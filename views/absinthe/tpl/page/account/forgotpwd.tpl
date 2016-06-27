[{capture append="oxidBlock_pageBody"}]
    [{if $oView->isEnabledPrivateSales()}]
        [{oxid_include_widget cl="oxwCookieNote" _parent=$oView->getClassName() nocookie=1}]
    [{/if}]
[{/capture}]
[{capture append="oxidBlock_content"}]
    <h1 class="h1">[{$oView->getTitle()}]</h1>
    [{if $oView->isExpiredLink()}]
        <div class="alert alert-info">
            [{oxmultilang ident="ERROR_MESSAGE_PASSWORD_LINK_EXPIRED"}]
        </div>
    [{elseif $oView->showUpdateScreen()}]
        [{include file="form/forgotpwd_change_pwd.tpl"}]
    [{elseif $oView->updateSuccess()}]
        <div class="alert alert-success">[{oxmultilang ident="PASSWORD_CHANGED"}]</div>
        <div>
            <form action="[{$oViewConf->getSelfActionLink()}]" name="forgotpwd" method="post">
                <div>
                    [{$oViewConf->getHiddenSid()}]
                    <input type="hidden" name="cl" value="start">
                </div>
                <button id="backToShop" class="submitButton largeButton" type="submit">[{oxmultilang ident="BACK_TO_SHOP"}]</button>
            </form>
        </div>
    [{else}]
        [{if $oView->getForgotEmail()}]
            <div class="alert alert-info">
                [{oxmultilang ident="PASSWORD_WAS_SEND_TO" suffix="COLON"}] [{$oView->getForgotEmail()}]
            </div>
            <div>
                <form action="[{$oViewConf->getSelfActionLink()}]" name="forgotpwd" method="post">
                    <div>
                        [{$oViewConf->getHiddenSid()}]
                        <input type="hidden" name="cl" value="start">
                        <button id="backToShop" class="submitButton largeButton" type="submit">[{oxmultilang ident="BACK_TO_SHOP"}]</button>
                    </div>
                 </form>
             </div>
        [{else}]
            [{include file="form/forgotpwd_email.tpl"}]
        [{/if}]
    [{/if}]
[{/capture}]
[{include file="layout/page.tpl"}]
[{*if $oView->isActive('PsLogin')}]
    [{include file="layout/popup.tpl"}]
[{else}]
    [{include file="layout/page.tpl"}]
[{/if*}]

