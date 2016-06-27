[{capture append="oxidBlock_content"}]
    <button id="absjs-acc-backbtn" class="btn btn-primary abs-account-backbtn m-b-1">[{oxmultilang ident="BACK"}]</button>
    <h1 class="h1">[{$oView->getTitle()}]</h1>
    [{if $oView->getOrderFilesList()|count}]
        [{foreach from=$oView->getOrderFilesList() item="oOrderArticle"}]
            <div class="card">
                <div class="card-header">
                    <div>[{oxmultilang ident="ORDER_DATE" suffix="COLON"}] [{$oOrderArticle.oxorderdate|date_format:"%d.%m.%Y"}]</div>
                    <div>[{oxmultilang ident="ORDER_NUMBER" suffix="COLON"}] [{$oOrderArticle.oxordernr}]</div>
                </div>
                <div class="card-block">
                    [{foreach from=$oOrderArticle.oxorderfiles item="oOrderFile"}]
                        [{if $oOrderFile->isPaid() || !$oOrderFile->oxorderfiles__oxpurchasedonly->value}]
                            [{if $oOrderFile->isValid()}]
                                <div class="row m-b-2">
                                    <div class="col-md-11 col-xs-10">
                                        <a class="card-link abs-download-link" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=download" params="sorderfileid="|cat:$oOrderFile->getId()}]" rel="nofollow" title="[{oxmultilang ident="START_DOWNLOAD"}]">
                                            <strong>[{$oOrderArticle.oxarticletitle}]</strong>
                                            [{*$oOrderFile->oxorderfiles__oxfilename->value*}]
                                        </a>
                                        [{include file="page/account/inc/file_attributes.tpl"}]
                                    </div>
                                    <div class="col-md-1 col-xs-2 text-xs-right p-l-0">
                                        <a class="card-link abs-download-icon" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=download" params="sorderfileid="|cat:$oOrderFile->getId()}]" rel="nofollow" title="[{oxmultilang ident="START_DOWNLOAD"}]">
                                            <i class="fa fa-arrow-circle-down"></i>
                                        </a>
                                    </div>
                                </div>
                                            <div class="row m-b-2">
                                    <div class="col-md-11 col-xs-10">
                                        <a class="card-link abs-download-link" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=download" params="sorderfileid="|cat:$oOrderFile->getId()}]" rel="nofollow" title="[{oxmultilang ident="START_DOWNLOAD"}]">
                                            <strong>[{$oOrderArticle.oxarticletitle}]</strong>
                                            [{*$oOrderFile->oxorderfiles__oxfilename->value*}]
                                        </a>
                                        [{include file="page/account/inc/file_attributes.tpl"}]
                                    </div>
                                    <div class="col-md-1 col-xs-2 text-xs-right p-l-0">
                                        <a class="card-link abs-download-icon" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=download" params="sorderfileid="|cat:$oOrderFile->getId()}]" rel="nofollow" title="[{oxmultilang ident="START_DOWNLOAD"}]">
                                            <i class="fa fa-arrow-circle-down"></i>
                                        </a>
                                    </div>
                                </div>
                            [{else}]
                                <div class="alert alert-danger" role="alert">
                                    [{oxmultilang ident="DOWNLOAD_LINK_EXPIRED_OR_MAX_COUNT_RECEIVED"}]
                                </div>
                            [{/if}]
                        [{else}]
                            <div class="alert alert-info" role="alert">
                                [{oxmultilang ident="DOWNLOADS_PAYMENT_PENDING"}]
                            </div>
                        [{/if}]
                    [{/foreach}]
                </div>
            </div>
        [{/foreach}]
    [{else}]
        <div class="alert alert-info" role="alert">
          [{oxmultilang ident="DOWNLOADS_EMPTY"}]
        </div>
    [{/if}]
[{/capture}]
[{capture append="oxidBlock_sidebar"}]
    [{include file="page/account/inc/account_menu.tpl" active_link="downloads"}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]