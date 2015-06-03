/**
 * Created by Sonia on 6/1/2015.
 */

$(window).scroll(function () {
    var windowWidth = $(this).width();
    var windowHeight = $(this).height();
    var windowScrollTop = $(this).scrollTop();

    // effect - No1
    if (windowScrollTop > 60) {
        $('.banner h2').css('display', 'none');
        $('.banner .info').css('display', 'block');
    } else {
        $('.banner h2').css('display', 'block');
        $('.banner .info').css('display', 'none');
    }

    // effect - No2
    var firstAnimation = function () {
        $('.producers .producers-info').each(
            function () {
                $(this).delay(500).animate(
                    {opacity: 1, height: '180', width: '250'}, 2000);
                $(this).delay(500).stop();

            }
        );
    };

    // effect - No3
    var secondAnimation = function () {
        $('.method:eq(0)').delay(1000).animate({opacity: 1}, 'slow', function () {
            $(this).find('h4').css('background-color', '#B5C8D5');
        });
        $('.method:eq(1)').delay(2000).animate({opacity: 1}, 'slow', function () {
            $(this).find('h4').css('background-color', '#B5C3D5');
        });
        $('.method:eq(2)').delay(3000).animate({opacity: 1}, 'slow', function () {
            $(this).find('h4').css('background-color', '#B5C3D5');
        });
        $('.method:eq(3)').delay(4000).animate({opacity: 1}, 'slow', function () {
            $(this).find('h4').css('background-color', '#B5C3D5');
        });
    };


    if (windowWidth <= 549) {
        if (windowScrollTop > 600 && windowScrollTop <= 1750) {
            $('.producers').css('background-color', '27AE60');
            firstAnimation();
        }
        if (windowScrollTop > 1750 && windowScrollTop <= 3500) {
            $('.process').css('background-color', '27AE60');
            secondAnimation();
        }
        if (windowScrollTop > 3500) {
            $('.demo').css('background-color', '27AE60');
            thirdAnimation();
        }
    } else if (windowWidth > 549 && windowWidth <= 991) {
        if (windowScrollTop > 480 && windowScrollTop <= 1150) {
            $('.producers').css('background-color', '27AE60');
            firstAnimation();
        }
        if (windowScrollTop > 1150 && windowScrollTop <= 2200) {
            $('.process').css('background-color', '27AE60');
            secondAnimation();
        }
        if (windowScrollTop > 2200) {
            $('.demo').css('background-color', '27AE60');
            thirdAnimation();
        }
    } else {
        if (windowScrollTop > 450 && windowScrollTop <= 850) {
            $('.producers').css('background-color', '27AE60');
            firstAnimation();
        }
        if (windowScrollTop > 850) {
            $('.process').css('background-color', '27AE60');
            secondAnimation();
        }

    }
});