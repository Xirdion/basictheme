[{assign var="aVariantSelections" value=$oView->getVariantSelections()}]

[{if $aVariantSelections && $aVariantSelections.rawselections}]
    [{assign var="_sSelectionHashCollection" value=""}]
    [{foreach from=$aVariantSelections.rawselections item=oSelectionList key=iKey}]
        [{assign var="_sSelectionHash" value=""}]
            [{foreach from=$oSelectionList item=oListItem key=iPos}]
                [{assign var="_sSelectionHash" value=$_sSelectionHash|cat:$iPos|cat:":"|cat:$oListItem.hash|cat:"|"}]
            [{/foreach}]
        [{if $_sSelectionHash}]
            [{if $_sSelectionHashCollection}]
                [{assign var="_sSelectionHashCollection" value=$_sSelectionHashCollection|cat:","}]
            [{/if}]
            [{assign var="_sSelectionHashCollection" value=$_sSelectionHashCollection|cat:"'`$_sSelectionHash`'"}]
        [{/if}]
    [{/foreach}]
    [{oxscript add="oxVariantSelections  = [`$_sSelectionHashCollection`];"}]
    <form id="absjs-widget-form" action="[{$oView->getWidgetLink()}]" method="get">
        <div>
            [{$oViewConf->getHiddenSid()}]
            [{$oViewConf->getNavFormParams()}]
            <input type="hidden" name="cl" value="[{$oView->getClassName()}]">
            <input type="hidden" name="oxwparent" value="[{$oViewConf->getTopActiveClassName()}]">
            <input type="hidden" name="listtype" value="[{$oView->getListType()}]">
            <input type="hidden" name="nocookie" value="1">
            <input type="hidden" name="cnid" value="[{$oView->getCategoryId()}]">
            <input type="hidden" name="anid" value="[{if !$oDetailsProduct->oxarticles__oxparentid->value}][{$oDetailsProduct->oxarticles__oxid->value}][{else}][{$oDetailsProduct->oxarticles__oxparentid->value}][{/if}]">
            <input type="hidden" name="actcontrol" value="[{$oViewConf->getTopActiveClassName()}]">
        </div>
    </form>
[{/if}]
[{oxhasrights ident="TOBASKET"}]
    <form action="[{$oViewConf->getSelfActionLink()}]" method="post">
        <div>
            [{$oViewConf->getHiddenSid()}]
            [{$oViewConf->getNavFormParams()}]
            <input type="hidden" name="cl" value="[{$oViewConf->getTopActiveClassName()}]">
            <input type="hidden" name="aid" value="[{$oDetailsProduct->oxarticles__oxid->value}]">
            <input type="hidden" name="anid" value="[{$oDetailsProduct->oxarticles__oxnid->value}]">
            <input type="hidden" name="parentid" value="[{if !$oDetailsProduct->oxarticles__oxparentid->value}][{$oDetailsProduct->oxarticles__oxid->value}][{else}][{$oDetailsProduct->oxarticles__oxparentid->value}][{/if}]">
            <input type="hidden" name="panid" value="">
            [{if !$oDetailsProduct->isNotBuyable()}]
                <input type="hidden" name="fnc" value="tobasket">
            [{/if}]
        </div>
