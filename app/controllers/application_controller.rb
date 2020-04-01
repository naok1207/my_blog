class ApplicationController < ActionController::Base
    $APP_NAME = 'my_blog'
    
    protected
        def check_ip
            if session[:ip].nil?
                session[:ip] = request.remote_ip
                session[:access] = []
            end
        end

        def check_access(post_id)
            !session[:access].include?(post_id)
        end

        def log_access(post_id)
            session[:access].push(post_id)
        end

end
