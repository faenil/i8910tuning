import QtQuick 1.0
import "startupChecks.js" as Checks
import "popups.js" as Popups

Rectangle{
	id: ids
	color:"transparent"
	clip: true
        width: 360; height: 640;
        property alias inusefw: fwgrid.selected

        Component.onCompleted: Checks.lightRightFW()

	Image{
        source: "images/background.png"
	x:0
	fillMode: Image.Tile
	}

        Grid{
                id: fwgrid
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 75
                columns: 2
                spacing: 13
                property variant selected

                Column{
                    spacing: 13
                        id: fwcol
                        Imgcodec {
                            id: c6;
                            name: "C6"
                            onImgClick: {if (i8910tuning.changeFW_C6()) {Popups.showErrorBox("Could not change ID to C6. Check if Open4All is active in RomPatcher.")} else group.selected = idcell;}
                            path: "images/C6.png";
                            path2: "images/C6_sel.png";
                            group: fwgrid
                        }
                        Imgcodec {
                            id: vivaz;
                            name: "Vivaz"
                            onImgClick: {if (i8910tuning.changeFW_vivaz()) {Popups.showErrorBox("Could not change ID to Vivaz. Check if Open4All is active in RomPatcher.")} else group.selected = idcell;}
                            path: "images/vivaz.png";
                            path2: "images/vivaz_sel.png";
                            group: fwgrid
                        }
                }

                Column{
                    spacing: 13
                        id: fwcol2
                        Imgcodec {
                            id: v52_5800;
                            name: "5800"
                            onImgClick: {if (i8910tuning.changeFW_5800()) {Popups.showErrorBox("Could not change ID to 5800. Check if Open4All is active in RomPatcher.")} else group.selected = idcell;}
                            path: "images/5800.png";
                            path2: "images/5800_sel.png";
                            group: fwgrid
                        }
                        Imgcodec {
                            id: n8;
                            name: "N8"
                            onImgClick: {if (i8910tuning.changeFW_N8()) {Popups.showErrorBox("Could not change ID to N8. Check if Open4All is active in RomPatcher.")} else group.selected = idcell;}
                            path: "images/N8.png";
                            path2: "images/N8_sel.png";
                            group: fwgrid
                        }
                }

                Row{
                        id: fwrow1
                        Imgcodec {
                            id: i8910;
                            name: "i8910"
                            onImgClick: {if (i8910tuning.changeFW_I8910()) {Popups.showErrorBox("Could not change ID to i8910. Check if Open4All is active in RomPatcher.")} else group.selected = idcell;}
                            path: "images/i8910.png";
                            path2: "images/i8910_sel.png";
                            group: fwgrid
                        }
                }
        }
}
