[{capture append="oxidBlock_content"}]
    <h1 class="h1">[{$oView->getTitle()}]</h1>
    [{assign var="_navcategorytree" value=$oView->getCategoryTree()}]
    [{if $_navcategorytree|count}]
        <ul class="row m-t-2">
            [{foreach from=$_navcategorytree item=category name=MoreSubCat}]
                [{* TOP categories *}]
                [{if $category->getIsVisible()}]
                    [{* CMS top categories *}]
                    [{if $category->getContentCats() }]
                        [{foreach from=$category->getContentCats() item=ocont name=MoreCms}]
                            <li class="col-lg-3 col-sm-6 col-xs-12 m-b-2">
                                <h3 class="h3">
                                    <a id="moreSubCms_[{$smarty.foreach.MoreSubCat.iteration}]_[{$smarty.foreach.MoreCms.iteration}]" href="[{$ocont->getLink()}]">[{$ocont->oxcontents__oxtitle->value}]</a>
                                </h3>
                            </li>
                        [{/foreach}]
                    [{/if}]
                    [{*assign var="iconUrl" value=$category->getIconUrl()*}]
                    <li class="col-lg-3 col-sm-6 col-xs-12 m-b-2">
                        <h3 class="h3">
                            <a id="moreSubCat_[{$smarty.foreach.MoreSubCat.iteration}]" href="[{$category->getLink()}]">
                                [{$category->oxcategories__oxtitle->value}][{if $oView->showCategoryArticlesCount() && ($category->getNrOfArticles() > 0)}] ([{$category->getNrOfArticles()}])[{/if}]
                            </a>
                        </h3>
                        [{* Top categories subcategories *}]
                        [{if $category->getHasVisibleSubCats()}]
                            <ul>
                                [{*if $iconUrl}]
                                    <li class="subcatPic">
                                        <a href="[{$category->getLink()}]">
                                            <img src="[{$category->getIconUrl()}]" alt="[{$category->oxcategories__oxtitle->value}]" height="100" width="168">
                                        </a>
                                    </li>
                                [{/if*}]
                                [{foreach from=$category->getSubCats() item=subcategory}]
                                    [{if $subcategory->getIsVisible()}]
                                        [{* CMS subcategories  *}]
                                        [{foreach from=$subcategory->getContentCats() item=ocont name=MoreCms}]
                                            <li>
                                                <a href="[{$ocont->getLink()}]">[{$ocont->oxcontents__oxtitle->value}]</a>
                                            </li>
                                        [{/foreach}]
                                        <li>
                                            <a href="[{$subcategory->getLink()}]">
                                                [{$subcategory->oxcategories__oxtitle->value}][{if $oView->showCategoryArticlesCount() && ($subcategory->getNrOfArticles() > 0)}] ([{$subcategory->getNrOfArticles()}])[{/if}]
                                            </a>
                                        </li>
                                    [{/if}]
                                [{/foreach}]
                            </ul>
                        [{*elseif $iconUrl}]
                            <div class="content catPicOnly">
                                <div class="subcatPic">
                                    [{if $iconUrl}]
                                    <a href="[{ $category->getLink() }]">
                                        <img src="[{$category->getIconUrl() }]" alt="[{ $category->oxcategories__oxtitle->value }]" height="100" width="168">
                                    </a>
                                    [{/if}]
                                </div>
                            </div>*}]
                        [{/if}]
                    </li>
                [{/if}]
            [{/foreach}]
        </ul>
    [{/if}]
[{/capture}]
[{include file="layout/page.tpl"}]
