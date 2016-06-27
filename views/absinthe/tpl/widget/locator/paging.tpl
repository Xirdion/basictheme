[{block name="widget_locator_paging"}]
[{if $pages->changePage}]
<nav class="text-xs-left">
    <ul class="pagination">
        [{if $pages->previousPage }]
        <li class="page-item">
            <a class="page-link[{if $iPage == $pages->actPage }] active[{/if}]" href="[{$pages->previousPage}]" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
                <span class="sr-only">[{oxmultilang ident="PREVIOUS"}]</span>
            </a>
        </li>
        [{/if}]
        [{assign var="i" value=1}]
        [{foreach key=iPage from=$pages->changePage item=page}]
        [{if $iPage == $i }]
        <li class="page-item [{if $iPage == $pages->actPage }] active[{/if}]"><a class="page-link" href="[{$page->url}]">[{$iPage}]</a></li>
        [{assign var="i" value=$i+1}]
        [{elseif $iPage > $i }]
        <li>...</li>
        <li class="page-item [{if $iPage == $pages->actPage }] active[{/if}]"><a class="page-link" href="[{$page->url}]">[{$iPage}]</a></li>
        [{assign var="i" value=$iPage+1}]
        [{elseif $iPage < $i }]
        <li class="page-item [{if $iPage == $pages->actPage }] active[{/if}]"><a class="page-link" href="[{$page->url}]">[{$iPage}]</a></li>
        <li>...</li>
        [{assign var="i" value=$iPage+1}]
        [{/if}]
        [{/foreach}]
        [{if $pages->nextPage }]
        <li class="page-item">
            <a class="page-link" href="[{$pages->nextPage}]" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
                <span class="sr-only">[{oxmultilang ident="NEXT"}]</span>
            </a>
        </li>
        [{/if}]
    </ul>
</nav>
[{/if}]
[{/block}]