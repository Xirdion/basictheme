[{* Important ! render page head and body to collect scripts and styles *}]
[{capture append="oxidBlock_pageHead"}]
    <meta http-equiv="Content-Type" content="text/html; charset=[{$oView->getCharSet()}]">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>[{block name="head_title"}][{$oView->getPageTitle()}][{/block}]</title>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">

    [{block name="head_meta_robots"}]
        [{if $oView->noIndex() == 1}]
            <meta name="ROBOTS" content="NOINDEX, NOFOLLOW">
        [{elseif $oView->noIndex() == 2}]
            <meta name="ROBOTS" content="NOINDEX, FOLLOW">
        [{/if}]
    [{/block}]

    [{block name="head_meta_description"}]
        [{if $oView->getMetaDescription()}]
            <meta name="description" content="[{$oView->getMetaDescription()}]">
        [{/if}]
    [{/block}]

    [{block name="head_meta_keywords"}]
        [{if $oView->getMetaKeywords()}]
            <meta name="keywords" content="[{$oView->getMetaKeywords()}]">
        [{/if}]
    [{/block}]

    [{block name="head_meta_open_graph"}]
        [{if $oViewConf->getFbAppId()}]
            <meta property="og:site_name" content="[{$oViewConf->getBaseDir()}]">
            <meta property="fb:app_id" content="[{$oViewConf->getFbAppId()}]">
            <meta property="og:title" content="[{$_sMetaTitlePrefix}][{if $_sMetaTitlePrefix && $_sMetaTitle}] | [{/if}][{$_sMetaTitle|strip_tags}][{if $_sMetaTitleSuffix && ($_sMetaTitlePrefix || $_sMetaTitle)}] | [{/if}][{$_sMetaTitleSuffix}] [{if $_sMetaTitlePageSuffix}] | [{$_sMetaTitlePageSuffix}] [{/if}]">
            [{if $oViewConf->getActiveClassName() == 'details'}]
                <meta property="og:type" content="product">
                <meta property="og:image" content="[{$oView->getActPicture()}]">
                <meta property="og:url" content="[{$oView->getCanonicalUrl()}]">
            [{else}]
                <meta property="og:type" content="website">
                <meta property="og:image" content="[{$oViewConf->getImageUrl('basket.png')}]">
                <meta property="og:url" content="[{$oViewConf->getCurrentHomeDir()}]">
            [{/if}]
        [{/if}]
    [{/block}]

    [{assign var="canonical_url" value=$oView->getCanonicalUrl()}]
    [{block name="head_link_canonical"}]
        [{if $canonical_url}]
            <link rel="canonical" href="[{$canonical_url}]">
        [{/if}]
    [{/block}]

    [{block name="head_link_favicon"}]
        <link rel="shortcut icon" href="[{$oViewConf->getImageUrl('favicon.ico')}]">
    [{/block}]

    [{block name="base_style"}]
        [{oxstyle include="css/absinth.css"}]
    [{/block}]

    [{*[{assign var='rsslinks' value=$oView->getRssLinks()}]
    [{block name="head_link_rss"}]
        [{if $rsslinks}]
            [{foreach from=$rsslinks item='rssentry'}]
                <link rel="alternate" type="application/rss+xml" title="[{$rssentry.title|strip_tags}]" href="[{$rssentry.link}]">
            [{/foreach}]
        [{/if}]
    [{/block}]*}]

    [{block name="head_css"}]
        [{foreach from=$oxidBlock_head item="_block"}]
            [{$_block}]
        [{/foreach}]
    [{/block}]
[{/capture}]
<!DOCTYPE HTML>
[{assign var="sLanguage" value=$oView->getActiveLangAbbr()}]
<html [{if $sLanguage}]lang="[{$sLanguage}]"[{/if}] [{if $oViewConf->getShowFbConnect()}]xmlns:fb="http://www.facebook.com/2008/fbml"[{/if}]>
    <head>
        [{foreach from=$oxidBlock_pageHead item="_block"}]
            [{$_block}]
        [{/foreach}]
        [{oxstyle}]
    </head>
    <body>
        [{foreach from=$oxidBlock_pageBody item="_block"}]
            [{$_block}]
        [{/foreach}]
        [{foreach from=$oxidBlock_pagePopup item="_block"}]
            [{$_block}]
        [{/foreach}]

        [{block name="base_js"}]
        
            [{* TODO: write gulp or npm automization task to minify sources *}]
            [{* TODO: check if it is possible to switch from bower to npm then *}]
        
            [{oxscript include="bower_components/jquery/dist/jquery.min.js" priority=1}]
            [{oxscript include="bower_components/jquery-ui/jquery-ui.min.js" priority=1}]
            
            [{* TODO: require this (oxid core dependency) via package manager *}]
            [{oxscript include="js/libs/cookie/jquery.cookie.js" priority=1}]
            
            [{oxscript include="bower_components/moment/min/moment.min.js" priority=1}]
            
            [{oxscript include="bower_components/bootstrap/dist/js/bootstrap.min.js" priority=1}]
            
            [{oxscript include="bower_components/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js" priority=1}]
            
            [{oxscript include="bower_components/slick-carousel/slick/slick.min.js" priority=1}]
            [{oxscript include="bower_components/slick-carousel/slick/slick.min.js" priority=1}]
            
            [{oxscript include="bower_components/photoswipe/dist/photoswipe.min.js" priority=1}]
            [{oxscript include="bower_components/photoswipe/dist/photoswipe-ui-default.min.js" priority=1}]
			
            [{oxscript include="js/absinth.js" priority=1}]
            
        [{/block}]

        [{* not supported *}]
        [{*if $oViewConf->isTplBlocksDebugMode()}]
            [{oxscript include="js/widgets/oxblockdebug.js"}]
            [{oxscript add="$( 'hr.debugBlocksStart' ).oxBlockDebug();"}]
        [{/if*}]

        [{oxscript}]
        [{oxid_include_dynamic file="widget/dynscript.tpl"}]

        [{foreach from=$oxidBlock_pageScript item="_block"}]
            [{$_block}]
        [{/foreach}]
    </body>
</html>