<?php

/*


   {}
   ||
   )(   ___   _____ _       _     _   _       
  |__|  \ /  |  _  | |_ ___|_|___| |_| |_ ___ 
  |  |   Y   |     | . |_ -| |   |  _|   | -_|
  |__|  _|_  |__|__|___|___|_|_|_|_| |_|_|___|


*/

$aTheme = array(
    'id'          =>  'Absinthe',
    'title'       =>  '<span style="color: #3CB371">Absinthe</span>',
    'description' =>  'Absinthe theme by <a style="color: #3CB371; text-decoration: underline" target="_blank" href="https://twitter.com/Patchee500">Patchee500</a>.<br/><br/>'
                    . "\"Always do sober what you said you'd do drunk.<br/>"
                    . "That will teach you to keep your mouth shut.\"<br/><br/>"
                    . "- Ernest Hemingway<br/><br/>",
    'thumbnail'   =>  'theme.gif',
    'version'     =>  '1.0.0',
    'author'      =>  '<a style="color: #3CB371; text-decoration: underline" target="_blank" href="http://www.twitter.com">Patchee500</a>',
    
    // Absinthe actually is a full copy of the Azure Theme v1.4.0
    // It could be used as a standalone theme but it you might want to inherit from Azure to get those juicy config variables
    // (which might get totally ignored by Absinthe)
    
    'parentTheme'    =>  'azure',
    'parentVersions' =>  array('1.4.0')
);

/*
 * TODO: correct bug in checkout that lets you only progress, when you chose some other payment type first
 * TODO: correct bug in guest login that lets you only progress, when you uncheck use same address for delivery
 * TODO: write extra module to use own config values with this theme
 * TODO: write grunt/npm tasks
 */