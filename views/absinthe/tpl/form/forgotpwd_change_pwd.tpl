[{*oxscript include="js/widgets/oxinputvalidator.js" priority=10}]
[{oxscript add="$('form.js-oxValidate').oxInputValidator();"*}]
<form action="[{$oViewConf->getSelfActionLink()}]" name="forgotpwd" method="post">
    [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
    <div>
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="fnc" value="updatePassword">
        <input type="hidden" name="uid" value="[{$oView->getUpdateId()}]">
        <input type="hidden" name="cl" value="forgotpwd">
        <input type="hidden" id="passwordLength" value="[{$oViewConf->getPasswordLength()}]">
    </div>
    <div class="row">
        <div class="col-lg-6 col-sm-8 col-xs-12">
            [{if $aErrors.oxuser__oxpassword}][{/if}]
            <fieldset class="form-group">
                <label for="abs-forgotpwd-pw">[{oxmultilang ident="NEW_PASSWORD" suffix="COLON"}]</label>
                <input required type="password" class="form-control" id="abs-forgotpwd-pw" name="password_new" />
            </fieldset>
            [{if $aErrors.oxuser__oxpassword}][{/if}]
            <fieldset class="form-group">
                <label for="abs-forgotpwd-pw-confirm">[{oxmultilang ident="CONFIRM_PASSWORD" suffix="COLON"}]</label>
                <input required type="password" class="form-control" id="abs-forgotpwd-pw-confirm" name="password_new_confirm" />
            </fieldset>
            [{*
            <span class="js-oxError_notEmpty">[{oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS"}]</span>
            <span class="js-oxError_length">[{oxmultilang ident="ERROR_MESSAGE_PASSWORD_TOO_SHORT"}]</span>
            <span class="js-oxError_match">[{oxmultilang ident="ERROR_MESSAGE_PASSWORD_DO_NOT_MATCH"}]</span>
            *}]
            <button type="submit" class="btn btn-primary">[{oxmultilang ident="CHANGE_PASSWORD"}]</button>
        </div>
    </div>
</form>