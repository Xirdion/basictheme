[{*include file="widget/locator/attributes.tpl"*}]

<div class="row">

    <div class="col-xs-12 col-sm-4 hidden-xs-down">
        [{if $listDisplayType }]
        [{include file="widget/locator/listdisplaytype.tpl"}]
        [{/if}]
    </div>
    <div class="col-xs-12 col-sm-8 text-xs-center text-sm-right">
        [{if $sort }]
        [{include file="widget/locator/sort.tpl"}]
        [{/if}]
    </div>

</div>

<div class="row">

    <div class="col-xs-12 col-sm-6">
        [{if $locator}]
        [{include file="widget/locator/paging.tpl" pages=$locator place=$place}]
        [{/if}]
    </div>

    <div class="col-xs-12 col-sm-6 text-xs-right">
        [{if $itemsPerPage }]
        [{include file="widget/locator/itemsperpage.tpl"}]
        [{/if}]
    </div>
    
</div>