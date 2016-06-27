[{assign var="_oProduct" value=$oView->getProduct()}]
[{assign var="editval" value=$oView->getSuggestData()}]
[{*oxscript include="js/widgets/oxinputvalidator.js" priority=10 }]
[{oxscript add="$('form.js-oxValidate').oxInputValidator();"*}]
<form action="[{$oViewConf->getSslSelfLink()}]" method="post">
    <div>
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="fnc" value="send">
        <input type="hidden" name="cl" value="suggest">
        <input type="hidden" name="anid" value="[{$_oProduct->oxarticles__oxnid->value}]">
        <input type="hidden" name="CustomError" value='suggest'>
        [{assign var="oCaptcha" value=$oView->getCaptcha()}]
        <input type="hidden" name="c_mach" value="[{$oCaptcha->getHash()}]">
    </div>
    <div class="row">
        <div class="col-lg-6 col-sm-8 col-xs-12">
            <h3 class="h3">[{oxmultilang ident="CARD_TO" suffix="COLON"}]</h3>
            <fieldset class="form-group">
                <label for="abs-suggest-rec-name">[{oxmultilang ident="RECIPIENT_NAME" suffix="COLON"}]</label>
                <input required type="text" class="form-control" id="abs-suggest-rec-name" name="editval[rec_name]" value="[{$editval->rec_name}]" />
            </fieldset>
            <fieldset class="form-group">
                <label for="abs-suggest-rec-email">[{oxmultilang ident="RECIPIENT_EMAIL" suffix="COLON"}]</label>
                <input required type="email" class="form-control" id="abs-suggest-rec-email" name="editval[rec_email]" value="[{$editval->rec_email}]" />
            </fieldset>
        </div>
        <div class="col-lg-6 col-sm-8 col-xs-12">
            <h3 class="h3">[{oxmultilang ident="FROM" suffix="COLON"}]</h3>
            <fieldset class="form-group">
                <label for="abs-suggest-send-name">[{oxmultilang ident="SENDER_NAME" suffix="COLON"}]</label>
                <input required type="text" class="form-control" id="abs-suggest-send-name" name="editval[send_name]" value="[{$editval->send_name}]" />
            </fieldset>
            <fieldset class="form-group">
                <label for="abs-suggest-send-email">[{oxmultilang ident="SENDER_EMAIL" suffix="COLON"}]</label>
                <input required type="email" class="form-control" id="abs-suggest-send-email" name="editval[send_email]" value="[{$editval->send_email}]" />
            </fieldset>
            <fieldset class="form-group">
                <label for="abs-suggest-send-subject">[{oxmultilang ident="SUBJECT" suffix="COLON"}]</label>
                <input required type="text" class="form-control" id="abs-suggest-send-subject" name="editval[send_subject]" value="[{if $editval->send_subject}][{$editval->send_subject}][{else}][{oxmultilang ident="HAVE_A_LOOK" suffix="COLON"}] [{$_oProduct->oxarticles__oxtitle->value|strip_tags}][{/if}]" />
            </fieldset>
            <fieldset class="form-group">
                <label for="abs-suggest-send-message">[{oxmultilang ident="MESSAGE" suffix="COLON"}]</label>
                <textarea required class="form-control" id="abs-suggest-send-message" name="editval[send_message]" rows="8">[{if $editval->send_message}][{$editval->send_message}][{else}][{oxmultilang ident="SHOP_SUGGEST_MESSAGE" args=$oxcmp_shop->oxshops__oxname->value}] [{/if}]</textarea>
            </fieldset>
            <fieldset class="form-group">
                <label for="abs-suggest-captcha">[{oxmultilang ident="VERIFICATION_CODE" suffix="COLON"}]</label>
                [{if $oCaptcha->isImageVisible()}]
                    <img src="[{$oCaptcha->getImageUrl()}]" alt="[{oxmultilang ident="VERIFICATION_CODE"}]">
                [{else}]
                    <span>[{$oCaptcha->getText()}]</span>
                [{/if}]
                <input required type="text" class="form-control" id="abs-suggest-captcha" name="c_mac" data-fieldsize="verify" value="" />
            </fieldset>
            <button type="submit" class="btn btn-primary">[{oxmultilang ident="SEND"}]</button>
        </div>
    </div>
</form>