[{capture append="oxidBlock_content"}]
    <button id="absjs-acc-backbtn" class="btn btn-primary abs-account-backbtn m-b-1">[{oxmultilang ident="BACK"}]</button>
    <h1 class="h1">[{oxmultilang ident="MY_DATA"}]</h1>
    [{block name="account_user_form"}]
        [{include file="form/user.tpl"}]
    [{/block}]
[{/capture}]


[{capture append="oxidBlock_sidebar"}]
    [{include file="page/account/inc/account_menu.tpl" active_link="billship"}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]