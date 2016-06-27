[{block name="widget_reviews_form"}]
[{if $oxcmp_user}]
<form action="[{$oViewConf->getSelfActionLink()}]" method="post" id="rating">
    <div class="row m-b-2">
        [{if $oView->canRate()}]
        <input id="productRating" type="hidden" name="artrating" value="0">

        <div class="col-xs-12">
            <fieldset id="abs-rate" class="abs-rating">
                [{section name=star start=1 loop=6}]
                [{math assign="starnumber" equation="6 - x" x=$smarty.section.star.index}]
                <input type="radio" id="star[{$starnumber}]" name="artrating" value="[{$starnumber}]" /><label class = "full" for="star[{$starnumber}]" title="[{$starnumber}] [{if $starnumber==1}][{oxmultilang ident="STAR"}][{else}][{oxmultilang ident="STARS"}][{/if}]"></label>
                [{/section}]
            </fieldset>
        </div>

        [{/if}]
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        [{oxid_include_dynamic file="form/formparams.tpl"}]
        <input type="hidden" name="fnc" value="savereview">
        <input type="hidden" name="cl" value="[{$oViewConf->getTopActiveClassName()}]">

        [{if $oView->getReviewType() == 'oxarticle'}]
        <input type="hidden" name="anid" value="[{$oView->getArticleId()}]">
        [{elseif $oView->getReviewType() == 'oxrecommlist'}]
        <input type="hidden" name="recommid" value="[{$oView->getRecommListId()}]">
        [{/if}]

        [{assign var="sReviewUserHash" value=$oView->getReviewUserHash()}]
        [{if $sReviewUserHash}]
        <input type="hidden" name="reviewuserhash" value="[{$sReviewUserHash}]">
        [{/if}]

        <div class="col-xs-12">
            <fieldset class="form-group">
                <textarea name="rvw_txt" class="form-control" rows="3"></textarea>
            </fieldset>
        </div>
        <div class="col-xs-12">
            <button class="btn btn-primary" type="submit" class="submitButton"><i class="fa fa-floppy-o"></i> [{oxmultilang ident="SAVE_RATING_AND_REVIEW"}]</button>
        </div>
    </div>
</form>
[{else}]
[{assign var="sArticleNId" value=$oView->getArticleNId()}]
<a rel="nofollow" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" params="anid=$sArticleNId"|cat:"&amp;sourcecl="|cat:$oViewConf->getTopActiveClassName()|cat:$oViewConf->getNavUrlParams()}]"><b>[{oxmultilang ident="MESSAGE_LOGIN_TO_WRITE_REVIEW"}]</b></a>
[{/if}]
[{/block}]

[{assign var="aReviews" value=$oView->getReviews()}]
[{if $aReviews}]
<div class="m-t-1">
[{foreach from=$aReviews item=review name=ReviewsCounter}]
[{block name="widget_reviews_record"}]
<span>
    <span>[{$review->oxuser__oxfname->value}]</span> [{oxmultilang ident="WRITES" suffix="COLON" }]
    <span>[{$review->oxreviews__oxcreate->value|date_format:"%d.%m.%Y"}]</span>
    [{if $review->oxreviews__oxrating->value}]
    <span class="abs-rating abs-rated">
        [{section name=star start=1 loop=6}]
        [{assign var="starnumber" value=$smarty.section.star.index}]
        
        <label class = "full[{if $review->oxreviews__oxrating->value >= $starnumber }] active[{/if}]" for="star[{$starnumber}]" title="[{$starnumber}] [{if $starnumber==1}][{oxmultilang ident="STAR"}][{else}][{oxmultilang ident="STARS"}][{/if}]"></label>
        [{/section}]
    </span>
    [{/if}]
</span>
<div>[{$review->oxreviews__oxtext->value}]</div>

[{/block}]
[{/foreach}]
[{else}]
<b><br>[{oxmultilang ident="NO_REVIEW_AVAILABLE"}]</b>
[{/if}]
</div>
[{oxscript widget=$oView->getClassName()}]