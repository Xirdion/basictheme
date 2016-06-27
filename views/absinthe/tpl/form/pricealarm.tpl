[{assign var="currency" value=$oView->getActCurrency()}]
<p>[{oxmultilang ident="MESSAGE_PRICE_ALARM_PRICE_CHANGE"}]</p>
[{*oxscript include="js/widgets/oxinputvalidator.js" priority=10}]
[{oxscript add="$('form.js-oxValidate').oxInputValidator();"*}]
<form class="js-oxValidate" name="pricealarm" action="[{$oViewConf->getSelfActionLink()}]" method="post">
    <div>
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="cl" value="[{$oViewConf->getTopActiveClassName()}]">
        [{if $oDetailsProduct}]
        <input type="hidden" name="anid" value="[{$oDetailsProduct->oxarticles__oxid->value}]">
        [{/if}]
        <input type="hidden" name="fnc" value="addme">
        [{assign var="oCaptcha" value=$oView->getCaptcha() }]
        <input type="hidden" name="c_mach" value="[{$oCaptcha->getHash()}]"/>
    </div>
    <div class="row">
        <div class="col-lg-6 col-sm-8 col-xs-12">
            <fieldset class="form-group">
                <label for="abs-pricealarm-price">[{oxmultilang ident="YOUR_PRICE"}] ([{$currency->sign}]):</label>
                <input required type="text" class="form-control" id="abs-pricealarm-price" name="pa[price]" value="[{oxhasrights ident="SHOWARTICLEPRICE"}][{if $product}][{$product->getFPrice()}][{/if}][{/oxhasrights}]" />
            </fieldset>
            <fieldset class="form-group">
                <label for="abs-pricealarm-email">[{oxmultilang ident="EMAIL" suffix="COLON"}]</label>
                <input required type="email" class="form-control" id="abs-pricealarm-email" name="pa[email]" placeholder="your@mail.com" value="[{if $oxcmp_user}][{$oxcmp_user->oxuser__oxusername->value}][{/if}]" />
            </fieldset>
            <fieldset class="form-group">
                <label for="abs-pricealarm-captcha">[{oxmultilang ident="VERIFICATION_CODE" suffix="COLON"}]</label>
                [{if $oCaptcha->isImageVisible()}]
                    <img src="[{$oCaptcha->getImageUrl()}]" alt="[{oxmultilang ident="VERIFICATION_CODE"}]">
                [{else}]
                    <span>[{$oCaptcha->getText()}]</span>
                [{/if}]
                <input required type="text" class="form-control" id="abs-pricealarm-captcha" name="c_mac" data-fieldsize="verify" value="" />
            </fieldset>
            <button type="submit" class="btn btn-primary">[{oxmultilang ident="SEND"}]</button>
        </div>
    </div>
</form>