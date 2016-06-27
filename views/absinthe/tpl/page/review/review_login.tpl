[{capture append="oxidBlock_content"}]
    <div class="accountLoginView">
        <h1 id="loginAccount" class="h1">[{$oView->getTitle()}]</h1>
        <p>[{ oxmultilang ident="MESSAGE_LOGIN_TO_WRITE_REVIEW" }]</p>

        [{include file="form/login_account.tpl"}]
    </div>
[{/capture}]
[{include file="layout/page.tpl"}]
