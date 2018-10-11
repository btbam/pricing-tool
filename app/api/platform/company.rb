module Platform
  # rubocop:disable ClassLength
  class Company < API
    helpers Platform::Helpers::SearchHelpers

    before do
      authenticated_user
    end

    resource :news do
      params do
        requires :q, type: String
      end

      get :search do
        query = "#{params[:q]}"
        page = [params[:page].to_i, 1].max
        news_only =  params[:news_only]
        results = ApiParser::GoogleJSON.fetch_and_parse(query: query, page: page, news_only: news_only)
        return {
          results: results.respond_to?(:entries) ? results.entries : [],
          stats: {
            total: results.results_total,
            time: results.results_time,
            pages: results.pages_total
          }
        }
      end
    end

    resource :entities do
      params do
        optional :query, type: String
        optional :customer, type: Boolean
      end
      get :search do
        if can?(:read, :companies)
          results = try_search(params[:query], **params.to_options.except(:route_info))

          json = ActiveModel::ArraySerializer.new(
            results,
            each_serializer: SearchSerializer
          ).to_json(root: 'companies')

          return JSON.parse(json)
        else
          { companies: [] }
        end
      end

      resource :search do
        params do
          optional :query, type: String
          optional :from, type: Integer
          optional :size, type: Integer
          optional :customer, type: Boolean
          optional :score_option, type: String
        end
        get :all do
          if can?(:read, :companies)
            companies = try_search(params[:query], **params.to_options.except(:route_info))

            json = ActiveModel::ArraySerializer.new(
              companies,
              each_serializer: SearchShowAllSerializer
            ).to_json(root: 'companies')

            return JSON.parse(json)
          else
            { companies: [] }
          end
        end
      end
    end

    resource :entity do
      params do
        requires :duns_number, type: Integer
      end

      get ':duns_number' do
        DatabaseFallback::PgOracle.fallback_if_necessary(params[:duns_number], time_ago: DateHelper.two_years_ago)
        company = CompanyInfo.create_from_es duns: params[:duns_number]
        error!('Company not found.', 404) unless company

        if !company.nil? && can?(:read, company)
          history = UserHistory.find_or_initialize_by(user_id: current_user.id, duns_number: company.duns_number)
          history.update(updated_at: Time.now)

          begin
            company.set_real_data
            company.set_fake_data
          rescue RuntimeError
            error!($ERROR_INFO.message, 500)
          end
        else
          company = CompanyInfo.new
          company.set_missing_data
        end

        json = DashboardSummarySerializer.new(company).to_json(root: 'company')
        return JSON.parse(json)
      end

      resource ':duns_number' do
        params do
          requires :sic_code, type: Integer
          optional :default, type: Boolean
        end
        get :calculator do
          sic_code = params[:sic_code]
          ci = CompanyInfo.create_from_es duns: params[:duns_number]
          unless params[:default]
            user_history = UserHistory.where(duns_number: params[:duns_number], user_id: current_user.id)
                           .where.not(user_history_do_id: nil, user_history_epli_id: nil).first
          end
          calculator = CalculatorApi.new(ci, sic_code, user_history)
          json = CalculatorSerializer.new(calculator).to_json
          return JSON.parse(json)
        end

        params do
          requires :sic_code, type: Integer
          requires :duns_number, type: Integer
          optional :years_in_operation, allow_blank: true, type: Integer
          requires :assets, allow_blank: true, type: BigDecimal
          requires :epli, allow_blank: true, type: Hash do
            requires :california_non_union_full_time, type: Integer
            requires :california_non_union_part_time, type: Integer
            requires :california_union_full_time, type: Integer
            requires :california_union_part_time, type: Integer
            requires :claims_history, type: Float
            requires :claims_reporting_procedures, type: Float
            requires :dc_mi_fl_tx_non_union_full_time, type: Integer
            requires :dc_mi_fl_tx_non_union_part_time, type: Integer
            requires :dc_mi_fl_tx_union_full_time, type: Integer
            requires :dc_mi_fl_tx_union_part_time, type: Integer
            requires :financial_conditions, type: Float
            requires :human_resources_and_loss_prevention, type: Float
            requires :incident_mgmt, type: Float
            requires :industry_third_party, type: Float
            requires :limit, type: BigDecimal
            requires :retention, type: BigDecimal
            requires :total_foreign_full_time, type: Integer
            requires :total_foreign_part_time, type: Integer
            requires :total_non_union_full_time, type: Integer
            requires :total_non_union_part_time, type: Integer
            requires :total_union_full_time, type: Integer
            requires :total_union_part_time, type: Integer
            requires :workforce_mgmt, type: Float
            requires :prior_acts_coverage, type: Float
            requires :punitive_damage, type: Float
            requires :years_in_operation, type: Float
            requires :has_changed, type: Boolean
          end
          requires :do, allow_blank: true, type: Hash do
            requires :claims_history, type: Float
            requires :entity_nonentity_coverage, type: Float
            requires :financial_conditions, type: Float
            requires :limit, type: BigDecimal
            requires :management_experience_qualifications, type: Float
            requires :mergers_and_acquisitions, type: Float
            requires :private_company, type: Float
            requires :retention, type: BigDecimal
            requires :revenue_asset_irregularities, type: Float
            requires :specialty_coverage, type: Float
            requires :industry, type: Float
            requires :litigation, type: Float
            requires :years_in_operation, type: Float
            requires :has_changed, type: Boolean
          end
        end
        put :calculator do
          user_history = UserHistory.find_or_initialize_by(duns_number: permitted_params[:duns_number],
                                                           user_id: current_user.id)
          user_history.attributes = { sic_code: permitted_params[:sic_code],
                                      assets: permitted_params[:assets],
                                      years_in_operation: permitted_params[:years_in_operation] }
          user_history.user_history_do = UserHistory::Do.new unless user_history.user_history_do
          user_history.user_history_epli = UserHistory::Epli.new unless user_history.user_history_epli
          user_history.user_history_do.attributes = permitted_params[:do] if permitted_params[:do]
          user_history.user_history_epli.attributes = permitted_params[:epli] if permitted_params[:epli]

          if user_history.save
            return JSON.parse({ duns_number: user_history.duns_number }.to_json)
          else
            error!(user_history.errors.messages, 409)
          end
        end

        get :peer_policies do
          sic_code = params[:sic].to_i
          DatabaseFallback::PgOracle.fallback_if_necessary(params[:duns_number], time_ago: DateHelper.two_years_ago)
          ci = CompanyInfo.create_from_es duns: params[:duns_number]
          error!('Company not found.', 404) unless ci

          api = PeerPolicyApi.new(ci, sic_code)
          json = PeerPoliciesSerializer.new(api).to_json
          return JSON.parse(json)
        end
      end
    end
  end
end
