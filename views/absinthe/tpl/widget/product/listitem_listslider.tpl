[{block name="widget_product_listitem_grid"}]
<div class="p-r-1 p-l-1">
[{assign var="product"              value=$oView->getProduct()}]
[{assign var="blDisableToCart"      value=$oView->getDisableToCart()}]
[{assign var="iIndex"               value=$oView->getIndex()}]
[{assign var="showMainLink"         value=$oView->getShowMainLink()}]

[{if $showMainLink}]
[{assign var='_productLink' value=$product->getMainLink()}]
[{else}]
[{assign var='_productLink' value=$product->getLink()}]
[{/if}]
[{assign var="blShowToBasket" value=true}] [{* tobasket or more info ? *}]
[{if $blDisableToCart || $product->isNotBuyable()||$product->hasMdVariants()||($oViewConf->showSelectListsInList() && $product->getSelections(1))||$product->getVariants()}]
[{assign var="blShowToBasket" value=false}]
[{/if}]
[{capture name=product_price}]
[{block name="widget_product_listitem_grid_price"}]
[{oxhasrights ident="SHOWARTICLEPRICE"}]
<div class="m-t-1">
    [{block name="widget_product_listitem_grid_price_value"}]
    [{if $product->getPrice()}]
    <strong>
        <span>
            [{if $product->isRangePrice()}]
            [{oxmultilang ident="PRICE_FROM"}]
            [{if !$product->isParentNotBuyable() }]
            [{assign var="oPrice" value=$product->getMinPrice() }]
            [{else}]
            [{assign var="oPrice" value=$product->getVarMinPrice() }]
            [{/if}]
            [{else}]
            [{if !$product->isParentNotBuyable() }]
            [{assign var="oPrice" value=$product->getPrice() }]
            [{else}]
            [{assign var="oPrice" value=$product->getVarMinPrice() }]
            [{/if}]
            [{/if}]
        </span>
        [{oxprice price=$oPrice currency=$oView->getActCurrency()}]
        [{if $oView->isVatIncluded() }]
        [{if !($product->hasMdVariants() || ($oViewConf->showSelectListsInList() && $product->getSelections(1)) || $product->getVariants())}] *[{/if}]
    </strong>
    [{/if}]
    [{/if}]
    [{/block}]
    [{if $product->getUnitPrice()}]
    <span>
        [{$product->getUnitQuantity()}] [{$product->getUnitName()}] | [{oxprice price=$product->getUnitPrice() currency=$oView->getActCurrency() }] /[{$product->getUnitName()}]
    </span>
    [{elseif $product->oxarticles__oxweight->value}]
    <span>
        <span>[{oxmultilang ident="WEIGHT" suffix="COLON"}]</span>
        <span>[{$product->oxarticles__oxweight->value}] [{oxmultilang ident="KG"}]</span>
    </span>
    [{/if}]
    
    [{if $product->getTPrice()}]
    <span>
        <s class="text-danger">[{oxprice price=$product->getTPrice() currency=$oView->getActCurrency()}]</s>
    </span>
    [{/if}]
    
</div>
[{/oxhasrights}]
[{/block}]
[{/capture}]

<a href="[{$_productLink}]" title="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]">
    <div class="abs-listitem-title">
        <span>[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]</span>
    </div>
    <div class="text-xs-center">
        <img class="center-block" data-lazy="[{$product->getThumbnailUrl()}]">
    </div>
</a>

[{block name="widget_product_listitem_grid_tobasket"}]
<div>
    [{oxhasrights ident="TOBASKET"}]
    [{$smarty.capture.product_price}]
    [{if !$blShowToBasket }]
    <a href="[{$_productLink}]" class="btn btn-secondary m-t-1"><i class="fa fa-info-circle"></i> [{oxmultilang ident="MORE_INFO"}]</a>
    [{else}]
    [{assign var="listType" value=$oView->getListType()}]

    <a href="[{$oView->getLink()|oxaddparams:"listtype=`$listType`&amp;fnc=tobasket&amp;aid=`$product->oxarticles__oxid->value`&amp;am=1" }]" class="btn btn-secondary m-t-1" title="[{oxmultilang ident="TO_CART" }]"><i class="fa fa-shopping-cart"></i> [{oxmultilang ident="TO_CART" }]</a>
    [{/if}]
    [{/oxhasrights}]
</div>
[{/block}]
</div>
[{/block}]
