/* 
 *  This File is part of Absinth. Drink responsibly.
 */

/* 
 * 
 * TODO: split this file once again when it is finished for better readability.
 * Subthemes then won't need to override all widgets (if they are written carefully).
 * Write npm/gulp task for putting javascript files back together (including 3rd Party Libs).
 * Provide Subtheme Boilerplate with own npm/gulp task, showing how to rewrite parent theme.
 * 
 * TODO: store breakpoints somewhere global
 * 
 */

$(document).ready(function () {
    //TODO: change this to some absjs class

    var page = $('#abs-page');

    // scoping JS on controller level

    if (page.hasClass('start')) {

        $('#absjs-slick-promo').absPromoSlider();
        $('#absjs-slick-manufacturer').absManufacturerSlider();

    }
    else if (page.hasClass('details')) {

        $('#absjs-article-pics').absArticlePics();
        $('#absjs-details-wrapper').absVariants();
        $('.absjs-slick-list-slider').absListSlider();

    }
    else if (page.hasClass('guestbook')) {
        $('#absjs-guestbook-link').click(function() {
            $('#absjs-guestbook-message').slideToggle();
            $(this).hide();
        });
    }
    else if (page.hasClass('account') || page.hasClass('account_password') || page.hasClass('account_newsletter') || page.hasClass('account_order') || page.hasClass('account_wishlist') || page.hasClass('account_downloads')) {
        $('#absjs-acc-backbtn').click(function() {
            // show menu
            $('#sidebar')[0].setAttribute('style', 'display:block !important');
            $('#abs-content').hide();
        });
    }
    //fire widgets needed on all pages

    // MobileNav

    $('#absjs-navtab').absTabCollapse();


    $('#absjs-mobile-categorytree').on('click', '.list-group-item i', function (e) {
        e.preventDefault();

        var subListGroupList = $(this).parent().next('.list-group');

        console.log(subListGroupList);

        if (subListGroupList.length) {
            $(subListGroupList).toggleClass('expanded');
        }

    });

    // Datepicker

    $('.absjs-choose-date').datetimepicker({
        viewMode: 'years',
        format: 'DD.MM.YYYY',
        maxDate: 'now',
        allowInputToggle: true,
        icons: {
            time: 'fa fa-clock-o',
            date: 'fa fa-calendar',
            up: 'fa fa-chevron-up',
            down: 'fa fa-chevron-down',
            previous: 'fa fa-chevron-left',
            next: 'fa fa-chevron-right',
            today: 'fa fa-home',
            clear: 'fa fa-trash-o',
            close: 'fa fa-times'
        }
    }).on('dp.change', function (e) {

        // TODO: rewrite with absjs classes

        $(this).next('.abs-date-day').val(e.date.date())
                .next('.abs-date-month').val(e.date.month() + 1)
                .next('.abs-date-year').val(e.date.year());
    });

    // show or hide shipping address form
    // TODO: rewrite with absjs classes

    $('#showShipAddress').change(function () {

        // get checkbox state
        var state = $(this).prop('checked');
        // enable or disable shipping address form fields
        $('#shippingAddressForm').find('input, select, textarea').attr('disabled', state);
        // show or hide "change address" button
        $('#userChangeShippingAddress').toggle(!state && $('#addressId').val() != -1);
        // show or hide shipping address form
        $('#shippingAddress').toggle(!state);
    });

    // if new shipping address has been chosen dont show "change address" button
    // TODO: rewrite with absjs classes

    $('#addressId').change(function () {
        $('#userChangeShippingAddress').toggle($('#addressId').val() != -1)
    });

    // if change shipping address button was clicked, show shipping address form
    // TODO: rewrite with absjs classes

    $('#userChangeShippingAddress').click(function () {
        $('#shippingAddressForm').show().find('input, select, textarea').attr('disabled', false);
        $('#shippingAddressText').hide();
        $('#userChangeShippingAddress').hide();
        return false;
    });

    // if change user address button was clicked, show user address form
    // TODO: rewrite with absjs classes
    // TV: only checkout anymore
    $('#userChangeAddress').click(function () {
        $('#addressForm').show();
        $('#addressText').hide();
        $(this).hide();
        return false;
    });

    // load oxUserShippingAddressSelect widget on this element
    // TODO: rewrite with absjs classes

    var oxUserShippingAddressSelect = '#addressId';
    if ($(oxUserShippingAddressSelect) && $(oxUserShippingAddressSelect).length) {
        $(oxUserShippingAddressSelect).oxUserShippingAddressSelect();
    }

});

