[{* basket contents *}]
[{assign var="currency" value=$oView->getActCurrency()}]
<form name="basket[{$basketindex}]" action="[{$oViewConf->getSelfActionLink()}]" method="post">
    [{$oViewConf->getHiddenSid()}]
    <input type="hidden" name="cl" value="basket">
    <input type="hidden" name="fnc" value="changebasket">
    <input type="hidden" name="CustomError" value='basket'>

    [{* basket header *}]
    <div id="abs-basketcontents-cols" class="row hidden-sm-down">
        [{* not supported *}]
        [{*if $editable}]<div class="col-sm-1"></div>[{/if*}]
        [{* not supported *}]
        [{*if $oView->isWrapping()}]<div class="col-sm-1" class="editCol"></div>[{/if*}]
        [{* not supported *}]
        [{*<div class="col-sm-1">[{oxmultilang ident="WRAPPING"}]</div>*}]
        <div class="col-xs-10 col-xs-offset-2">
            <div class="row text-xs-right">
                <div class="col-xs-2 col-xs-offset-6">[{oxmultilang ident="UNIT_PRICE"}]</div>
                <div class="col-xs-2">[{oxmultilang ident="VAT"}]</div>
                <div class="col-xs-2">[{oxmultilang ident="TOTAL"}]</div>
            </div>
        </div>
    </div>

    [{* basket items *}]
    [{assign var="basketitemlist" value=$oView->getBasketArticles()}]
    [{assign var="oMarkGenerator" value=$oView->getBasketContentMarkGenerator()}]
    <div class="m-b-1">
        [{foreach key=basketindex from=$oxcmp_basket->getContents() item=basketitem name=basketContents}]
        [{block name="checkout_basketcontents_basketitem"}]
        [{assign var="basketproduct" value=$basketitemlist.$basketindex}]
        [{assign var="oArticle" value=$basketitem->getArticle()}]
        [{assign var="oAttributes" value=$oArticle->getAttributesDisplayableInBasket()}]

        <div class="row abs-basketcontents-item m-b-2">

            [{* not supported *}]
            [{*block name="checkout_basketcontents_basketitem_removecheckbox"}]
            [{if $editable}]
            <div class="col-xs-1">
            <input type="checkbox" name="aproducts[[{$basketindex}]][remove]" value="1">
            </div>
            [{/if}]
            [{/block*}]


            [{block name="checkout_basketcontents_basketitem_image"}]
            [{* product image *}]
            <div class="col-xs-4 col-sm-3 col-md-2 text-xs-center">
                <a href="[{$basketitem->getLink()}]" rel="nofollow">
                    <img src="[{$basketitem->getIconUrl()}]" alt="[{$basketitem->getTitle()|strip_tags}]">
                </a>
                <span class="abs-basketitem-small-price hidden-sm-up">
                    [{if $basketitem->getUnitPrice()}]
                    [{oxprice price=$basketitem->getUnitPrice() currency=$currency}]
                    [{/if}]
                    [{if !$basketitem->isBundle()}]
                    [{assign var=dRegUnitPrice value=$basketitem->getRegularUnitPrice()}]
                    [{assign var=dUnitPrice value=$basketitem->getUnitPrice()}]
                    [{if $dRegUnitPrice && $dUnitPrice && $dRegUnitPrice->getPrice() > $dUnitPrice->getPrice()}]
                    <s class="text-danger">[{oxprice price=$basketitem->getRegularUnitPrice() currency=$currency}]</s>
                    [{/if}]
                    [{/if}]
                </span>
            </div>
            [{/block}]

            <div class="col-xs-8 col-sm-9 col-md-10">
                <div class="row">

                    [{block name="checkout_basketcontents_basketitem_titlenumber"}]
                    [{* product title & number *}]
                    <div class="col-xs-12 col-md-6">
                        <div>
                            <a rel="nofollow" href="[{$basketitem->getLink()}]"><b>[{$basketitem->getTitle()}]</b></a>

                            [{if $basketitem->isSkipDiscount()}] <sup><a rel="nofollow" href="#noteWithSkippedDiscount" >[{$oMarkGenerator->getMark('skippedDiscount')}]</a></sup>[{/if}]
                            [{if $oViewConf->getActiveClassName() == 'order' && $oViewConf->isFunctionalityEnabled('blEnableIntangibleProdAgreement')}]
                            [{if $oArticle->hasDownloadableAgreement()}] <sup><a rel="nofollow" href="#noteForDownloadableArticles" >[{$oMarkGenerator->getMark('downloadable')}]</a></sup>[{/if}]
                            [{if $oArticle->hasIntangibleAgreement()}] <sup><a rel="nofollow" href="#noteForIntangibleArticles" >[{$oMarkGenerator->getMark('intangible')}]</a></sup>[{/if}]
                            [{/if}]
                        </div>
                        <div>
                            [{oxmultilang ident="PRODUCT_NO" suffix="COLON"}] [{$basketproduct->oxarticles__oxartnum->value}]
                        </div>
                        <div>
                            [{assign var=sep value=", "}]
                            [{assign var=result value=""}]
                            [{foreach key=oArtAttributes from=$oAttributes->getArray() item=oAttr name=attributeContents}]
                            [{assign var=temp value=$oAttr->oxattribute__oxvalue->value}]
                            [{assign var=result value=$result$temp$sep}]
                            [{/foreach}]
                            <b>[{$result|trim:$sep}]</b>
                        </div>

                        [{if !$basketitem->isBundle() || !$basketitem->isDiscountArticle()}]
                        [{assign var="oSelections" value=$basketproduct->getSelections(null,$basketitem->getSelList())}]
                        [{if $oSelections}]
                        <div class="selectorsBox clear" id="cartItemSelections_[{$smarty.foreach.basketContents.iteration}]">
                            [{foreach from=$oSelections item=oList name=selections}]
                            [{if $oViewConf->showSelectListsInList()}]
                            [{include file="widget/product/selectbox.tpl" oSelectionList=$oList sFieldName="aproducts[`$basketindex`][sel]" iKey=$smarty.foreach.selections.index blHideDefault=true sSelType="seldrop"}]
                            [{else}]
                            [{assign var="oActiveSelection" value=$oList->getActiveSelection()}]
                            [{if $oActiveSelection}]
                            <input type="hidden" name="aproducts[[{$basketindex}]][sel][[{$smarty.foreach.selections.index}]]" value="[{if $oActiveSelection}][{$oActiveSelection->getValue()}][{/if}]">
                            <div>[{$oList->getLabel()}]: [{$oActiveSelection->getName()}]</div>
                            [{/if}]
                            [{/if}]
                            [{/foreach}]
                        </div>
                        [{/if}]
                        [{/if}]


                        [{if !$editable}]
                        [{foreach key=sVar from=$basketitem->getPersParams() item=aParam name=persparams}]
                        <strong>
                            [{if $smarty.foreach.persparams.first && $smarty.foreach.persparams.last}]
                            [{oxmultilang ident="LABEL" suffix="COLON"}]
                            [{else}]
                            [{$sVar}] :
                            [{/if}]
                        </strong> [{$aParam}]
                        [{/foreach}]
                        [{else}]
                        [{if $basketproduct->oxarticles__oxisconfigurable->value}]
                        [{if $basketitem->getPersParams()}]
                        [{foreach key=sVar from=$basketitem->getPersParams() item=aParam name=persparams}] 
                        <div class="abs-basketitem-buttons input-group">
                            <input type="text" class="form-control" placeholder="[{if $smarty.foreach.persparams.first && $smarty.foreach.persparams.last}][{oxmultilang ident="LABEL" suffix="COLON"}][{else}][{$sVar}][{/if}]"  name="aproducts[[{$basketindex}]][persparam][[{$sVar}]]" value="[{$aParam}]">
                            <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
                        </div>
                        [{/foreach}]
                        [{else}]
                        <div class="abs-basketitem-buttons input-group">
                            <input type="text" class="form-control" placeholder="[{oxmultilang ident="LABEL"}]" name="aproducts[[{$basketindex}]][persparam][details]" value="">
                            <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
                        </div>
                        [{/if}]
                        [{/if}]
                        [{/if}]

                        [{block name="checkout_basketcontents_basketitem_quantity"}]
                        [{* product quantity manager *}]
                        [{if $editable}]
                        <input type="hidden" name="aproducts[[{$basketindex}]][aid]" value="[{$basketitem->getProductId()}]">
                        <input type="hidden" name="aproducts[[{$basketindex}]][basketitemid]" value="[{$basketindex}]">
                        <input type="hidden" name="aproducts[[{$basketindex}]][override]" value="1">
                        [{if $basketitem->isBundle()}]
                        <input type="hidden" name="aproducts[[{$basketindex}]][bundle]" value="1">
                        [{/if}]

                        [{if !$basketitem->isBundle() || !$basketitem->isDiscountArticle()}]   
                        <div class="abs-quantity-input abs-basketitem-buttons input-group">
                            <input required="" type="number" min="1" class="form-control" name="aproducts[[{$basketindex}]][am]" value="[{$basketitem->getAmount()}]">
                            <span class="input-group-btn">
                                <button class="btn btn-secondary" type="submit"><i class="fa fa-refresh fa-rotate-90"></i></button>
                                <button class="btn btn-secondary" type="submit" name="aproducts[[{$basketindex}]][am]" value="0"><i class="fa fa-trash-o"></i></button>
                            </span>
                        </div>
                        [{/if}]
                        [{else}]
                        x [{$basketitem->getAmount()}]
                        [{/if}]
                        [{if $basketitem->getdBundledAmount() > 0 && ($basketitem->isBundle() || $basketitem->isDiscountArticle())}]
                        +[{$basketitem->getdBundledAmount()}]
                        [{/if}]
                        [{/block}]
                    </div>
                    [{/block}]

                    [{block name="checkout_basketcontents_basketitem_wrapping"}]
                    [{* not supported *}]
                    [{* product wrapping *}]
                    [{*if $oView->isWrapping()}]
                    <div class="col-sm-1">
                    [{if !$basketitem->getWrappingId()}]
                    [{if $editable}]
                    <a class="wrappingTrigger" rel="nofollow" href="#" title="[{oxmultilang ident="ADD"}]">[{oxmultilang ident="ADD"}]</a>
                    [{else}]
                    [{oxmultilang ident="NONE"}]
                    [{/if}]
                    [{else}]
                    [{assign var="oWrap" value=$basketitem->getWrapping()}]
                    [{if $editable}]
                    <a class="wrappingTrigger" rel="nofollow" href="#" title="[{oxmultilang ident="ADD"}]">[{$oWrap->oxwrapping__oxname->value}]</a>
                    [{else}]
                    [{$oWrap->oxwrapping__oxname->value}]
                    [{/if}]
                    [{/if}]
                    </div>
                    [{/if*}]
                    [{/block}]

                    [{block name="checkout_basketcontents_basketitem_unitprice"}]
                    [{* product price *}]
                    <div class="col-sm-12 col-md-2 hidden-xs-down text-sm-left text-md-right">
                        <span class="hidden-md-up">[{oxmultilang ident="UNIT_PRICE" suffix="COLON"}]</span>
                        [{if $basketitem->getUnitPrice()}]
                        [{oxprice price=$basketitem->getUnitPrice() currency=$currency}]
                        [{/if}]
                        [{if !$basketitem->isBundle()}]
                        [{assign var=dRegUnitPrice value=$basketitem->getRegularUnitPrice()}]
                        [{assign var=dUnitPrice value=$basketitem->getUnitPrice()}]
                        [{if $dRegUnitPrice && $dUnitPrice && $dRegUnitPrice->getPrice() > $dUnitPrice->getPrice()}]
                        <s class="text-danger">[{oxprice price=$basketitem->getRegularUnitPrice() currency=$currency}]</s>
                        [{/if}]
                        [{/if}]
                    </div>
                    [{/block}]

                    [{block name="checkout_basketcontents_basketitem_vat"}]
                    [{* product VAT percent *}]
                    <div class="col-sm-12 col-md-2 hidden-xs-down text-sm-left text-md-right">
                        <span class="hidden-md-up">[{oxmultilang ident="VAT" suffix="COLON"}]</span>            
                        [{$basketitem->getVatPercent()}]%
                    </div>
                    [{/block}]

                    [{block name="checkout_basketcontents_basketitem_totalprice"}]
                    [{* product quantity * price *}]
                    <div class="col-sm-12 col-md-2 hidden-xs-down col-xs-12 text-sm-left text-md-right">
                        <span class="hidden-md-up">[{oxmultilang ident="TOTAL" suffix="COLON"}]</span>
                        [{oxprice price=$basketitem->getPrice() currency=$currency}]
                    </div>
                    [{/block}]
                </div>
            </div>
        </div>
        [{/block}]

        [{* packing unit *}]

        [{block name="checkout_basketcontents_itemerror"}]
        [{foreach from=$Errors.basket item=oEr key=key}]
        [{if $oEr->getErrorClassType() == 'oxOutOfStockException'}]
        [{* display only the exceptions for the current article *}]
        [{if $basketindex == $oEr->getValue('basketIndex')}]
        <div class="col-sm-1">
            [{if $editable}]<td></td>[{/if}]
            <td colspan="5">
                <span class="inlineError">[{$oEr->getOxMessage()}] <strong>[{$oEr->getValue('remainingAmount')}]</strong></span>
            </td>
            [{* not supported *}]
            [{*if $oView->isWrapping()}]<td></td>[{/if*}]
            <td></td>
        </div>
        [{/if}]
        [{/if}]
        [{if $oEr->getErrorClassType() == 'oxArticleInputException'}]
        [{if $basketitem->getProductId() == $oEr->getValue('productId')}]
        <div class="col-sm-1">
            [{if $editable}]<td></td>[{/if}]
            <td colspan="5">
                <span class="inlineError">[{$oEr->getOxMessage()}]</span>
            </td>
            [{if $oView->isWrapping()}]<td></td>[{/if}]
            <td></td>
        </div>
        [{/if}]
        [{/if}]
        [{/foreach}]
        [{/block}]
        [{*  basket items end  *}]
        [{/foreach}]
    </div>

    [{block name="checkout_basketcontents_giftwrapping"}]
    [{* not suppored *}]
    [{*if $oViewConf->getShowGiftWrapping()}]
    [{assign var="oCard" value=$oxcmp_basket->getCard()}]
    [{if $oCard}]
    <tr>
    [{if $editable}]<td></td>[{/if}]
    <td></td>
    <td id="orderCardTitle" colspan="3">[{oxmultilang ident="GREETING_CARD"}] "[{$oCard->oxwrapping__oxname->value}]"
    <br>
    <b>[{oxmultilang ident="YOUR_MESSAGE" suffix="COLON"}]</b>
    <br>
    <div id="orderCardText">[{$oxcmp_basket->getCardMessage()|nl2br}]</div>
    </td>
    <td id="orderCardPrice">[{oxprice price=$oCard->getPrice() currency=$currency}]</td>
    <td>
    [{if $oxcmp_basket->isProportionalCalculationOn()}]
    [{oxmultilang ident="PROPORTIONALLY_CALCULATED"}]</div>
    [{else}]
    [{if $oxcmp_basket->getGiftCardCostVat()}][{$oxcmp_basket->getGiftCardCostVatPercent()}]%[{/if}]
    [{/if}]
    </td>
    <td id="orderCardTotalPrice" align="right">[{oxprice price=$oCard->getPrice() currency=$currency}]</td>
    </tr>
    [{/if}]
    [{/if*}]
    [{/block}]

    [{block name="checkout_basketcontents_basketfunctions"}]
    [{*  basket update/delete buttons  *}]
    [{* not supported *}]
    [{*
    [{if $editable}]
    <div>
    <input type="checkbox" name="checkAll" id="checkAll" title="[{oxmultilang ident="ALL"}]">
    <button id="basketRemoveAll" name="removeAllBtn"><span>[{oxmultilang ident="ALL"}]</span></button>
    <button id="basketRemove" type="submit" name="removeBtn"><span>[{oxmultilang ident="REMOVE"}]</span></button>
    <button class="btn btn-primary" type="submit" name="updateBtn"><span>[{oxmultilang ident="UPDATE"}]</span></button>
    </div>
    [{/if}]
    *}]
    [{/block}]

    [{block name="checkout_basketcontents_summary"}]
    
    <hr class="m-t-3 m-b-3"/>
    
    <div id="abs-basket-summary" class="summary[{if $oViewConf->getActiveClassName() == 'order'}] orderSummary[{/if}] m-b-2">
        [{*  basket summary  *}]
        <div class="row text-xs-right">
            [{if !( $oxcmp_basket->getDiscounts() || ($oViewConf->getShowVouchers() && $oxcmp_basket->getVoucherDiscValue())  )}]
            [{block name="checkout_basketcontents_nodiscounttotalnet"}]
            <div class="col-xs-8 col-sm-5 col-sm-offset-0 col-lg-3 col-lg-offset-7 text-xs-left">[{oxmultilang ident="TOTAL_NET" suffix="COLON"}]</div>
            <div class="col-xs-4 col-sm-3 col-sm-offset-4 col-lg-offset-0 col-lg-2">[{oxprice price=$oxcmp_basket->getNettoSum() currency=$currency}]</div>
            [{/block}]
            [{block name="checkout_basketcontents_nodiscountproductvats"}]
            [{foreach from=$oxcmp_basket->getProductVats(false) item=VATitem key=key}]
            <div class="col-xs-8 col-sm-5 col-sm-offset-0 col-lg-3 col-lg-offset-7 text-xs-left">[{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$key}]</div>
            <div class="col-xs-4 col-sm-3 col-sm-offset-4 col-lg-offset-0 col-lg-2">[{oxprice price=$VATitem currency=$currency}]</div>
            [{/foreach}]
            [{/block}]
            [{block name="checkout_basketcontents_nodiscounttotalgross"}]
            <div class="col-xs-8 col-sm-5 col-sm-offset-0 col-lg-3 col-lg-offset-7 text-xs-left">[{oxmultilang ident="TOTAL_GROSS" suffix="COLON"}]</div>
            <div class="col-xs-4 col-sm-3 col-sm-offset-4 col-lg-offset-0 col-lg-2">[{oxprice price=$oxcmp_basket->getBruttoSum() currency=$currency}]</div>
            [{/block}]
            [{else}]
            [{if $oxcmp_basket->isPriceViewModeNetto()}]
            [{block name="checkout_basketcontents_discounttotalnet"}]
            <div class="col-xs-8 col-sm-5 col-sm-offset-0 col-lg-3 col-lg-offset-7 text-xs-left">[{oxmultilang ident="TOTAL_NET" suffix="COLON"}]</div>
            <div class="col-xs-4 col-sm-3 col-sm-offset-4 col-lg-offset-0 col-lg-2">[{oxprice price=$oxcmp_basket->getNettoSum() currency=$currency}]</div>
            [{/block}]
            [{else}]
            [{block name="checkout_basketcontents_discounttotalgross"}]
            <div class="col-xs-8 col-sm-5 col-sm-offset-0 col-lg-3 col-lg-offset-7 text-xs-left">[{oxmultilang ident="TOTAL_GROSS" suffix="COLON"}]</div>
            <div class="col-xs-4 col-sm-3 col-sm-offset-4 col-lg-offset-0 col-lg-2">[{oxprice price=$oxcmp_basket->getBruttoSum() currency=$currency}]</div>
            [{/block}]
            [{/if}]
            [{block name="checkout_basketcontents_discounts"}]
            [{foreach from=$oxcmp_basket->getDiscounts() item=oDiscount name=test_Discounts}]
            <div class="col-xs-8 col-sm-5 col-sm-offset-0 col-lg-3 col-lg-offset-7 text-xs-left">
                <b>[{if $oDiscount->dDiscount < 0}][{oxmultilang ident="SURCHARGE"}][{else}][{oxmultilang ident="DISCOUNT"}][{/if}]&nbsp;</b>[{$oDiscount->sDiscount}]
            </div>
            <div class="col-xs-4 col-sm-3 col-sm-offset-4 col-lg-offset-0 col-lg-2">[{oxprice price=$oDiscount->dDiscount*-1 currency=$currency}]</div>
            [{/foreach}]
            [{/block}]
            [{block name="checkout_basketcontents_voucherdiscount"}]
            [{if $oViewConf->getShowVouchers() && $oxcmp_basket->getVoucherDiscValue()}]
            [{foreach from=$oxcmp_basket->getVouchers() item=sVoucher key=key name=Voucher}]
            <div class="col-xs-8 col-sm-5 col-sm-offset-0 col-lg-3 col-lg-offset-7 text-xs-left">
                <span><strong>[{oxmultilang ident="COUPON"}]</strong>&nbsp;([{oxmultilang ident="NUMBER_2"}] [{$sVoucher->sVoucherNr}])</span>
                [{if $editable}]
                <a href="[{$oViewConf->getSelfLink()}]&amp;cl=basket&amp;fnc=removeVoucher&amp;voucherId=[{$sVoucher->sVoucherId}]&amp;CustomError=basket" rel="nofollow"><i class="fa fa-trash-o"></i></a>
                [{/if}]
            </div>
            <div class="col-xs-4 col-sm-3 col-sm-offset-4 col-lg-offset-0 col-lg-2 text-danger">[{oxprice price=$sVoucher->dVoucherdiscount*-1 currency=$currency}]</div>
            [{/foreach}]
            [{/if}]
            [{/block}]

            [{if !$oxcmp_basket->isPriceViewModeNetto()}]
            [{block name="checkout_basketcontents_totalnet"}]
            <div class="col-xs-8 col-sm-5 col-sm-offset-0 col-lg-3 col-lg-offset-7 text-xs-left">[{oxmultilang ident="TOTAL_NET" suffix="COLON"}]</div>
            <div class="col-xs-4 col-sm-3 col-sm-offset-4 col-lg-offset-0 col-lg-2">[{oxprice price=$oxcmp_basket->getNettoSum() currency=$currency}]</div>
            [{/block}]
            [{/if}]

            [{block name="checkout_basketcontents_productvats"}]
            [{foreach from=$oxcmp_basket->getProductVats(false) item=VATitem key=key}]
            <div class="col-xs-8 col-sm-5 col-sm-offset-0 col-lg-3 col-lg-offset-7 text-xs-left">[{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$key}]</div>
            <div class="col-xs-4 col-sm-3 col-sm-offset-4 col-lg-offset-0 col-lg-2">[{oxprice price=$VATitem currency=$currency}]</div>
            [{/foreach}]
            [{/block}]

            [{if $oxcmp_basket->isPriceViewModeNetto()}]
            [{block name="checkout_basketcontents_totalgross"}]
            <div class="col-xs-8 col-sm-5 col-sm-offset-0 col-lg-3 col-lg-offset-7 text-xs-left">[{oxmultilang ident="TOTAL_GROSS" suffix="COLON"}]</div>
            <div class="col-xs-4 col-sm-3 col-sm-offset-4 col-lg-offset-0 col-lg-2">[{oxprice price=$oxcmp_basket->getBruttoSum() currency=$currency}]</div>
            [{/block}]
            [{/if}]
            [{/if}]
            [{block name="checkout_basketcontents_delcosts"}]
            [{assign var="deliveryCost" value=$oxcmp_basket->getDeliveryCost()}]
            [{if $deliveryCost && ($oxcmp_basket->getBasketUser() || $oViewConf->isFunctionalityEnabled('blCalculateDelCostIfNotLoggedIn') )}]
            [{if $oViewConf->isFunctionalityEnabled('blShowVATForDelivery')}]
            <div class="col-xs-8 col-sm-5 col-sm-offset-0 col-lg-3 col-lg-offset-7 text-xs-left">[{oxmultilang ident="SHIPPING_NET" suffix="COLON"}]</div>
            <div class="col-xs-4 col-sm-3 col-sm-offset-4 col-lg-offset-0 col-lg-2">[{oxprice price=$deliveryCost->getNettoPrice() currency=$currency}]</div>
            [{if $deliveryCost->getVatValue()}]

            [{if $oxcmp_basket->isProportionalCalculationOn()}]
            <div class="col-xs-8 col-sm-5 col-sm-offset-0 col-lg-3 col-lg-offset-7 text-xs-left">[{oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT" suffix="COLON"}]</div>
            [{else}]
            <div class="col-xs-8 col-sm-5 col-sm-offset-0 col-lg-3 col-lg-offset-7 text-xs-left">[{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$deliveryCost->getVat()}]</div>
            [{/if}]
            <div class="col-xs-4 col-sm-3 col-sm-offset-4 col-lg-offset-0 col-lg-2">[{oxprice price=$deliveryCost->getVatValue() currency=$currency}]</div>

            [{/if}]
            [{else}]

            <div class="col-xs-8 col-sm-5 col-sm-offset-0 col-lg-3 col-lg-offset-7 text-xs-left">[{oxmultilang ident="SHIPPING_COST" suffix="COLON"}]</div>
            <div class="col-xs-4 col-sm-3 col-sm-offset-4 col-lg-offset-0 col-lg-2">[{oxprice price=$deliveryCost->getBruttoPrice() currency=$currency}]</div>

            [{/if}]
            [{/if}]
            [{/block}]

            [{block name="checkout_basketcontents_paymentcosts"}]
            [{assign var="paymentCost" value=$oxcmp_basket->getPaymentCost()}]
            [{if $paymentCost && $paymentCost->getPrice()}]
            [{if $oViewConf->isFunctionalityEnabled('blShowVATForPayCharge')}]

            <div class="col-xs-8 col-sm-5 col-sm-offset-0 col-lg-3 col-lg-offset-7 text-xs-left">[{if $paymentCost->getPrice() >= 0}][{oxmultilang ident="SURCHARGE"}][{else}][{oxmultilang ident="DEDUCTION"}][{/if}] [{oxmultilang ident="PAYMENT_METHOD" suffix="COLON"}]</div>
            <div class="col-xs-4 col-sm-3 col-sm-offset-4 col-lg-offset-0 col-lg-2">[{oxprice price=$paymentCost->getNettoPrice() currency=$currency}]</div>

            [{if $paymentCost->getVatValue()}]

            [{if $oxcmp_basket->isProportionalCalculationOn()}]
            <div class="col-xs-8 col-sm-5 col-sm-offset-0 col-lg-3 col-lg-offset-7 text-xs-left">[{oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT" suffix="COLON"}]</div>
            [{else}]
            <div class="col-xs-8 col-sm-5 col-sm-offset-0 col-lg-3 col-lg-offset-7 text-xs-left">[{oxmultilang ident="SURCHARGE_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$paymentCost->getVat()}]</div>
            [{/if}]
            <div class="col-xs-4 col-sm-3 col-sm-offset-4 col-lg-offset-0 col-lg-2">[{oxprice price=$paymentCost->getVatValue() currency=$currency}]</div>

            [{/if}]
            [{else}]

            <div class="col-xs-8 col-sm-5 col-sm-offset-0 col-lg-3 col-lg-offset-7 text-xs-left">[{if $paymentCost->getPrice() >= 0}][{oxmultilang ident="SURCHARGE"}][{else}][{oxmultilang ident="DEDUCTION"}][{/if}] [{oxmultilang ident="PAYMENT_METHOD" suffix="COLON"}]</div>
            <div class="col-xs-4 col-sm-3 col-sm-offset-4 col-lg-offset-0 col-lg-2">[{oxprice price=$paymentCost->getBruttoPrice() currency=$currency}]</div>

            [{/if}]
            [{/if}]
            [{/block}]

            [{block name="checkout_basketcontents_ts"}]
            [{assign var="trustedShopProtectionCost" value=$oxcmp_basket->getTrustedShopProtectionCost()}]
            [{if $trustedShopProtectionCost && $trustedShopProtectionCost->getPrice() > 0}]
            [{if $oViewConf->isFunctionalityEnabled('blShowVATForPayCharge')}]

            <div class="col-xs-8 col-sm-5 col-sm-offset-0 col-lg-3 col-lg-offset-7 text-xs-left">[{oxmultilang ident="TRUSTED_SHOP_BUYER_PROTECTION"}]</div>
            <div class="col-xs-4 col-sm-3 col-sm-offset-4 col-lg-offset-0 col-lg-2">[{oxprice price=$trustedShopProtectionCost->getNettoPrice() currency=$currency}]</div>

            [{if $trustedShopProtectionCost->getVatValue()}]

            [{if $oxcmp_basket->isProportionalCalculationOn()}]
            <div class="col-xs-8 col-sm-5 col-sm-offset-0 col-lg-3 col-lg-offset-7 text-xs-left">[{oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT" suffix="COLON"}]</div>
            [{else}]
            <div class="col-xs-8 col-sm-5 col-sm-offset-0 col-lg-3 col-lg-offset-7 text-xs-left">[{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$trustedShopProtectionCost->getVat()}]</div>
            [{/if}]
            <div class="col-xs-4 col-sm-3 col-sm-offset-4 col-lg-offset-0 col-lg-2">[{oxprice price=$trustedShopProtectionCost->getVatValue() currency=$currency}]</div>

            [{/if}]
            [{else}]

            <div class="col-xs-8 col-sm-5 col-sm-offset-0 col-lg-3 col-lg-offset-7 text-xs-left">[{oxmultilang ident="TRUSTED_SHOP_BUYER_PROTECTION"}]</div>
            <div class="col-xs-4 col-sm-3 col-sm-offset-4 col-lg-offset-0 col-lg-2">[{oxprice price=$trustedShopProtectionCost->getBruttoPrice() currency=$currency}]</div>

            [{/if}]
            [{/if}]
            [{/block}]

            [{block name="checkout_basketcontents_wrappingcosts"}]
            [{if $oViewConf->getShowGiftWrapping()}]

            [{assign var="wrappingCost" value=$oxcmp_basket->getWrappingCost()}]
            [{if $wrappingCost && $wrappingCost->getPrice() > 0}]
            [{if $oViewConf->isFunctionalityEnabled('blShowVATForWrapping')}]

            <div class="col-xs-8 col-sm-5 col-sm-offset-0 col-lg-3 col-lg-offset-7 text-xs-left">[{oxmultilang ident="BASKET_TOTAL_WRAPPING_COSTS_NET" suffix="COLON"}]</div>
            <div class="col-xs-4 col-sm-3 col-sm-offset-4 col-lg-offset-0 col-lg-2">[{oxprice price=$wrappingCost->getNettoPrice() currency=$currency}]</div>

            [{if $oxcmp_basket->getWrappCostVat()}]

            <div class="col-xs-8 col-sm-5 col-sm-offset-0 col-lg-3 col-lg-offset-7 text-xs-left">[{oxmultilang ident="PLUS_VAT" suffix="COLON"}]</div>
            <div class="col-xs-4 col-sm-3 col-sm-offset-4 col-lg-offset-0 col-lg-2">[{oxprice price=$wrappingCost->getVatValue() currency=$currency}]</div>

            [{/if}]
            [{else}]

            <div class="col-xs-8 col-sm-5 col-sm-offset-0 col-lg-3 col-lg-offset-7 text-xs-left">[{oxmultilang ident="GIFT_WRAPPING" suffix="COLON"}]</div>
            <div class="col-xs-4 col-sm-3 col-sm-offset-4 col-lg-offset-0 col-lg-2">[{oxprice price=$wrappingCost->getBruttoPrice() currency=$currency}]</div>

            [{/if}]
            [{/if}]

            [{assign var="giftCardCost" value=$oxcmp_basket->getGiftCardCost()}]
            [{if $giftCardCost && $giftCardCost->getPrice() > 0}]
            [{if $oViewConf->isFunctionalityEnabled('blShowVATForWrapping')}]

            <div class="col-xs-8 col-sm-5 col-sm-offset-0 col-lg-3 col-lg-offset-7 text-xs-left">[{oxmultilang ident="BASKET_TOTAL_GIFTCARD_COSTS_NET" suffix="COLON"}]</div>
            <div class="col-xs-4 col-sm-3 col-sm-offset-4 col-lg-offset-0 col-lg-2">[{oxprice price=$giftCardCost->getNettoPrice() currency=$currency}]</div>


            [{if $oxcmp_basket->isProportionalCalculationOn()}]
            <div class="col-xs-8 col-sm-5 col-sm-offset-0 col-lg-3 col-lg-offset-7 text-xs-left">[{oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT" suffix="COLON"}]</div>
            [{else}]
            <div class="col-xs-8 col-sm-5 col-sm-offset-0 col-lg-3 col-lg-offset-7 text-xs-left">[{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$giftCardCost->getVat()}] </div>
            [{/if}]
            <div class="col-xs-4 col-sm-3 col-sm-offset-4 col-lg-offset-0 col-lg-2">[{oxprice price=$giftCardCost->getVatValue() currency=$currency}]</div>

            [{else}]

            <div class="col-xs-8 col-sm-5 col-sm-offset-0 col-lg-3 col-lg-offset-7 text-xs-left">[{oxmultilang ident="GREETING_CARD" suffix="COLON"}]</div>
            <div class="col-xs-4 col-sm-3 col-sm-offset-4 col-lg-offset-0 col-lg-2">[{oxprice price=$giftCardCost->getBruttoPrice() currency=$currency}]</div>

            [{/if}]
            [{/if}]
            [{/if}]
            [{/block}]

            [{block name="checkout_basketcontents_grandtotal"}]

            <div class="col-xs-8 col-sm-5 col-sm-offset-0 col-lg-3 col-lg-offset-7 text-xs-left"><strong>[{oxmultilang ident="GRAND_TOTAL" suffix="COLON"}]</strong></div>
            <div class="col-xs-4 col-sm-3 col-sm-offset-4 col-lg-offset-0 col-lg-2"><strong>[{oxprice price=$oxcmp_basket->getPrice() currency=$currency}]</strong></div>

            [{/block}]

            [{if $oxcmp_basket->hasSkipedDiscount()}]

            <div class="col-xs-8 col-sm-5 col-sm-offset-0 col-lg-3 col-lg-offset-7 text-xs-left"><span id="noteWithSkippedDiscount" class="note">[{$oMarkGenerator->getMark('skippedDiscount')}]</span> [{oxmultilang ident="MESSAGE_COUPON_NOT_APPLIED_FOR_ARTICLES"}]</span></div>
            <div class="col-xs-4 col-sm-3 col-sm-offset-4 col-lg-offset-0 col-lg-2"></div>

            [{/if}]
        </div>
    </div>
    [{/block}]
</form>