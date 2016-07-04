[{if $oView->isEnabled()}]
    [{oxscript include="js/libs/cookie/jquery.cookie.js"}]
    <div id="abs-cookienote">
        <div class="abs-cookie-notify p-x-3 p-y-1">
            [{oxmultilang ident='COOKIE_NOTE'}]
            <span class="cancelCookie">
                <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=clearcookies"}]" title="[{oxmultilang ident='COOKIE_NOTE_DISAGREE'}]">
                    [{oxmultilang ident='COOKIE_NOTE_DISAGREE'}]
                </a>
            </span>
            <span class="dismiss">
                <a href="#" title="[{oxmultilang ident='CLOSE'}]">X</a>
            </span>
        </div>
    </div>
    [{oxscript add="$('#abs-cookienote').oxCookieNote();"}]
[{/if}]
[{oxscript widget=$oView->getClassName()}]