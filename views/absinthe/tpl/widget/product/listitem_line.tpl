[{block name="widget_product_listitem_line"}]
[{assign var="product"          value=$oView->getProduct()      }]
[{assign var="owishid"          value=$oView->getWishId()          }]
[{assign var="removeFunction"   value=$oView->getRemoveFunction()  }]
[{assign var="recommid"         value=$oView->getRecommId()        }]
[{assign var="iIndex"           value=$oView->getIndex()          }]
[{assign var="showMainLink"     value=$oView->getShowMainLink()    }]
[{assign var="blDisableToCart"  value=$oView->getDisableToCart()   }]
[{assign var="toBasketFunction" value=$oView->getToBasketFunction()}]
[{assign var="altproduct"       value=$oView->getAltProduct()      }]

[{if $showMainLink}]
[{assign var='_productLink' value=$product->getMainLink()}]
[{else}]
[{assign var='_productLink' value=$product->getLink()}]
[{/if}]
[{assign var="aVariantSelections" value=$product->getVariantSelections(null,null,1)}]
[{assign var="blShowToBasket" value=true}] [{* tobasket or more info ? *}]
[{if $blDisableToCart || $product->isNotBuyable()||($aVariantSelections&&$aVariantSelections.selections)||$product->getVariants()||($oViewConf->showSelectListsInList()&&$product->getSelections(1))}]
[{assign var="blShowToBasket" value=false}]
[{/if}]

<form name="tobasket.[{$iIndex}]" [{if $blShowToBasket}]action="[{ $oViewConf->getSelfActionLink() }]" method="post"[{else}]action="[{$_productLink}]" method="get"[{/if}]  class="js-oxProductForm">
    [{ $oViewConf->getNavFormParams() }]
    [{ $oViewConf->getHiddenSid() }]
    <input type="hidden" name="pgNr" value="[{ $oView->getActPage() }]">
    [{if $recommid}]
    <input type="hidden" name="recommid" value="[{ $recommid }]">
    [{/if}]
    [{if $blShowToBasket}]
    [{oxhasrights ident="TOBASKET"}]
    <input type="hidden" name="cl" value="[{ $oViewConf->getTopActiveClassName() }]">
    [{if $owishid}]
    <input type="hidden" name="owishid" value="[{$owishid}]">
    [{/if}]
    [{if $toBasketFunction}]
    <input type="hidden" name="fnc" value="[{$toBasketFunction}]">
    [{else}]
    <input type="hidden" name="fnc" value="tobasket">
    [{/if}]
    <input type="hidden" name="aid" value="[{ $product->oxarticles__oxid->value }]">
    [{if $altproduct}]
    <input type="hidden" name="anid" value="[{ $altproduct }]">
    [{else}]
    <input type="hidden" name="anid" value="[{ $product->oxarticles__oxnid->value }]">
    [{/if}]
    <input id="am_[{$iIndex}]" type="hidden" name="am" value="1">
    [{/oxhasrights}]
    [{else}]
    <input type="hidden" name="cl" value="details">
    <input type="hidden" name="anid" value="[{ $product->oxarticles__oxnid->value }]">
    [{/if}]

    <div class="row">

        [{block name="widget_product_listitem_line_picturebox"}]
        <div class="col-xs-12 col-sm-4">
            <a href="[{$_productLink}]" title="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]">
                <img src="[{$product->getThumbnailUrl()}]" alt="[{ $product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]">
            </a>
        </div>
        [{/block}]
        <div class="col-xs-12 col-sm-5 text-xs-center text-sm-left">
            [{block name="widget_product_listitem_line_selections"}]
            <div class="info">
                <a id="[{$iIndex}]" href="[{$_productLink}]" class="title" title="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]">
                    <span>[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]</span>
                </a>
            </div>
            [{/block}]
            [{block name="widget_product_listitem_line_description"}]
            <div>
                [{if $recommid }]
                <div>[{$product->text|truncate:160:"..."}]</div>
                [{else}]
                [{oxhasrights ident="SHOWSHORTDESCRIPTION"}]
                [{$product->oxarticles__oxshortdesc->value|truncate:160:"..."}]
                [{/oxhasrights}]
                [{/if}]
            </div>
            [{/block}]
        </div>
        <div class="col-xs-12 col-sm-3 text-xs-center text-sm-right">
            [{block name="widget_product_listitem_line_price"}]
            [{oxhasrights ident="SHOWARTICLEPRICE"}]

            [{block name="widget_product_listitem_line_price_value"}]

            [{if $product->getTPrice()}]
            <span class="text-danger">
                <s>[{oxprice price=$product->getTPrice() currency=$oView->getActCurrency()}]</s>
            </span><br/>
            [{/if}]

            [{if $product->getPrice()}]
            <label>
                <span>
                    [{if $product->isRangePrice()}]
                    [{ oxmultilang ident="PRICE_FROM" }]
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
                </span> [{oxprice price=$oPrice currency=$oView->getActCurrency()}]
                [{if $oView->isVatIncluded() }]
                [{if !($product->hasMdVariants() || ($oViewConf->showSelectListsInList() && $product->getSelections(1)) || $product->getVariants())}]*[{/if}]
                [{/if}]
            </label>
            [{/if}]
            [{/block}]

            [{if $product->getUnitPrice()}]
            <span>
                [{$product->getUnitQuantity()}] [{$product->getUnitName()}] | [{oxprice price=$product->getUnitPrice() currency=$oView->getActCurrency() }]/[{$product->getUnitName()}]
            </span>
            [{elseif $product->oxarticles__oxweight->value  }]
            <span>
                <span title="weight">[{oxmultilang ident="WEIGHT" suffix="COLON"}]</span>
                <span class="value">[{$product->oxarticles__oxweight->value}] [{oxmultilang ident="KG"}]</span>
            </span>
            [{/if}]
            [{/oxhasrights}]
            [{/block}]

            [{block name="widget_product_listitem_line_tobasket"}]

            [{if $blShowToBasket}]
            [{oxhasrights ident="TOBASKET"}]

            <div class="center-block">
                [{include file="widget/product/tobasket.tpl" blCanBuy=true}]
            </div>

            [{/oxhasrights}]
            [{else}]
            <a class="btn btn-secondary" href="[{$_productLink}]" >[{oxmultilang ident="MORE_INFO"}]</a>
            [{/if}]
            [{if $removeFunction && (($owishid && ($owishid==$oxcmp_user->oxuser__oxid->value)) || (($wishid==$oxcmp_user->oxuser__oxid->value)) || $recommid) }]
            <button triggerForm="remove_[{$removeFunction}][{$iIndex}]" type="submit" class="submitButton largeButton removeButton"><span>[{ oxmultilang ident="REMOVE" }]</span></button>
            [{/if}]
            [{/block}]
        </div>
    </div>
</form>
[{/block}]
[{oxscript widget=$oView->getClassName()}]
