[{assign var="editval" value=$oView->getUserData()}]
[{*oxscript include="js/widgets/oxinputvalidator.js" priority=10*}]
[{*oxscript add="$('form.js-oxValidate').oxInputValidator();"*}]
<form action="[{$oViewConf->getSslSelfLink()}]" method="post">
    <div>
        [{$oViewConf->getHiddenSid()}]
        <input type="hidden" name="fnc" value="send"/>
        <input type="hidden" name="cl" value="contact"/>
        [{assign var="oCaptcha" value=$oView->getCaptcha()}]
        <input type="hidden" name="c_mach" value="[{$oCaptcha->getHash()}]"/>
    </div>
    <div class="row">
        <div class="col-lg-6 col-sm-8 col-xs-12">
            [{if $oxcmp_user && !$editval.oxuser__oxsal}]
                [{include file="form/fieldset/salutation.tpl" name="editval[oxuser__oxsal]" value=$oxcmp_user->oxuser__oxsal->value }]
            [{else}]
                [{include file="form/fieldset/salutation.tpl" name="editval[oxuser__oxsal]" value=$editval.oxuser__oxsal }]
            [{/if}]
            [{if $aErrors.oxuser__oxfname}][{/if}]
            <fieldset class="form-group req">
                <label for="abs-contact-firstname">[{oxmultilang ident="FIRST_NAME" suffix="COLON"}]</label>
                <input required type="text" class="form-control" id="abs-contact-firstname" name="editval[oxuser__oxfname]" placeholder="[{oxmultilang ident="FIRST_NAME"}]" value="[{if $oxcmp_user && !$editval.oxuser__oxfname}][{$oxcmp_user->oxuser__oxfname->value}][{else}][{$editval.oxuser__oxfname}][{/if}]" />
            </fieldset>
            [{if $aErrors.oxuser__oxlname}][{/if}]
            <fieldset class="form-group req">
                <label for="abs-contact-lastname">[{oxmultilang ident="LAST_NAME" suffix="COLON"}]</label>
                <input required type="text" class="form-control" id="abs-contact-lastname" name="editval[oxuser__oxlname]" placeholder="[{oxmultilang ident="LAST_NAME"}]" value="[{if $oxcmp_user && !$editval.oxuser__oxlname}][{$oxcmp_user->oxuser__oxlname->value}][{else}][{$editval.oxuser__oxlname}][{/if}]" />
            </fieldset>
            [{if $aErrors.oxuser__oxusername}][{/if}]
            <fieldset class="form-group req">
                <label for="abs-contact-username">[{oxmultilang ident="EMAIL" suffix="COLON"}]</label>
                <input required type="email" class="form-control" id="abs-contact-username" name="editval[oxuser__oxusername]" placeholder="your@mail.com" value="[{if $oxcmp_user && !$editval.oxuser__oxusername}][{$oxcmp_user->oxuser__oxusername->value}][{else}][{$editval.oxuser__oxusername}][{/if}]" />
            </fieldset>
            [{if $aErrors && !$oView->getContactSubject()}][{/if}]
            <fieldset class="form-group req">
                <label for="abs-contact-subject">[{oxmultilang ident="SUBJECT" suffix="COLON"}]</label>
                <input required type="text" class="form-control" id="abs-contact-subject" name="c_subject" placeholder="[{oxmultilang ident="SUBJECT"}]" value="[{$oView->getContactSubject()}]" />
            </fieldset>
            <fieldset class="form-group">
                <label for="abs-contact-message">[{oxmultilang ident="MESSAGE" suffix="COLON"}]</label>
                <textarea class="form-control" id="abs-contact-message" name="c_message" rows="8">[{$oView->getContactMessage()}]</textarea>
            </fieldset>
            <fieldset class="form-group req">
                <label for="abs-contact-captcha">[{oxmultilang ident="VERIFICATION_CODE" suffix="COLON"}]</label>
                [{if $oCaptcha->isImageVisible()}]
                    <img src="[{$oCaptcha->getImageUrl()}]" alt="[{oxmultilang ident="VERIFICATION_CODE"}]">
                [{else}]
                    <span>[{$oCaptcha->getText()}]</span>
                [{/if}]
                <input required type="text" class="form-control" id="abs-contact-captcha" name="c_mac" data-fieldsize="verify" value="" />
            </fieldset>
            <button type="submit" class="btn btn-primary">[{oxmultilang ident="SEND"}]</button>
        </div>
    </div>
</form>
