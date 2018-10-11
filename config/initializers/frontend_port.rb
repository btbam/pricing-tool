FRONTEND_PORT = case Rails.env
                when 'production' then 9333
                when 'staging' then 9777
                else 9000
                end
