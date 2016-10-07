module ApplicationHelper
  def session_button
    if user_signed_in?
      link_to "Sair", destroy_user_session_path, class: 'btn news_button logout-btn'
    else
      render partial: "layouts/login"
    end
  end

  def cities_for_select
    options_from_collection_for_select(City.all, 'id', 'name', 1)
  end

  def states_for_select
    options_from_collection_for_select(State.all, 'id', 'name', 1)
  end
end
