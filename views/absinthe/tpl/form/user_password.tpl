<div class="row">
    <div class="col-lg-6 col-sm-8 col-xs-12">
        <form action="[{$oViewConf->getSelfActionLink()}]" name="changepassword" method="post">
            [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
            <div>
                [{$oViewConf->getHiddenSid()}]
                [{$oViewConf->getNavFormParams()}]
                <input type="hidden" name="fnc" value="changePassword">
                <input type="hidden" name="cl" value="account_password">
                <input type="hidden" name="CustomError" value='user'>
                <input type="hidden" id="passwordLength" value="[{$oViewConf->getPasswordLength()}]">
            </div>
            <fieldset class="form-group req">
                <label for="abs-password-old">[{oxmultilang ident="OLD_PASSWORD" suffix="COLON"}]</label>
                <input type="password" required class="form-control" id="abs-password-old" name="password_old"/>
            </fieldset>
            <fieldset class="form-group req">
                <label for="abs-password-new">[{oxmultilang ident="NEW_PASSWORD" suffix="COLON"}]</label>
                <input type="password" required class="form-control" id="abs-password-new" name="password_new"/>
            </fieldset>
            <fieldset class="form-group req">
                <label for="abs-password-new-confirm">[{oxmultilang ident="CONFIRM_PASSWORD" suffix="COLON"}]</label>
                <input type="password" required class="form-control" id="abs-password-new-comfirm" name="password_new_confirm"/>
            </fieldset>
            <button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o"></i> [{oxmultilang ident="SAVE"}]</button>
        </form>
    </div>
</div>