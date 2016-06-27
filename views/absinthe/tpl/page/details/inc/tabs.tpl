[{block name="details_tabs_longdescription"}]
    [{oxhasrights ident="SHOWLONGDESCRIPTION"}]
        [{assign var="oLongdesc" value=$oDetailsProduct->getLongDescription()}]
        [{if $oLongdesc->value}]
        
            <div class="card abs-card-ul">
                <div class="card-header">
                    [{*oxmultilang ident="DESCRIPTION"*}]
                    [{$oDetailsProduct->oxarticles__oxtitle}]
                </div>
                <div class="card-box p-a-1">
                    [{oxeval var=$oLongdesc}]
                    [{if $oDetailsProduct->oxarticles__oxexturl->value}]
                        <a class="js-external card-link" href="http://[{$oDetailsProduct->oxarticles__oxexturl->value}]">
                            [{if $oDetailsProduct->oxarticles__oxurldesc->value}]
                                [{$oDetailsProduct->oxarticles__oxurldesc->value}]
                            [{else}]
                                [{$oDetailsProduct->oxarticles__oxexturl->value}]
                            [{/if}]
                        </a>
                    [{/if}]
                </div>
            </div>
        
            [{*capture append="tabs"}]
                <a class="nav-link active" data-toggle="tab" href="#description" role="tab">[{oxmultilang ident="DESCRIPTION"}]</a>
            [{/capture}]
            [{capture append="tabsContent"}]
                <div class="tab-pane active p-y-1" id="description" role="tabpanel">
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
            [{*/capture*}]
        [{/if}]
    [{/oxhasrights}]
[{/block}]

[{block name="details_tabs_attributes"}]
    [{if $oView->getAttributes()}]
        <div class="card">
            <div class="card-header">
                [{oxmultilang ident="SPECIFICATION"}]
            </div>
            <div class="card-box p-a-1">
                [{include file="page/details/inc/attributes.tpl"}]
            </div>
        </div>
        [{*capture append="tabs"}]
            <a class="nav-link " data-toggle="tab" href="#attributes" role="tab">[{oxmultilang ident="SPECIFICATION"}]</a>
        [{/capture}]
        [{capture append="tabsContent"}]
            <div class="tab-pane  p-y-1" id="attributes" role="tabpanel">[{include file="page/details/inc/attributes.tpl"}]</div>
        [{/capture*}]
    [{/if}]
[{/block}]

[{block name="details_tabs_media"}]
    [{if $oView->getMediaFiles() || $oDetailsProduct->oxarticles__oxfile->value}]
        <div class="card">
            <div class="card-header">
                [{oxmultilang ident="MEDIA"}]
            </div>
            <div class="card-box p-a-1">
                [{include file="page/details/inc/media.tpl"}]
            </div>
        </div>
        [{*capture append="tabs"}]
            <a class="nav-link" data-toggle="tab" href="#media" role="tab">[{oxmultilang ident="MEDIA"}]</a>
        [{/capture}]
        [{capture append="tabsContent"}]
            <div class="tab-pane p-y-1" id="media" role="tabpanel">[{include file="page/details/inc/media.tpl"}]</div>
        [{/capture*}]
    [{/if}]
[{/block}]

[{block name="details_tabs_main"}]
    [{*if $tabs}]
        <div class="m-b-2">
            <nav class="nav nav-tabs nav-inline" role="tablist">
                [{foreach from=$tabs item="tab"}]
                    <div class="nav-item">
                        <a class="nav-link" href="#">
                            [{$tab}]
                        </a>
                    </div>
                [{/foreach}]
            </nav>
            <div class="tab-content">
                [{foreach from=$tabsContent item="tabContent"}]
                    [{$tabContent}]
                [{/foreach}]
            </div>
        </div>
    [{/if*}]
[{/block}]