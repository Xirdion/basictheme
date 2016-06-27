[{capture append="oxidBlock_content"}]
[{if $oxcmp_user}]
[{assign var="force_sid" value=$oView->getSidForWidget()}]
[{/if}]
<div id="absjs-details-wrapper">
    <div id="absjs-details-content">
        [{oxid_include_widget cl="oxwArticleDetails" _parent=$oView->getClassName() nocookie=1 force_sid=$force_sid _navurlparams=$oViewConf->getNavUrlParams() _object=$oView->getProduct() anid=$oViewConf->getActArticleId() iPriceAlarmStatus=$oView->getPriceAlarmStatus() sorting=$oView->getSortingParameters() skipESIforUser=1}]
    </div>
</div>
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]
