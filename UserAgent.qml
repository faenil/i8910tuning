import QtQuick 1.0
import "startupChecks.js" as Checks
import "popups.js" as Popups

Rectangle{
        id: userAgent
        color:"transparent"
        clip: true
        width: 360; height: 640;
        property alias inuseua: uagrid.selected

        Component.onCompleted: Checks.lightRightUA()

        Image{
        source: "images/background.png"
        x:0
        fillMode: Image.Tile
        }

        Grid{
                id: uagrid
                anchors.centerIn:parent

                columns: 3

                property variant selected

                Column{
                    spacing: 20
                        id: uacol
                        Imgcodec {
                            id: iphone;
                            width:120
                            name: "iPhone"
                            onImgClick: {if (i8910tuning.changeUA_iPhone()) {Popups.showErrorBox("Could not change UserAgent to N8")} else group.selected = idcell;}
                            path: "images/iphone.png";
                            path2: "images/iphone_sel.png";
                            group: uagrid
                        }
                        Imgcodec {
                            id: c6;
                            width:120
                            name:  "C6"
                            onImgClick: {if (i8910tuning.changeUA_C6()) {Popups.showErrorBox("Could not change UserAgent to C6")} else group.selected = idcell;}
                            path: "images/C6.png";
                            path2: "images/C6_sel.png";
                            group: uagrid
                        }

                }

                Column{
                    spacing: 20
                        id: uacol2
                        Imgcodec {
                            id: android;
                            width:120
                            name: "Android"
                            onImgClick: {if (i8910tuning.changeUA_android()) {Popups.showErrorBox("Could not change UserAgent to N8")} else group.selected = idcell;}
                            path: "images/android.png";
                            path2: "images/android_sel.png";
                            group: uagrid
                        }
                        Imgcodec {
                            id: v52_5800;
                            width:120
                            name: "5800"
                            onImgClick: {if (i8910tuning.changeUA_5800()) {Popups.showErrorBox("Could not change UserAgent to 5800")} else group.selected = idcell;}
                            path: "images/5800.png";
                            path2: "images/5800_sel.png";
                            group: uagrid
                        }
                        Imgcodec {
                            id: i8910;
                            width:120
                            name: "i8910"
                            onImgClick: {if (i8910tuning.changeUA_I8910()) {Popups.showErrorBox("Could not change UserAgent to i8910")} else group.selected = idcell;}
                            path: "images/i8910.png";
                            path2: "images/i8910_sel.png";
                            group: uagrid
                        }
                }

                Column{
                    spacing: 20
                        id: uacol3
                        Imgcodec {
                            id: desktop;
                            width:120
                            name: "Desktop"
                            onImgClick: {if (i8910tuning.changeUA_desktop()) {Popups.showErrorBox("Could not change UserAgent to 5800")} else group.selected = idcell;}
                            path: "images/desktop.png";
                            path2: "images/desktop_sel.png";
                            group: uagrid
                        }

                        Imgcodec {
                            id: vivaz;
                            width:120
                            name:  "Vivaz"
                            onImgClick: {if (i8910tuning.changeUA_vivaz()) {Popups.showErrorBox("Could not change UserAgent to Vivaz")} else group.selected = idcell;}
                            path: "images/vivaz.png";
                            path2: "images/vivaz_sel.png";
                            group: uagrid
                        }
                }

        }
}