(function ($) {
    absTabCollapse = {
        _create: function () {
            var self = this,
                    options = self.options,
                    el = self.element,
                    activeToggle = 'active';

            $(el).on('click', '[data-toggle=absjs-tabcollapse]', function (e) {

                e.preventDefault();

                var activeTabs = $(el).find('[data-toggle=absjs-tabcollapse].active');
                var activateTab = $(this).hasClass('active');

                $(activeTabs).each(function (i) {

                    var activeTabLink = $(activeTabs[i]);
                    $(activeTabLink).removeClass(activeToggle);

                    var activeTabSelector = $(activeTabLink).attr('href');
                    var activeTab = $(activeTabSelector);
                    $(activeTab).removeClass(activeToggle).hide();

                });

                if (!activateTab) {

                    $(this).addClass(activeToggle);
                    var activeTabLink = $(this).attr('href');
                    $(activeTabLink).addClass(activeToggle).show();

                }
            });
        }
    };

    $.widget("ui.absTabCollapse", absTabCollapse);

})(jQuery);

(function ($) {
    absPromoSlider = {
        _create: function () {
            var self = this,
                    options = self.options,
                    el = self.element;

            $(el).slick({
                mobileFirst: true,
                swipeToSlide: true,
                speed: 500,
                infinite: true,
                autoplay: true,
                autoplaySpeed: 6000,
                dots: true
            });
        }
    };

    $.widget("ui.absPromoSlider", absPromoSlider);

})(jQuery);

(function ($) {
    absManufacturerSlider = {
        _create: function () {
            var self = this,
                    options = self.options,
                    el = self.element;

            $(el).slick({
                mobileFirst: true,
                swipeToSlide: true,
                speed: 300,
                infinite: true,
                autoplay: true,
                autoplaySpeed: 4000,
                slidesToShow: 1,
                arrows: true,
                responsive: [
                    {
                        breakpoint: 480,
                        settings: {
                            slidesToShow: 2,
                        }
                    },
                    {
                        breakpoint: 768,
                        settings: {
                            slidesToShow: 3,
                        }
                    },
                    {
                        breakpoint: 992,
                        settings: {
                            slidesToShow: 5,
                        }
                    },
                    {
                        breakpoint: 1200,
                        settings: {
                            slidesToShow: 8,
                        }
                    }
                ]
            });
        }
    };

    $.widget("ui.absManufacturerSlider", absManufacturerSlider);

})(jQuery);

(function ($) {
    absArticlePics = {
        _create: function () {
            var self = this,
                    options = self.options,
                    el = self.element,
                    morepicswrapper = $(el).find('#absjs-slick-more-pics'),
                    zoompicswrapper = $(el).find('#absjs-slick-zoom-pics'),
                    zoompics = $(zoompicswrapper).find('img'),
                    pswp = document.querySelectorAll('.pswp')[0],
                    pswpitems = [];


            $(zoompics).each(function (pswpitem) {
                pswpitems.push({src: $(zoompics[pswpitem]).attr('data-large-image'), w: $(zoompics[pswpitem]).attr('data-large-image-width'), h: $(zoompics[pswpitem]).attr('data-large-image-height')});
            });

            $(zoompicswrapper).slick({
                mobileFirst: true,
                speed: 300,
                slidesToShow: 1,
                arrows: true,
                responsive: [
                    {
                        breakpoint: 543,
                        settings: {
                            draggable: false,
                            arrows: false,
                            fade: true
                        }
                    }
                ]
            });

            $(morepicswrapper).slick({
                mobileFirst: true,
                swipeToSlide: true,
                speed: 300,
                slidesToShow: 3,
                arrows: true
//                centerMode: true,
//                centerPadding: 1
//                focusOnSelect: true,
//                asNavFor: '#absjs-slick-zoom-pics'
            });


            $(morepicswrapper).on('click', 'img', function () {

                var imgindex = $(this).parent().attr('data-slick-index');
                var sliderhandle = $(morepicswrapper).slick('getSlick');
                var slidecount = sliderhandle.$slides.length;

                if (slidecount <= imgindex) {
                    imgindex = imgindex - slidecount;
                }

                //TODO: indicate which slide has been clicked and is active now

                $(zoompicswrapper).slick('goTo', imgindex);

            });

            $(zoompicswrapper).on('click', 'img', function () {

//                var galleryoptions = {
//                    index: parseInt($(this).attr('data-large-image-index'))
//                };

                var galleryoptions = {
                    shareEl: false,
                    index: parseInt($(this).attr('data-large-image-index'))
                }


                var gallery = new PhotoSwipe(pswp, PhotoSwipeUI_Default, pswpitems, galleryoptions);
                gallery.init();

            });
        }
    };

    $.widget("ui.absArticlePics", absArticlePics);

})(jQuery);

