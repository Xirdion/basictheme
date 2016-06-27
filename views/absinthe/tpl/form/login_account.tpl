<form action="[{$oViewConf->getSslSelfLink()}]" method="post">
    <div>
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="fnc" value="login_noredirect">
        <input type="hidden" name="cl" value="[{ $oViewConf->getActiveClassName() }]">
        <input type="hidden" name="tpl" value="[{$oViewConf->getActTplName()}]">
        <input type="hidden" name="oxloadid" value="[{$oViewConf->getActContentLoadId()}]">
        [{if $oView->getArticleId()}]
            <input type="hidden" name="aid" value="[{$oView->getArticleId()}]">
        [{/if}]
        [{if $oView->getProduct()}]
            [{assign var="product" value=$oView->getProduct()}]
            <input type="hidden" name="anid" value="[{$product->oxarticles__oxnid->value}]">
        [{/if}]
    </div>
    <fieldset class="form-group">
        <label for="abs-email-input">[{oxmultilang ident="EMAIL" suffix="COLON"}]</label>
        <input type="email" required name="lgn_usr" class="form-control" id="abs-email-input" placeholder="your@mail.com">
    </fieldset>
    <fieldset class="form-group">
        <label for="abs-password-input">[{oxmultilang ident="PASSWORD" suffix="COLON"}]</label>
        <input type="password" required name="lgn_pwd" class="form-control" id="abs-password-input">
    </fieldset>
    [{if $oView->showRememberMe()}]
        <fieldset class="form-group">
            <label class="c-input c-checkbox">
                <input type="checkbox" name="lgn_cook" value="1">
                <span class="c-indicator"></span>
                [{oxmultilang ident="KEEP_LOGGED_IN"}]
            </label>
        </fieldset>
    [{/if}]
    <button type="submit" class="btn btn-primary"><i class="fa fa-sign-in"></i> [{oxmultilang ident="LOGIN"}]</button>
</form>
<div class="row m-t-2">
    <div class="col-xs-12">
        <a id="openAccountLink" href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=register"}]" rel="nofollow">[{oxmultilang ident="OPEN_ACCOUNT"}]</a>
    </div>
    <div class="col-xs-12">
        <a id="forgotPasswordLink" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=forgotpwd"}]" rel="nofollow">[{oxmultilang ident="FORGOT_PASSWORD"}]</a>
    </div>
</div>