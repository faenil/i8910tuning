var confirmcomp
var confirmitem

function showErrorBox(msg) {
    page.loadingRect.opacity=0.7;
    page.popuptitle = "ERROR";
    page.popuptitleimg = "images/err.png";
    page.errmsg.text = msg;
    page.errbox.opacity = 1;
    page.disableMouseBack = true
}

function showSuccessBox(msg){
    page.loadingRect.opacity=0.7;
    page.popuptitle = "SUCCESS";
    page.popuptitleimg = "images/success.png";
    page.errmsg.text = msg;
    page.errbox.opacity = 1;
    disableMouseBackground.enabled = true
}

function showWarningBox(msg){
    page.loadingRect.opacity=0.7;
    page.popuptitle = "WARNING";
    page.popuptitleimg = "images/warning.png";
    page.errmsg.text = msg;
    page.errbox.opacity = 1;
    disableMouseBackground.enabled = true
}

function showLoaderDestroyConfirm()
{
    confirmitem.opacity = 0;
    page.loader.opacity = 1
    page.loadingRect.opacity=0.7
    page.disableMouseBack = true
    confirmitem.destroy();
}

function deleteGalleryCache(){
    showLoaderDestroyConfirm()
    page.loadingTimerCache.start()
}

function deleteCameraFolders(){
    showLoaderDestroyConfirm()
    page.loadingTimerFolders.start()
}

function deleteCameraFoldersFun()
{
    i8910tuning.deleteEmptyCamera_slot();

    page.loader.opacity = 0
    showSuccessBox("Empty folders deleted!");
}

function deleteGalleryCacheFun()
{
    if (!i8910tuning.deleteGalleryCache_slot()) {
        page.loader.opacity = 0
        showSuccessBox("Gallery cache successully deleted!");

    }
    else{
        page.loader.opacity = 0
        showErrorBox("Could not delete gallery cache");

    }
}

function confirmExit(){
    confirmitem.destroy()
    Qt.quit()
}

function set_dynamic_mode(){
   if (i8910tuning.changeClockMode_slot(1))
    {
        page.loader.opacity = 0
       showErrorBox("Could not change to DYNAMIC mode");

    }
    else
    {
        page.loader.opacity = 0
       showSuccessBox("Clock mode changed to DYNAMIC mode");

    }
}

function set_locked_mode(){
if (i8910tuning.changeClockMode_slot(0))
{
    page.loader.opacity = 0
    showErrorBox("Could not change to LOCKED mode");

}
else
{
    page.loader.opacity = 0
    showSuccessBox("Clock mode changed to LOCKED mode");
}
}

function switch_mode(){

    i8910tuning.changeClockMode_slot(2);

    page.loader.opacity = 0

    showWarningBox("Clock Patch created. Now open RomPatcher+ and activate it");

}

function defaultks(){
    confirmitem.opacity = 0;
    confirmitem.destroy();

    if (!i8910tuning.defaultks_slot()){
        page.loadingRect.opacity=0.7;
        page.forceexit.opacity = 1;
        page.forceexitmsg = "KS default settings restored. i8910tuning will now close to apply the changes."
    }

    else {
        showErrorBox("Could not restore default ks settings");
    }
}
