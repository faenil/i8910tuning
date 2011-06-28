import QtQuick 1.0

Rectangle{
        id: mic
        color:"transparent"
        clip: true
        width: 360
        height: 565


        Image{
        source: "images/background.png"
        x:-1080
        fillMode: Image.Tile
        }

            Column{
                id: col
                spacing: 5
                anchors.top:  parent.top
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                Slider{id:micamp; propertyname: "Mic Amp"; value: 0; step: 6; minimum: 0; maximum: 30}
                Slider{id:channel; propertyname: "Mic Channel"; value: 0; step: 1; minimum: 0; maximum: 31}


                Image{
                    id:micimg
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 260
                    height: 75
                    source: "images/butt.png"

                    Text{
                        anchors.centerIn:parent
                        text: "Apply"
                    }

                    MouseArea{
                        id: micButt
                        anchors.fill: parent
                        onClicked: {if (i8910tuning.changeMicSens_slot(micamp.value, channel.value)) {page.errbox.success = false; page.errmsg.text = "Could not change Mic Settings"; page.errbox.opacity = 0.9;} else {page.errbox.success = true; page.errmsg.text = "Mic Settings changed and saved"; page.errbox.opacity = 0.9;}}
                    }
                    states: State {
                        name: "pressed"; when: micButt.pressed == true
                        PropertyChanges { target: micimg; source: "images/butt_pressed.png" }
                    }
                }
           }
}
