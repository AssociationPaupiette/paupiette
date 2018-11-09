//= require activestorage
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require owl.carousel
//= require_tree ./application

$(function () {
    "use strict";

    var owlCarousel = function () {
        /**
         * Owl carousel instance
         */
        var owl = $('.owl-carousel');
        var previousButton = $('.carousel__control--prev');
        var nextButton = $('.carousel__control--next');

        owl.owlCarousel({
            loop: true,
            dots: false,
            nav: false,
            autoplay: false,
            autoplayTimeout: 3000,
            autoplayHoverPause: true,
            items: 4,
            responsive: {
                0: {
                    items: 1
                },
                600: {
                    items: 2
                },
                1000: {
                    items: 3
                },
                1200: {
                    items: 4
                }
            },
            navSpeed: 500,
            smartSpeed: 2500
        });

        /**
         *  Go to previous / next carousel item
         *  using custom buttons
         */
        previousButton.click(function() {
            owl.trigger('prev.owl.carousel', [800]);
        });

        nextButton.click(function() {
            owl.trigger('next.owl.carousel', [800]);
        });
    };

    owlCarousel();


});