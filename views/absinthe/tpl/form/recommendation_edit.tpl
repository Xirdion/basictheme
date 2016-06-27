<form action="[{$oViewConf->getSelfActionLink()}]" name="saverecommlist" method="post">
    <div>
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="fnc" value="saveRecommList">
        <input type="hidden" name="cl" value="account_recommlist">
        [{if $actvrecommlist}]
            <input type="hidden" name="recommid" value="[{$actvrecommlist->getId()}]">
        [{/if}]
        [{if $actvrecommlist && $oView->isSavedList()}]
            [{oxmultilang ident="LISTMANIA_LIST_SAVED"}]
        [{/if}]
    </div>
    <div class="row">
        <div class="col-lg-6 col-sm-8 col-xs-12">
            <fieldset class="form-group">
                <label for="abs-recedit-title">[{oxmultilang ident="TITLE" suffix="COLON"}]</label>
                <input required type="text" class="form-control" id="abs-recedit-title" name="recomm_title" value="[{$actvrecommlist->oxrecommlists__oxtitle->value}]" />
            </fieldset>
            <fieldset class="form-group">
                <label for="abs-recedit-author">[{oxmultilang ident="AUTHOR" suffix="COLON"}]</label>
                <input required type="text" class="form-control" id="abs-recedit-author" name="recomm_author" value="[{if $actvrecommlist->oxrecommlists__oxauthor->value}][{$actvrecommlist->oxrecommlists__oxauthor->value}][{elseif !$actvrecommlist}][{$oxcmp_user->oxuser__oxfname->value}] [{$oxcmp_user->oxuser__oxlname->value}][{/if}]" />
            </fieldset>
            <fieldset class="form-group">
                <label for="abs-recedit-desc">[{oxmultilang ident="INTRODUCTION" suffix="COLON"}]</label>
                <textarea class="form-control" id="abs-recedit-desc" name="recomm_desc" rows="8">[{$actvrecommlist->oxrecommlists__oxdesc->value}]</textarea>
            </fieldset>
            <button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o"></i> [{oxmultilang ident="SAVE"}]</button>
        </div>
    </div>
</form>
