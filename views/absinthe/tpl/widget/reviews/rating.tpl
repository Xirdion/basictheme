[{assign var="iRatingAverage" value=$oView->getRatingValue()}]
[{if $iRatingAverage}]
    <span class="abs-rating abs-rated">
        [{section name=star start=1 loop=6}]
        [{assign var="starnumber" value=$smarty.section.star.index}]

        <label class = "full [{if $iRatingAverage >= $starnumber}]active[{/if}]" for="star[{$starnumber}]" title="[{$starnumber}] [{if $starnumber==1}][{oxmultilang ident="STAR"}][{else}][{oxmultilang ident="STARS"}][{/if}]"></label>
        [{/section}]
    </span>
[{/if}]
