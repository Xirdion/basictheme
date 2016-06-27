[{capture append="oxidBlock_content"}]
    <h1 class="h1">[{$oView->getTitle()}]</h1>
    <div class="m-t-2">
        [{foreach from=$oView->getLinksList() item=link name=linksList}]
            <div class="row m-b-2">
                <div class="col-md-2 col-xs-12">
                    [{$link->oxlinks__oxinsert->value|date_format:"%d.%m.%Y"}]
                </div>
                <div class="col-md-10 col-xs-12">
                    <p><a href="[{$link->oxlinks__oxurl->value}]" >[{$link->oxlinks__oxurl->value}]</a></p>
                    <p>[{$link->oxlinks__oxurldesc->value}]</p>
                </div>
            </div>
        [{/foreach}]
    </div>
[{/capture}]

[{include file="layout/page.tpl" sidebar="Left"}]