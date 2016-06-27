[{if !$oxcmp_user->oxuser__oxusername->value}]
    [{include file="page/account/login.tpl"}]
[{else}]
    [{assign var="product" value=$oView->getProduct()}]
    [{if $oxcmp_user->getRecommListsCount()}]
        <form action="[{$oViewConf->getSelfActionLink()}]" method="post">
            <div>
                [{$oViewConf->getHiddenSid()}]
                [{$oViewConf->getNavFormParams()}]
                <input type="hidden" name="fnc" value="addToRecomm">
                <input type="hidden" name="cl" value="details">
                <input type="hidden" name="anid" value="[{$product->oxarticles__oxid->value}]">
            </div>
            <div class="row">
                <div class="col-lg-6 col-sm-8 col-xs-12">
                    <fieldset class="form-group">
                        <label for="abs-recadd-list">[{oxmultilang ident="SELECT_LISTMANIA_LIST" suffix="COLON"}]</label>
                        <select class="form-control" id="abs-recadd-list" name="recomm">
                            [{foreach from=$oView->getRecommLists() item=oList}]
                                <option value="[{$oList->oxrecommlists__oxid->value}]">[{$oList->oxrecommlists__oxtitle->value}]</option>
                            [{/foreach}]
                        </select>
                    </fieldset>
                    <fieldset class="form-group">
                        <label for="abs-recadd-desc">[{oxmultilang ident="DESCRIPTION" suffix="COLON"}]</label>
                        <textarea type="text" class="form-control" id="abs-recadd-desc" name="recomm_txt" rows="8"></textarea>
                    </fieldset>
                    <button type="submit" class="btn btn-primary">[{oxmultilang ident="ADD_TO_LISTMANIA_LIST"}]</button>
                </div>
            </div>
      </form>
    [{else}]
        [{oxmultilang ident="NO_LISTMANIA_LIST"}] <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_recommlist"}]">[{oxmultilang ident="CLICK_HERE"}]</a>
    [{/if}]
[{/if}]
