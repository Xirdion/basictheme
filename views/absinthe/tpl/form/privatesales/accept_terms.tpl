<div>
    <form name="login" action="[{$oViewConf->getSslSelfLink()}]" method="post">
        <div>
            [{$oViewConf->getHiddenSid()}]
            [{$oViewConf->getNavFormParams()}]
            <input type="hidden" name="fnc" value="login_noredirect">
            <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
            <input type="hidden" name="tpl" value="[{$oViewConf->getActTplName()}]">
            <input type="hidden" name="oxloadid" value="[{$oViewConf->getActContentLoadId()}]">
            [{if $oView->getArticleId()}]
                <input type="hidden" name="aid" value="[{$oView->getArticleId()}]">
            [{/if}]
            [{if $oView->getProduct()}]
                [{assign var="product" value=$oView->getProduct()}]
                <input type="hidden" name="anid" value="[{$product->oxarticles__oxnid->value}]">
            [{/if}]
            <input type="hidden" name="ord_agb" value="0">
        </div>
        <div class="row">
            <div class="col-lg-6 col-sm-8 col-xs-12">
                <fieldset class="form-group req">
                    <label class="c-input c-checkbox" for="abs-account-agb">
                        <input id="abs-account-agb" type="checkbox" name="ord_agb" value="1" required>
                        <span class="c-indicator"></span>
                        [{oxifcontent ident="oxrighttocancellegend" object="oContent"}]
                            [{$oContent->oxcontents__oxcontent->value}]
                        [{/oxifcontent}]
                    </label>
                </fieldset>
                <button type="submit" class="btn btn-primary">[{oxmultilang ident="LOGIN"}]</button>
            </div>
        </div>
    </form>
</div>