[{/oxhasrights}]
<div class="row">
    <div class="col-xs-12 col-sm-6">
        <div id="absjs-article-pics">
            [{if $oView->getActPicture()}]
                [{assign var="oConf" value=$oViewConf->getConfig()}]
                <div class="row">
                    <div class="col-xs-10 col-xs-offset-1">
                        <div id="absjs-slick-zoom-pics">
                            [{if $oView->morePics()}]
                                [{foreach from=$oView->getIcons() name=morePics key=iPicNr item=oArtIcon}]
                                    [{assign var="picToLoad" value="oxarticles__oxpic$iPicNr"}]
                                    [{assign var="picToLoadPath" value=$oPictureProduct->$picToLoad->value}]
                                    [{assign var="picToLoadFullPath" value="master/product/$iPicNr/$picToLoadPath"}]
                                    [{assign var="picToLoadAbsolutePath" value=$oConf->getPicturePath($picToLoadFullPath)}]
                                    [{* hacks confirmed *}]
                                    [{assign var="zoomPicSize" value=$picToLoadAbsolutePath|getimagesize}]
                                    <div>
                                        <img [{if $smarty.foreach.morePics.iteration == 1}]src="[{$oPictureProduct->getPictureUrl($iPicNr)}]"[{else}]data-lazy="[{$oPictureProduct->getPictureUrl($iPicNr)}]"[{/if}] class="abs-zoom-pic img-fluid center-block" data-large-image-index="[{$iPicNr-1}]" data-large-image="[{$oPictureProduct->getMasterZoomPictureUrl($iPicNr)}]"  data-large-image-width="[{$zoomPicSize.0}]" data-large-image-height="[{$zoomPicSize.1}]">
                                    </div>
                                [{/foreach}]
                            [{else}]
                                [{assign var="picToLoad" value="oxarticles__oxpic1"}]
                                [{assign var="picToLoadPath" value=$oPictureProduct->$picToLoad->value}]
                                [{assign var="picToLoadFullPath" value="master/product/1/$picToLoadPath"}]
                                [{assign var="picToLoadAbsolutePath" value=$oConf->getPicturePath($picToLoadFullPath)}]
                                [{assign var="picToLoadPath" value=$oView->getActPicture()}]
                                [{* hacks confirmed *}]
                                [{assign var="zoomPicSize" value=$picToLoadAbsolutePath|getimagesize}]
                                <div>
                                    <img src="[{$oPictureProduct->getPictureUrl(1)}]" class="abs-zoom-pic img-fluid center-block" data-large-image-index="0" data-large-image="[{$oPictureProduct->getMasterZoomPictureUrl(1)}]"  data-large-image-width="[{$zoomPicSize.0}]" data-large-image-height="[{$zoomPicSize.1}]">
                                </div>
                            [{/if}]
                        </div>
                    </div>
                </div>
            [{/if}]
            [{block name="details_productmain_morepics"}]
                [{include file="page/details/inc/morepics.tpl"}]
            [{/block}]
        </div>
    </div>
    <div class="col-xs-12 col-sm-6">
        <h1 class="h1">[{$oDetailsProduct->oxarticles__oxtitle->value}] [{$oDetailsProduct->oxarticles__oxvarselect->value}]</h1>
        
        [{* article number *}]
        [{block name="details_productmain_artnumber"}]
            <span>[{oxmultilang ident="PRODUCT_NO" suffix="COLON" }] [{$oDetailsProduct->oxarticles__oxartnum->value}]</span>
        [{/block}]

        [{* ratings *}]
        [{if $oView->ratingIsActive()}]
            [{block name="details_productmain_ratings"}]
                [{if $oxcmp_user}]
                    [{assign var="force_sid" value=$oView->getSidForWidget()}]
                [{/if}]
                [{oxid_include_widget cl="oxwRating" blCanRate=$oView->canRate() _parent=$oViewConf->getTopActiveClassName() nocookie=1 force_sid=$force_sid sRateUrl=$oDetailsProduct->getLink() dRatingCount=$oView->getRatingCount() dRatingValue=$oView->getRatingValue() anid=$oDetailsProduct->oxarticles__oxnid->value skipESIforUser=1}]
            [{/block}]
        [{/if}]

        [{*manufacturer-icon*}]
        [{block name="details_productmain_manufacturersicon"}]
            [{assign var="oManufacturer" value=$oView->getManufacturer()}]
            [{if $oManufacturer->oxmanufacturers__oxicon->value}]
                <div>
                    <img src="[{$oManufacturer->getIconUrl()}]" alt="[{$oManufacturer->oxmanufacturers__oxtitle->value}]">
                </div>
            [{/if}]
        [{/block}]

        [{*shortdesc*}]
        [{block name="details_productmain_shortdesc"}]
            [{oxhasrights ident="SHOWSHORTDESCRIPTION"}]
                [{if $oDetailsProduct->oxarticles__oxshortdesc->value}]
                    <div class="m-b-1">[{$oDetailsProduct->oxarticles__oxshortdesc->value}]</div>
                [{/if}]
            [{/oxhasrights}]
        [{/block}]

        [{if $oViewConf->getShowWishlist()}]
            <div class="m-b-1">
                [{if $oxcmp_user}]
                    [{if $oView->isArticleInWishlist()}]
                        <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl="|cat:$oViewConf->getTopActiveClassName() params="aid=`$oDetailsProduct->oxarticles__oxnid->value`&anid=`$oDetailsProduct->oxarticles__oxnid->value`&amp;fnc=towishlist&amp;am=0"|cat:$oViewConf->getNavUrlParams()|cat:"&amp;stoken="|cat:$oViewConf->getSessionChallengeToken() }]" rel="nofollow"><i class="fa fa-gift">&nbsp;</i>[{oxmultilang ident="REMOVE_FROM_WISHLIST"}]</a></span>
                    [{else}]
                        <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl="|cat:$oViewConf->getTopActiveClassName() params="aid=`$oDetailsProduct->oxarticles__oxnid->value`&anid=`$oDetailsProduct->oxarticles__oxnid->value`&amp;fnc=towishlist&amp;am=1"|cat:$oViewConf->getNavUrlParams()|cat:"&amp;stoken="|cat:$oViewConf->getSessionChallengeToken() }]" rel="nofollow"><i class="fa fa-gift">&nbsp;</i>[{oxmultilang ident="ADD_TO_GIFT_REGISTRY"}]</a></span>
                    [{/if}]
                [{else}]
                    <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" params="anid=`$oDetailsProduct->oxarticles__oxnid->value`"|cat:"&amp;sourcecl="|cat:$oViewConf->getTopActiveClassName()|cat:$oViewConf->getNavUrlParams()}]" rel="nofollow"><i class="fa fa-gift">&nbsp;</i>[{oxmultilang ident="LOGIN_TO_ACCESS_GIFT_REGISTRY"}]</a>
                [{/if}]
            </div>
        [{/if}]

        [{assign var="blCanBuy" value=true}]
        [{* variants | md variants *}]

        [{block name="details_productmain_variantselections"}]
        [{if $aVariantSelections && $aVariantSelections.selections }]
        [{assign var="blCanBuy" value=$aVariantSelections.blPerfectFit}]
        <div class="m-t-1 m-b-1">
            [{assign var="blHasActiveSelections" value=false}]
            [{foreach from=$aVariantSelections.selections item=oList key=iKey}]
            [{if $oList->getActiveSelection()}]
            [{assign var="blHasActiveSelections" value=true}]
            [{/if}]
            [{include file="widget/product/selectbox.tpl" oSelectionList=$oList iKey=$iKey blInDetails=true}]
            [{/foreach}]
        </div>

        [{if $blHasActiveSelections}]
        <div class="absjs-variant-reset m-b-1">
            [{* Reset link *}]
            <a href="[{$oViewConf->getSelfActionLink()}]" class="btn btn-secondary" title="[{oxmultilang ident="RESET_SELECTION"}]"><i class="fa fa-eraser"></i></a>
        </div>
        [{else}]
        [{if !$blCanBuy && !$oDetailsProduct->isParentNotBuyable()}]
        [{assign var="blCanBuy" value=true}]
        [{/if}]
        [{/if}]
        [{if !$blCanBuy }]
        <div class="text-sm-right text-danger m-b-1">[{oxmultilang ident="DETAILS_CHOOSEVARIANT"}]</div>
        [{/if}]

        [{/if}]
        [{/block}]

        [{* selection lists *}]
        [{block name="details_productmain_selectlists"}]
        [{if $oViewConf->showSelectLists()}]
        [{assign var="oSelections" value=$oDetailsProduct->getSelections()}]
        [{if $oSelections}]
        <div class="selectorsBox js-fnSubmit clear" id="productSelections">
            [{foreach from=$oSelections item=oList name=selections}]
            [{include file="widget/product/selectbox.tpl" oSelectionList=$oList sFieldName="sel" iKey=$smarty.foreach.selections.index blHideDefault=true sSelType="seldrop"}]
            [{/foreach}]
        </div>
        [{/if}]
        [{/if}]
        [{/block}]

        [{* pers params *}]
        [{block name="details_productmain_persparams"}]
        [{if $oView->isPersParam()}]
        <div class="input-group">
            <input type="text" class="form-control" placeholder="[{oxmultilang ident="LABEL" suffix="COLON"}]"  name="persparam[details]" value="[{$oDetailsProduct->aPersistParam.text}]">
            <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
        </div>
        [{/if}]
        [{/block}]

        [{block name="details_productmain_watchlist"}][{/block}]

        <div class="text-sm-right m-t-2">

            [{block name="details_productmain_tprice"}]
            [{oxhasrights ident="SHOWARTICLEPRICE"}]
            [{if $oDetailsProduct->getTPrice()}]
            <div>
                <strong><s class="text-danger">[{oxprice price=$oDetailsProduct->getTPrice() currency=$currency}]</s></strong>
            </div>
            [{/if}]
            [{/oxhasrights}]
            [{/block}]

            [{block name="details_productmain_price"}]
            [{oxhasrights ident="SHOWARTICLEPRICE"}]
            [{if $oDetailsProduct->getPrice()}]
            <label>
                [{assign var="sFrom" value=""}]
                [{assign var="oPrice" value=$oDetailsProduct->getPrice()}]
                [{if $oDetailsProduct->isParentNotBuyable() }]
                [{assign var="oPrice" value=$oDetailsProduct->getVarMinPrice()}]
                [{if $oDetailsProduct->isRangePrice() }]
                [{assign var="sFrom" value="PRICE_FROM"|oxmultilangassign}]
                [{/if}]
                [{/if}]
                <strong class="h3">
                    <span>[{$sFrom}] [{oxprice price=$oPrice currency=$currency}]</span>
                    [{if $oView->isVatIncluded() }]
                    <span>*</span>
                    [{/if}]
                </strong>
            </label>
            [{/if}]
            [{oxscript include="js/widgets/oxamountpriceselect.js" priority=10 }]
            [{*if $oDetailsProduct->loadAmountPriceInfo()}]
            [{include file="page/details/inc/priceinfo.tpl"}]
            [{/if*}]
            [{/oxhasrights}]
            [{/block}]

        </div>

        [{block name="details_productmain_tobasket"}]
        [{oxhasrights ident="TOBASKET"}]
        [{if !$oDetailsProduct->isNotBuyable()}]

        <form class="js-oxProductForm" action="[{$oViewConf->getSelfActionLink()}]" method="post">
            [{$oViewConf->getHiddenSid()}]
            [{$oViewConf->getNavFormParams()}]
            <input type="hidden" name="cl" value="[{$oViewConf->getTopActiveClassName()}]">
            <input type="hidden" name="aid" value="[{$oDetailsProduct->oxarticles__oxid->value}]">
            <input type="hidden" name="anid" value="[{$oDetailsProduct->oxarticles__oxnid->value}]">
            <input type="hidden" name="parentid" value="[{if !$oDetailsProduct->oxarticles__oxparentid->value}][{$oDetailsProduct->oxarticles__oxid->value}][{else}][{$oDetailsProduct->oxarticles__oxparentid->value}][{/if}]">
            <input type="hidden" name="panid" value="">
            [{if !$oDetailsProduct->isNotBuyable()}]
            <input type="hidden" name="fnc" value="tobasket">
            [{/if}]

            <div class="row">
                <div class="col-xs-12 col-sm-6 col-sm-offset-6">

                    [{include file="widget/product/tobasket.tpl"}]

                </div>
            </div>
        </form>

        [{/if}]
        [{/oxhasrights}]
        [{/block}]


        [{* additional info *}]
        <div class="pull-sm-right text-sm-right m-b-2">
            [{block name="details_productmain_priceperunit"}]
            [{if $oDetailsProduct->getUnitPrice()}]
            <div><i class="fa fa-info-circle"></i> [{$oDetailsProduct->getUnitQuantity()}] [{$oDetailsProduct->getUnitName()}] | [{oxprice price=$oDetailsProduct->getUnitPrice() }] [{$currency->sign}]/[{$oDetailsProduct->getUnitName()}] </div>
            [{/if}]
            [{/block}]

            [{block name="details_productmain_stockstatus"}]
            [{if $oDetailsProduct->getStockStatus() == -1}]
            <span>
                [{if $oDetailsProduct->oxarticles__oxnostocktext->value}]
                [{$oDetailsProduct->oxarticles__oxnostocktext->value}]
                [{elseif $oViewConf->getStockOffDefaultMessage()}]
                <i class="fa fa-truck text-danger"></i> [{oxmultilang ident="MESSAGE_NOT_ON_STOCK"}]
                [{/if}]
                [{if $oDetailsProduct->getDeliveryDate()}]
                [{oxmultilang ident="AVAILABLE_ON"}] [{$oDetailsProduct->getDeliveryDate()}]
                [{/if}]
            </span>
            [{elseif $oDetailsProduct->getStockStatus() == 1}]
            <span>
                <i class="fa fa-truck text-warning"></i> [{oxmultilang ident="LOW_STOCK"}]
            </span>
            [{elseif $oDetailsProduct->getStockStatus() == 0}]
            <span>
                [{if $oDetailsProduct->oxarticles__oxstocktext->value}]
                <i class="fa fa-truck text-success"></i> [{$oDetailsProduct->oxarticles__oxstocktext->value}]
                [{elseif $oViewConf->getStockOnDefaultMessage()}]
                <i class="fa fa-truck text-success"></i> [{oxmultilang ident="READY_FOR_SHIPPING"}]
                [{/if}]
            </span>
            [{/if}]
            [{/block}]

            [{block name="details_productmain_deliverytime"}]
            [{oxhasrights ident="TOBASKET"}]
            [{if $oDetailsProduct->isBuyable() }]
            [{include file="page/details/inc/deliverytime.tpl"}]
            [{/if}]
            [{/oxhasrights}]
            [{/block}]

            [{block name="details_productmain_weight"}]
            [{if $oDetailsProduct->oxarticles__oxweight->value}]

            [{*
            since font-awesome does not have an appropriate icon for indicating weight, we are going to use fa-balance-scale instead
            note that this might conflict with product comparison sometime
            meanwhile you can +1 this: https://github.com/FortAwesome/Font-Awesome/issues/2735
            *}]

            <div><i class="fa fa-balance-scale"></i> [{oxmultilang ident="WEIGHT" suffix="COLON" }] [{$oDetailsProduct->oxarticles__oxweight->value}] [{oxmultilang ident="KG"}]</div>
            [{/if}]
            [{/block}]

        </div>
    </div>

    [{* article main info block *}]
    <div class="information col-xs-12">

    </div>
</div>
[{oxhasrights ident="TOBASKET"}]
    </form>
[{/oxhasrights}]
<div>
    [{include file="page/details/inc/photoslider.tpl"}]
</div>
