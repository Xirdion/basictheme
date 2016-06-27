[{block name="user"}]
    <form action="[{$oViewConf->getSelfActionLink()}]" name="order" method="post">
        [{block name="user_form"}]
            [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
            <div>
                [{$oViewConf->getHiddenSid()}]
                [{$oViewConf->getNavFormParams()}]
                <input type="hidden" name="fnc" value="changeuser_testvalues">
                <input type="hidden" name="cl" value="account">
                <input type="hidden" name="CustomError" value="user">
                <input type="hidden" name="blshowshipaddress" value="1">
            </div>
            <div class="m-b-1">
                [{block name="user_billing_address"}]
                    [{block name="user_billing_address_head"}]
                        <h3 class="h3 m-t-2">
                            [{oxmultilang ident="BILLING_ADDRESS"}]
                        </h3>
                    [{/block}]
                    [{block name="user_billing_address_form"}]
                        <div id="addressForm" class="m-b-2 m-t-1">
                            <div class="m-b-1">
                                [{include file="form/fieldset/user_email.tpl"}]
                            </div>
                            <div class="m-b-1">
                                [{include file="form/fieldset/user_billing.tpl" noFormSubmit=true}]
                            </div>
                            <button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o"></i> [{oxmultilang ident="SAVE"}]</button>
                        </div>
                    [{/block}]
                [{/block}]
                [{block name="user_shipping_address"}]
                    [{block name="user_shipping_address_head"}]
                        <h3 class="h3 m-t-2">
                            [{oxmultilang ident="SHIPPING_ADDRESSES"}]
                        </h3>
                    [{/block}]
                    [{block name="user_shipping_address_choice"}]
                        <div class="m-t-1">
                            <label class="c-input c-checkbox">
                                <input type="checkbox" name="blshowshipaddress" id="showShipAddress" [{if !$oView->showShipAddress()}]checked[{/if}] value="0">
                                <span class="c-indicator"></span>
                                [{oxmultilang ident="USE_BILLINGADDRESS_FOR_SHIPPINGADDRESS"}]
                            </label>
                        </div>
                    [{/block}]
                    [{block name="user_shipping_address_form"}]
                        <div id="shippingAddress" class="m-t-1 m-b-1" [{if !$oView->showShipAddress()}] style="display: none;" [{/if}]>
                            [{include file="form/fieldset/user_shipping.tpl" noFormSubmit=true}]
                            <button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o"></i> [{oxmultilang ident="SAVE"}]</button>
                        </div>
                    [{/block}]
                [{/block}]
            </div>
        [{/block}]
    </form>
[{/block}]
