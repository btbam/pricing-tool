module Platform
  # Platform::Status
  class Status < API
    get :status do
      # Commented out because this is only an example message.
      # uncomment to see it as a global application message
      # {
      #   message: <<-EOF
      #     The Entity Import script failed to complete 01/27/2015, please be advised data may not be up-to-date. <a
      #     href=\"http://google.com\">Read more...</a>"
      #   EOF
      # }
    end
  end
end
