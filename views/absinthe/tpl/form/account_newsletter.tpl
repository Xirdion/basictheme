<form action="[{$oViewConf->getSelfActionLink()}]" name="newsletter" method="post">
    <div>
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="fnc" value="subscribe">
        <input type="hidden" name="cl" value="account_newsletter">
    </div>
    <fieldset class="form-group">
        <div class="row">
            <div class="col-xs-12">
                <label for="abs-newsletter-status">[{oxmultilang ident="NEWSLETTER_SUBSCRIPTION" suffix="COLON"}]</label>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-4 col-sm-3 col-lg-2">
                <select name="status" class="form-control" id="abs-newsletter-status">
                    <option value="1" [{if $oView->isNewsletter()}]selected[{/if}] >[{oxmultilang ident="YES"}]</option>
                    <option value="0" [{if !$oView->isNewsletter()}]selected[{/if}] >[{oxmultilang ident="NO"}]</option>
                </select>
            </div>
            <div class="col-xs-8 col-sm-9 col-lg-10">
                <button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o"></i> [{oxmultilang ident="SAVE"}]</button>
            </div>
        </div>
    </fieldset>

    [{if $oView->isNewsletter() == 2}]
        <div class="info">
            [{oxmultilang ident="MESSAGE_SENT_CONFIRMATION_EMAIL"}]
        </div>
    [{/if}]
    <span class="notice">[{oxmultilang ident="MESSAGE_NEWSLETTER_SUBSCRIPTION"}]</span>
</form>