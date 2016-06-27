<div id="abs-manufacturer-slider">
    <h4 class="h4">[{oxmultilang ident="OUR_BRANDS"}]</h4>
    <div class="row m-t-2 m-b-2">
        <div class="col-xs-10 col-xs-offset-1 col-md-12 col-md-offset-0">
            <div id="absjs-slick-manufacturer">
                [{foreach from=$oView->getManufacturerForSlider() item=oManufacturer}]
                [{if $oManufacturer->oxmanufacturers__oxicon->value }]
                [{counter assign="slideCount"}]
                <div>
                    <a title="[{$oManufacturer->oxmanufacturers__oxtitle->value}]" href="[{$oManufacturer->getLink()}]">
                        <img class="center-block" data-lazy="[{$oManufacturer->getIconUrl()}]">
                    </a>
                </div>
                [{/if}]
                [{/foreach}]
            </div>  
        </div>
    </div>
</div>