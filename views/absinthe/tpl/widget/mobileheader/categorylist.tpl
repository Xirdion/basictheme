[{if $oxcmp_categories }]
[{assign var="categories" value=$oxcmp_categories}]

[{if $categories }]
[{assign var="deepLevel" value=$oView->getDeepLevel()}]

<div id="absjs-mobile-categorytree" class="abs-categorytree m-b-2">
    <div class="list-group">
        [{defun name="tree" categories=$categories}]
        [{assign var="deepLevel" value=$deepLevel+1}]
        [{assign var="oContentCat" value=$oView->getContentCategory() }]
        [{foreach from=$categories item=_cat}]
        [{*$deepLevel*}]
        [{if $_cat->getIsVisible()}]
        [{* CMS category *}]
        [{if $_cat->getContentCats() && $deepLevel > 1 }]
        [{foreach from=$_cat->getContentCats() item=_oCont}]
        <a class="list-group-item[{if $oContentCat && $oContentCat->getId()==$_oCont->getId()}] active [{/if}]" href="[{$_oCont->getLink()}]">
            [{$_oCont->oxcontents__oxtitle->value}]
        </a>
        [{/foreach}]
        [{/if}]
        [{* subcategories *}]

        [{assign var="current" value=false }]

        [{if !$oContentCat && $act && $act->getId()==$_cat->getId()}]
        [{assign var="current" value=true }]
        [{/if}]

        <a class="list-group-item[{if !$current && $_cat->expanded}] active[{elseif $current}] list-group-item-abs-current[{/if}]" href="[{$_cat->getLink()}]">
            [{section name=ident start=1 loop=$deepLevel step=1}]
            &nbsp;
            [{/section}]
            [{if !$current && $_cat->expanded }]
            <i class="fa fa-chevron-down"></i>
            [{else}]
            <i class="fa fa-chevron-right"></i>
            [{/if}]
            [{$_cat->oxcategories__oxtitle->value}] [{if $oView->showCategoryArticlesCount() && ($_cat->getNrOfArticles() > 0)}] ([{$_cat->getNrOfArticles()}])[{/if}]
        </a>
        [{if $_cat->getSubCats()}]
        <div class="list-group [{if $_cat->expanded}]expanded[{/if}]">
        [{fun name="tree" categories=$_cat->getSubCats() }]
        </div>
        [{/if}]

        [{/if}]
        [{/foreach}]
        [{/defun}]
    </div>
</div>
[{/if}]
[{/if}]

