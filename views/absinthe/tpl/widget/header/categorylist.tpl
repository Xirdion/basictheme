[{assign var="homeSelected" value="false"}]
[{if $oViewConf->getTopActionClassName() == 'start'}]
    [{assign var="homeSelected" value="true"}]
[{/if}]

[{assign var="oxcmp_categories" value=$oxcmp_categories}]
[{assign var="blShowMore" value=false}]
[{assign var="iCatCnt" value=0}]

[{if $oView->isMobile()}]
    [{*<li class="nav-item[{if $homeSelected == 'true'}] active[{/if}]">
        <a class="nav-link" href="[{$oViewConf->getHomeLink()}]">
            <i class="fa fa-home"></i>
        </a>
    </li>*}]
    [{foreach from=$oxcmp_categories item=ocat key=catkey name=root}]
        [{if $ocat->getIsVisible()}]
        [{* only content-categories (cms-pages) *}]
            [{foreach from=$ocat->getContentCats() item=oTopCont name=MoreTopCms}]
                <li>
                    <a class="p-x-1" href="[{$oTopCont->getLink()}]" title="[{$oTopCont->oxcontents__oxtitle->value}]">[{$oTopCont->oxcontents__oxtitle->value}]</a>
                </li>
            [{/foreach}]

            [{* product-categories *}]
            [{if $ocat->getSubCats()}]
                <li class="[{if $homeSelected == 'false' && $ocat->expanded}]active[{/if}]">
                    [{*<a href="[{$ocat->getLink()}]" role="button">*}]
                    <a class="p-x-1" href="#" role="button" title="[{$ocat->oxcategories__oxtitle->value}]">
                        [{$ocat->oxcategories__oxtitle->value}][{if $oView->showCategoryArticlesCount() && ($ocat->getNrOfArticles() > 0) }] ([{$ocat->getNrOfArticles()}])[{/if}]
                    </a>
                    <ul>
                       [{foreach from=$ocat->getSubCats() item=osubcat key=subcatkey name=SubCat}]
                           [{if $osubcat->getIsVisible()}]
                               [{foreach from=$osubcat->getContentCats() item=ocont name=MoreCms}]
                                   <li><a class="p-x-1" href="[{$ocont->getLink()}]" title="[{$ocont->oxcontents__oxtitle->value}]">[{$ocont->oxcontents__oxtitle->value}]</a></li>
                               [{/foreach}]
                               [{if $osubcat->getIsVisible()}]
                                   <li>
                                       <a class="p-x-1" href="[{$osubcat->getLink()}]" title="[{$osubcat->oxcategories__oxtitle->value}]">
                                           [{$osubcat->oxcategories__oxtitle->value}] [{if $oView->showCategoryArticlesCount() && ($osubcat->getNrOfArticles() > 0)}] ([{$osubcat->getNrOfArticles()}])[{/if}]
                                       </a>
                                   </li>
                               [{/if}]
                           [{/if}]
                       [{/foreach}]
                   </ul>
                </li>
            [{else}]
                <li>
                    <a class="p-x-1" href="[{$ocat->getLink()}]" title="[{$ocat->oxcategories__oxtitle->value}]">[{$ocat->oxcategories__oxtitle->value}][{if $oView->showCategoryArticlesCount() && ($ocat->getNrOfArticles() > 0)}] ([{$ocat->getNrOfArticles()}])[{/if}]</a>
                </li>
            [{/if}] 
        [{/if}]
    [{/foreach}]
