[{capture append="oxidBlock_content"}]
    [{assign var="oContent" value=$oView->getContent()}]
    [{assign var="tpl" value=$oViewConf->getActTplName()}]
    [{assign var="oxloadid" value=$oViewConf->getActContentLoadId()}]
    <h1 class="h1">[{$oView->getTitle()}]</h1>
    [{$oView->getParsedContent()}]
[{/capture}]
[{*include file="layout/popup.tpl"*}]
[{include file="layout/page.tpl"}]