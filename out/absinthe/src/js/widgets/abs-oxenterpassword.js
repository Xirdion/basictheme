/* 
 *     This File ist part of Absinth. Drink responsibly.
 */


( function( $ ) {
    /**
     * Show password field if email will be changed
     */
    oxEnterPassword = {
        options: {
            metodEnterPasswd      : "oxValidate_enterPass"
        },

        _create: function()
        {
            var self    = this,
            options = self.options,
            el      = self.element;

            el.bind ( "keyup", function() {
                self.showInput( el, el.val() != el.prop( "defaultValue" ), options.metodEnterPasswd );
            });
        },

        /**
         * Shows/hides given element
         */
        showInput: function( oSource, blShow, sClass )
        {
            var oRegexp  = new RegExp( sClass + "Target\\[(.+)\\]", "g" );
            var sClasses = oRegexp.exec( oSource.attr( "class" ) );
            if ( sClasses && sClasses.length ) {
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

    $.widget( "ui.oxEnterPassword", oxEnterPassword );

} )( jQuery );