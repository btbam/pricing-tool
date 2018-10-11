module Platform
  # Platform::Comparables
  class Comparables < API
    helpers Platform::Helpers::ComparableHelpers

    before do
      authenticated_user
    end

    resource :entity do
      params do
        requires :duns_number, type: Integer
        requires :business_product, type: String
        requires :business_type, type: String
      end

      before do
        @ci = CompanyInfo.create_from_es duns: params['duns_number']
        @ci.business_product = params['business_product']
        @ci.business_type = params['business_type']
      end

      resource ':duns_number' do
        if Rails.configuration.pricing-tool.comparables_demo
          get :comparables do
            DemoService.generate_comparables
          end

          resource :comparables do
            %i(loss_experience
               industry
               financial_health
               state
               size_of_company
               number_of_employees
            ).each do |section|
              post section do
                DemoService.generate_comparables_section(section)
              end
            end
          end
        else
          post :comparables do
            menu_selects = params[:menu_selects]
            if menu_selects.length > 0
              apply_industry(menu_selects['industry'])
              apply_number_of_employees(menu_selects['number_of_employees'])
              apply_size_of_company(menu_selects['size_of_company'])
              apply_state(menu_selects['state'])
            end
            json = CompareSerializer.new(CompareApi.new(@ci)).to_json
            JSON.parse(json)
          end

          resource 'comparables' do
            post :financial_health do
              section_json(@ci, 'financial_health')
            end

            post :industry do
              apply_industry(params[:menu_id])
              section_json(@ci, 'industry')
            end

            post :loss_experience do
              # TODO: These associations don't exist
              #   Once we get adb access these should be made proper
              #   That is the only thing stopping self feature from working
              # menu = CompareApiSection::LossExperience.create_menu
              # book_name = menu[params[:menu_id].to_i]
              # book_product_type = book_name.split('/')
              # business_product = Business::Product.where(name: book_product_type[0]).first
              # business_type = Business::Type.where(name: book_product_type[1]).first
              # @ci.business_product = business_product
              # @ci.business_type = business_type
              section_json(@ci, 'loss_experience')
            end

            post :number_of_employees do
              apply_number_of_employees(params[:menu_id])
              section_json(@ci, 'number_of_employees')
            end

            post :size_of_company do
              apply_size_of_company(params[:menu_id])
              section_json(@ci, 'size_of_company')
            end

            post :state do
              apply_state(params[:menu_id])
              section_json(@ci, 'state')
            end
          end
        end
      end
    end
  end
end
