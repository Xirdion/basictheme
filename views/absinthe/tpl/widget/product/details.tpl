[{assign var="oDetailsProduct" value=$oView->getProduct()}]
[{assign var="oPictureProduct" value=$oView->getPicturesProduct()}]
[{assign var="currency" value=$oView->getActCurrency()}]
[{assign var="sPageHeadTitle" value=$oDetailsProduct->oxarticles__oxtitle->value|cat:' '|cat:$oDetailsProduct->oxarticles__oxvarselect->value}]

[{if $oView->getPriceAlarmStatus() == 1}]
[{assign var="shop_name" value=$oxcmp_shop->oxshops__oxname->value}]
[{assign var="bid_price" value=$oView->getBidPrice()}]
[{assign var="currency_sign" value=$currency->sign}]
[{assign_adv var="message_vars" value="array
    (
     '0' => '$shop_name',
     '1' => '$bid_price',
     '2' => '$currency_sign'
    )"}]
[{assign var="_statusMessage" value="PRICE_ALERT_THANK_YOU_MESSAGE"|oxmultilangassign:$message_vars}]
[{include file="message/success.tpl" statusMessage=`$_statusMessage`}]
[{elseif $oView->getPriceAlarmStatus() == 2}]
[{assign var="_statusMessage" value="MESSAGE_WRONG_VERIFICATION_CODE"|oxmultilangassign}]
[{include file="message/error.tpl" statusMessage=$_statusMessage}]
[{elseif $oView->getPriceAlarmStatus() === 0}]
[{assign var="_statusMessage1" value="MESSAGE_NOT_ABLE_TO_SEND_EMAIL"|oxmultilangassign|cat:"<br> "}]
[{assign var="_statusMessage2" value="MESSAGE_VERIFY_YOUR_EMAIL"|oxmultilangassign}]
[{include file="message/error.tpl" statusMessage=`$_statusMessage1``$_statusMessage2`}]
[{/if}]

<div>
    [{if $oView->getSearchTitle()}]
    [{assign var="detailsLocation" value=$oView->getSearchTitle()}]
    [{else}]
    [{foreach from=$oView->getCatTreePath() item=oCatPath name="detailslocation"}]
    [{if $smarty.foreach.detailslocation.last}]
    [{assign var="detailsLocation" value=$oCatPath->oxcategories__oxtitle->value}]
    [{/if}]
    [{/foreach}]
    [{/if }]


    [{* details locator  *}]
    [{assign var="actCategory" value=$oView->getActiveCategory()}]

    [{* 
    
        The prev/next product buttons have been retired.
        The space taken up by this rather unpopular feature should be used otherwise, especially on mobile.
        
        If implementing those buttons again, following should be reviewed:
    
        http://v4-alpha.getbootstrap.com/components/pagination/ (Pager Element)
        
    *}]
    
    [{*

    <div class="row m-b-1">
        <div class="col-xs-6 col-sm-6 col-md-6 text-left m-b-1">
            <a class="btn btn-secondary [{if !$actCategory->prevProductLink}]disabled[{/if}]" class="prev" href="[{$actCategory->prevProductLink}]"><i class="fa fa-chevron-left"></i> <span class="hidden-xs-down">[{oxmultilang ident="PREVIOUS_PRODUCT"}]</span></a>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-6 text-xs-right">
            <a class="btn btn-secondary [{if !$actCategory->nextProductLink}]disabled[{/if}]" href="[{$actCategory->nextProductLink}]" class="next"><span class="hidden-xs-down">[{oxmultilang ident="NEXT_PRODUCT"}]</span> <i class="fa fa-chevron-right"></i></a>
        </div>
    </div>
    
    *}]
    
    [{include file="page/details/inc/fullproductinfo.tpl"}]
</div>
[{insert name="oxid_tracker" title="PRODUCT_DETAILS"|oxmultilangassign product=$oDetailsProduct cpath=$oView->getCatTreePath() }]
[{oxscript widget=$oView->getClassName()}]
