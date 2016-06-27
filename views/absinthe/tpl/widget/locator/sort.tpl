[{block name="widget_locator_sort"}]
[{if $oView->showSorting()}]
[{assign var="_listType" value=$oView->getListDisplayType()}]
[{assign var="_additionalParams" value=$oView->getAdditionalParams()}]
[{assign var="_artPerPage" value=$oViewConf->getArtPerPageCount()}]
[{assign var="_sortColumnVarName" value=$oView->getSortOrderByParameterName()}]
[{assign var="_sortDirectionVarName" value=$oView->getSortOrderParameterName()}]
[{assign var="_listOrderById" value=$oView->getListOrderBy()}]

<span class="m-r-1">[{oxmultilang ident="SORT_BY" suffix="COLON"}]</span>

<div class="btn-group" role="group" aria-label="[{oxmultilang ident="SORT_BY"}]">
    <div class="btn-group" role="group">
        <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            [{if $oView->getListOrderBy()}]
            [{oxmultilang ident=$oView->getListOrderBy()|upper}]
            [{else}]
            [{* TODO: translate as "Unsortiert" *}]
            [{oxmultilang ident="CHOOSE"}]
            [{/if}]
        </button>
        <div class="dropdown-menu">
            [{foreach from=$oView->getSortColumns() item=sColumnName}]
            <a href="[{$oView->getBaseLink()|oxaddparams:"ldtype=$_listType&amp;_artperpage=$_artPerPage&amp;$_sortColumnVarName=$sColumnName&amp;$_sortDirectionVarName=asc&amp;pgNr=0&amp;$_additionalParams"}]" class="dropdown-item[{if $sColumnName == $oView->getListOrderBy()}] active[{/if}]">[{oxmultilang ident=$sColumnName|upper}]</a>
            [{/foreach}]
        </div>
    </div>
    [{* TODO: make <a><a/> as big as button *}]

    [{if $oView->getListOrderDirection() == 'desc'}]
    <a href="[{$oView->getBaseLink()|oxaddparams:"ldtype=$_listType&amp;_artperpage=$_artPerPage&amp;$_sortColumnVarName=$_listOrderById&amp;$_sortDirectionVarName=asc&amp;pgNr=0&amp;$_additionalParams"}]" class="btn btn-secondary"><i class="fa fa-sort-amount-desc"></i></i></a>
    [{else}]
    <a href="[{$oView->getBaseLink()|oxaddparams:"ldtype=$_listType&amp;_artperpage=$_artPerPage&amp;$_sortColumnVarName=$_listOrderById&amp;$_sortDirectionVarName=desc&amp;pgNr=0&amp;$_additionalParams"}]" class="btn btn-secondary"><i class="fa fa-sort-amount-asc"></i></a>
    [{/if}]
</div>

[{/if}]
[{/block}]