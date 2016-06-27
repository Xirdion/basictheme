[{if !$type}]
[{assign var="type" value="infogrid"}]
[{/if}]

[{if $head}]
<p class="h4">
    [{$head}]
</p>
[{/if}]
[{if $products|@count gt 0}]

[{if $type=="line"}]
[{assign var=listColumnsMd value="12"}]
[{assign var=listColumnsSm value="12"}]
[{elseif $type=="infogrid" }]
[{assign var=listColumnsMd value="4"}]
[{assign var=listColumnsSm value="6"}]
[{elseif $type=="grid" }]    
[{assign var=listColumnsMd value="3"}]
[{assign var=listColumnsSm value="6"}]
[{/if}]

<div class="[{$type}] [{$listId}] m-t-2 m-b-2">
    [{assign var="currency" value=$oView->getActCurrency() }]
    <div class="row">
        [{foreach from=$products item=_product name=productlist}]
        [{assign var="_sTestId" value=$listId|cat:"_"|cat:$smarty.foreach.productlist.iteration}]
        <div class="abs-list-item col-xs-12 col-sm-[{$listColumnsSm}]  col-md-[{$listColumnsMd}] text-xs-center">
            [{oxid_include_widget cl="oxwArticleBox" _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() iLinkType=$_product->getLinkType() _object=$_product anid=$_product->getId() sWidgetType=product sListType=listitem_$type iIndex=$_sTestId blDisableToCart=$blDisableToCart isVatIncluded=$oView->isVatIncluded() showMainLink=$showMainLink recommid=$recommid owishid=$owishid toBasketFunction=$toBasketFunction removeFunction=$removeFunction altproduct=$altproduct inlist=$_product->isInList() skipESIforUser=1}]
        </div>
        [{/foreach}]
    </div>
</div>
[{/if}]