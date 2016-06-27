[{block name="checkout_user_options"}]
[{oxscript include="js/widgets/oxequalizer.js" priority=10 }]
[{oxscript add="$(function(){oxEqualizer.equalHeight($('.checkoutOptions .option'));});"}]
<div id="abs-login-register" class="row m-b-2">

    [{block name="checkout_options_reg"}]
    <div class="col-sm-6" id="abs-loginoption-register">
        <p class="h4">[{ oxmultilang ident="OPEN_ACCOUNT" }]</p>
        [{block name="checkout_options_reg_text"}]
        [{oxifcontent ident="oxregistrationdescription" object="oCont"}]
        [{$oCont->oxcontents__oxcontent->value}]
        [{/oxifcontent}]
        [{/block}]
        <form action="[{$oViewConf->getSslSelfLink()}]" method="post">
            <p>
                [{ $oViewConf->getHiddenSid() }]
                [{ $oViewConf->getNavFormParams() }]
                <input type="hidden" name="cl" value="user">
                <input type="hidden" name="fnc" value="">
                <input type="hidden" name="option" value="3">
                <button class="btn btn-primary" type="submit"><i class="fa fa-user-plus"></i> [{ oxmultilang ident="NEXT" }]</button>
            </p>
        </form>
    </div>
    [{/block}]

    [{block name="checkout_options_login"}]
    <div class="col-sm-6" id="abs-loginoption-login">
        <p class="h4">[{ oxmultilang ident="ALREADY_CUSTOMER" }]</p>
        [{block name="checkout_options_login_text"}]
        <p>[{ oxmultilang ident="LOGIN_DESCRIPTION" }]</p>
        [{/block}]
        [{ include file="form/login.tpl"}]
    </div>
    [{/block}]

</div>
<div class="row">

    [{block name="checkout_options_noreg"}]
    [{if $oView->getShowNoRegOption() }]
    <div class="col-sm-6" id="abs-loginoptin-guest">
        <p class="h4">[{ oxmultilang ident="PURCHASE_WITHOUT_REGISTRATION" }]</p>
        [{block name="checkout_options_noreg_text"}]
        <p>[{ oxmultilang ident="DO_NOT_WANT_CREATE_ACCOUNT" }]</p>
        [{if $oView->isDownloadableProductWarning() }]
        <p class="errorMsg">[{ oxmultilang ident="MESSAGE_DOWNLOADABLE_PRODUCT" }]</p>
        [{/if}]
        [{/block}]
        <form action="[{$oViewConf->getSslSelfLink()}]" method="post">
            <p>
                [{$oViewConf->getHiddenSid()}]
                [{$oViewConf->getNavFormParams()}]
                <input type="hidden" name="cl" value="user">
                <input type="hidden" name="fnc" value="">
                <input type="hidden" name="option" value="1">
                <button class="btn btn-primary" type="submit"><i class="fa fa-user-times"></i> [{oxmultilang ident="NEXT"}]</button>
            </p>
        </form>
    </div>
    [{/if}]
    [{/block}]

</div>
[{/block}]