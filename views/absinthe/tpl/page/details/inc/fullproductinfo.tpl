[{include file="page/details/inc/productmain.tpl"}]
<div class="row">
    <div class="col-xs-12 m-t-1">
        [{include file="page/details/inc/tabs.tpl"}]
        [{if $oView->getAlsoBoughtTheseProducts()}]    
            [{include file="widget/product/listslider.tpl" type="grid" listId="alsoBought" header="light" head="CUSTOMERS_ALSO_BOUGHT"|oxmultilangassign|colon products=$oView->getAlsoBoughtTheseProducts()}]
        [{/if}]
    </div>
    [{if $oView->isReviewActive()}]
        <div class="col-xs-12 m-t-2">
            <div class="widgetBox reviews">
                <h4 class="h4">[{oxmultilang ident="RATINGS"}]</h4>
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