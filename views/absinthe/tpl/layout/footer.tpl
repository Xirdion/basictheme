[{block name="footer_main"}]
    <div id="abs-footer">
        <div id="abs-footer-newsletter" class="p-t-1 p-b-1">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-md-6 abs-newsletter-delinfo p-b-1">
                        [{block name="footer_deliveryinfo"}]
                            [{oxifcontent ident="oxdeliveryinfo" object="oCont"}]
                                [{if $oView->isVatIncluded()}]
                                    <a href="[{$oCont->getLink()}]" rel="nofollow">* [{oxmultilang ident="PLUS_SHIPPING"}] [{oxmultilang ident="PLUS_SHIPPING2"}]</a>
                                [{else}]
                                    <a href="[{$oCont->getLink()}]" rel="nofollow">* [{oxmultilang ident="PLUS"}] [{oxmultilang ident="PLUS_SHIPPING2"}]</a>
                                [{/if}]
                            [{/oxifcontent}]
                        [{/block}]
                    </div>
                    <div class="col-xs-12 col-md-6 col-lg-4 col-lg-offset-2">
                        [{if $oView->showNewsletter()}]
                            [{include file="widget/footer/newsletter.tpl"}]
                        [{/if}]

                    </div>
                </div>
            </div>
        </div>
        <div class="container">

            <div id="abs-footer-links" class="row p-t-2">
                [{*block name="footer_fblike"}]
                    [{if $oView->isActive('FbLike') && $oViewConf->getFbAppId()}]
                        <div class="facebook" id="footerFbLike">
                            [{include file="widget/facebook/enable.tpl" source="widget/facebook/like.tpl" ident="#footerFbLike" parent="footer"}]
                        </div>
                    [{/if}]
                [{/block*}]

                [{oxid_include_widget cl="oxwServiceList" noscript=1 nocookie=1}]

                [{oxid_include_widget cl="oxwInformation" noscript=1 nocookie=1}]

                [{oxid_include_widget cl="oxwManufacturerList" _parent=$oView->getClassName() noscript=1 nocookie=1}]

                [{oxid_include_widget cl="oxwCategoryTree" _parent=$oView->getClassName() sWidgetType="footer" noscript=1 nocookie=1}]

            </div>
        </div>
    </div>
[{/block}]
[{if $oView->isRootCatChanged()}]
    [{oxscript include="js/widgets/oxmodalpopup.js" priority=10}]
    [{oxscript add="$( '#scRootCatChanged' ).oxModalPopup({ target: '#scRootCatChanged', openDialog: true});"}]
    <div id="scRootCatChanged" class="popupBox corners FXgradGreyLight glowShadow">
        [{include file="form/privatesales/basketexcl.tpl"}]
    </div>
[{/if}]