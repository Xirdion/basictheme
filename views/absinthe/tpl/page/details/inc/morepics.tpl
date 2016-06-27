[{if $oView->morePics()}]

<div class="row">
    <div id="absjs-slick-more-pics" class="hidden-xs-down col-sm-10 col-sm-offset-1">
        [{foreach from=$oView->getIcons() key=iPicNr item=oArtIcon}]
        <div>
            <img class="img-fluid abs-click-pic" src="[{$oPictureProduct->getIconUrl($iPicNr)}]">
        </div>
        [{/foreach}]
    </div>
</div>
[{/if}]