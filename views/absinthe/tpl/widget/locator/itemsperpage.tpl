[{assign var="_additionalParams" value=$oView->getAdditionalParams()}]
[{assign var="_listType" value=$oView->getListDisplayType()}]

<div class="hidden-xs-down">
    <span class="m-r-1">[{oxmultilang ident="PRODUCTS_PER_PAGE" suffix="COLON"}]</span>
    <div class="btn-group m-t-1 m-b-1" role="group">
        <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            [{if $oViewConf->getArtPerPageCount() }]
            [{$oViewConf->getArtPerPageCount()}]
            [{else}]
            [{oxmultilang ident="CHOOSE"}]
            [{/if}]
        </button>
        <div class="dropdown-menu">
            [{foreach from=$oViewConf->getNrOfCatArticles() item=iItemsPerPage}]
            <a href="[{$oView->getBaseLink()|oxaddparams:"ldtype=$_listType&amp;_artperpage=$iItemsPerPage&amp;pgNr=0&amp;$_additionalParams"}]" rel="nofollow" class="dropdown-item[{if $oViewConf->getArtPerPageCount() == $iItemsPerPage }] active[{/if}]">[{$iItemsPerPage}]</a>
            [{/foreach}]
        </div>
    </div>
</div>