[{assign var="_oProduct" value=$oView->getProduct()}]
[{assign var="editval" value=$oView->getInviteData()}]
[{*oxscript include="js/widgets/oxinputvalidator.js" priority=10}]
[{oxscript add="$('form.js-oxValidate').oxInputValidator();"*}]
<form class="js-oxValidate" action="[{$oViewConf->getSslSelfLink()}]" method="post">
    <div>
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="fnc" value="send">
        <input type="hidden" name="cl" value="invite">
        <input type="hidden" name="anid" value="[{$_oProduct->oxarticles__oxnid->value}]">
        <input type="hidden" name="CustomError" value='invite'>
        [{assign var="oCaptcha" value=$oView->getCaptcha()}]
        <input type="hidden" name="c_mach" value="[{$oCaptcha->getHash()}]">
    </div>
    <div class="row">
        <div class="col-lg-6 col-sm-8 col-xs-12">
            <h3 class="h3">[{oxmultilang ident="SEND_INVITE_TO" suffix="COLON"}]</h3>
            <fieldset class="form-group req">
                <label for="abs-invite-email1">[{oxmultilang ident="EMAIL"}] #1:</label>
                <input required type="email" class="form-control" id="abs-invite-email1" name="editval[rec_email][1]" value="[{$editval->rec_email.1}]" />
            </fieldset>
            <fieldset class="form-group">
                <label for="abs-invite-email2">[{oxmultilang ident="EMAIL"}] #2:</label>
                <input type="email" class="form-control" id="abs-invite-email2" name="editval[rec_email][2]" value="[{$editval->rec_email.2}]" />
            </fieldset>
            <fieldset class="form-group">
                <label for="abs-invite-email3">[{oxmultilang ident="EMAIL"}] #3:</label>
                <input type="email" class="form-control" id="abs-invite-email3" name="editval[rec_email][3]" value="[{$editval->rec_email.3}]" />
            </fieldset>
            <fieldset class="form-group">
                <label for="abs-invite-email4">[{oxmultilang ident="EMAIL"}] #4:</label>
                <input type="email" class="form-control" id="abs-invite-email4" name="editval[rec_email][4]" value="[{$editval->rec_email.4}]" />
            </fieldset>
            <fieldset class="form-group">
                <label for="abs-invite-email5">[{oxmultilang ident="EMAIL"}] #5:</label>
                <input type="email" class="form-control" id="abs-invite-email5" name="editval[rec_email][5]" value="[{$editval->rec_email.5}]" />
            </fieldset>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-6 col-sm-8 col-xs-12">
            <h3 class="h3">[{oxmultilang ident="FROM" suffix="COLON"}]</h3>
            <fieldset class="form-group req">
                <label for="abs-invite-sendname">[{oxmultilang ident="SENDER_NAME" suffix="COLON"}]</label>
                <input required type="text" class="form-control" id="abs-invite-sendname" name="editval[send_name]" value="[{$editval->send_name}]" />
            </fieldset>
            <fieldset class="form-group req">
                <label for="abs-invite-sendemail">[{oxmultilang ident="SENDER_EMAIL" suffix="COLON"}]</label>
                <input required type="email" class="form-control" id="abs-invite-sendemail" name="editval[send_email]" value="[{$editval->send_email}]" />
            </fieldset>
            <fieldset class="form-group req">
                <label for="abs-invite-subject">[{oxmultilang ident="SUBJECT" suffix="COLON"}]</label>
                <input required type="text" class="form-control" id="abs-invite-subject" name="editval[send_subject]" value="[{if $editval->send_subject}][{$editval->send_subject}][{else}][{oxmultilang ident="HAVE_A_LOOK" suffix="COLON"}] [{$_oProduct->oxarticles__oxtitle->value|strip_tags}][{/if}]" />
            </fieldset>
            <fieldset class="form-group">
                <label for="abs-invite-message">[{oxmultilang ident="MESSAGE" suffix="COLON"}]</label>
                <textarea class="form-control" id="abs-invite-message" name="editval[send_message]" rows="8">[{if $editval->send_message}][{$editval->send_message}][{else}][{oxmultilang ident="SHOP_SUGGEST_MESSAGE" args=$oxcmp_shop->oxshops__oxname->value}][{/if}]</textarea>
            </fieldset>
            <fieldset class="form-group req">
                <label for="abs-contact-captcha">[{oxmultilang ident="VERIFICATION_CODE" suffix="COLON"}]</label>
                [{assign var="oCaptcha" value=$oView->getCaptcha()}]
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