[{*oxscript include="js/widgets/oxinputvalidator.js" priority=10}]
[{oxscript add="$('form.js-oxValidate').oxInputValidator();"*}]
[{block name="user_checkout_registration"}]
    <form action="[{$oViewConf->getSslSelfLink()}]" name="order" method="post">
        [{block name="user_checkout_registration_form"}]
            [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
            <div>
                [{$oViewConf->getHiddenSid()}]
                [{$oViewConf->getNavFormParams()}]
                <input type="hidden" name="cl" value="user">
                <input type="hidden" name="option" value="3">
                [{if !$oxcmp_user->oxuser__oxpassword->value}]
                    <input type="hidden" name="fnc" value="createuser">
                [{else}]
                    <input type="hidden" name="fnc" value="changeuser">
                    <input type="hidden" name="lgn_cook" value="0">
                [{/if}]
                <input type="hidden" id="reloadAddress" name="reloadaddress" value="">
                <input type="hidden" name="blshowshipaddress" value="1">
            </div>
            [{block name="user_checkout_registration_next_step_top"}]
                <div class="row">
                    <div class="col-sm-3 col-md-2 m-b-1">
                        <a href="[{oxgetseourl ident=$oViewConf->getBasketLink()}]" class="btn btn-secondary"><i class="fa fa-chevron-left"></i> [{oxmultilang ident="PREVIOUS_STEP"}]</a>
                    </div>
                    <div class="col-sm-6 col-sm-offset-3 col-md-3 col-md-offset-7 col-xs-offset-0 m-b-2">
                        <button class="btn btn-primary pull-sm-right" name="userform" type="submit">[{oxmultilang ident="CONTINUE_TO_NEXT_STEP"}] <i class="fa fa-chevron-right"></i></button>
                    </div>
                </div>
            [{/block}]
            <h3 class="h3">[{oxmultilang ident="ACCOUNT_INFORMATION"}]</h3>
            <div class="m-t-1 m-b-1">
                [{include file="form/fieldset/user_account.tpl"}]
            </div>
            <h3 class="h3">[{oxmultilang ident="BILLING_ADDRESS"}]</h3>
            <div class="m-t-1 m-b-1">
                [{include file="form/fieldset/user_billing.tpl" noFormSubmit=true blSubscribeNews=false blOrderRemark=true}]
            </div>
            <h3 class="h3">[{oxmultilang ident="SHIPPING_ADDRESS"}]</h3>
            <div class="m-t-1 m-b-1">
                <input type="checkbox" name="blshowshipaddress" id="showShipAddress" [{if !$oView->showShipAddress()}]checked[{/if}] value="0"><label for="showShipAddress">[{oxmultilang ident="USE_BILLINGADDRESS_FOR_SHIPPINGADDRESS"}]</label>
            </div>
            <div id="shippingAddress" [{if !$oView->showShipAddress()}] style="display: none;" [{/if}]>
                [{include file="form/fieldset/user_shipping.tpl" noFormSubmit=true}]
            </div>
            <div class="m-t-1 m-b-1">
                [{include file="form/fieldset/order_remark.tpl" blOrderRemark=true}]
            </div>
            [{oxscript add="$('#showShipAddress').change( function() { $('#shippingAddress').toggle($(this).is(':not(:checked)'));});"}]
            [{block name="user_checkout_registration_next_step_bottom"}]
                <div class="row">
                    <div class="col-sm-3 col-md-2 m-b-1">
                        <a href="[{oxgetseourl ident=$oViewConf->getBasketLink()}]" class="btn btn-secondary"><i class="fa fa-chevron-left"></i> [{oxmultilang ident="PREVIOUS_STEP"}]</a>
                    </div>
                    <div class="col-sm-6 col-sm-offset-3 col-md-3 col-md-offset-7 col-xs-offset-0 m-b-2">
                        <button class="btn btn-primary pull-sm-right" name="userform" type="submit">[{oxmultilang ident="CONTINUE_TO_NEXT_STEP"}] <i class="fa fa-chevron-right"></i></button>
                    </div>
                </div>
            [{/block}]
        [{/block}]
    </form>
[{/block}]