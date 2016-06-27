[{assign var="listType" value=$oView->getListDisplayType()}]
[{assign var="_additionalParams" value=$oView->getAdditionalParams()}]
[{assign var="_artPerPage" value=$oViewConf->getArtPerPageCount()}]
[{if $oView->canSelectDisplayType()}]
<div class="dropDown js-fnLink" id="viewOptions">
    <div class="btn-group" role="group" aria-label="[{oxmultilang ident="SORT_BY"}]">

        <a href="[{$oView->getBaseLink()|oxaddparams:"ldtype=infogrid&amp;_artperpage=$_artPerPage&amp;pgNr=0&amp;$_additionalParams"}]" class="btn btn-secondary[{if $listType eq 'infogrid'}] active[{/if}]"><i class="fa fa-th-large"></i></a>
        
        <a href="[{$oView->getBaseLink()|oxaddparams:"ldtype=line&amp;_artperpage=$_artPerPage&amp;pgNr=0&amp;$_additionalParams"}]" class="btn btn-secondary[{if $listType eq 'line' }] active[{/if}]"><i class="fa fa-th-list"></i></a>

    </div>
</div>
[{/if}]