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
                [{assign var="oPaymentPrice" value=$paymentmethod->getPrice()}]
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
    [{block name="checkout_payment_longdesc"}]
        [{if $paymentmethod->oxpayments__oxlongdesc->value|trim}]
            <div class="card-block">
                <div class="m-b-1">
                    [{$paymentmethod->oxpayments__oxlongdesc->getRawValue()}]
                </div>
            </div>
        [{/if}]
    [{/block}]
</div>