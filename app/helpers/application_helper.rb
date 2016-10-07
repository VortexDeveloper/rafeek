module ApplicationHelper
    def session_button
        if user_signed_in?
            link_to "Sair", destroy_user_session_path, class: 'btn news_button logout-btn'
        else
            render partial: "layouts/login"
        end
    end
end
