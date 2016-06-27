<ul class="m-b-0">
    <li>
        <span>[{oxmultilang ident="FILESIZE" suffix="COLON"}]</span>
        <span class="abs-download-attr">[{$oOrderFile->getFileSize()|oxfilesize}]</span>
    </li>
    [{if $oOrderFile->oxorderfiles__oxdownloadcount->value == 0 && $oOrderFile->getValidUntil() != "0000-00-00 00:00"}]
        [{if $oOrderFile->oxorderfiles__oxlinkexpirationtime->value || $oOrderFile->oxorderfiles__oxdownloadxpirationtime->value}]
            <li>
                <span>[{oxmultilang ident="START_DOWNLOADING_UNTIL"}]</span>
                <span class="abs-download-attr">[{$oOrderFile->getValidUntil()|date_format:"%d.%m.%Y %H:%M"}]</span>
            </li>
        [{/if}]
        [{if $oOrderFile->oxorderfiles__oxmaxdownloadcount->value != 0}]
            <li>
                <span>[{oxmultilang ident="LEFT_DOWNLOADS" suffix="COLON"}]</span>
                <span class="abs-download-attr">[{$oOrderFile->getLeftDownloadCount()}]</span>
            </li>
        [{/if}]
    [{else}]
        [{if $oOrderFile->getValidUntil() != "0000-00-00 00:00"}]
            [{if $oOrderFile->oxorderfiles__oxlinkexpirationtime->value || $oOrderFile->oxorderfiles__oxdownloadxpirationtime->value}]
                <li>
                    <span>[{oxmultilang ident="LINK_VALID_UNTIL" suffix="COLON"}]</span>
                    <span class="abs-download-attr">[{$oOrderFile->getValidUntil()|date_format:"%d.%m.%Y %H:%M"}] [{oxmultilang ident="CLOCK"}]</span>
                </li>
            [{/if}]
        [{/if}]
        [{if $oOrderFile->oxorderfiles__oxmaxdownloadcount->value != 0}]
            <li>
                <span>[{oxmultilang ident="LEFT_DOWNLOADS" suffix="COLON"}]</span>
                <span class="abs-download-attr">[{$oOrderFile->getLeftDownloadCount()}]</span>
            </li>
        [{/if}]
    [{/if}]
</ul>