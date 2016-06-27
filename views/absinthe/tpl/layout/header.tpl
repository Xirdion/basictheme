[{if $oView->showBetaNote()}]
[{oxid_include_widget cl="oxwBetaNote" noscript=1 nocookie=1}]
[{/if}]

[{if $oViewConf->getTopActionClassName() != 'clearcookies' && $oViewConf->getTopActionClassName() != 'mallstart'}]
[{oxid_include_widget cl="oxwCookieNote" _parent=$oView->getClassName() nocookie=1}]
[{/if}]

<nav id="abs-navbar-top" class="navbar navbar-full navbar-dark">
    <div class="container">
        <address>
            <ul class="nav navbar-nav text-xs-center">
                <li class="nav-item">
                    <a class="nav-link" href="mailto:[{$oxcmp_shop->oxshops__oxinfoemail->value}]"><i class="fa fa-envelope-o"></i>[{$oxcmp_shop->oxshops__oxinfoemail->value}]</a></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="tel:[{$oxcmp_shop->oxshops__oxtelefon->value}]"><i class="fa fa-phone"></i>[{$oxcmp_shop->oxshops__oxtelefon->value}]</a>
                </li>
            </ul>
        </address>
        <ul class="nav navbar-nav pull-xs-right hidden-sm-down">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                    [{oxmultilang ident="MY_ACCOUNT"}]
                </a>
                <div class="dropdown-menu">
                    [{block name="widget_header_servicebox_items"}]
                    <a class="dropdown-item" href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account"}]" rel="nofollow"><i class="fa fa-user"></i> [{oxmultilang ident="MY_ACCOUNT"}]</a>
                    <a class="dropdown-item" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_order"}]" rel="nofollow"><i class="fa fa-list"></i> [{oxmultilang ident="MY_ORDER_HISTORY"}]</a>
                    <a class="dropdown-item" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_wishlist"}]" rel="nofollow"><i class="fa fa-gift"></i> [{oxmultilang ident="MY_GIFT_REGISTRY"}][{if $oxcmp_user && $oxcmp_user->getWishListArtCnt()}] ([{$oxcmp_user->getWishListArtCnt()}])[{/if}]</a>
                    <a class="dropdown-item" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_downloads"}]" rel="nofollow"><i class="fa fa-download"></i> [{oxmultilang ident="MY_DOWNLOADS"}]</a>
                    [{if $oxcmp_user}]
                    <a class="dropdown-item" href="[{$oViewConf->getLogoutLink()}]" rel="nofollow"><i class="fa fa-sign-out"></i> [{oxmultilang ident="LOGOUT"}]</a>
                    [{/if}]

                    [{/block}]
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=contact"}]">[{oxmultilang ident="CONTACT"}]</a>
            </li>
        </ul>
    </div>
</nav>
<div id="abs-compass" class="container m-b-1 m-t-1">
    <div class="row">
        <div id="abs-compass-logo" class="col-md-4 col-sm-9 col-xs-12">
            <div class="m-t-1 m-b-1">
                [{block name="layout_header_logo"}]
                [{assign var="sLogoImg" value=$oViewConf->getShopLogo()}]
                <a href="[{$oViewConf->getHomeLink()}]" title="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]">
                    <img class="img-fluid" src="[{$oViewConf->getImageUrl($sLogoImg)}]" alt="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]">
                </a>
                [{/block}]
            </div>
        </div>
        <div id="abs-compass-search" class="col-sm-4 col-sm-offset-1 col-lg-4 col-lg-offset-0 hidden-sm-down">
            <div class="m-t-2 m-b-1 text-xs-center">
                [{include file="widget/header/search.tpl"}]
            </div>
        </div>
        <div id="abs-compass-basket" class="col-sm-3 col-lg-3 col-lg-offset-1 hidden-xs-down">
            <div class="text-xs-right">
                <div id="abs-compass-minibasket" class="text-xs-right pull-xs-right m-t-1 hidden-md-down">
                    <strong class="center-block">
                        [{if $oxcmp_basket->isPriceViewModeNetto()}]
                        [{$oxcmp_basket->getProductsNetPrice()}]
                        [{else}]
                        [{$oxcmp_basket->getFProductsPrice()}]
                        [{/if}]
                        [{assign var="currency" value=$oView->getActCurrency()}]
                        [{$currency->sign}]
                    </strong>
                    <a rel="nofollow" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=basket"}]" ald="[{oxmultilang ident="DISPLAY_BASKET"}]">
                        <b>[{oxmultilang ident="DISPLAY_BASKET"}]</b>
                    </a>
                </div>
                <a id="abs-compass-cart" class="pull-xs-right" rel="nofollow" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=basket"}]" ald="[{oxmultilang ident="DISPLAY_BASKET"}]">
                    <i class="fa fa-shopping-cart m-r-1"></i>
                    <span>[{$oxcmp_basket->getProductsCount()}]</span>
                </a>
                [{* not supported *}]
                [{*oxid_include_widget cl="oxwMiniBasket" nocookie=$blAnon force_sid=$force_sid*}]
            </div>
        </div>

    </div>
