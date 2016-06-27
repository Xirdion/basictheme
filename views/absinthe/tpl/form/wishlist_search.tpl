<div class="row m-b-1">
    <div class="col-lg-6 col-sm-8 col-xs-12">
        <form name="wishlist_searchbox" action="[{$oViewConf->getSelfActionLink()}]" method="post">
            <div>
                [{$oViewConf->getHiddenSid()}]
                <input type="hidden" name="cl" value="[{$searchClass}]">
                <input type="hidden" name="fnc" value="searchforwishlist">
            </div>
            <label for="abs-wishlist-search">[{oxmultilang ident="SEARCH_GIFT_REGISTRY"}]</label>
            <div class="input-group">
                <input id="abs-wishlist-search" type="text" class="form-control" placeholder="[{oxmultilang ident="ENTER_EMAIL_OR_NAME"}]" name="search" value="[{$oView->getWishListSearchParam()}]"/>
                <span class="input-group-btn">
                    <button class="btn btn-secondary" type="submit" value=""><i class="fa fa-search"></i></button>
                </span>
            </div>
        </form>
    </div>
</div>
<div class="row m-b-1">
    [{if $oView->getWishListUsers()}]
        <div class="col-xs-12">
            <div>[{oxmultilang ident="GIFT_REGISTRY_SEARCH_RESULTS" suffix="COLON"}]</div>
            [{foreach from=$oView->getWishListUsers() item=wishres}]
                <div>
                    <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=wishlist" params="wishid=`$wishres->oxuser__oxid->value`"}]">
                        [{oxmultilang ident="GIFT_REGISTRY_OF"}] [{$wishres->oxuser__oxfname->value}]&nbsp;[{$wishres->oxuser__oxlname->value}]
                    </a>
                </div>
            [{/foreach }]
        </div>    
    [{/if }]
</div>