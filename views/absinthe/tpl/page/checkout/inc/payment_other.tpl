<label class="c-input c-radio">
    <input id="payment_[{$sPaymentID}]" type="radio" name="paymentid" value="[{$sPaymentID}]" [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]checked[{/if}]>
    <span class="c-indicator"></span>
    [{$paymentmethod->oxpayments__oxdesc->value}]
    [{if $paymentmethod->getPrice()}]
    [{assign var="oPaymentPrice" value=$paymentmethod->getPrice() }]
    [{if $oViewConf->isFunctionalityEnabled('blShowVATForPayCharge') }]
    ( [{oxprice price=$oPaymentPrice->getNettoPrice() currency=$currency}]
    [{if $oPaymentPrice->getVatValue() > 0}]
    [{ oxmultilang ident="PLUS_VAT" }] [{oxprice price=$oPaymentPrice->getVatValue() currency=$currency }]
    [{/if}])
    [{else}]
    ([{oxprice price=$oPaymentPrice->getBruttoPrice() currency=$currency}])
    [{/if}]
    [{/if}]
</label>

<div class="abs-payment-info m-t-1">
    [{block name="checkout_payment_longdesc"}]
    [{if $paymentmethod->oxpayments__oxlongdesc->value|trim}]
    <div class="m-b-1">
        [{ $paymentmethod->oxpayments__oxlongdesc->getRawValue()}]
    </div>
    [{/if}]
    [{/block}]
    [{assign var="aDynValues" value=$paymentmethod->getDynValues()}]
    [{if $aDynValues}]
    <div class="row m-b-1">
        <div class="col-xs-12 col-sm-5">
            [{foreach from=$aDynValues item=value name=PaymentDynValues}]
            <fieldset class="form-group">
                <label for="[{$sPaymentID}]_[{$smarty.foreach.PaymentDynValues.iteration}]">[{$value->name}]</label>
                <input required type="text" class="form-control" id="[{$sPaymentID}]_[{$smarty.foreach.PaymentDynValues.iteration}]" name="dynvalue[[{$value->name}]]" value="[{ $value->value}]">
            </fieldset>
            [{/foreach}]
        </div>
    </div>
    [{/if}]
</div>