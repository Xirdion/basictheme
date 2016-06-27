[{*oxscript include="js/widgets/oxinputvalidator.js" priority=10}]
[{oxscript add="$('form.js-oxValidate').oxInputValidator();"*}]

<form action="[{$oViewConf->getSslSelfLink()}]" method="post">
    <div>
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="fnc" value="login_noredirect">
        <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
    </div>
    <fieldset class="form-group">
        <label for="abs-email-input">[{oxmultilang ident="EMAIL_ADDRESS"}]</label>
        <input type="email" name="lgn_usr" required class="form-control" id="abs-email-input" placeholder="your@mail.com" value="">
    </fieldset>
    <fieldset class="form-group">
        <label for="abs-password-input">[{oxmultilang ident="PASSWORD" suffix="COLON"}]</label>
        <input type="password" name="lgn_pwd" required class="form-control" id="abs-password-input">
    </fieldset>
    <button type="submit" class="btn btn-primary">[{oxmultilang ident="LOGIN"}]</button>
</form>