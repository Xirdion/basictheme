[{if $products|@count gt 0}]

[{if $head}]
<p class="h4 m-b-1">
    [{$head}]
</p>
[{/if}]

<div class="absjs-slick-list-slider text-xs-center">
    [{foreach from=$products item=_product name=productlist}]
    <div>
        [{oxid_include_widget cl="oxwArticleBox" _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() iLinkType=$_product->getLinkType() _object=$_product anid=$_product->getId() sWidgetType=product sListType=listitem_listslider iIndex=$_sTestId blDisableToCart=$blDisableToCart isVatIncluded=$oView->isVatIncluded() showMainLink=$showMainLink recommid=$recommid owishid=$owishid toBasketFunction=$toBasketFunction removeFunction=$removeFunction altproduct=$altproduct inlist=$_product->isInList() skipESIforUser=1}]
    </div>
    [{/foreach}]
</div>

[{/if}]