</div>
<div id="abs-navbar-main" class="container-fluid hidden-sm-down">
    <nav class="navbar navbar-full navbar-dark" role="navigation">
        <div class="container">
            <div id="abs-navigation">
                [{oxid_include_widget cl="oxwCategoryTree" cnid=$oView->getCategoryId() sWidgetType="header"  _parent=$oView->getClassName() nocookie=1}]
            </div>
        </div>
    </nav>
</div>

<div id="abs-navbar-mobile">

    <div id="abs-navbar-mobile-tablist" class="hidden-md-up container-fluid">
        <ul id="absjs-navtab" class="row text-xs-center m-b-0">
            
            <li class="col-xs-3 p-l-0 p-r-0">
                [{if $oxcmp_categories}]
                <a class="center-block" data-toggle="absjs-tabcollapse" href="#abs-navbar-mobile-categories"><i class="fa fa-bars fa-2x"></i></a>
                [{/if}]
            </li>
            <li class="col-xs-3 text-xs-center  p-l-0 p-r-0">
                [{if $oView->showSearch()}]
                <a class="center-block" data-toggle="absjs-tabcollapse" href="#abs-navbar-mobile-search"><i class="fa fa-search fa-2x"></i></a>
                [{/if}]
            </li>
            <li class="col-xs-3 text-xs-center  p-l-0 p-r-0">
                <a class="center-block" href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account"}]"><i class="fa fa-user fa-2x"></i></a>
            </li>
            <li class="col-xs-3 text-xs-center  p-l-0 p-r-0">
                <a class="center-block" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=basket"}]"><i class="fa fa-shopping-cart fa-2x"></i></a>
            </li>
        </ul>
    </div>

    <div id="abs-navbar-mobile-tabs" class="hidden-md-up">
        <div class="tab-content">
            <div  class="collapse" id="abs-navbar-mobile-categories">
                [{oxid_include_widget cl="oxwCategoryTree" cnid=$oView->getCategoryId() sWidgetType="mobileheader"  _parent=$oView->getClassName() nocookie=1}]
            </div>
            <div class="collapse p-a-1" id="abs-navbar-mobile-search">
                [{include file="widget/header/search.tpl"}]
            </div>
        </div>
    </div>

</div>

[{if $oView->getClassName()=='start' && $oView->getBanners()|@count > 0}]
[{include file="widget/promoslider.tpl" }]
[{/if}]


[{* not supported *}]
[{*
<div id="header" class="clear">
[{block name="layout_header_top"}]
[{oxid_include_widget cl="oxwLanguageList" lang=$oViewConf->getActLanguageId() _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
[{oxid_include_widget cl="oxwCurrencyList" cur=$oViewConf->getActCurrency() _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]

[{if $oxcmp_user || $oView->getCompareItemCount() || $Errors.loginBoxErrors}]
[{assign var="blAnon" value=0}]
[{assign var="force_sid" value=$oView->getSidForWidget()}]
[{else}]
[{assign var="blAnon" value=1}]
[{/if}]

[{oxid_include_widget cl="oxwServiceMenu" _parent=$oView->getClassName() force_sid=$force_sid nocookie=$blAnon _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
[{/block}]

[{block name="layout_header_logo"}]
[{assign var="sLogoImg" value=$oViewConf->getShopLogo()}]
<a id="logo" href="[{$oViewConf->getHomeLink()}]" title="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]">
<img src="[{$oViewConf->getImageUrl($sLogoImg)}]" alt="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]">
</a>
[{/block}]
[{block name="layout_header_bottom"}]
[{oxid_include_widget cl="oxwCategoryTree" cnid=$oView->getCategoryId() sWidgetType="header" _parent=$oView->getClassName() nocookie=1}]

[{if $oxcmp_basket->getProductsCount()}]
[{assign var="blAnon" value=0}]
[{assign var="force_sid" value=$oView->getSidForWidget()}]
[{else}]
[{assign var="blAnon" value=1}]
[{/if}]
<div id="minibasket_container">
[{oxid_include_widget cl="oxwMiniBasket" nocookie=$blAnon force_sid=$force_sid}]
</div>
[{include file="widget/header/search.tpl"}]
[{/block}]
</div>
[{if $oView->getClassName()=='start' && $oView->getBanners()|@count > 0 }]
<div class="oxSlider">
[{include file="widget/promoslider.tpl" }]
</div>
[{/if}]
*}]