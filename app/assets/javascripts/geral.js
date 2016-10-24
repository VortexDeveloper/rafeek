$(function () {

    //CONTROLE DO MENU MOBILE TOPO
    $('.mobile_action').click(function () {

        if (!$(this).hasClass('active_topo')) {
            $(this).addClass('active_topo');
            $('.menu_topo').animate({'left': '0'}, 400);

        } else {
            $(this).removeClass('active_topo');
            $('.menu_topo').animate({'left': '-100%'}, 400);

        }
    });

    //CONTROLE DO MENU MOBILE SIDE
    $('.mobile_action_side').click(function () {

        if (!$(this).hasClass('active_side')) {
            $(this).addClass('active_side');
            $('.menu_side').animate({'left': '0'}, 500);

        } else {
            $(this).removeClass('active_side');
            $('.menu_side').animate({'left': '-100%'}, 500);

        }
    });

    //CONTROLE DE SUB ITEM MENU SIDE
    $('.menu_side_sub').hide();
    $('.menu_side_item').click(function () {
        $(this).children('.menu_side_sub').slideToggle('slow');
    });

    //*******************************SLIDE GANHADORES**********************************

    //SLIDE GO
    $('.slide_nav.go').click(function () {
        clearInterval(action);
        slideGo();
    });

    //SLIDE BACK
    $('.slide_nav.back').click(function () {
        clearInterval(action);
        slideBack();
    });

    var action = setInterval(slideGo, 3000);

    //BOTÃO SLIDE GO
    function slideGo() {
        if ($('.slide_item.first').next().size()) {
            $('.slide_item.first').fadeOut(400, function () {
                $(this).removeClass('first').next().fadeIn().addClass('first');
            });
        } else {
            $('.slide_item.first').fadeOut(400, function () {
                $('.slide_item').removeClass('first');
                $('.slide_item:eq(0)').fadeIn().addClass('first');
            });
        }
    }



    //BOTÃO SLIDE BACK
    function slideBack() {
        if ($('.slide_item.first').index() >= $('.slide_item').length) {
            $('.slide_item.first').fadeOut(400, function () {
                $(this).removeClass('first').prev().fadeIn().addClass('first');
            });
        } else {
            $('.slide_item.first').fadeOut(400, function () {
                $('.slide_item').removeClass('first');
                $('.slide_item:last-of-type').fadeIn().addClass('first');
            });
        }
    }

    window.onload = function() {
	     $('.item:first').addClass('active')
    }

    $('#myModal').on('shown.bs.modal', function () {
        $('#myInput').focus();
    });
    //*******************************SLIDE GANHADORES**********************************
//    //*******************************SLIDE PARCEIROS***********************************
//
//    //SLIDE GO
//    $('.slide_parceiros_nav.go').click(function () {
//        clearInterval(actionParceiros);
//        slideParceirosGo();
//    });
//
//    //SLIDE BACK
//    $('.slide_parceiros_nav.back').click(function () {
//        clearInterval(actionParceiros);
//        slideParceirosBack();
//    });
//
//    var actionParceiros = setInterval(slideParceirosGo, 3000);
//
//    //BOTÃO SLIDE GO
//    function slideParceirosGo() {
//        if ($('.slide_parceiros_item.first').next().size()) {
//            $('.slide_parceiros_item.first').fadeOut(400, function () {
//                $(this).removeClass('first').next().fadeIn().addClass('first');
//            });
//        } else {
//            $('.slide_parceiros_item.first').fadeOut(400, function () {
//                $('.slide_parceiros_item').removeClass('first');
//                $('.slide_parceiros_item:eq(0)').fadeIn().addClass('first');
//            });
//        }
//    }
//
//    //BOTÃO SLIDE BACK
//    function slideParceirosBack() {
//        if ($('.slide_parceiros_item.first').index() >= $('.slide_parceiros_item').length) {
//            $('.slide_parceiros_item.first').fadeOut(400, function () {
//                $(this).removeClass('first').prev().fadeIn().addClass('first');
//            });
//        } else {
//            $('.slide_parceiros_item.first').fadeOut(400, function () {
//                $('.slide_parceiros_item').removeClass('first');
//                $('.slide_parceiros_item:last-of-type').fadeIn().addClass('first');
//            });
//        }
//    }
//    //*******************************SLIDE PARCEIROS***********************************

    //EFEITO SCROLL MENU
    var topo = $('#topo').offset().top;
    var $login = $('#login');
    var $logo = $('#logo');
    var $menu = $('#menu');
    var $fundoMenu = $('#fundo_menu');

    $(document).on('scroll', function () {
        if (topo <= $(window).scrollTop()) {
            $login.addClass('fixar_login');
            $logo.addClass('fixar_logo');
            $menu.addClass('fixar_menu');
            $fundoMenu.addClass('fixar_fundo');
        } else {
            $login.removeClass('fixar_login');
            $logo.removeClass('fixar_logo');
            $menu.removeClass('fixar_menu');
            $fundoMenu.removeClass('fixar_fundo');
        }
    });

    $(function() {
      $(".img-file").click(function() {
        $(".btn-file").trigger('click');
      });
    })

});
