import QtQuick 1.0
import "startupChecks.js" as Checks
import "popups.js" as Popups

Rectangle{
        id: utilities
        color:"transparent"
        clip: true
        width: 360
        height: 640

        Component.onCompleted: Checks.getCallSummaryAndLight();

        Image{
        source: "images/background.png"
        x:-2160
        fillMode: Image.Tile
        }

            Column{
                id: col
                spacing: 5
                anchors.top:  parent.top
                anchors.topMargin: 75
                anchors.horizontalCenter: parent.horizontalCenter

                Switch{ id: callsummary
                        opt2: "OFF"
                        opt1: "ON"
                        centreText: "CallSumm"
                        anchors.horizontalCenter: parent.horizontalCenter

                        function toggle() {
                                 if (callsummary.state == 'on'){

                                        if (i8910tuning.callSummary_slot() === 0) callsummary.state = 'off'
                                        else { callsummary.knob_x = callsummary.maxpixel; Popups.showErrorBox("Could not set call summary to OFF")}
                                }
                                else{

                                        if (i8910tuning.callSummary_slot() === 0) callsummary.state = 'on'
                                        else { callsummary.knob_x = callsummary.minpixel; Popups.showErrorBox("Could not set call summary to ON")}

                                 }
                        }

                }

                Switch{ id: dimmedlight
                        opt2: "OFF"
                        opt1: "ON"
                        centreText: "LowLight"
                        anchors.horizontalCenter: parent.horizontalCenter

                        function toggle() {
                                 if (dimmedlight.state == 'on'){

                                        if (i8910tuning.dimlight_slot() === 0) dimmedlight.state = 'off'
                                        else { dimmedlight.knob_x=dimmedlight.maxpixel; Popups.showErrorBox("Could not disable dim light")}
                                }
                                else{

                                        if (i8910tuning.dimlight_slot() === 0) dimmedlight.state = 'on'
                                        else { dimmedlight.knob_x=dimmedlight.minpixel; Popups.showErrorBox("Could not enable dim light")}

                                 }
                        }

                }


                Image{
                    id:cachebuttimg
                anchors.horizontalCenter: parent.horizontalCenter
                width: 260
                height: 75
                source: "images/butt.png"

                Text{
                        anchors.centerIn:parent
                        text: "Delete cache"
                }

                        MouseArea{
                                id: cacheButt
                                anchors.fill: parent
                                onClicked: {
                                    Popups.confirmcomp = Qt.createComponent("ConfirmBox.qml");
                                    Popups.confirmitem = Popups.confirmcomp.createObject(page)
                                    Popups.confirmitem.anchors.centerIn = page;
                                    Popups.confirmitem.title = "WARNING"
                                    Popups.confirmitem.msg = "Do you really want to delete gallery cache?"
                                    page.loadingRect.opacity=0.6;
                                    Popups.confirmitem.opacity = 1;
                                    page.disableMouseBack = true

                                    Popups.confirmitem.confirmed.connect(Popups.deleteGalleryCache)

                                }
                        }

                        states: State {
                            name: "pressed"; when: cacheButt.pressed == true
                            PropertyChanges { target:cachebuttimg ; source: "images/butt_pressed.png" }
                        }
                }
           }
}