(function ($) {
    absVariants = {
        _create: function () {
            var self = this,
                    options = self.options,
                    el = self.element;

            $(el).on('change', '.absjs-dropdown', function () {
                reloadVariants();
            });

            $(el).on('click', '.absjs-variant-reset', function (e) {
                e.preventDefault();
                reloadVariants(true);
            });

            function reloadVariants(reset) {

                var ajaxForm = $(el).find("#absjs-widget-form");
                var ajaxData = $(ajaxForm).serializeArray();
                var ajaxUrl = $(ajaxForm).attr("action");
                var ajaxType = $(ajaxForm).attr("method");

                $(el).find('.absjs-dropdown').each(function (index) {

                    var pushValue = 0;

                    if (!reset) {
                        pushValue = $(this).val();
                    }

                    ajaxData.push({
                        name: $(this).attr('name'),
                        value: pushValue
                    });


                });

                $.ajax({
                    url: ajaxUrl,
                    type: ajaxType,
                    data: ajaxData,
                    success: function (data)
                    {
                        $(el).find('#absjs-details-content').html(data);
                        $(el).find('#absjs-article-pics').absArticlePics();
                        $(el).find('.absjs-slick-list-slider').absListSlider();
                    }
                });

            }
        }
    };

    $.widget("ui.absVariants", absVariants);

})(jQuery);

(function ($) {
    absListSlider = {
        _create: function () {
            var self = this,
                    options = self.options,
                    el = self.element;


            $(el).slick({
                mobileFirst: true,
                swipeToSlide: true,
                speed: 300,
                slidesToShow: 1,
                arrows: true,
                responsive: [
                    {
                        breakpoint: 480,
                        settings: {
                            slidesToShow: 2,
                            arrows: true
                        }
                    },
                    {
                        breakpoint: 768,
                        settings: {
                            slidesToShow: 3,
                            arrows: true
                        }
                    }
                ]
            });
        }
    };

    $.widget("ui.absListSlider", absListSlider);

})(jQuery);

// TODO: remove oxajax, guestbook will not be supported, oxajax is no longer needed for variant selection on details page

