<div class="wishlistSuggest">
    [{if $oView->getWishList() && $oView->showSuggest()}]
        [{if count($Errors.account_whishlist)>0}]
            <div class="alert alert-danger" role="alert">
                [{foreach from=$Errors.account_whishlist item=oEr key=key}]
                    [{$oEr->getOxMessage()}]<br>
                [{/foreach}]
            </div>
        [{/if}]
        [{assign var="editval" value=$oView->getEnteredData()}]
        <form action="[{$oViewConf->getSelfActionLink()}]" method="post">
            <div>
                [{$oViewConf->getHiddenSid()}]
                <input type="hidden" name="fnc" value="sendwishlist">
                <input type="hidden" name="cl" value="account_wishlist">
                <input type="hidden" name="blshowsuggest" value="1">
                <input type="hidden" name="editval[send_subject]" value="[{oxmultilang ident="GIFT_REGISTRY_OF_2"}] [{$oxcmp_shop->oxshops__oxname->value}]">
                <input type="hidden" name="CustomError" value='account_whishlist'>
            </div>
            <fieldset class="form-group">
                <label for="abs-wishlist-send-name">[{oxmultilang ident="RECIPIENT_NAME" suffix="COLON"}]</label>
                <input type="text" class="form-control" name="editval[rec_name]" id="abs-wishlist-send-name">
            </fieldset>
            <fieldset class="form-group">
                <label for="abs-wishlist-send-mail">[{oxmultilang ident="RECIPIENT_EMAIL" suffix="COLON"}]</label>
                <input type="email" class="form-control" name="editval[rec_email]" id="abs-wishlist-send-mail">
            </fieldset>
            <fieldset class="form-group">
                <label for="abs-wishlist-message">[{oxmultilang ident="MESSAGE"}]</label>
                <textarea class="form-control" id="exampleTextarea" name="editval[send_message]" rows="3">[{if $editval->send_message}][{$editval->send_message}][{else }][{oxmultilang ident="SHOP_SUGGEST_BUY_FOR_ME" args=$oxcmp_shop->oxshops__oxname->value}][{/if}]</textarea>
            </fieldset>
            <button type="submit" class="btn btn-primary">[{oxmultilang ident="SUBMIT"}]</button>
        </form>
    [{/if}]
</div>