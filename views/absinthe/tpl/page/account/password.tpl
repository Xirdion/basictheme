[{capture append="oxidBlock_content"}]
    <button id="absjs-acc-backbtn" class="btn btn-primary abs-account-backbtn m-b-1">[{oxmultilang ident="BACK"}]</button>
    <h1 id="personalSettingsHeader" class="h1">[{$oView->getTitle()}]</h1>
    [{if $oView->isPasswordChanged()}]
        <div class="alert alert-success" role="alert">[{oxmultilang ident="MESSAGE_PASSWORD_CHANGED"}]</div>
    [{/if}]
    [{if count($Errors) > 0 && count($Errors.user) > 0}]
        <div class="alert alert-danger" role="alert">
            [{foreach from=$Errors.user item=oEr key=key }]
                <p>[{$oEr->getOxMessage()}]</p>
            [{/foreach}]
        </div>
    [{/if}]
    [{include file="form/user_password.tpl"}]
[{/capture}]
[{capture append="oxidBlock_sidebar"}]
    [{include file="page/account/inc/account_menu.tpl" active_link="password"}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]