(function ($) {

    /**
     * Ajax
     */
    oxAjax = {
        /**
         * Loading temporary screen when ajax call proseeds
         */
        loadingScreen: {
            /**
             * Starts load
             *
             * @target - DOM element witch must be hide with the loading screen
             * @iconPositionElement - element of a target on witch loaging icon is shown
             */
            start: function (target, iconPositionElement) {

                var loadingScreens = Array();
                $(target).each(function () {
                    var overlayKeeper = document.createElement("div");
                    overlayKeeper.innerHTML = '<div class="loadingfade"></div><div class="loadingicon"></div><div class="loadingiconbg"></div>';
                    $('div', overlayKeeper).css({
                        'position': 'absolute',
                        'left': $(this).offset().left - 10,
                        'top': $(this).offset().top - 10,
                        'width': $(this).width() + 20,
                        'height': $(this).height() + 20
                    });
                    if (iconPositionElement && iconPositionElement.length) {
                        var x = Math.round(
                                iconPositionElement.offset().left // my left
                                - 10 - $(this).offset().left      // relativeness
                                + iconPositionElement.width() / 2   // plus half of width to center
                                );
                        var offsetTop = iconPositionElement.offset().top;
                        var y = Math.round(
                                offsetTop                         //my top
                                - 10 - $(this).offset().top       // relativeness
                                + (// this requires, that last element in collection, would be the bottom one
                                        // as it computes last element offset from the first one plus its height
                                        iconPositionElement.last().offset().top - offsetTop + iconPositionElement.last().height()
                                        ) / 2
                                );

                        $('div.loadingiconbg, div.loadingicon', overlayKeeper).css({
                            'background-position': x + "px " + y + "px"
                        });
                    }
                    $('div.loadingfade', overlayKeeper)
                            .css({'opacity': 0})
                            .animate({
                                opacity: 0.55
                            }, 200
                                    );
                    $("body").append(overlayKeeper);
                    loadingScreens.push(overlayKeeper);
                });

                return loadingScreens;
            },
            /**
             * Stops viewing loading screens
             *
             * @loadingScreens - one or more showing screens
             */
            stop: function (loadingScreens) {
                $.each(loadingScreens, function (i, el) {
                    $('div', el).not('.loadingfade').remove();
                    $('div.loadingfade', el)
                            .stop(true, true)
                            .animate({
                                opacity: 0
                            }, 100, function () {
                                $(el).remove();
                            });
                });
            }
        },
        /**
         * Updating errors on page
         *
         * @errors - array of errors
         */
        updatePageErrors: function (errors) {
            if (errors.length) {
                var errlist = $("#content > .status.error");
                if (errlist.length == 0) {
                    $("#content").prepend("<div class='status error corners'>");
                    errlist = $("#content > .status.error");
                }
                if (errlist) {
                    errlist.children().remove();
                    var i;
                    for (i = 0; i < errors.length; i++) {
                        var p = document.createElement('p');
                        $(p).append(document.createTextNode(errors[i]));
                        errlist.append(p);
                    }
                }
            } else {
                $("#content > .status.error").remove();
            }
        },
        /**
         * Ajax call
         *
         * @activator - link or form element that activates ajax call
         * @params - call params: targetEl, iconPosEl, onSuccess, onError, additionalData
         */
        ajax: function (activator, params) {
            var self = this;
            var inputs = {};
            var action = "";
            var type = "";
            if (activator[0].tagName == 'FORM') {
                $("input", activator).each(function () {
                    if (this.type == 'checkbox' && !this.checked)
                        return true;
                    inputs[this.name] = this.value;
                });
                action = activator.attr("action");
                type = activator.attr("method");
            } else if (activator[0].tagName == 'A') {
                action = activator.attr("href");
            }

            if (params['additionalData']) {
                $.each(params['additionalData'], function (i, f) {
                    inputs[i] = f;
                });
            }

            // sorting array to pass parameters alphabetically
            var aInputs = {};
            var keys = Array();
            for (var key in inputs) {
                if (inputs.hasOwnProperty(key)) {
                    keys.push(key);
                }
            }
            keys.sort().forEach(function (i) {
                aInputs[i] = inputs[i];
            })

            var sLoadingScreen = null;
            if (params['targetEl']) {
                sLoadingScreen = self.loadingScreen.start(params['targetEl'], params['iconPosEl']);
            }

            if (!type) {
                type = "get";
            }

            jQuery.ajax({
                data: aInputs,
                url: action,
                type: type,
                timeout: 30000,
                beforeSend: function (jqXHR, settings) {
                    settings.url = settings.url.replace("&&", "&");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    if (sLoadingScreen) {
                        self.loadingScreen.stop(sLoadingScreen);
                    }
                    if (params['onError']) {
                        params['onError'](jqXHR, textStatus, errorThrown);
                    }
                },
                success: function (r) {

                    if (sLoadingScreen) {
                        self.loadingScreen.stop(sLoadingScreen);
                    }
                    if (r['debuginfo'] != undefined && r['debuginfo']) {
                        $("body").append(r['debuginfo']);
                    }
                    if (r['errors'] != undefined
                            && r['errors']['default'] != undefined) {
                        self.updatePageErrors(r['errors']['default']);
                    } else {
                        self.updatePageErrors([]);
                    }
                    if (params['onSuccess']) {
                        params['onSuccess'](r, inputs);
                    }
                }
            });
        },
        /**
         * If it's possible report JS error
         *
         * @param e JS exception
         */
        reportJSError: function (e) {
            if (typeof console != 'undefined' && typeof console.error != 'undefined') {
                console.error(e);
            }
        },
        /**
         * Evals returned html and executes javascript after reload
         *
         * @container - witch javascript must be restarted
         */
        evalScripts: function (container) {
            var self = this;
            try {
                $("script", container).each(function () {
                    try {
                        if (this.src != '' && $('body > script[src="' + this.src + '"]').length == 0) {
                            $('body').append(this);
                            document.body.appendChild(this);
                            return true;
                        }
                        eval(this.innerHTML);
                    } catch (e) {
                        self.reportJSError(e);
                    }
                    $(this).remove();
                });
            } catch (e) {
                self.reportJSError(e);
            }
        }
    };

    $.widget("ui.oxAjax", oxAjax);

})(jQuery);

