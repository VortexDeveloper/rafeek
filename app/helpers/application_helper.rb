module ApplicationHelper

  def session_button
    if user_signed_in?
      link_to "Sair", destroy_user_session_path, class: 'btn news_button logout-btn'
    else
      render partial: "layouts/login"
    end
  end

  def admin_button
    if user_signed_in? && current_user.admin?
      link_to "Painel Admin", user_index_path, class: 'btn news_button logout-btn', target: '_blank'
    end
  end

  def profile_button
    if user_signed_in?
      link_to "Perfil", profile_edit_path(current_user), class: 'btn news_button login-btn'
    end
  end

  def welcome_text
    if user_signed_in?
      content_tag(:p, "Saudações, #{(current_user.profile.name || 'Complete seu cadastro!')}", :class => 'user-logged')
    end
  end

  def cities_for_select
    options_from_collection_for_select(City.all, 'id', 'name', 1)
  end

  def states_for_select
    options_from_collection_for_select(State.all, 'id', 'name', 1)
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end

end
