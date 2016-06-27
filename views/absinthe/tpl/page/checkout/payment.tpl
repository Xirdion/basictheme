[{capture append="oxidBlock_content"}]

[{* ordering steps *}]
[{include file="page/checkout/inc/steps.tpl" active=3 }]

[{block name="checkout_payment_main"}]
[{assign var="currency" value=$oView->getActCurrency() }]
[{block name="change_shipping"}]
[{if $oView->getAllSets()}]
[{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
<form action="[{$oViewConf->getSslSelfLink()}]" name="shipping" id="shipping" method="post">
    [{$oViewConf->getHiddenSid()}]
    [{$oViewConf->getNavFormParams()}]
    <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
    <input type="hidden" name="fnc" value="changeshipping">

    <h3 class="h3">[{if $oView->getAllSetsCnt() > 1}][{oxmultilang ident="SELECT_SHIPPING_METHOD" suffix="COLON"}][{else}][{oxmultilang ident="SELECT_SHIPPING_METHOD" suffix="COLON"}][{/if}]</h3>

    [{block name="act_shipping"}]
    <div class="row m-t-2 m-b-2">
        <div class="col-sm-5 col-md-4">

            <select name="sShipSet" onChange="JavaScript:document.forms.shipping.submit();" class="form-control">
                [{foreach key=sShipID from=$oView->getAllSets() item=oShippingSet name=ShipSetSelect}]
                <option value="[{$sShipID}]" [{if $oShippingSet->blSelected}]selected[{/if}]>[{$oShippingSet->oxdeliveryset__oxtitle->value}]</option>
                [{/foreach}]
            </select>
        </div>
    </div>
    [{/block}]

    [{assign var="oDeliveryCostPrice" value=$oxcmp_basket->getDeliveryCost() }]
    [{if $oDeliveryCostPrice && $oDeliveryCostPrice->getPrice() > 0}]
    <div id="shipSetCost" class="m-t-1 m-b-1">
        [{if $oViewConf->isFunctionalityEnabled('blShowVATForDelivery') }]
        <b>[{oxmultilang ident="CHARGES" suffix="COLON"}] [{oxprice price=$oDeliveryCostPrice->getNettoPrice() currency=$currency}]
            ([{ oxmultilang ident="PLUS_VAT" }]
            [{oxprice price=$oDeliveryCostPrice->getVatValue() currency=$currency}])
        </b>
        [{else}]
        <b>[{oxmultilang ident="CHARGES" suffix="COLON" }] [{oxprice price=$oDeliveryCostPrice->getBruttoPrice() currency=$currency}]</b>

        [{/if}]
    </div>
    [{/if}]
</form>
[{/if}]
[{/block}]

[{block name="checkout_payment_errors"}]
[{assign var="iPayError" value=$oView->getPaymentError()}]
[{if $iPayError == 1}]
<div class="status error">[{oxmultilang ident="ERROR_MESSAGE_COMPLETE_FIELDS_CORRECTLY"}]</div>
[{elseif $iPayError == 2}]
<div class="status error">[{oxmultilang ident="MESSAGE_PAYMENT_AUTHORIZATION_FAILED"}]</div>
[{elseif $iPayError == 4}]
<div class="status error">[{oxmultilang ident="MESSAGE_UNAVAILABLE_SHIPPING_METHOD"}]</div>
[{elseif $iPayError == 5}]
<div class="status error">[{oxmultilang ident="MESSAGE_PAYMENT_UNAVAILABLE_PAYMENT"}]</div>
[{elseif $iPayError == 6}]
<div class="status error">[{oxmultilang ident="TRUSTED_SHOP_UNAVAILABLE_PROTECTION"}]</div>
[{elseif $iPayError > 6}]
<!--Add custom error message here-->
<div class="status error">[{oxmultilang ident="MESSAGE_PAYMENT_UNAVAILABLE_PAYMENT"}]</div>
[{elseif $iPayError == -1}]
<div class="status error">[{oxmultilang ident="MESSAGE_PAYMENT_UNAVAILABLE_PAYMENT_ERROR" suffix="COLON"}] "[{$oView->getPaymentErrorText()}]").</div>
[{elseif $iPayError == -2}]
<div class="status error">[{oxmultilang ident="MESSAGE_NO_SHIPPING_METHOD_FOUND"}]</div>
[{elseif $iPayError == -3}]
<div class="status error">[{oxmultilang ident="MESSAGE_PAYMENT_SELECT_ANOTHER_PAYMENT"}]</div>
[{elseif $iPayError == -4}]
<div class="status error">[{oxmultilang ident="MESSAGE_PAYMENT_BANK_CODE_INVALID"}]</div>
[{elseif $iPayError == -5}]
<div class="status error">[{oxmultilang ident="MESSAGE_PAYMENT_ACCOUNT_NUMBER_INVALID"}]</div>
[{/if}]
[{/block}]

[{block name="change_payment"}]
[{oxscript include="js/widgets/abs-oxpayment.js" priority=10}]
[{oxscript add="$( '#payment' ).oxPayment();"}]
<form action="[{$oViewConf->getSslSelfLink()}]" id="payment" name="order" method="post">
    <div>
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
        <input type="hidden" name="fnc" value="validatepayment">
    </div>

    [{if $oView->getPaymentList()}]
    <h3 class="h3">[{oxmultilang ident="PAYMENT_METHOD"}]</h3>
    [{assign var="inptcounter" value="-1"}]

    <div class="m-t-2 m-b-2">
        [{foreach key=sPaymentID from=$oView->getPaymentList() item=paymentmethod name=PaymentSelect}]
        <div class="abs-payment-type [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]active[{/if}]">
            [{assign var="inptcounter" value="`$inptcounter+1`"}]
            [{block name="select_payment"}]
            [{if $sPaymentID == "oxidcashondel"}]
            [{include file="page/checkout/inc/payment_oxidcashondel.tpl"}]
            [{elseif $sPaymentID == "oxidcreditcard"}]
            [{include file="page/checkout/inc/payment_oxidcreditcard.tpl"}]
            [{elseif $sPaymentID == "oxiddebitnote"}]
            [{include file="page/checkout/inc/payment_oxiddebitnote.tpl"}]
            [{else}]
            [{include file="page/checkout/inc/payment_other.tpl"}]
            [{/if}]
            [{/block}]
        </div>
        [{/foreach}]

    </div>

    [{* TRUSTED SHOPS BEGIN *}]
    [{include file="page/checkout/inc/trustedshops.tpl"}]
    [{* TRUSTED SHOPS END *}]

    [{block name="checkout_payment_nextstep"}]
    [{if $oView->isLowOrderPrice()}]

    <div class="alert alert-warning" role="alert">[{oxmultilang ident="MIN_ORDER_PRICE"}] [{oxprice price=$oxcmp_basket->getMinOrderPrice() currency=$currency}]</div>

    [{else}]
    <div class="row">
        <div class="col-sm-3 col-md-2 m-b-1">
            <a href="[{oxgetseourl ident=$oViewConf->getOrderLink()}]" class="btn btn-secondary"><i class="fa fa-chevron-left"></i> [{oxmultilang ident="PREVIOUS_STEP"}]</a>
        </div>
        <div class="col-sm-6 col-sm-offset-3 col-md-3 col-md-offset-7 col-xs-offset-0 m-b-2">
            <button class="btn btn-primary pull-sm-right" name="userform" type="submit">[{oxmultilang ident="CONTINUE_TO_NEXT_STEP"}] <i class="fa fa-chevron-right"></i></button>
        </div>
    </div>
    [{/if}]
    [{/block}]

    [{elseif $oView->getEmptyPayment()}]
    [{block name="checkout_payment_nopaymentsfound"}]
    <h3 class="h3">[{oxmultilang ident="PAYMENT_INFORMATION"}]</h3>
    [{oxifcontent ident="oxnopaymentmethod" object="oCont"}]
    [{$oCont->oxcontents__oxcontent->value}]
    [{/oxifcontent}]
    <input type="hidden" name="paymentid" value="oxempty">

    <div class="row">
        <div class="col-sm-3 col-md-2 m-b-1">
            <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=user"}]" class="btn btn-secondary"><i class="fa fa-chevron-left"></i> [{oxmultilang ident="PREVIOUS_STEP"}]</a>
        </div>
        <div class="col-sm-6 col-sm-offset-3 col-md-3 col-md-offset-7 col-xs-offset-0 m-b-2">
            <button class="btn btn-primary pull-sm-right" name="userform" type="submit">[{oxmultilang ident="CONTINUE_TO_NEXT_STEP"}] <i class="fa fa-chevron-right"></i></button>
        </div>
    </div>
    [{/block}]
    [{/if}]
</form>
[{/block}]
[{/block}]
[{/capture}]

[{include file="layout/page.tpl"}]