[{capture append="oxidBlock_content"}]
    [{assign var="oNews" value=$oView->getNews()}]
    <h1 class="h1">[{$oView->getTitle()}]</h1>
    <div class="m-t-2">
        [{if !empty($oNews)}]
            [{foreach from=$oNews item=oNewsEntry}]
                [{if !empty($oNewsEntry) && !empty($oNewsEntry->oxnews__oxshortdesc->value)}]
                    <div class="row m-b-2">
                        <div class="col-md-2 col-xs-12">
                            [{$oNewsEntry->oxnews__oxdate->value|date_format:"%d.%m.%Y"}]
                        </div>
                        <div class="col-md-10 col-xs-12">
                            <p>[{$oNewsEntry->oxnews__oxshortdesc->value}]</p>
                            <p>[{$oNewsEntry->getLongDesc() force=1}]</p>
                        </div>
                    </div>
                [{/if}]
            [{/foreach}]
        [{else}]
            [{oxmultilang ident="LATEST_NEWS_NOACTIVENEWS"}]
        [{/if}]
    </div>
    [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigation() place="bottom"}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]
