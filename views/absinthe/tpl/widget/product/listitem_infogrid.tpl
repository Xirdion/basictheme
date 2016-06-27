[{block name="widget_product_listitem_infogrid"}]
    [{assign var="product" value=$oView->getProduct()}]
    [{assign var="owishid" value=$oView->getWishId()}]
    [{assign var="toBasketFunction" value=$oView->getToBasketFunction()}]
    [{assign var="recommid" value=$oView->getRecommId()}]
    [{assign var="showMainLink" value=$oView->getShowMainLink()}]
    [{assign var="blDisableToCart" value=$oView->getDisableToCart()}]
    [{assign var="iIndex" value=$oView->getIndex()}]
    [{assign var="altproduct" value=$oView->getAltProduct()}]

    [{if $showMainLink}]
        [{assign var='_productLink' value=$product->getMainLink()}]
    [{else}]
        [{assign var='_productLink' value=$product->getLink()}]
    [{/if}]
    [{assign var="aVariantSelections" value=$product->getVariantSelections(null,null,1)}]
    [{assign var="blShowToBasket" value=true}] [{* tobasket or more info ? *}]
    [{if $blDisableToCart || $product->isNotBuyable()||($aVariantSelections&&$aVariantSelections.selections)||$product->hasMdVariants()||($oViewConf->showSelectListsInList() && $product->getSelections(1))||$product->getVariants()}]
        [{assign var="blShowToBasket" value=false}]
    [{/if}]
    <form name="tobasket[{$iIndex}]" [{if $blShowToBasket}]action="[{$oViewConf->getSelfActionLink()}]" method="post"[{else}]action="[{$_productLink}]" method="get"[{/if}]>
        <div>
            [{$oViewConf->getNavFormParams()}]
            [{$oViewConf->getHiddenSid()}]
            <input type="hidden" name="pgNr" value="[{$oView->getActPage()}]">
            [{if $recommid}]
                <input type="hidden" name="recommid" value="[{$recommid}]">
            [{/if}]
            [{if $blShowToBasket}]
                [{oxhasrights ident="TOBASKET"}]
                    <input type="hidden" name="cl" value="[{$oViewConf->getTopActiveClassName()}]">
                    [{if $owishid}]
                        <input type="hidden" name="owishid" value="[{$owishid}]">
                    [{/if}]
                    [{if $toBasketFunction}]
                        <input type="hidden" name="fnc" value="[{$toBasketFunction}]">
                    [{else}]
                        <input type="hidden" name="fnc" value="tobasket">
                    [{/if}]
                    <input type="hidden" name="aid" value="[{$product->oxarticles__oxid->value}]">
                    [{if $altproduct}]
                        <input type="hidden" name="anid" value="[{$altproduct}]">
                    [{else}]
                        <input type="hidden" name="anid" value="[{$product->oxarticles__oxnid->value}]">
                    [{/if}]
                    <input type="hidden" name="am" value="1">
                [{/oxhasrights}]
            [{else}]
                <input type="hidden" name="cl" value="details">
                <input type="hidden" name="anid" value="[{$product->oxarticles__oxnid->value}]">
            [{/if}]
        </div>
        [{block name="widget_product_listitem_infogrid_gridpicture"}]
            <div class="m-t-1">
                <a href="[{$_productLink}]" title="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]">
                    <img src="[{$product->getThumbnailUrl()}]" alt="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]">
                </a>
            </div>
        [{/block}]

        [{block name="widget_product_listitem_infogrid_titlebox"}]
            <div class="m-t-1 m-b-1">
                <a href="[{$_productLink}]" title="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]">
                    <span>[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]</span>
                </a>
            </div>
        [{/block}]

        <div class="abs-listitem-infogrid-details-holder">&nbsp;</div>

        <div class="abs-listitem-infogrid-details w-100">
            <div>
                [{block name="widget_product_listitem_infogrid_price"}]
                    [{oxhasrights ident="SHOWARTICLEPRICE"}]
                        [{block name="widget_product_listitem_infogrid_price_value"}]
                            [{if $product->getPrice()}]
                                <span>
                                    <span>
                                        [{if $product->isRangePrice()}]
                                            [{oxmultilang ident="PRICE_FROM"}]
                                            [{if !$product->isParentNotBuyable()}]
                                                [{assign var="oPrice" value=$product->getMinPrice()}]
                                            [{else}]
                                                [{assign var="oPrice" value=$product->getVarMinPrice()}]
                                            [{/if}]
                                        [{else}]
                                            [{if !$product->isParentNotBuyable()}]
                                                [{assign var="oPrice" value=$product->getPrice()}]
                                            [{else}]
                                                [{assign var="oPrice" value=$product->getVarMinPrice()}]
                                            [{/if}]
                                        [{/if}]
                                    </span>
                                    [{oxprice price=$oPrice currency=$oView->getActCurrency()}]
                                    [{if $oView->isVatIncluded()}]
                                        [{if !($product->hasMdVariants() || ($oViewConf->showSelectListsInList() && $product->getSelections(1)) || $product->getVariants())}]
                                            *
                                        [{/if}]
                                    [{/if}]
                                </span>
                            [{/if}]
                        [{/block}]
                        [{if $product->getTPrice()}]
                            <span>
                                <s class="text-danger">[{oxprice price=$product->getTPrice() currency=$oView->getActCurrency()}]</s>
                            </span>
                        [{/if}]
                        [{if $product->getUnitPrice()}]
                            <span id="productPricePerUnit_[{$iIndex}]">
                                [{$product->getUnitQuantity()}] [{$product->getUnitName()}] | [{oxprice price=$product->getUnitPrice() currency=$oView->getActCurrency() }]/[{$product->getUnitName()}]
                            </span>
                        [{elseif $product->oxarticles__oxweight->value  }]
                            <span id="productPricePerUnit_[{$iIndex}]">
                                <span title="weight">[{oxmultilang ident="WEIGHT" suffix="COLON"}]</span>
                                <span class="value">[{$product->oxarticles__oxweight->value}] [{oxmultilang ident="KG"}]</span>
                            </span>
                        [{/if}]
                    [{/oxhasrights}]
                [{/block}]
            </div>

            [{block name="widget_product_listitem_infogrid_selections"}]
            [{/block}]

            [{block name="widget_product_listitem_infogrid_tobasket"}]
                <div class="m-t-1 m-b-1">
                    [{if $blShowToBasket}]
                        [{oxhasrights ident="TOBASKET"}]
                            <button type="submit" class="btn btn-secondary"><i class="fa fa-shopping-cart"></i> [{oxmultilang ident="TO_CART"}]</button>
                        [{/oxhasrights}]
                    [{else}]
                        <a class="btn btn-secondary" href="[{$_productLink}]" ><i class="fa fa-info-circle"></i> [{oxmultilang ident="MORE_INFO"}]</a>
                    [{/if}]
                </div>
            [{/block}]
        </div>
    </form>
[{/block}]
[{oxscript widget=$oView->getClassName()}]
