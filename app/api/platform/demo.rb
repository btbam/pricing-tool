module Platform
  # Platform::Demo
  class Demo < API
    before do
      authenticated_user
    end

    resource :demo do
      get :comparables do
        DemoService.generate_comparables if can?(:read, :companies)
      end

      post :comparables_update_section do
        DemoService.generate_comparables_section if can?(:read, :companies)
      end
    end
  end
end
