[{block name="checkout_steps_main"}]
<div id="abs-steps" class="row hidden-md-down m-b-3">
    [{if $oxcmp_basket->getProductsCount()}]
    [{assign var=showStepLinks value=true}]
    [{/if}]

    [{block name="checkout_steps_basket"}]
    <div class="col-sm-2 col-sm-offset-1 [{if $active == 1}] active [{elseif $active > 1}] passed [{/if}]">
        [{if $showStepLinks}]<a rel="nofollow" href="[{oxgetseourl ident=$oViewConf->getBasketLink()}]">[{/if}]
            <div class="abs-step-icon-group">
                <i class="fa fa-shopping-basket [{if $active == 1}] active [{/if}]"></i>
                [{if $active > 1}]
                <i class="fa fa-check-circle"></i>
                [{/if}]
            </div>
            <div class="text-nowrap">
                [{oxmultilang ident="STEPS_BASKET"}]    
            </div>

            [{if $showStepLinks}]</a>[{/if}]
    </div>
    [{/block}]

    [{assign var=showStepLinks value=false}]
    [{if !$oView->isLowOrderPrice() && $oxcmp_basket->getProductsCount()}]
    [{assign var=showStepLinks value=true}]
    [{/if}]

    [{block name="checkout_steps_send"}]
    <div class="col-sm-2 [{if $active == 2}] active [{elseif $active > 2}] passed [{/if}]">
        [{if $showStepLinks}]<a rel="nofollow" href="[{oxgetseourl ident=$oViewConf->getOrderLink()}]">[{/if}]
            <div class="abs-step-icon-group">
                <i class="fa fa-home [{if $active == 2}] active [{/if}]"></i>
                [{*<i class="fa fa-user"></i>*}]
                [{if $active > 2}]
                <i class="fa fa-check-circle"></i>
                [{/if}]
            </div>
            <div class="text-nowrap">
                [{oxmultilang ident="STEPS_SEND"}]
            </div>
            [{if $showStepLinks}]</a>[{/if}]
    </div>
    [{/block}]

    [{assign var=showStepLinks value=false}]
    [{if $active != 1 && $oxcmp_user && !$oView->isLowOrderPrice() && $oxcmp_basket->getProductsCount()}]
    [{assign var=showStepLinks value=true}]
    [{/if}]

    [{block name="checkout_steps_pay"}]
    <div class="col-sm-2 [{if $active == 3}] active [{elseif $active > 3}] passed [{/if}]">
        <span>
            [{if $showStepLinks}]<a rel="nofollow" [{if $oViewConf->getActiveClassName() == "user"}]id="paymentStep"[{/if}] href="[{oxgetseourl ident=$oViewConf->getPaymentLink()}]">[{/if}]
                <div class="abs-step-icon-group">
                    <i class="fa fa-truck [{if $active == 3}] active [{/if}]"></i>
                    [{*<i class="fa fa-money"></i>*}]
                    [{if $active > 3}]
                    <i class="fa fa-check-circle"></i>
                    [{/if}]
                </div>
                <div class="text-nowrap">
                    [{oxmultilang ident="STEPS_PAY"}]
                </div>
                [{if $showStepLinks}]</a>[{/if}]
        </span>
    </div>
    [{oxscript add="$('#paymentStep').click( function() { $('#userNextStepBottom').click();return false;});"}]
    [{/block}]

    [{assign var=showStepLinks value=false}]
    [{if $active != 1 && $oxcmp_user && $oxcmp_basket->getProductsCount() && $oView->getPaymentList() && !$oView->isLowOrderPrice()}]
    [{assign var=showStepLinks value=true}]
    [{/if}]

    [{block name="checkout_steps_order"}]
    <div class="col-sm-2 [{if $active == 4}] active [{elseif $active > 4}] passed [{/if}]">
        <span>
            [{if $showStepLinks}]<a rel="nofollow" [{if $oViewConf->getActiveClassName() == "payment"}]id="orderStep"[{/if}] href="[{if $oViewConf->getActiveClassName() == "payment"}]javascript:document.forms.order.submit();[{else}][{oxgetseourl ident=$oViewConf->getOrderConfirmLink()}][{/if}]">[{/if}]
                <div class="abs-step-icon-group">
                    [{*<i class="fa fa-list"></i>*}]
                    <i class="fa fa-thumbs-up [{if $active == 4}] active [{/if}]"></i>
                    [{if $active > 4}]
                    <i class="fa fa-check-circle"></i>
                    [{/if}]
                </div>
                <div class="text-nowrap">
                    [{oxmultilang ident="STEPS_ORDER"}]
                </div>
                [{if $showStepLinks}]</a>[{/if}]
        </span>
    </div>
    [{oxscript add="$('#orderStep').click( function() { $('#paymentNextStepBottom').click();return false;});"}]
    [{/block}]

    [{block name="checkout_steps_laststep"}]
    <div class="col-sm-2 [{if $active == 5}] activeLast [{else}] defaultLast [{/if}] ">
        <span>
            <div class="abs-step-icon-group">
                <i class="fa fa-envelope [{if $active == 5}] active [{/if}]"></i>
                [{if $active > 5}]
                <i class="fa fa-check-circle"></i>
                [{/if}]
            </div>
            <div class="text-nowrap">
                [{oxmultilang ident="READY"}]
            </div>
        </span>
    </div>
    [{/block}]
</div>
[{/block}]