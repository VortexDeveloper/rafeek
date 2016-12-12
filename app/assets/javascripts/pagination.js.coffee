jQuery ->
  if $('#infinite-scrolling').size() > 0
    $(window).on 'scroll', ->
        more_posts_url = $('.pagination .next_page').attr('href')
        console.log(more_posts_url)
        console.log($(window).scrollTop() > $(document).height() - $(window).height() - 500)
        if more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60
            $('.pagination').html('<img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..." />')
            $.getScript more_posts_url
        return
      return