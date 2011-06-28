import QtQuick 1.0

Rectangle{
        id: userAgent
        color:"transparent"
        clip: true
        width: 360; height: 565;
        property alias inuseua: uagrid.selected
        Image{
        source: "images/background.png"
        x:0
        fillMode: Image.Tile
        }

        function lightRightUA(){
                switch (i8910tuning.inUseUA()){
                case -1:
                uagrid.selected = -1
                // COULD NOT DETECT FW IN USE, I RESET BUTTONS
                break
                case 2:
                uagrid.selected = i8910.idcell
                break
                case 3:
                uagrid.selected = v52_5800.idcell
                break
                case 4:
                uagrid.selected = vivaz.idcell
                break
                case 5:
                uagrid.selected = c6.idcell
                break
                case 6:
                uagrid.selected = n8.idcell
                break
                default:
                break
                }
        return 0
        }


        Grid{
                id: uagrid
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 55

                columns: 2
                spacing: 25
                property variant selected

                Column{
                        id: uacol
                        Imgcodec {
                            id: c6;
                            name:  "C6"
                            onImgClick: {if (i8910tuning.changeUA_C6()) {page.errbox.success = false; page.errmsg.text = "Could not change UserAgent to C6"; page.errbox.opacity = 1;} else group.selected = idcell;}
                            path: "images/C6.png";
                            path2: "images/C6_sel.png";
                            group: uagrid
                        }
                        Imgcodec {
                            id: vivaz;
                            name:  "Vivaz"
                            onImgClick: {if (i8910tuning.changeUA_vivaz()) {page.errbox.success = false; page.errmsg.text = "Could not change UserAgent to Vivaz"; page.errbox.opacity = 1;} else group.selected = idcell;}
                            path: "images/vivaz.png";
                            path2: "images/vivaz_sel.png";
                            group: uagrid
                        }
                }

                Column{
                        id: uacol2
                        Imgcodec {
                            id: v52_5800;
                            name: "5800"
                            onImgClick: {if (i8910tuning.changeUA_5800()) {page.errbox.success = false; page.errmsg.text = "Could not change UserAgent to 5800"; page.errbox.opacity = 1;} else group.selected = idcell;}
                            path: "images/5800.png";
                            path2: "images/5800_sel.png";
                            group: uagrid
                        }
                        Imgcodec {
                            id: n8;
                            name: "N8"
                            onImgClick: {if (i8910tuning.changeUA_N8()) {page.errbox.success = false; page.errmsg.text = "Could not change UserAgent to N8"; page.errbox.opacity = 1;} else group.selected = idcell;}
                            path: "images/N8.png";
                            path2: "images/N8_sel.png";
                            group: uagrid
                        }
                }

                Row{
                        id: uarow1
                        Imgcodec {
                            id: i8910;
                            name: "i8910"
                            onImgClick: {if (i8910tuning.changeUA_I8910()) {page.errbox.success = false; page.errmsg.text = "Could not change UserAgent to i8910"; page.errbox.opacity = 1;} else group.selected = idcell;}
                            path: "images/i8910.png";
                            path2: "images/i8910_sel.png";
                            group: uagrid
                        }
                }
        }
}
