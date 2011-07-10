import QtQuick 1.0
import "startupChecks.js" as Checks
import "popups.js" as Popups

Item{
        id: ocsettings
        clip: true
        width: 360
        height: 640

        Component.onCompleted: Checks.getclock()

        function showLoader(){
        page.loader.opacity = 1
        page.loadingRect.opacity=0.7
        disableMouseBackground.enabled = true
        }

        signal set_dynamic_mode

        Image{
        source: "images/background.png"
        x:-1440
        fillMode: Image.Tile
        }

        VisualItemModel{
            id: clockmodel
            Item{
                width:parent.width
                anchors.horizontalCenter: ocsettings.horizontalCenter
                height: col.height

            Column{
                id: col
                spacing: 5
                anchors.top:  parent.top
                anchors.horizontalCenter: parent.horizontalCenter

                Slider{id:min; anchors.horizontalCenter: parent.horizontalCenter; propertyname: "Minimum"; step: 10; minimum: 200; maximum: 900}
                Slider{id:medium; anchors.horizontalCenter: parent.horizontalCenter; propertyname: "Medium"; step: 10; minimum: 200; maximum: 900 }
                Slider{id:max; anchors.horizontalCenter: parent.horizontalCenter; propertyname: "Maximum"; step: 10; minimum: 200; maximum: 900}
                /*Switch{ id: clockmode
                        anchors.horizontalCenter: parent.horizontalCenter
                        opt1: "Dynamic"
                        opt2: "Locked"
                        centreText: ""
                        state: "on"
                        function toggle() {
                                 if (clockmode.state == "off"){

                                     if (i8910tuning.changeClockMode_slot(1) === 0) clockmode.state = "on"
                                     else { page.popuptitle = "ERROR"; page.popuptitleimg = "images/err.png"; page.errbox.opacity = 1; disableMouseBackground.enabled = true; page.errmsg.text = "Could not set Dynamic Clock mode"}
                                 }
                                 else{

                                     if (i8910tuning.changeClockMode_slot(0) === 0) clockmode.state = "off"
                                     else { page.popuptitle = "ERROR"; page.popuptitleimg = "images/err.png"; page.errbox.opacity = 1; disableMouseBackground.enabled = true; page.errmsg.text = "Could not set Locked Clock mode"}

                                 }
                        }

                }*/
                Image{
                    id:dynamicimg
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 260
                    height: 75
                    source: "images/butt.png"

                    Text{
                        anchors.centerIn:parent
                        text: "Dynamic Frequency"
                    }

                    MouseArea{
                        id: dynamicButt
                        anchors.fill: parent
                        onClicked: {

                            showLoader()
                            page.loadingTimerDynamic.start()

                        }
                    }
                    states: State {
                        name: "pressed"; when: dynamicButt.pressed == true
                        PropertyChanges { target: dynamicimg; source: "images/butt_pressed.png" }
                    }

                }

                Image{
                    id:lockedimg
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 260
                    height: 75
                    source: "images/butt.png"

                    Text{
                        anchors.centerIn:parent
                        text: "Locked Frequency"
                    }

                    MouseArea{
                        id: lockedButt
                        anchors.fill: parent
                        onClicked: {
                            showLoader()
                            page.loadingTimerLocked.start()
                        }
                    }
                    states: State {
                        name: "pressed"; when: lockedButt.pressed == true
                        PropertyChanges { target: lockedimg; source: "images/butt_pressed.png" }
                    }

                }

                Image{
                    id:applyimg
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 260
                    height: 75
                    source: "images/butt.png"

                    Text{
                        anchors.centerIn:parent
                        text: "Create Patch"
                    }

                    MouseArea{
                        id: applyButt
                        anchors.fill: parent
                        onClicked: {

                            showLoader()

                            if (i8910tuning.createOCPatch(min.value, medium.value, max.value))
                            {
                                page.loader.opacity = 0

                                Popups.showErrorBox("Could not create Clock Patch");

                                //Reset sliders' value to real values taken from power.dll
                                Checks.getclock();
                            }
                            else
                            {
                                page.loadingTimerSwitch.start()
                            }
                        }
                    }

                    states: State {
                        name: "pressed"; when: applyButt.pressed == true
                        PropertyChanges { target: applyimg; source: "images/butt_pressed.png" }
                    }

                }

                Image{
                    id:clockimg
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 260
                    height: 75
                    source: "images/butt.png"
                    property alias txt: clocktxt.text
                    property alias timer: clocktimer
                    Text{
                        id:clocktxt
                        anchors.centerIn:parent
                        text: "Get Clock"
                    }

                    MouseArea{
                        id: clockButt
                        anchors.fill: parent
                        onClicked: { parent.timer.start(); showtimer.start()}
                    }
                    states: State {
                        name: "pressed"; when: clockButt.pressed == true
                        PropertyChanges { target: clockimg; source: "images/butt_pressed.png" }
                    }

                    Timer {
                        id:showtimer
                        interval: 7000; running: false; repeat: false
                        onTriggered: {clocktimer.stop(); parent.txt = "Get Clock"}
                    }

                    Timer {
                        id:clocktimer
                        interval: 100; running: false; repeat: true
                        onTriggered: parent.txt = i8910tuning.getClockValue_slot()
                    }
                }
           }

            }
        }

            ListView{
                id: clocklist
                anchors.fill: parent
                anchors.bottomMargin: 75
                anchors.topMargin: 75
                model: clockmodel
                orientation: ListView.Vertical
                flickDeceleration: 1000
                highlightFollowsCurrentItem: true
                highlightMoveDuration:240
            }
}

