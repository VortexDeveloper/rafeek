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
      content_tag(:p, "Saudações #{(current_user.profile.name || 'Complete seu cadastro') }, seu saldo de pontos é:  #{( current_user.account.balance || 0) }", :class => 'user-logged')
    end
  end

  def cities_for_select
    options_from_collection_for_select(City.all, 'id', 'name', 1)
  end

  def states_for_select(selected)
    selected = selected || 1
    options_from_collection_for_select(State.all, 'id', 'name', selected)
  end

  def categories_for_select(selected)
    selected = selected || ""
    options_from_collection_for_select(Category.enabled_categories, 'id', 'name', selected)
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end

  def sold_percentage(r)
    (r.amount_sold/r.amount.to_f)*100
  end

  def available_percentage(r)
    (r.tickets_available/r.amount.to_f)*100
  end

  def points_encoding(points)
    parts = points.humanize(2, '.').split('.')
    first = parts.first
    parts.delete_at 0
    last = parts.join('.')

    points_html_encoding(first, last)
  end

  def points_html_encoding(first, last)
    content = content_tag(:span, "#{first}", class: 'unity-first')
    content << content_tag(:span, ".#{last}", class: 'unity-last') unless last.empty?
    content_tag(:span, content, class: 'unidade')
  end
end
