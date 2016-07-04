/*
    Slinky
    A light-weight, responsive, mobile-like navigation menu plugin for jQuery
    Built by Ali Zahid
    Published under the MIT license
*/

;(function($) {
    $.fn.slinky = function(options) {
        // Setup plugin defaults
        var settings = $.extend({
            label: 'Back',
            title: false,
            speed: 300
        }, options);

        // store current location to check if a menu-item is active
        var loc = location.href;

        // Convenience method for navigation animation
        var move = function(root, next, callback) {
            var left = Math.round(parseInt(root[0].style.left)) || 0;

            // Use multiples of 100% for responsive animation
            root.css('left', -Math.abs(next ? left - 100 : left + 100) + '%');
            
            // Callback after animation is finished
            if (typeof callback === 'function') {
                    setTimeout(callback, settings.speed);
            }
        };

        // Convenience method for resizing menu
        var resize = function(menu, content) {
            menu.height('auto');
            menu.height(content.outerHeight());
        };

        return this.each(function() {
            // The root node is where animation happens
            var menu = $(this),
                root = [],
                ul   = menu.children('ul'); // all root lists
            
            // Set CSS animation duration
            menu.css('transition-duration', settings.speed + 'ms');
            
            // Add .next class to links with sub menus
            $('a + ul', menu).prev().addClass('next').append('<i class="fa fa-chevron-right"></i>');

            // Add header for back button and title
            $('li > ul', menu).prepend('<li class="header">');

            // Add title
            if (settings.title === true) {
                // Create a label with title from the parent
                $('li > ul', menu).each(function() {
                    var label = $(this).parent().find('a').first().text(),
                        title = $('<h3>').text(label);

                    $('> .header', this).append(title);
                });
            }

            // Add back links with appropriate labels
            if (!settings.title && settings.label === true) {
                // Create a link with label from parent
                $('li > ul', menu).each(function() {
                    var label = $(this).parent().find('a').first().text(),
                        backLink = $('<a>').text(label).prop('href', '#').addClass('back');

                    $('> .header', this).append(backLink);
                });
            } else {
                // Create a link with the label from settings
                var backLink = $('<a>').html('<i class="fa fa-chevron-left"></i>').prop('href', '#').addClass('back');
                $('.header', menu).append(backLink);
            }
            
            // for each root-ul create a entry in the root-array so that the root element can easily be found
            // add transition to the root-ul and save the ul-number to links inside the ul
            ul.each(function(i) {
                var self = $(this);
                root[i]  = self;
                
                self.data('count', i);
                self.css('transition-duration', settings.speed + 'ms').addClass('root');
                self.find('a').each(function(){
                    $(this).data('root', i);
                    if ($(this).attr('href') === loc) {
                        $(this).addClass('active');
                        // check if a menu item is active and navigate to it
                        $(this).parents('ul:not(.root)').each(function() {
                            $(this).show();
                            move(root[i], true);
                            resize(root[i], $(this));
                        });
                    }
                });
            });


            // Setup navigation
            $('a', menu).on('click', function(e) {
                var a = $(this),
                    c = a.data('root');

                // Disable navigation if link has hash
                // else proceed to URL
                if (/#/.test(this.href)) {
                    e.preventDefault();
                }
                
                // Animate forward or backward
                if (a.hasClass('next')) {
                    a.next().show();
                    
                    move(root[c], true);
                    
                    resize(root[c], a.next());
                    
                } else if (a.hasClass('back')) {
                    move(root[c], false, function() {
                        a.parent().parent().hide();
                    });
                    resize(root[c], a.parent().parent().parents('ul'));
                }
            });
        });
        return this;
    };
}(jQuery));
