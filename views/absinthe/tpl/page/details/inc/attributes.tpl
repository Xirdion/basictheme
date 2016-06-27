<div class="row">
[{foreach from=$oView->getAttributes() item=oAttr name=attribute}]
<div class="col-xs-6 col-lg-6">[{$oAttr->title}]</div>
<div class="col-xs-6 col-lg-6">[{$oAttr->value}]</div>
[{/foreach}]
</div>