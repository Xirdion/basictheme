[{*oxscript include="js/widgets/oxreview.js" priority=10 }]
[{oxscript add="$( '#writeNewReview' ).oxReview();"*}]
[{if $oxcmp_user}]
    [{if !$oView->floodProtection()}]
        <a id="absjs-guestbook-link" class="abs-guestbook-link" rel="nofollow"><b>[{oxmultilang ident="CLICK_HERE_TO_WRITE_ENTRY"}]</b></a>
        <form action="[{$oViewConf->getSelfActionLink()}]" method="post">
            <div>
                [{$oViewConf->getHiddenSid()}]
                [{$oViewConf->getNavFormParams()}]
                [{oxid_include_dynamic file="form/formparams.tpl"}]
                <input type="hidden" name="fnc" value="saveEntry">
                <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
            </div>
            <div id="absjs-guestbook-message" class="row abs-guestbook-message">
                <div class="col-lg-6 col-sm-8 col-xs-12">
                    <fieldset class="form-group">
                        <label for="abs-guestbook-msg">[{oxmultilang ident="MESSAGE" suffix="COLON"}]</label>
                        <textarea required rows="8" class="form-control" id="abs-guestbook-msg" name="rvw_txt"></textarea>
                    </fieldset>
                    <button type="submit" class="btn btn-primary">[{oxmultilang ident="SUBMIT"}]</button>
                </div>
            </div>
        </form>
    [{/if}]
[{else}]
    <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" params="sourcecl="|cat:$oViewConf->getActiveClassName()|cat:$oViewConf->getNavUrlParams()}]" rel="nofollow"><b>[{oxmultilang ident="MESSAGE_TO_BE_LOGGED_WRITE_GUESTBOOK"}]</b></a>
[{/if}]
