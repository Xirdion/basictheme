[{oxmultilang ident="HAVE_YOU_FORGOTTEN_PASSWORD"}]<br>
[{oxmultilang ident="HERE_YOU_SET_UP_NEW_PASSWORD"}]<br><br>
[{*oxscript include="js/widgets/oxinputvalidator.js" priority=10}]
[{oxscript add="$('form.js-oxValidate').oxInputValidator();"*}]
<form action="[{$oViewConf->getSelfActionLink()}]" name="forgotpwd" method="post">
    <div>
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="fnc" value="forgotpassword">
        <input type="hidden" name="cl" value="forgotpwd">
        <input type="hidden" name="actcontrol" value="forgotpwd">
    </div>
    <div class="row">
        <div class="col-lg-6 col-sm-8 col-xs-12">
            <fieldset class="form-group req">
                <label for="abs-forgotpwd-email">[{oxmultilang ident="YOUR_EMAIL_ADDRESS" suffix="COLON"}]</label>
                <input required type="email" class="form-control" id="abs-forgotpwd-email" name="lgn_usr" placeholder="your@mail.com" value="[{$oView->getActiveUsername()}]" />
            </fieldset>
            <button type="submit" class="btn btn-primary">[{oxmultilang ident="REQUEST_PASSWORD"}]</button>
        </div>
    </div>
</form>
[{oxmultilang ident="REQUEST_PASSWORD_AFTERCLICK"}]<br><br>
[{oxifcontent ident="oxforgotpwd" object="oCont"}]
    [{$oCont->oxcontents__oxcontent->value}]
[{/oxifcontent}]