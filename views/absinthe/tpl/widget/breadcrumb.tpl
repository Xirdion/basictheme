[{strip}]
<ol class="breadcrumb hidden-xs-down m-b-2">
    <li>[{oxmultilang ident="YOU_ARE_HERE" suffix="COLON"}]</li>
    [{foreach from=$oView->getBreadCrumb() item=sCrum}]
    <li class="active">[{if $sCrum.link }]<a href="[{$sCrum.link}]" title="[{$sCrum.title|escape:'html'}]">[{/if}][{$sCrum.title}][{if $sCrum.link }]</a>[{/if}]</li>
    [{/foreach}]
</ol>
[{/strip}]