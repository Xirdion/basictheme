<div class="row">
    <div class="col-lg-6 col-sm-8 col-xs-12">
        [{block name="user_account_username"}]
            <fieldset class="form-group req">
                <label for="abs-account-username">[{oxmultilang ident="EMAIL_ADDRESS" suffix="COLON"}]</label>
                <input required type="email" class="form-control" id="abs-account-username" name="lgn_usr" placeholder="your@mail.com" value="[{$oView->getActiveUsername()}]" />
            </fieldset>
        [{/block}]
        [{block name="user_account_password"}]
            <fieldset class="form-group req">
                <label for="abs-account-password">[{oxmultilang ident="PASSWORD" suffix="COLON"}]</label>
                <input required type="password" class="form-control" id="abs-account-password" name="lgn_pwd" value="[{$lgn_pwd}]" />
            </fieldset>
        [{/block}]
        [{block name="user_account_confirmpwd"}]
            <fieldset class="form-group req">
                <label for="abs-account-confirmpwd">[{oxmultilang ident="CONFIRM_PASSWORD" suffix="COLON"}]</label>
                <input required type="password" class="form-control" id="abs-account-confirmpwd" name="lgn_pwd2" value="[{$lgn_pwd2}]" />
            </fieldset>
        [{/block}]
        [{block name="user_account_newsletter"}]
            <fieldset class="form-group">
                <label class="c-input c-checkbox" for="abs-news-subscribe">
                    <input id="abs-news-subscribe" type="checkbox" name="blnewssubscribed" value="1" [{if $oView->isNewsSubscribed()}]checked[{/if}]>
                    <span class="c-indicator"></span>
                    [{oxmultilang ident="NEWSLETTER_SUBSCRIPTION"}]
                </label>
            </fieldset>
        [{/block}]
    </div>
</div>