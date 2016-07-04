[{capture append="oxidBlock_content"}]
    [{block name="checkout_order_errors"}]
        [{if $oView->isConfirmAGBError() == 1}]
            [{include file="message/error.tpl" statusMessage="READ_AND_CONFIRM_TERMS"|oxmultilangassign}]
        [{/if}]
        [{assign var="iError" value=$oView->getAddressError()}]
        [{if $iError == 1}]
            [{include file="message/error.tpl" statusMessage="ERROR_DELIVERY_ADDRESS_WAS_CHANGED_DURING_CHECKOUT"|oxmultilangassign}]
        [{/if}]
    [{/block}]

    [{* ordering steps *}]
    [{include file="page/checkout/inc/steps.tpl" active=4}]

    [{block name="checkout_order_main"}]
        [{if !$oView->showOrderButtonOnTop()}]
            <div class="m-t-2 m-b-2">
                <span>[{oxmultilang ident="MESSAGE_SUBMIT_BOTTOM"}]</span>
            </div>
        [{/if}]

        [{block name="checkout_order_details"}]
            [{if !$oxcmp_basket->getProductsCount()}]
                [{block name="checkout_order_emptyshippingcart"}]
                    <div class="status corners error">[{oxmultilang ident="BASKET_EMPTY"}]</div>
                [{/block}]
            [{else}]
                [{assign var="currency" value=$oView->getActCurrency()}]
                [{block name="checkout_order_next_step_top"}]
                    [{if $oView->isLowOrderPrice()}]
                        [{block name="checkout_order_loworderprice_top"}]
                            <div>[{oxmultilang ident="MIN_ORDER_PRICE"}] [{$oView->getMinOrderPrice()}] [{$currency->sign}]</div>
                        [{/block}]
                    [{else}]
                        [{block name="checkout_order_btn_confirm_top"}]
                            [{if $oView->showOrderButtonOnTop()}]
                                <div>
                                    <form action="[{$oViewConf->getSslSelfLink()}]" method="post" id="orderConfirmAgbTop">
                                        <div>
                                            [{$oViewConf->getHiddenSid()}]
                                            [{$oViewConf->getNavFormParams()}]
                                            <input type="hidden" name="cl" value="order">
                                            <input type="hidden" name="fnc" value="[{$oView->getExecuteFnc()}]">
                                            <input type="hidden" name="challenge" value="[{$challenge}]">
                                            <input type="hidden" name="sDeliveryAddressMD5" value="[{$oView->getDeliveryAddressMD5()}]">
                                        </div>
                                        [{include file="page/checkout/inc/agb.tpl"}]
                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 m-b-1">
                                                <a href="[{oxgetseourl ident=$oViewConf->getPaymentLink()}]" class="btn btn-secondary"><i class="fa fa-chevron-left"></i> [{oxmultilang ident="PREVIOUS_STEP"}]</a>
                                            </div>
                                            <div class="col-sm-6 col-sm-offset-3 col-md-3 col-md-offset-7 col-xs-offset-0 m-b-2">
                                                <button class="btn btn-primary pull-sm-right" name="userform" type="submit">[{oxmultilang ident="SUBMIT_ORDER"}] <i class="fa fa-chevron-right"></i></button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            [{/if}]
                        [{/block}]
                    [{/if}]
                [{/block}]

                [{* not supported *}]
                [{*block name="checkout_order_vouchers"}]
                [{if $oViewConf->getShowVouchers() && $oxcmp_basket->getVouchers()}]
                [{oxmultilang ident="USED_COUPONS"}]
                <div>
                    [{foreach from=$Errors.basket item=oEr key=key}]
                    [{if $oEr->getErrorClassType() == 'oxVoucherException'}]
                    [{oxmultilang ident="COUPON_NOT_ACCEPTED" args=$oEr->getValue('voucherNr')}]<br>
                    [{oxmultilang ident="REASON" suffix="COLON"}]
                    [{$oEr->getOxMessage()}]<br>
                    [{/if}]
                    [{/foreach}]
                    [{foreach from=$oxcmp_basket->getVouchers() item=sVoucher key=key name=aVouchers}]
                    [{$sVoucher->sVoucherNr}]<br>
                    [{/foreach}]
                </div>
                [{/if}]
                [{/block*}]

                <div class="row">
                    [{block name="checkout_order_address"}]
                        <div class="col-xs-12 col-sm-12 col-md-4">
                            <form action="[{$oViewConf->getSslSelfLink()}]" method="post">
                                <div>
                                    [{$oViewConf->getHiddenSid()}]
                                    <input type="hidden" name="cl" value="user">
                                    <input type="hidden" name="fnc" value="">
                                </div>
                                <h3 class="h3">
                                    <strong>[{oxmultilang ident="ADDRESSES"}]</strong>
                                    <button type="submit" class="btn btn-primary">[{oxmultilang ident="EDIT"}]</button>
                                </h3>
                            </form>
                            <div class="m-b-1 m-t-1">
                                <div><b>[{oxmultilang ident="BILLING_ADDRESS"}]</b></div>
                                <div>
                                    [{include file="widget/address/billing_address.tpl"}]
                                </div>
                            </div>
                            [{assign var="oDelAdress" value=$oView->getDelAddress()}]
                            [{if $oDelAdress}]
                                <dl class="shippingAddress">
                                    <div><b>[{oxmultilang ident="SHIPPING_ADDRESS"}]</b></div>
                                    <div>
                                        [{include file="widget/address/shipping_address.tpl" delivadr=$oDelAdress}]
                                    </div>
                                </dl>
                            [{/if}]

                            [{if $oView->getOrderRemark()}]
                                <div class="orderRemarks">
                                    <div>[{oxmultilang ident="WHAT_I_WANTED_TO_SAY" suffix="COLON"}]</div>
                                    <div>
                                        [{$oView->getOrderRemark()}]
                                    </div>
                                </div>
                            [{/if}]
                        </div>
                    [{/block}]

                    [{block name="shippingAndPayment"}]
                        <div class="m-b-1 col-xs-12 col-sm-12 col-md-4">
                            <form action="[{$oViewConf->getSslSelfLink()}]" method="post">
                                <div>
                                    [{$oViewConf->getHiddenSid()}]
                                    <input type="hidden" name="cl" value="payment">
                                    <input type="hidden" name="fnc" value="">
                                </div>
                                <h3 class="h3">
                                    <strong>[{oxmultilang ident="SHIPPING_CARRIER"}]</strong>
                                    <button type="submit" class="btn btn-primary">[{oxmultilang ident="EDIT"}]</button>
                                </h3>
                            </form>
                            [{assign var="oShipSet" value=$oView->getShipSet()}]
                            [{$oShipSet->oxdeliveryset__oxtitle->value}]
                        </div>

                        <div class="m-b-1 col-xs-12 col-sm-12 col-md-4">
                            <form action="[{$oViewConf->getSslSelfLink()}]" method="post">
                                <div>
                                    [{$oViewConf->getHiddenSid()}]
                                    <input type="hidden" name="cl" value="payment">
                                    <input type="hidden" name="fnc" value="">
                                </div>
                                <h3 class="h3">
                                    <strong>[{oxmultilang ident="PAYMENT_METHOD"}]</strong>
                                    <button type="submit" class="btn btn-primary">[{oxmultilang ident="EDIT"}]</button>
                                </h3>
                            </form>
                            [{assign var="payment" value=$oView->getPayment()}]
                            [{$payment->oxpayments__oxdesc->value}]
                        </div>
                    [{/block}]
                </div>

                <div class="m-t-1">
                    <form action="[{$oViewConf->getSslSelfLink()}]" method="post">
                        <div>
                            [{$oViewConf->getHiddenSid()}]
                            <input type="hidden" name="cl" value="basket">
                            <input type="hidden" name="fnc" value="">
                        </div>
                        <h3 class="h3">
                            <strong>[{oxmultilang ident="CART"}]</strong>
                            <button type="submit" class="btn btn-primary">[{oxmultilang ident="EDIT"}]</button>
                        </h3>
                    </form>
                </div>

                <div id="abs-basketcontents" class="lineBox clear">
                    [{block name="order_basket"}]
                        [{include file="page/checkout/inc/basketcontents.tpl" editable=false}]
                    [{/block}]

                    [{block name="checkout_order_next_step_bottom"}]
                        [{if $oView->isLowOrderPrice()}]
                            [{block name="checkout_order_loworderprice_bottom"}]
                                <div>[{oxmultilang ident="MIN_ORDER_PRICE"}] [{$oView->getMinOrderPrice()}] [{$currency->sign}]</div>
                            [{/block}]
                        [{else}]
                            [{block name="checkout_order_btn_confirm_bottom"}]
                                <form action="[{$oViewConf->getSslSelfLink()}]" method="post" id="orderConfirmAgbBottom">
                                    <div>
                                        [{$oViewConf->getHiddenSid()}]
                                        [{$oViewConf->getNavFormParams()}]
                                        <input type="hidden" name="cl" value="order">
                                        <input type="hidden" name="fnc" value="[{$oView->getExecuteFnc()}]">
                                        <input type="hidden" name="challenge" value="[{$challenge}]">
                                        <input type="hidden" name="sDeliveryAddressMD5" value="[{$oView->getDeliveryAddressMD5()}]">
                                    </div>
                                    [{if $oViewConf->isFunctionalityEnabled("blShowTSInternationalFeesMessage")}]
                                        [{oxifcontent ident="oxtsinternationalfees" object="oTSIFContent"}]
                                            <hr/>
                                            <div class="clear">
                                                <span class="title">[{$oTSIFContent->oxcontents__oxcontent->value}]</span>
                                            </div>
                                        [{/oxifcontent}]
                                    [{/if}]

                                    [{if $payment->oxpayments__oxid->value eq "oxidcashondel" && $oViewConf->isFunctionalityEnabled("blShowTSCODMessage")}]
                                        [{oxifcontent ident="oxtscodmessage" object="oTSCODContent"}]
                                            <hr/>
                                            <div class="clear">
                                                <span class="title">[{$oTSCODContent->oxcontents__oxcontent->value}]</span>
                                            </div>
                                        [{/oxifcontent}]
                                    [{/if}]
                                    <hr/>

                                    [{if !$oView->showOrderButtonOnTop()}]
                                        [{include file="page/checkout/inc/agb.tpl"}]
                                        <hr/>
                                    [{else}]
                                        [{include file="page/checkout/inc/agb.tpl" hideButtons=true}]
                                    [{/if}]

                                    
                                    <div class="row">
                                        <div class="col-sm-3 col-md-2 m-b-1">
                                            <a href="[{oxgetseourl ident=$oViewConf->getPaymentLink()}]" class="btn btn-secondary"><i class="fa fa-chevron-left"></i> [{oxmultilang ident="PREVIOUS_STEP"}]</a>
                                        </div>
                                        <div class="col-sm-6 col-sm-offset-3 col-md-3 col-md-offset-7 col-xs-offset-0 m-b-2">
                                            <button class="btn btn-primary pull-sm-right" type="submit">[{oxmultilang ident="SUBMIT_ORDER"}] <i class="fa fa-chevron-right"></i></button>
                                        </div>
                                    </div>
                                </form>
                            [{/block}]
                        [{/if}]
                    [{/block}]
                </div>
            [{/if}]
        [{/block}]
    [{/block}]
[{/capture}]
[{include file="layout/page.tpl"}]
