[{*oxscript include="js/widgets/oxinputvalidator.js" priority=10 }]
[{oxscript add="$('form.js-oxValidate').oxInputValidator();"*}]
<form class="js-oxValidate" action="[{$oViewConf->getSslSelfLink()}]" name="order" method="post">
    <div>
        [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="fnc" value="registeruser">
        <input type="hidden" name="cl" value="register">
        <input type="hidden" name="lgn_cook" value="0">
        <input type="hidden" id="reloadAddress" name="reloadaddress" value="">
        <input type="hidden" name="option" value="3">
    </div>
    <h3 class="h3 m-t-1">[{oxmultilang ident="ACCOUNT_INFORMATION"}]</h3>
    [{include file="form/fieldset/user_account.tpl"}]
    [{if $oView->isActive('PsLogin')}]
        <div class="row">
            <div class="col-lg-6 col-sm-8 col-xs-12">
                <fieldset class="form-group">
                    <label class="c-input c-checkbox" for="abs-account-agb">
                        <input type="hidden" name="ord_agb" value="0">
                        <input id="abs-account-agb" type="checkbox" name="ord_agb" value="1">
                        <span class="c-indicator"></span>
                        [{oxifcontent ident="oxrighttocancellegend" object="oContent"}]
                            [{$oContent->oxcontents__oxcontent->value}]
                        [{/oxifcontent}]
                    </label>
                </fieldset>
            </div>
        </div>
    [{/if}]
    <h3 class="h3 m-t-1">[{oxmultilang ident="BILLING_ADDRESS"}]</h3>
    [{include file="form/fieldset/user_billing.tpl"}]
    <button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o"></i> [{oxmultilang ident="SAVE"}]</button>
</form>
[{*if $oView->isActive('PsLogin') }]
    <div id="popup1" class="popupBox corners FXgradGreyLight glowShadow">
         <img src="[{$oViewConf->getImageUrl('x.png')}]" alt="" class="closePop">
         [{oxifcontent ident="oxagb" object="oContent"}]
            [{ $oContent->oxcontents__oxcontent->value }]
         [{/oxifcontent}]
    </div>
    <div id="popup2" class="popupBox corners FXgradGreyLight glowShadow">
         <img src="[{$oViewConf->getImageUrl('x.png')}]" alt="" class="closePop">
         [{oxifcontent ident="oxrightofwithdrawal" object="oContent"}]
            [{ $oContent->oxcontents__oxcontent->value }]
         [{/oxifcontent}]
    </div>
[{/if*}]