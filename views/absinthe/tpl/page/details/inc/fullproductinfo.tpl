
[{include file="page/details/inc/productmain.tpl"}]
<div class="row">
    <div class="col-xs-12">
        [{include file="page/details/inc/tabs.tpl"}]
        [{if $oView->getAlsoBoughtTheseProducts()}]    
        [{include file="widget/product/listslider.tpl" type="grid" listId="alsoBought" header="light" head="CUSTOMERS_ALSO_BOUGHT"|oxmultilangassign|colon products=$oView->getAlsoBoughtTheseProducts()}]
        <hr class="m-t-3 m-b-3"/>
        [{/if}]
    </div>
    [{if $oView->isReviewActive() }]
    <div class="col-xs-12">
        <div class="widgetBox reviews">
            <p class="h4">[{oxmultilang ident="WRITE_PRODUCT_REVIEW"}]</p>
            [{assign var="product" value=$oView->getProduct()}]
            [{if $oxcmp_user}]
            [{assign var="force_sid" value=$oView->getSidForWidget()}]
            [{/if}]
            [{oxid_include_widget cl="oxwReview" nocookie=1 force_sid=$force_sid _parent=$oViewConf->getTopActiveClassName() type=oxarticle anid=$product->oxarticles__oxnid->value aid=$product->oxarticles__oxid->value canrate=$oView->canRate() skipESIforUser=1}]
        </div>
    </div>
    [{/if}]
</div>
[{include file="page/details/inc/related_products.tpl"}]