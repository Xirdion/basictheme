[{capture append="oxidBlock_content"}]
    <h1 class="h1">[{$oView->getTitle()}]</h1>
    [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigation() sort=true}]
    <div>
        [{include file="form/guestbook.tpl"}]
        <dl class="m-t-2">
            [{if $oView->getEntries()}]
                [{foreach from=$oView->getEntries() item=entry}]
                    <dt class="m-t-1">
                        <span>[{$entry->oxuser__oxfname->value}] [{oxmultilang ident="WRITES" suffix="COLON"}] <span>[{$entry->oxgbentries__oxcreate->value|date_format:"%d.%m.%Y"}] [{$entry->oxgbentries__oxcreate->value|date_format:"%H:%M"}]<span></span></span>
                    </dt>
                    <dd>
                        <div>[{$entry->oxgbentries__oxcontent->value|nl2br}]</div>
                    </dd>
                [{/foreach}]
            [{else}]
                <dt class="m-t-1">
                    [{oxmultilang ident="NO_ENTRY_AVAILABLE"}]
                </dt>
                <dd></dd>
            [{/if}]
        </dl>
        [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigation() place="bottom"}]
    </div>
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]
