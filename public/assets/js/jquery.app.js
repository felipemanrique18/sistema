/**
 * Theme: SimpleAdmin Template
 * Author: Coderthemes
 * Main Js File
 *
 */

$(document).ready(function(e) {
    (function($) {

        'use strict';

        function initSlimscroll() {
            $('.slimscroll').slimscroll({
                height: 'auto',
                position: 'right',
                size: "5px",
                color: '#9ea5ab'
            });
        }

        function initMetisMenu() {
            //metis menu
            $("#side-menu").metisMenu();
        }

        function initLeftMenuCollapse() {
            // Left menu collapse
            $('.button-menu-mobile').on('click', function(event) {
                event.preventDefault();
                $("body").toggleClass("nav-collapse");
            });
            $('.seleccion').on('click', function(event) {
                event.preventDefault();
                $("body").removeClass();
            });

        }

        function initComponents() {
            $('[data-toggle="tooltip"]').tooltip();
            $('[data-toggle="popover"]').popover();

            $('[data-plugin="switchery"]').each(function(idx, obj) {
                new Switchery($(this)[0], $(this).data());
            });
        }

        function initActiveMenu() {
            // === following js will activate the menu in left side bar based on url ====
            $("#side-menu a").each(function() {
                if (this.href === window.location.href) {
                    $(this).click();
                    $(this).parent().parent().children().click(); // click the item to make it drop
                }
            });
        }

        function init() {
            initSlimscroll();
            initMetisMenu();
            initLeftMenuCollapse();
            initComponents();
            initActiveMenu();
        }

        init();

    })(jQuery)
});