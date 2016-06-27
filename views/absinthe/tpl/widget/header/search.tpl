[{block name="widget_header_search_form"}]
[{if $oView->showSearch() }]
<form action="[{$oViewConf->getSelfActionLink()}]" method="get" role=search>
    [{$oViewConf->getHiddenSid()}]
    <input type="hidden" name="cl" value="search">
    [{assign var="currency" value=$oView->getActCurrency()}]
    [{if $currency->id}]
    <input type="hidden" name="cur" value="[{$currency->id}]">
    [{/if}]
    <div class="input-group">
        [{block name="header_search_field"}]
        <input type="text" required class="form-control" placeholder="[{oxmultilang ident="SEARCH" }]"  name="searchparam" value="[{$oView->getSearchParamForHtml()}]">
        [{/block}]
        <span class="input-group-btn">
            <button class="btn btn-secondary" type="submit" value=""><i class="fa fa-search"></i></button>
        </span>
    </div>
</form>
[{/if}]
[{/block}]