[{capture append="oxidBlock_pageBody"}]
    [{assign var="class_name" value=$oView->getClassName()}]
    [{assign var="template_title" value=$oView->getTitle()}]
    [{if $oView->showRDFa()}]
        [{include file="rdfa/rdfa.tpl"}]
    [{/if}]
    <div id="abs-page" class="[{$class_name}][{if $sidebar}] sidebar[{$sidebar}][{/if}]">
        <div id="abs-mobile-menu-overlay"></div>
        [{block name="layout_header"}]
            [{include file="layout/header.tpl"}]
        [{/block}]
        <div class="container p-t-2 p-b-2 abs-container">
            [{*no breadcrumb in account-sector*}]
            [{assign var="class_account" value=$class_name|strpos:"account"}]
            [{if $class_name ne "start" && $class_account === false && !$blHideBreadcrumb}]
                [{block name="layout_breadcrumb"}]
                    [{include file="widget/breadcrumb.tpl"}]
                [{/block}]
            [{/if}]
            <div class="row">
                [{if $sidebar}]
                    <div id="sidebar" class="col-lg-3 hidden-md-down col-xs-12">
                        [{include file="layout/sidebar.tpl"}]
                    </div>
                    [{assign var=listColumns value="9"}]
                [{else}]
                    [{assign var=listColumns value="12"}]
                [{/if}]
                <div id="abs-content" class="col-xs-12 col-lg-[{$listColumns}]">
                    [{block name="content_main"}]
                        [{include file="message/errors.tpl"}]
                        [{foreach from=$oxidBlock_content item="_block"}]
                            [{$_block}]
                        [{/foreach}]
                    [{/block}]
                </div>
            </div>
        </div>
        [{include file="layout/footer.tpl"}]
    </div>
    [{* not supported *}]
    [{*include file="widget/facebook/init.tpl"*}]

    [{*if $oView->isPriceCalculated() }]
    [{block name="layout_page_vatinclude"}]
    [{oxifcontent ident="oxdeliveryinfo" object="oCont"}]
    [{assign var="tsBadge" value=""}]
    [{if $oView->getTrustedShopId()}]
    [{assign var="tsBadge" value="TsBadge"}]
    [{/if}]
    <div id="incVatMessage[{$tsBadge}]">
    [{if $oView->isVatIncluded()}]
    * <span class="deliveryInfo">[{oxmultilang ident="PLUS_SHIPPING"}]<a href="[{$oCont->getLink()}]" rel="nofollow">[{oxmultilang ident="PLUS_SHIPPING2"}]</a></span>
    [{else}]
    * <span class="deliveryInfo">[{oxmultilang ident="PLUS"}]<a href="[{$oCont->getLink()}]" rel="nofollow">[{oxmultilang ident="PLUS_SHIPPING2"}]</a></span>
    [{/if}]
    </div>
    [{/oxifcontent}]
    [{/block}]
    [{/if*}]
    [{if $oView->getClassName() != "details"}]
        [{insert name="oxid_tracker" title=$template_title }]
    [{/if}]
[{/capture}]
[{include file="layout/base.tpl"}]