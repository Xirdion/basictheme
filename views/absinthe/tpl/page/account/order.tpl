[{capture append="oxidBlock_content"}]
    <button id="absjs-acc-backbtn" class="btn btn-primary abs-account-backbtn m-b-1">[{oxmultilang ident="BACK"}]</button>
    <h1 class="h1">[{$oView->getTitle()}]</h1>
    <div id="abs-order-history">
        [{assign var=oOrders value=$oView->getOrderList()}]
        [{block name="account_order_history"}]
            [{if count($oOrders) > 0}]
                [{assign var=oArticleList value=$oView->getOrderArticleList()}]
                [{foreach from=$oOrders item=order}]
                    <div class="m-b-2">
                        [{*order-header*}]
                        <button type="button" class="btn btn-secondary text-xs-left abs-collapse-btn collapsed" data-toggle="collapse" data-target="#abs-order_[{$order->oxorder__oxordernr->value}]" aria-expanded="false" aria-controls="abs-order_[{$order->oxorder__oxordernr->value}]">
                            <div class="row">
                                <div class="col-md-5 col-xs-12 abs-oder-col">
                                    <div class="row">
                                        <div class="col-md-7 col-xs-6">
                                            [{*order-date*}]
                                            <div class="abs-order-head"><strong>[{oxmultilang ident="ORDER_DATE" suffix="COLON"}]</strong></div>
                                            <div>[{$order->oxorder__oxorderdate->value|date_format:"%d.%m.%Y"}][{*$order->oxorder__oxorderdate->value|date_format:"%H:%M:%S"*}]</div>
                                        </div>
                                        <div class="col-md-5 col-xs-6">
                                            [{*order-sum*}]
                                            <div class="abs-order-head"><strong>[{oxmultilang ident="TOTAL" suffix="COLON"}]</strong></div>
                                            [{assign var="currency" value=$oView->getActCurrency()}]
                                            <div>[{oxprice price=$order->getOrderNetSum() currency=$currency}]</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-7 col-xs-12">
                                    <div class="row">
                                        <div class="col-md-7 col-xs-6">
                                            [{*del-address*}]
                                            <div class="abs-order-head"><strong>[{oxmultilang ident="SHIPPING_ADDRESS" suffix="COLON"}]</strong></div>
                                            <div>
                                                [{if $order->oxorder__oxdellname->value}]
                                                    [{$order->oxorder__oxdelfname->value|substr:0:1}].
                                                    [{$order->oxorder__oxdellname->value}]
                                                [{else }]
                                                    [{$order->oxorder__oxbillfname->value|substr:0:1}].
                                                    [{$order->oxorder__oxbilllname->value}]
                                                [{/if}]
                                            </div>
                                        </div>
                                        <div class="col-md-5 col-xs-6">
                                            [{*order-nr*}]
                                            <div class="abs-order-head"><strong>[{oxmultilang ident="ORDER_NUMBER" suffix="COLON"}]</strong></div>
                                            <div>[{$order->oxorder__oxordernr->value}]</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </button>
                        [{*order-body*}]
                        <div id="abs-order_[{$order->oxorder__oxordernr->value}]" class="collapse abs-collapse-card">
                            <div class="card card-block">
                                <div class="row">
                                    <div class="col-md-8 col-xs-12">
                                        [{*order-status*}]
                                        <h4 class="h4">
                                            [{if $order->oxorder__oxstorno->value}]
                                                [{oxmultilang ident="ORDER_IS_CANCELED"}]
                                            [{elseif $order->oxorder__oxsenddate->value != "-"}]
                                                [{oxmultilang ident="ORDER_SHIPPED" suffix="COLON"}]
                                                [{$order->oxorder__oxsenddate->value|date_format:"%d.%m.%Y"}]
                                            [{else}]
                                                [{oxmultilang ident="NOT_SHIPPED_YET"}]
                                            [{/if}]
                                        </h4>
                                        [{*articles*}]
                                    </div>
                                    <div class="col-md-4 col-xs-12">
                                        [{*tracking-url*}]
                                        [{if $order->getShipmentTrackingUrl()}]
                                            <strong>[{oxmultilang ident="TRACKING_ID" suffix="COLON"}]</strong>
                                            <span id="accOrderTrack_[{$order->oxorder__oxordernr->value}]">
                                                <a href="[{$order->getShipmentTrackingUrl()}]">[{oxmultilang ident="TRACK_SHIPMENT"}]</a>
                                            </span>
                                        [{/if}]
                                    </div>
                                    <div class="col-xs-12">
                                        [{foreach from=$order->getOrderArticles(true) item=orderitem name=testOrderItem}]
                                            <div class="row m-t-2">
                                                [{assign var=sArticleId value=$orderitem->oxorderarticles__oxartid->value}]
                                                [{assign var=oArticle value=$oArticleList[$sArticleId]}]
                                                [{*article-pic*}]
                                                <div class="col-sm-2 col-xs-3 text-xs-center abs-order-img">
                                                    [{if $oArticle->oxarticles__oxid->value && $oArticle->isVisible()}]
                                                        <a href="[{$oArticle->getLink()}]">
                                                    [{/if}]
                                                    <img class="w-100" src="[{$oArticle->getIconUrl()}]"  alt="[{$orderitem->oxorderarticles__oxtitle->value}]">
                                                    [{if $oArticle->oxarticles__oxid->value && $oArticle->isVisible()}]
                                                        </a>
                                                    [{/if}]
                                                </div>
                                                [{*article-info*}]
                                                <div class="col-sm-10 col-xs-9 p-l-0">
                                                    <div>
                                                        [{if $oArticle->oxarticles__oxid->value && $oArticle->isVisible()}]
                                                            <a href="[{$oArticle->getLink()}]">
                                                        [{/if}]
                                                            [{$orderitem->oxorderarticles__oxtitle->value}] [{$orderitem->oxorderarticles__oxselvariant->value}]
                                                        [{if $oArticle->oxarticles__oxid->value && $oArticle->isVisible()}]
                                                            </a>
                                                        [{/if}]
                                                    </div>
                                                    <div>[{oxmultilang ident="COUNT" suffix="COLON"}]&nbsp;[{$orderitem->oxorderarticles__oxamount->value}]</div>
                                                    <div>[{oxmultilang ident="UNIT_PRICE" suffix="COLON"}]&nbsp;[{oxprice price=$oArticle->getPrice() currency=$currency}]</div>
                                                    [{foreach key=sVar from=$orderitem->getPersParams() item=aParam}]
                                                        [{if $aParam}]
                                                            <br />[{oxmultilang ident="DETAILS" suffix="COLON"}] [{$aParam}]
                                                        [{/if}]
                                                    [{/foreach}]

                                                    [{* Commented due to Trusted Shops precertification. Enable if needed *}]
                                                    [{*
                                                    [{oxhasrights ident="TOBASKET"}]
                                                        [{if $oArticle->oxarticles__oxid->value && $oArticle->isBuyable()}]
                                                            <a id="accOrderToBasket_[{$order->oxorder__oxordernr->value}]_[{$smarty.foreach.testOrderItem.iteration}]" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_order" params="fnc=tobasket&amp;aid=`$oArticle->oxarticles__oxid->value`&amp;am=1"}]" rel="nofollow">[{oxmultilang ident="TO_CART"}]</a>
                                                        [{/if}]
                                                    [{/oxhasrights}]
                                                    *}]
                                                </div>
                                            </div>
                                        [{/foreach}]
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                [{/foreach}]
                [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigation() place="bottom"}]
            [{else}]
                <div class="alert alert-info" role="alert">
                    [{oxmultilang ident="ORDER_EMPTY_HISTORY"}]
                </div>
            [{/if}]
        [{/block}]
    </div>
[{/capture}]
[{capture append="oxidBlock_sidebar"}]
    [{include file="page/account/inc/account_menu.tpl" active_link="orderhistory"}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]