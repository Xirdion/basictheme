[{assign var="currency" value=$oView->getActCurrency()}]
<div class="box" [{if $_boxId}]id="[{$_boxId}]"[{/if}]>
    [{if $_sHeaderIdent}]
    <h3 class="h3 [{if $_sHeaderCssClass}] [{$_sHeaderCssClass}][{/if}]">
        [{oxmultilang ident=$_sHeaderIdent}]
        [{assign var='rsslinks' value=$oView->getRssLinks() }]
        [{if $rsslinks.topArticles}]
        <a class="rss js-external" id="rssTopProducts" href="[{$rsslinks.topArticles.link}]" title="[{$rsslinks.topArticles.title}]"><img src="[{$oViewConf->getImageUrl('rss.png')}]" alt="[{$rsslinks.topArticles.title}]"><span class="FXgradOrange corners glowShadow">[{$rsslinks.topArticles.title}]</span></a>
        [{/if}]
    </h3>
    [{/if}]
    <ul class="js-articleBox featuredList">
        [{foreach from=$_oBoxProducts item=_oBoxProduct name=_sProdList}]
        [{assign var="iProdCount" value=$smarty.foreach._sProdList.first}]
        [{oxid_include_widget cl="oxwArticleBox" _parent=$oView->getClassName() _navurlparams=$oViewConf->getNavUrlParams() iLinkType=$_oBoxProduct->getLinkType() _object=$_oBoxProduct anid=$_oBoxProduct->getId() isVatIncluded=$oView->isVatIncluded() iProdCount=$iProdCount nocookie=1 sWidgetType=product sListType=boxproduct inlist=$_oBoxProduct->isInList() skipESIforUser=1}]
        [{/foreach}]
    </ul>
</div>
  

[{if $head}]
<p class="h4">
    [{$head}]
    [{if $rsslink}]
    <a class="rss js-external" id="[{$rssId}]" href="[{$rsslink.link}]" title="[{$rsslink.title}]"><img src="[{$oViewConf->getImageUrl('rss.png')}]" alt="[{$rsslink.title}]"></a>
    [{/if}]
</p>
[{/if}]

[{if $products|@count gt 0}]

<div class="absjs-slick-list-slider text-xs-center">
    [{foreach from=$products item=_product name=productlist}]
    <div>
        [{oxid_include_widget cl="oxwArticleBox" _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() iLinkType=$_product->getLinkType() _object=$_product anid=$_product->getId() sWidgetType=product sListType=listitem_$type iIndex=$_sTestId blDisableToCart=$blDisableToCart isVatIncluded=$oView->isVatIncluded() showMainLink=$showMainLink recommid=$recommid owishid=$owishid toBasketFunction=$toBasketFunction removeFunction=$removeFunction altproduct=$altproduct inlist=$_product->isInList() skipESIforUser=1}]
    </div>
    [{/foreach}]
</div>

[{/if}]