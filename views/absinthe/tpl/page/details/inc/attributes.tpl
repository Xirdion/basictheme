[{foreach from=$oView->getAttributes() item=oAttr name=attribute}]
    <div class="row m-t-1">
        <div class="col-lg-3 col-md-4 col-sm-5 col-xs-6">[{$oAttr->title}]</div>
        <div class="col-lg-9 col-md-8 col-sm-7 col-xs-6">[{$oAttr->value}]</div>
    </div>
[{/foreach}]