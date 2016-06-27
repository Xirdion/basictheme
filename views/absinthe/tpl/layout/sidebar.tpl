[{foreach from=$oxidBlock_sidebar item="_block"}]
    [{$_block}]
[{/foreach}]

[{block name="sidebar"}]

    [{block name="sidebar_categoriestree"}]
        [{if $oView->getClassName() != 'start' && $oView->getClassName() != 'compare'}]
            [{oxid_include_widget cl="oxwCategoryTree" cnid=$oView->getCategoryId() deepLevel=0 noscript=1 nocookie=1}]
        [{/if}]
    [{/block}]
    
    [{* not supported at the moment... *}]

    [{*block name="sidebar_boxproducts"}]
        [{if $oView->getTop5ArticleList()}]
            [{include file="widget/product/boxproducts.tpl" _boxId="topBox" _oBoxProducts=$oView->getTop5ArticleList() _sHeaderIdent="TOP_OF_THE_SHOP"}]
        [{/if}]
    [{/block*}]

    [{block name="sidebar_tags"}]
        [{if $oView->showTags() && $oView->getClassName() ne "details" && $oView->getClassName() ne "alist" && $oView->getClassName() ne "suggest" && $oView->getClassName() ne "tags"}]
            [{oxid_include_widget nocookie=1 cl="oxwTagCloud" blShowBox="1" noscript=1 }]
        [{/if}]
    [{/block}]

    [{block name="sidebar_news"}]
        [{if $oxcmp_news|count }]
            [{include file="widget/sidebar/news.tpl" oNews=$oxcmp_news}]
        [{/if}]
    [{/block}]

[{/block}]