[{else}]
    <ul class="nav navbar-nav">
        [{*<li class="nav-item[{if $homeSelected == 'true'}] active[{/if}]">
            <a class="nav-link" href="[{$oViewConf->getHomeLink()}]">
                <i class="fa fa-home"></i>
            </a>
        </li>*}]
        [{foreach from=$oxcmp_categories item=ocat key=catkey name=root}]
            [{if $ocat->getIsVisible()}]
                [{foreach from=$ocat->getContentCats() item=oTopCont name=MoreTopCms}]
                    [{assign var="iCatCnt" value=$iCatCnt+1}]
                    [{if $iCatCnt <= $oView->getTopNavigationCatCnt()}]
                        <li class="nav-item">
                            <a class="nav-link" href="[{$oTopCont->getLink()}]">[{$oTopCont->oxcontents__oxtitle->value}]</a>
                        </li>
                    [{else}]
                        [{assign var="blShowMore" value=true}]
                        [{capture append="moreLinks"}]
                            <li class="nav-item">
                                <a class="nav-link" href="[{$oTopCont->getLink()}]">[{$oTopCont->oxcontents__oxtitle->value}]</a>
                            </li>
                        [{/capture}]
                    [{/if}]
                [{/foreach}]

                [{assign var="iCatCnt" value=$iCatCnt+1}]
                [{if $iCatCnt <= $oView->getTopNavigationCatCnt()}]
                    [{if $ocat->getSubCats()}]
                        <li class="nav-item [{if $homeSelected == 'false' && $ocat->expanded}]active[{/if}]">
                            <a class="nav-link dropdown-toggle"  href="[{$ocat->getLink()}]" role="button">[{$ocat->oxcategories__oxtitle->value}][{if $oView->showCategoryArticlesCount() && ($ocat->getNrOfArticles() > 0) }] ([{$ocat->getNrOfArticles()}])[{/if}]<span class="caret"></span></a>
                            <div class="dropdown-menu row">
                                <ul class="col-sm-6">
                                    [{foreach from=$ocat->getSubCats() item=osubcat key=subcatkey name=SubCat}]
                                        [{if $osubcat->getIsVisible()}]
                                            [{foreach from=$osubcat->getContentCats() item=ocont name=MoreCms}]
                                                <li><a href="[{$ocont->getLink()}]">[{$ocont->oxcontents__oxtitle->value}]</a></li>
                                            [{/foreach}]
                                            [{if $osubcat->getIsVisible()}]
                                                <li [{if $homeSelected == 'false' && $osubcat->expanded}]class="active"[{/if}]><a [{if $homeSelected == 'false' && $osubcat->expanded}]class="current"[{/if}] href="[{$osubcat->getLink()}]">[{$osubcat->oxcategories__oxtitle->value}] [{if $oView->showCategoryArticlesCount() && ($osubcat->getNrOfArticles() > 0)}] ([{$osubcat->getNrOfArticles()}])[{/if}]</a></li>
                                            [{/if}]
                                        [{/if}]
                                    [{/foreach}]
                                </ul>
                            </div>
                        </li>
                    [{else}]
                        <li class="nav-item [{if $homeSelected == 'false' && $ocat->expanded}]active[{/if}]">
                            <a class="nav-link" href="[{$ocat->getLink()}]">[{$ocat->oxcategories__oxtitle->value}][{if $oView->showCategoryArticlesCount() && ($ocat->getNrOfArticles() > 0)}] ([{$ocat->getNrOfArticles()}])[{/if}]</a>
                        </li>
                    [{/if}]
                [{else}]
                    [{capture append="moreLinks"}]
                        [{assign var="blShowMore" value=true}]
                        <li class="nav-item [{if $homeSelected == 'false' && $ocat->expanded}]active[{/if}]">
                            <a class="nav-link" href="[{$ocat->getLink()}]">[{$ocat->oxcategories__oxtitle->value}][{if $oView->showCategoryArticlesCount() && ($ocat->getNrOfArticles() > 0)}] ([{$ocat->getNrOfArticles()}])[{/if}]</a>
                        </li>
                    [{/capture}]
                [{/if}] 
            [{/if}]
        [{/foreach}]
        [{if $blShowMore}]
            <li class="nav-item">
                [{assign var="_catMoreUrl" value=$oView->getCatMoreUrl()}]
                <a class="nav-link" href="[{oxgetseourl ident="`$_catMoreUrl`&amp;cl=alist" }]">[{oxmultilang ident="MORE"}]</a>
                <ul class="dropdown-menu">
                    [{foreach from=$moreLinks item=link}]
                        [{$link}]
                    [{/foreach}]
                </ul>
            </li>
        [{/if}]
    </ul>
[{/if}]