[{if $oView->getCheckedPaymentId() == $sPaymentID}]
    [{assign var="isChecked" value=true}]
[{else}]
    [{assign var="isChecked" value=false}]
[{/if}]
[{assign var="dynvalue" value=$oView->getDynValue()}]
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
    <div class="card-block">
        [{block name="checkout_payment_longdesc"}]
            [{if $paymentmethod->oxpayments__oxlongdesc->value}]
                <div class="m-b-1">
                    [{$paymentmethod->oxpayments__oxlongdesc->getRawValue()}]
                </div>
            [{/if}]
        [{/block}]
        <div class="row">
            <div class="col-lg-6 col-sm-8 col-xs-12">            
                <label>[{oxmultilang ident="CREDITCARD" suffix="COLON"}]</label>
                <select name="dynvalue[kktype]" class="form-control form-group">
                    <option value="mcd" [{if ($dynvalue.kktype == "mcd" || !$dynvalue.kktype)}]selected[{/if}]>[{oxmultilang ident="CARD_MASTERCARD"}]</option>
                    <option value="vis" [{if $dynvalue.kktype == "vis"}]selected[{/if}]>[{oxmultilang ident="CARD_VISA"}]</option>
                    [{*<option value="amx" [{if $dynvalue.kktype == "amx"}]selected[{/if}]>American Express</option>
                    <option value="dsc" [{if $dynvalue.kktype == "dsc"}]selected[{/if}]>Discover</option>
                    <option value="dnc" [{if $dynvalue.kktype == "dnc"}]selected[{/if}]>Diners Club</option>
                    <option value="jcb" [{if $dynvalue.kktype == "jcb"}]selected[{/if}]>JCB</option>
                    <option value="swi" [{if $dynvalue.kktype == "swi"}]selected[{/if}]>Switch</option>
                    <option value="dlt" [{if $dynvalue.kktype == "dlt"}]selected[{/if}]>Delta</option>
                    <option value="enr" [{if $dynvalue.kktype == "enr"}]selected[{/if}]>EnRoute</option>*}]
                </select>

                <fieldset class="form-group">
                    <label>
                        [{oxmultilang ident="NUMBER" suffix="COLON"}]
                    </label>
                    <input required class="form-control" type="text" maxlength="64" name="dynvalue[kknumber]" autocomplete="off" value="[{$dynvalue.kknumber}]" [{if !$isChecked}]disabled[{/if}]/>
                </fieldset>

                <fieldset class="form-group">
                    <label>
                        [{oxmultilang ident="BANK_ACCOUNT_HOLDER" suffix="COLON"}]
                    </label>
                    <input required class="form-control" type="text" maxlength="64" name="dynvalue[kkname]" autocomplete="off" value="[{if $dynvalue.kkname}][{$dynvalue.kkname}][{else}][{$oxcmp_user->oxuser__oxfname->value}] [{$oxcmp_user->oxuser__oxlname->value}][{/if}]" [{if !$isChecked}]disabled[{/if}]/>
                </fieldset>

                <label>[{oxmultilang ident="VALID_UNTIL" suffix="COLON"}]</label>
                <div class="row">
                    <div class="col-xs-6">
                        <select name="dynvalue[kkmonth]" class="form-control form-group">
                            <option [{if $dynvalue.kkmonth == "01"}]selected[{/if}]>01</option>
                            <option [{if $dynvalue.kkmonth == "02"}]selected[{/if}]>02</option>
                            <option [{if $dynvalue.kkmonth == "03"}]selected[{/if}]>03</option>
                            <option [{if $dynvalue.kkmonth == "04"}]selected[{/if}]>04</option>
                            <option [{if $dynvalue.kkmonth == "05"}]selected[{/if}]>05</option>
                            <option [{if $dynvalue.kkmonth == "06"}]selected[{/if}]>06</option>
                            <option [{if $dynvalue.kkmonth == "07"}]selected[{/if}]>07</option>
                            <option [{if $dynvalue.kkmonth == "08"}]selected[{/if}]>08</option>
                            <option [{if $dynvalue.kkmonth == "09"}]selected[{/if}]>09</option>
                            <option [{if $dynvalue.kkmonth == "10"}]selected[{/if}]>10</option>
                            <option [{if $dynvalue.kkmonth == "11"}]selected[{/if}]>11</option>
                            <option [{if $dynvalue.kkmonth == "12"}]selected[{/if}]>12</option>
                        </select>
                    </div>
                    <div class="col-xs-6">
                        <select name="dynvalue[kkmonth]" class="form-control form-group">
                            [{foreach from=$oView->getCreditYears() item=year}]
                            <option [{if $dynvalue.kkyear == $year}]selected[{/if}]>[{$year}]</option>
                            [{/foreach}]
                        </select>
                    </div>
                </div>

                <fieldset class="form-group">
                    <label>
                        [{oxmultilang ident="CARD_SECURITY_CODE" suffix="COLON"}]
                    </label>
                    <input required class="form-control" type="text" maxlength="64" name="dynvalue[kkpruef]" autocomplete="off" value="[{$dynvalue.kkpruef}]" [{if !$isChecked}]disabled[{/if}]/>
                    <div class="m-t-1">[{oxmultilang ident="CARD_SECURITY_CODE_DESCRIPTION"}]</div>
                </fieldset>
            </div>
        </div>
    </div>
</div>