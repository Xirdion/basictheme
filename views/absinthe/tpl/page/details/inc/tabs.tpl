[{block name="details_tabs_longdescription"}]
[{oxhasrights ident="SHOWLONGDESCRIPTION"}]
[{assign var="oLongdesc" value=$oDetailsProduct->getLongDescription()}]
[{if $oLongdesc->value}]
[{capture append="tabs"}]<a class="nav-link active" data-toggle="tab" href="#description" role="tab">[{oxmultilang ident="DESCRIPTION"}]</a>[{/capture}]
[{capture append="tabsContent"}]
<div class="tab-pane active p-t-1 p-b-1" id="description" role="tabpanel">
    [{oxeval var=$oLongdesc}]
    [{if $oDetailsProduct->oxarticles__oxexturl->value}]
    <a id="productExturl" class="js-external" href="http://[{$oDetailsProduct->oxarticles__oxexturl->value}]">
        [{if $oDetailsProduct->oxarticles__oxurldesc->value }]
        [{$oDetailsProduct->oxarticles__oxurldesc->value }]
        [{else}]
        [{$oDetailsProduct->oxarticles__oxexturl->value }]
        [{/if}]
    </a>
    [{/if}]
</div>
[{/capture}]
[{/if}]
[{/oxhasrights}]
[{/block}]

[{block name="details_tabs_attributes"}]
[{if $oView->getAttributes()}]
[{capture append="tabs"}]<a class="nav-link" data-toggle="tab" href="#attributes" role="tab">[{oxmultilang ident="SPECIFICATION"}]</a>[{/capture}]
[{capture append="tabsContent"}]<div class="tab-pane p-t-1 p-b-1" id="attributes" role="tabpanel">[{include file="page/details/inc/attributes.tpl"}]</div>[{/capture}]
[{/if}]
[{/block}]

[{block name="details_tabs_media"}]
[{if $oView->getMediaFiles() || $oDetailsProduct->oxarticles__oxfile->value}]
[{capture append="tabs"}]<a class="nav-link" data-toggle="tab" href="#media" role="tab">[{oxmultilang ident="MEDIA"}]</a>[{/capture}]
[{capture append="tabsContent"}]<div class="tab-pane p-t-1 p-b-1" id="media" role="tabpanel">[{include file="page/details/inc/media.tpl"}]</div>[{/capture}]
[{/if}]
[{/block}]

[{block name="details_tabs_main"}]
[{if $tabs}]


<ul class="nav nav-tabs" role="tablist">
    [{foreach from=$tabs item="tab"}]
    <li class="nav-item">
        [{$tab}]
    </li>
    [{/foreach}]
</ul>

<div class="tab-content">
    [{foreach from=$tabsContent item="tabContent"}]
    [{$tabContent}]
    [{/foreach}]
</div>

<hr class="m-t-0 m-b-3"/>
[{/if}]
[{/block}]