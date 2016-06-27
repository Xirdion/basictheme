[{assign var="actCategory" value=$oView->getActiveCategory()}]

[{capture append="oxidBlock_sidebar"}]
[{assign var="listType" value=$oView->getListType()}]
[{if $listType=='manufacturer' || $listType=='vendor'}]
[{if $actCategory && $actCategory->getIconUrl()}]
<div>
    <h3 class="h3">
        [{if $listType=='manufacturer'}]
        [{oxmultilang ident="BRAND"}]
        [{elseif $listType=='vendor'}]
        [{oxmultilang ident="VENDOR"}]
        [{/if}]
    </h3>
    <img src="[{$actCategory->getIconUrl()}]" alt="[{$actCategory->getTitle()}]">
</div>
[{/if}]
[{/if}]
[{/capture}]

[{capture append="oxidBlock_content"}]

[{block name="page_list_listhead"}]

<h1 class="h1 m-b-2">[{$oView->getTitle()}]</h1>

[{if $actCategory->oxcategories__oxthumb->value && $actCategory->getThumbUrl()}]
<div class="m-b-2">
    <img class="img-fluid w-100" src="[{$actCategory->getThumbUrl()}]" alt="[{$actCategory->oxcategories__oxtitle->value}]" class="categoryPicture">
</div>
[{/if}]

[{if $listType!='tag' && $actCategory && $actCategory->getShortDescription() }]
<div class="m-b-2">
    [{$actCategory->getShortDescription()}]
</div>
[{/if}]

[{if $oView->hasVisibleSubCats()}]
<div>
    <div class="row">
        [{foreach from=$oView->getSubCatList() item=category name=MoreSubCat}]
        [{if $category->getIsVisible()}]
        <div class="col-xs-12 col-sm-6 col-md-4">
            <div class="card abs-card">
                [{assign var="iconUrl" value=$category->getIconUrl()}]

                [{* TODO: add documentation that links to subcategories will only show up if an icon of the subcategory is set *}]

                [{if $iconUrl}]

                <a href="[{$category->getLink()}]" title="[{$category->oxcategories__oxtitle->value}]"><img class="w-100" src="[{$category->getIconUrl()}]" alt="[{$category->oxcategories__oxtitle->value}]"></a>
                <div class="p-t-1 p-r-1 p-l-1 abs-card-block">
                    <h4 class="h4">[{$category->oxcategories__oxtitle->value }][{if $oView->showCategoryArticlesCount() && ($category->getNrOfArticles() > 0) }] ([{ $category->getNrOfArticles() }])[{/if}]</h4>
                </div>
                <div class="p-a-1">
                    <a class="btn btn-primary" href="[{$category->getLink()}]" title="[{$category->oxcategories__oxtitle->value}]">[{oxmultilang ident="VISIT_CATEGORY"}]</a>
                </div>

                [{/if}]
            </div>
        </div>
        [{/if}]
        [{/foreach}]
    </div>
</div>

[{if $oView->getArticleList()|@count > 0}]
<hr class="m-t-3 m-b-3"/>
[{/if}]

[{/if}]
[{/block}]



[{block name="page_list_listbody"}]
[{if $oView->getArticleList()|@count > 0}]
[{include file="widget/locator/listlocator.tpl" attributes=$oView->getAttributes() listDisplayType=true sort=true }]

[{* List types: line|infogrid *}]
[{include file="widget/product/list.tpl" type=$oView->getListDisplayType() listId="productList" products=$oView->getArticleList()}]
[{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigationLimitedBottom() itemsPerPage=true}]
[{/if}]

[{if $actCategory->oxcategories__oxlongdesc->value }]

<hr class="m-t-2 m-b-3"/>

<div class="m-b-1">[{oxeval var=$actCategory->oxcategories__oxlongdesc}]</div>
[{/if}]

[{/block}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left" tree_path=$oView->getTreePath()}]