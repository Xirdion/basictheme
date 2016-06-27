[{if $oView->getWishList()}]
    <form name="wishlist_wishlist_status" action="[{$oViewConf->getSelfActionLink()}]" method="post">
        <div>
            [{$oViewConf->getHiddenSid()}]
            <input type="hidden" name="fnc" value="togglepublic">
            <input type="hidden" name="cl" value="account_wishlist">
        </div>
        <fieldset class="form-group">
            <div class="row">
                <div class="col-sm-12">
                    <label for="abs-wishlist-status">[{oxmultilang ident="MESSAGE_MAKE_GIFT_REGISTRY_PUBLISH" suffix="COLON"}]</label>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <select name="blpublic" class="form-control" id="abs-wishlist-status">
                        <option value="0">[{oxmultilang ident="NO"}]</option>
                        [{assign var="wishlist" value=$oView->getWishList()}]
                        <option value="1" [{if $wishlist->oxuserbaskets__oxpublic->value}]selected[{/if}] >[{oxmultilang ident="YES"}]</option>
                    </select>
                </div>
                <div class="col-sm-1">
                    <button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o"></i> [{oxmultilang ident="SAVE"}]</button>
                </div>
            </div>
        </fieldset>
        <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_wishlist" params="blshowsuggest=1"}]">
            [{oxmultilang ident="MESSAGE_SEND_GIFT_REGISTRY"}]
        </a>
    </form>
[{/if}]