import QtQuick 1.0
import "startupChecks.js" as Checks
import "popups.js" as Popups
Rectangle{
        id: mic
        color:"transparent"
        clip: true
        width: 360
        height: 640


        Image{
        source: "images/background.png"
        x:-1800
        fillMode: Image.Tile
        }

            Column{
                id: col
                spacing: 5
                anchors.top:  parent.top
                anchors.topMargin: 75
                anchors.horizontalCenter: parent.horizontalCenter
                Slider{id:micamp; anchors.horizontalCenter: parent.horizontalCenter; propertyname: "Mic Amp"; value: 0; step: 6; minimum: 0; maximum: 30}
                Slider{id:channel; anchors.horizontalCenter: parent.horizontalCenter; propertyname: "Mic Channel"; value: 0; step: 1; minimum: 0; maximum: 31}


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
                        onClicked: {if (i8910tuning.changeMicSens_slot(micamp.value, channel.value)) {Popups.showErrorBox("Could not change Mic Settings");} else {Popups.showSuccessBox("Mic Settings changed and saved");}}
                    }
                    states: State {
                        name: "pressed"; when: micButt.pressed == true
                        PropertyChanges { target: micimg; source: "images/butt_pressed.png" }
                    }
                }
           }
}
