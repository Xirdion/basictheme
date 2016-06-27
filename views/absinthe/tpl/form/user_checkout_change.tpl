[{*oxscript include="js/widgets/oxinputvalidator.js" priority=10}]
[{oxscript add="$('form.js-oxValidate').oxInputValidator();"*}]
[{block name="user_checkout_change"}]
    <form action="[{$oViewConf->getSslSelfLink()}]" name="order" method="post">
        [{block name="user_checkout_change_form"}]
            [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
            <div>
                [{$oViewConf->getHiddenSid()}]
                [{$oViewConf->getNavFormParams()}]
                <input type="hidden" name="cl" value="user">
                <input type="hidden" name="option" value="[{$oView->getLoginOption()}]">
                <input type="hidden" name="fnc" value="changeuser">
                <input type="hidden" name="lgn_cook" value="0">
                <input type="hidden" name="blshowshipaddress" value="1">
            </div>
            [{block name="user_checkout_change_next_step_top"}]
                <div class="row m-b-2">
                    <div class="col-sm-3 col-md-2 m-b-1">
                        <a href="[{oxgetseourl ident=$oViewConf->getBasketLink()}]" class="btn btn-secondary"><i class="fa fa-chevron-left"></i> [{oxmultilang ident="PREVIOUS_STEP"}]</a>
                    </div>
                    <div class="col-sm-6 col-sm-offset-3 col-md-3 col-md-offset-7 col-xs-offset-0">
                        <button class="btn btn-primary pull-sm-right" name="userform" type="submit">[{oxmultilang ident="CONTINUE_TO_NEXT_STEP"}] <i class="fa fa-chevron-right"></i></button>
                    </div>
                </div>
            [{*    <div class="col-sm-2 col-sm-offset-6 col-md-offset-8 col-lg-offset-9">
            <form action="http://localhost:8890/index.php?lang=1&amp;" method="post">
            <input type="hidden" name="stoken" value="1F083AF0">
            <input type="hidden" name="lang" value="1">
            <input type="hidden" name="cl" value="user">
            <button type="submit" class="btn">Weiter zum nächsten Schritt <i class="fa fa-chevron-right"></i></button>
            </form>
            </div>*}]

            [{/block}]
            [{block name="user_checkout_billing"}]
                [{block name="user_checkout_billing_head"}]
                    <h3 class="h3">
                        [{oxmultilang ident="BILLING_ADDRESS"}]
                        <button id="userChangeAddress" class="btn btn-primary" name="changeBillAddress" type="submit">[{oxmultilang ident="CHANGE"}]</button>
                        <span class="btn">&nbsp;</span>
                    </h3>
                    [{oxscript add="$('#userChangeAddress').click( function() { $('#addressForm').show();$('#addressText').hide();$('#userChangeAddress').hide();return false;});"}]
                    [{if $aErrors}]
                        [{oxscript add="$(document).ready(function(){ $('#userChangeAddress').trigger('click');});"}]
                    [{/if}]
                [{/block}]
                [{block name="user_checkout_billing_form"}]
                    <div class="m-t-1 m-b-1" style="display: none;" id="addressForm">
                        [{include file="form/fieldset/user_billing.tpl" noFormSubmit=true blSubscribeNews=true blOrderRemark=true}]
                    </div>
                [{/block}]
                [{block name="user_checkout_billing_feedback"}]
                    <div id="addressText" class="m-t-1 m-b-1">
                        [{include file="widget/address/billing_address.tpl" noFormSubmit=true blSubscribeNews=true blOrderRemark=true}]
                    </div>
                [{/block}]
            [{/block}]

            [{block name="user_checkout_shipping"}]
                [{block name="user_checkout_shipping_head"}]
                    <h3 class="h3">[{oxmultilang ident="SHIPPING_ADDRESS"}]
                        <button id="userChangeShippingAddress" class="btn btn-primary" name="changeShippingAddress" type="submit" [{if !$oView->showShipAddress() or !$oxcmp_user->getSelectedAddress()}] style="display: none;" [{/if}]>[{oxmultilang ident="CHANGE"}]</button>
                        <span class="btn">&nbsp;</span>
                    </h3>
                    [{oxscript add="$('#showShipAddress').change(function() { $('#userChangeShippingAddress').toggle($(this).is(':not(:checked)') && $('#addressId').val() != -1 ); }); "}]
                    [{oxscript add="$('#addressId').change(function() { $('#userChangeShippingAddress').toggle($('#addressId').val() != -1 ); }); "}]
                [{/block}]
                [{block name="user_checkout_shipping_change"}]
                    <div class="m-t-1 m-b-1">
                        <label class="c-input c-checkbox">
                            <input type="checkbox" name="blshowshipaddress" id="showShipAddress" [{if !$oView->showShipAddress()}]checked[{/if}] value="0">
                            <span class="c-indicator"></span>
                            [{oxmultilang ident="USE_BILLINGADDRESS_FOR_SHIPPINGADDRESS"}]
                        </label>
                    </div>
                    [{oxscript add="$('#showShipAddress').change( function() { $('#shippingAddress').toggle($(this).is(':not(:checked)'));});"}]
                [{/block}]
                [{block name="user_checkout_shipping_form"}]
                    <div id="shippingAddress" [{if !$oView->showShipAddress()}] style="display: none;" [{/if}]>
                        [{include file="form/fieldset/user_shipping.tpl" noFormSubmit=true onChangeClass='user'}]
                    </div>
                [{/block}]
                [{block name="user_checkout_shipping_feedback"}]
                    <div class="m-b-1 m-t-1">
                        [{include file="form/fieldset/order_newsletter.tpl" blSubscribeNews=true}]
                    </div>
                    <div class="m-b-2">
                        [{include file="form/fieldset/order_remark.tpl" blOrderRemark=true}]
                    </div>
                [{/block}]
            [{/block}]
            [{block name="user_checkout_change_next_step_bottom"}]
                <div class="row">
                    <div class="col-sm-3 col-md-2 m-b-1">
                        <a href="[{oxgetseourl ident=$oViewConf->getBasketLink()}]" class="btn btn-secondary"><i class="fa fa-chevron-left"></i> [{oxmultilang ident="PREVIOUS_STEP"}]</a>
                    </div>
                    <div class="col-sm-6 col-sm-offset-3 col-md-3 col-md-offset-7 col-xs-offset-0">
                        <button class="btn btn-primary pull-sm-right" name="userform" type="submit">[{oxmultilang ident="CONTINUE_TO_NEXT_STEP"}] <i class="fa fa-chevron-right"></i></button>
                    </div>
                </div>
            [{/block}]
        [{/block}]
    </form>
[{/block}]
