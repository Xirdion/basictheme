[{capture append="oxidBlock_content"}]
    [{* ordering steps *}]
    [{include file="page/checkout/inc/steps.tpl" active=1}]

    [{block name="checkout_basket_main"}]
        [{assign var="currency" value=$oView->getActCurrency()}]
        [{if !$oxcmp_basket->getProductsCount()  }]
            [{block name="checkout_basket_emptyshippingcart"}]
                <div class="alert alert-warning" role="alert">[{oxmultilang ident="BASKET_EMPTY"}]</div>
            [{/block}]
        [{else}]
            [{block name="checkout_basket_next_step_top"}]
                <div class="row m-b-3">
                    [{if $oView->showBackToShop()}]
                        [{block name="checkout_basket_backtoshop_top"}]
                            <div class="backtoshop">
                                <form action="[{$oViewConf->getSslSelfLink()}]" method="post">
                                    <div>
                                        [{$oViewConf->getHiddenSid()}]
                                        <input type="hidden" name="cl" value="basket">
                                        <input type="hidden" name="fnc" value="backtoshop">
                                    </div>
                                    <button type="submit" class="btn btn-secondary">[{oxmultilang ident="CONTINUE_SHOPPING"}]</button>
                                </form>
                            </div>
                        [{/block}]
                    [{/if}]

                    [{if $oView->isLowOrderPrice() }]
                        [{block name="checkout_basket_loworderprice_top"}]
                            <div class="alert alert-warning" role="alert">
                                [{oxmultilang ident="MIN_ORDER_PRICE"}] [{$oView->getMinOrderPrice()}] [{$currency->sign}]
                            </div>
                        [{/block}]
                    [{else}]
                        [{block name="basket_btn_next_top"}]
                            <div class="col-sm-6 col-md-4 col-md-offset-8">
                                <form action="[{$oViewConf->getSslSelfLink()}]" method="post">
                                    <div>
                                        [{$oViewConf->getHiddenSid()}]
                                        <input type="hidden" name="cl" value="user">
                                    </div>
                                    <button type="submit" class="btn btn-primary pull-md-right">[{oxmultilang ident="CONTINUE_TO_NEXT_STEP"}] <i class="fa fa-chevron-right"></i></button>
                                </form>
                            </div>
                        [{/block}]
                    [{/if}]
                </div>
            [{/block}]

            <div id="abs-basketcontents" class="m-b-3">
                [{include file="page/checkout/inc/basketcontents.tpl" editable=true}]

                [{if $oViewConf->getShowVouchers()}]
                    [{block name="checkout_basket_vouchers"}]
                        <div class="row">
                            <div class="col-sm-8 col-sm-offset-4 col-lg-5 col-lg-offset-7 text-xs-left">
                                <form name="voucher" action="[{$oViewConf->getSelfActionLink()}]" method="post" class="js-oxValidate">
                                    <div>
                                        [{$oViewConf->getHiddenSid()}]
                                        <input type="hidden" name="cl" value="basket">
                                        <input type="hidden" name="fnc" value="addVoucher">
                                    </div>
                                    <div>
                                        <div id="abs-voucher-input" class="input-group req">
                                            <span class="input-group-addon" id="abs-voucher-label">[{oxmultilang ident="ENTER_COUPON_NUMBER" suffix="COLON"}]</span>
                                            <input required type="text" class="form-control" name="voucherNr" aria-describedby="abs-voucher-label">
                                            <span class="input-group-btn">
                                                <button class="btn btn-secondary" type="submit"><i class="fa fa-ticket"></i></button>
                                            </span>
                                        </div>
                                        <input type="hidden" name="CustomError" value='basket'>
                                        [{foreach from=$Errors.basket item=oEr key=key}]
                                            [{if $oEr->getErrorClassType() == 'oxVoucherException'}]
                                                <div class="alert alert-danger" role="alert">
                                                    [{oxmultilang ident="COUPON_NOT_ACCEPTED" args=$oEr->getValue('voucherNr')}]
                                                    <strong>[{oxmultilang ident="REASON" suffix="COLON"}]</strong>
                                                    [{$oEr->getOxMessage()}]
                                                </div>
                                            [{/if}]
                                        [{/foreach}]
                                    </div>
                                </form>
                            </div>
                        </div>
                    [{/block}]
                [{/if}]
            </div>

            [{block name="checkout_basket_next_step_bottom"}]
                <div class="row">
                    [{if $oView->showBackToShop()}]
                        [{block name="checkout_basket_backtoshop_bottom"}]
                            <form action="[{$oViewConf->getSslSelfLink()}]" method="post">
                                <div class="backtoshop">
                                    <div>
                                        [{$oViewConf->getHiddenSid()}]
                                        <input type="hidden" name="cl" value="basket">
                                        <input type="hidden" name="fnc" value="backtoshop">
                                    </div>
                                    <button type="submit" class="btn">[{oxmultilang ident="CONTINUE_SHOPPING"}]</button>
                                </div>
                            </form>
                        [{/block}]
                    [{/if}]

                    [{if $oView->isLowOrderPrice()}]
                        [{block name="checkout_basket_loworderprice_bottom"}]
                            <div>[{oxmultilang ident="MIN_ORDER_PRICE"}] [{$oView->getMinOrderPrice()}] [{$currency->sign}]</div>
                        [{/block}]
                    [{else}]
                        [{block name="basket_btn_next_bottom"}]
                            <div class="col-sm-6 col-md-4 col-md-offset-8">
                                <form action="[{$oViewConf->getSslSelfLink()}]" method="post">
                                    <div>
                                        [{$oViewConf->getHiddenSid()}]
                                        <input type="hidden" name="cl" value="user">
                                    </div>
                                    <button type="submit" class="btn btn-primary pull-md-right">[{oxmultilang ident="CONTINUE_TO_NEXT_STEP"}] <i class="fa fa-chevron-right"></i></button>
                                </form>
                            </div>
                        [{/block}]
                    [{/if}]
                </div>
            [{/block}]
        [{/if}]
        [{* not supported *}]
        [{*if $oView->isWrapping() }]
            [{include file="page/checkout/inc/wrapping.tpl"}]
        [{/if*}]
    [{/block}]
[{/capture}]

[{include file="layout/page.tpl"}]