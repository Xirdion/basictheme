[{block name="details_relatedproducts_crossselling"}]
[{if $oView->getCrossSelling()|count}]
[{capture append="oxidBlock_productbar"}]

<hr class="m-t-3 m-b-3" >

[{include file="widget/product/listslider.tpl" head="HAVE_YOU_SEEN"|oxmultilangassign type="grid" products=$oView->getCrossSelling()}]

[{/capture}]
[{/if}]
[{/block}]

[{block name="details_relatedproducts_similarproducts"}]
[{if $oView->getSimilarProducts()|count}]
[{capture append="oxidBlock_productbar" }]

<hr class="m-t-3 m-b-3" >

[{include file="widget/product/listslider.tpl" head="SIMILAR_PRODUCTS"|oxmultilangassign type="grid" products=$oView->getSimilarProducts()}]

[{/capture}]
[{/if}]
[{/block}]

[{block name="details_relatedproducts_accessoires"}]
[{if $oView->getAccessoires()|count}]
[{capture append="oxidBlock_productbar"}]

<hr class="m-t-3 m-b-3" >

[{include file="widget/product/listslider.tpl" head="ACCESSORIES"|oxmultilangassign type="grid" products=$oView->getAccessoires()}]

[{/capture}]
[{/if}]
[{/block}]

[{if $oxidBlock_productbar}]
<div>
    [{foreach from=$oxidBlock_productbar item="_block"}]
    [{$_block}]
    [{/foreach}]
</div>
[{/if}]