[{if $oView->getCheckedPaymentId() == $sPaymentID}]
    [{assign var="isChecked" value=true}]
[{else}]
    [{assign var="isChecked" value=false}]
[{/if}]
<div class="panel-heading card-header" role="tab">
    <div data-toggle="collapse" data-parent="#accordion" data-target="#collapse[{$sPaymentID}]" aria-expanded="[{if $isChecked}]true[{else}]false[{/if}]" aria-controls="collapse[{$sPaymentID}]" class="absjs-payment-collapse [{if !$isChecked}]collapsed[{/if}]">
        <label class="c-input c-radio">
            <input id="payment_[{$sPaymentID}]" type="radio" name="paymentid" value="[{$sPaymentID}]" [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]checked[{/if}]>
            <span class="c-indicator"></span>
            [{$paymentmethod->oxpayments__oxdesc->value}]
            [{if $paymentmethod->getPrice()}]
                [{assign var="oPaymentPrice" value=$paymentmethod->getPrice() }]
                [{if $oViewConf->isFunctionalityEnabled('blShowVATForPayCharge')}]
                    ([{oxprice price=$oPaymentPrice->getNettoPrice() currency=$currency}]
                    [{if $oPaymentPrice->getVatValue() > 0}]
                        [{oxmultilang ident="PLUS_VAT"}] [{oxprice price=$oPaymentPrice->getVatValue() currency=$currency}]
                    [{/if}])
                [{else}]
                    ([{oxprice price=$oPaymentPrice->getBruttoPrice() currency=$currency}])
                [{/if}]
            [{/if}]
        </label>
    </div>
</div>
<div class="panel-collapse collapse [{if $isChecked}]in[{/if}]" role="tabpanel" id="collapse[{$sPaymentID}]">
    [{assign var="aDynValues" value=$paymentmethod->getDynValues()}]
    [{if $paymentmethod->oxpayments__oxlongdesc->value|trim || $aDynValues}]
        <div class="card-block">
            [{block name="checkout_payment_longdesc"}]
                [{if $paymentmethod->oxpayments__oxlongdesc->value|trim}]
                    <div class="m-b-1">
                        [{$paymentmethod->oxpayments__oxlongdesc->getRawValue()}]
                    </div>
                [{/if}]
            [{/block}]
            [{if $aDynValues}]
                <div class="row">
                    <div class="col-lg-6 col-sm-8 col-xs-12">
                        [{foreach from=$aDynValues item=value name=PaymentDynValues}]
                            <fieldset class="form-group req">
                                <label for="[{$sPaymentID}]_[{$smarty.foreach.PaymentDynValues.iteration}]">[{$value->name}]</label>
                                <input required type="text" class="form-control" id="[{$sPaymentID}]_[{$smarty.foreach.PaymentDynValues.iteration}]" name="dynvalue[[{$value->name}]]" value="[{$value->value}]" [{if !$isChecked}]disabled[{/if}]/>
                            </fieldset>
                        [{/foreach}]
                    </div>
                </div>
            [{/if}]
        </div>
    [{/if}]
</div>