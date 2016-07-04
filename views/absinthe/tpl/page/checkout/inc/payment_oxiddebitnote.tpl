[{if $oView->getCheckedPaymentId() == $sPaymentID}]
    [{assign var="isChecked" value=true}]
[{else}]
    [{assign var="isChecked" value=false}]
[{/if}]
[{assign var="dynvalue" value=$oView->getDynValue()}]
[{assign var="iPayError" value=$oView->getPaymentError()}]
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
                        [{oxmultilang ident="PLUS_VAT"}]
                        [{oxprice price=$oPaymentPrice->getVatValue() currency=$currency}]
                    [{/if}])
                [{else}]
                    ([{oxprice price=$oPaymentPrice->getBruttoPrice() currency=$currency}])
                [{/if}]
            [{/if}]
        </label>
    </div>
</div>
<div class="panel-collapse collapse [{if $isChecked}]in[{/if}]" role="tabpanel" id="collapse[{$sPaymentID}]">
    <div class="card-block">
        [{block name="checkout_payment_longdesc"}]
            [{if $paymentmethod->oxpayments__oxlongdesc->value|trim}]
                <div class="m-b-1">
                    [{$paymentmethod->oxpayments__oxlongdesc->getRawValue()}]
                </div>
            [{/if}]
        [{/block}]

        <div class="row">
            <div class="col-lg-6 col-sm-8 col-xs-12">
                <fieldset class="form-group req">
                    <label for="payment_[{$sPaymentID}]_1">
                        [{oxmultilang ident="BANK" suffix="COLON"}]
                    </label>
                    <input id="payment_[{$sPaymentID}]_1" required type="text" class="form-control" maxlenght="64" name="dynvalue[lsbankname]" autocomplete="off" value="[{$dynvalue.lsbankname}]" [{if !$isChecked}]disabled[{/if}]/>
                </fieldset>

                <fieldset class="form-group req">
                    <label for="payment_[{$sPaymentID}]_2">
                        [{if $oView->isOldDebitValidationEnabled()}]
                        [{oxmultilang ident="BANK_CODE" suffix="COLON"}]
                        [{else}]
                        [{oxmultilang ident="BIC" suffix="COLON"}]
                        [{/if}]
                    </label>
                    <input id="payment_[{$sPaymentID}]_2" required type="text" class="form-control" maxlenght="64" name="dynvalue[lsblz]" autocomplete="off" value="[{$dynvalue.lsblz}]" [{if !$isChecked}]disabled[{/if}]/>
                </fieldset>

                <fieldset class="form-group req">
                    <label for="payment_[{$sPaymentID}]_3">
                        [{if $oView->isOldDebitValidationEnabled()}]
                        [{oxmultilang ident="BANK_ACCOUNT_NUMBER" suffix="COLON"}]
                        [{else}]
                        [{oxmultilang ident="IBAN" suffix="COLON"}]
                        [{/if}]
                    </label>
                    <input id="payment_[{$sPaymentID}]_3" required type="text" class="form-control" maxlenght="64" name="dynvalue[lsktonr]" autocomplete="off" value="[{$dynvalue.lsktonr}]" [{if !$isChecked}]disabled[{/if}]/>
                </fieldset>

                <fieldset class="form-group req">
                    <label for="payment_[{$sPaymentID}]_4">
                        [{oxmultilang ident="BANK_ACCOUNT_HOLDER" suffix="COLON"}]
                    </label>
                    <input id="payment_[{$sPaymentID}]_4" required type="text" class="form-control" maxlenght="64" name="dynvalue[lsktoinhaber]" autocomplete="off" value="[{if $dynvalue.lsktoinhaber}][{$dynvalue.lsktoinhaber}][{else}][{$oxcmp_user->oxuser__oxfname->value}] [{$oxcmp_user->oxuser__oxlname->value}][{/if}]" [{if !$isChecked}]disabled[{/if}]/>
                </fieldset>
            </div>
        </div>
    </div>
</div>