(function ($) {
    /**
     * Show password field if email will be changed
     */
    oxEnterPassword = {
        options: {
            metodEnterPasswd: "oxValidate_enterPass"
        },
        _create: function ()
        {
            var self = this,
                    options = self.options,
                    el = self.element;

            el.bind("keyup", function () {
                self.showInput(el, el.val() != el.prop("defaultValue"), options.metodEnterPasswd);
            });
        },
        /**
         * Shows/hides given element
         */
        showInput: function (oSource, blShow, sClass)
        {
            var oRegexp = new RegExp(sClass + "Target\\[(.+)\\]", "g");
            var sClasses = oRegexp.exec(oSource.attr("class"));
            if (sClasses && sClasses.length) {
                var aClasses = sClasses[1].split(",");

                for (var i = 0; i < aClasses.length; i++) {

                    var showElement = $("." + aClasses[i]);

                    if (blShow) {
                        $(showElement).show();
                        $(showElement).find('input, select, textarea').attr('disabled', false);
                    }
                    else {
                        $(showElement).hide();
                        $(showElement).find('input, select, textarea').attr('disabled', true);
                    }
                }
            }
        }
    }

    $.widget("ui.oxEnterPassword", oxEnterPassword);

})(jQuery);

(function ($) {
    oxPayment = {
        _create: function () {
            var self = this,
                    options = self.options,
                    el = self.element;

            $("input[type=radio]", el).click(function () {
                $(el).find(".abs-payment-type").removeClass('active');
                $(el).find("input[required], select[required], textarea[required]").attr('disabled', true);
                $(this).closest('.abs-payment-type').addClass('active').find("input[disabled], select[disabled], textarea[disabled]").attr('disabled', false);
            });

            // TODO: click on selected radio button
        }
    }

    $.widget("ui.oxPayment", oxPayment);

})(jQuery);

(function ($) {
    /**
     * User shipping address selector
     */
    oxUserShippingAddressSelect = {
        _create: function ()
        {
            var self = this,
                    options = self.options,
                    el = self.element;

            el.change(function () {
                var selectValue = $(this).val();

                if ($("input[name=reloadaddress]")) {
                    $("input[name=reloadaddress]").val(self.getReloadValue(selectValue));
                }
                if (selectValue !== '-1') {
                    self.submitForm();
                } else {
                    self.emptyInputFields();
                }
            });
        },
        /**
         * Clears all shipping address input fields
         *
         * @return null
         */
        emptyInputFields: function ()
        {
            $("input:text").filter(function () {
                return this.name.match(/address__/);
            }).val("");

            $('#shippingAddressForm').find('input, select, textarea').attr('disabled', false);

            $('#shippingAddressForm').show();
            $('#shippingAddressText').hide();
            $("select[name='deladr[oxaddress__oxcountryid]']").children("option").prop("selected", null);
            $("select[name='deladr[oxaddress__oxstateid]']").children('option[value=""]').prop("selected", "selected");
        },
        /**
         * Sets some form values and submits it
         *
         * @return null
         */
        submitForm: function ()
        {
            $("form[name='order'] input[name=cl]").val($("input[name=changeClass]").val());
            $("form[name='order'] input[name=fnc]").val("");
            $("form[name='order']").submit();
        },
        /**
         * Returns reloadaddress value
         *
         * @return integer
         */
        getReloadValue: function (selectValue)
        {
            if (selectValue === '-1') {
                return '1';
            } else {
                return '2';
            }
        }
    }

    $.widget("ui.oxUserShippingAddressSelect", oxUserShippingAddressSelect);

})(jQuery);