import QtQuick 1.0

Item{
        id: ocsettings
        clip: true
        width: 360
        height: 565

        function getclock(){
            var clockvalues = i8910tuning.getClock_slot()
            min.value = clockvalues[0]
            medium.value = clockvalues[1]
            max.value = clockvalues[2]
        }

        Image{
        source: "images/background.png"
        x:-1080
        fillMode: Image.Tile
        }

        VisualItemModel{
            id: clockmodel
            Item{
                width:360
                anchors.horizontalCenter: ocsettings.horizontalCenter
                height: col.height + 20

            Column{
                id: col
                spacing: 5
                anchors.top:  parent.top
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter

                Slider{id:min; propertyname: "Minimum Frequency"; step: 10; minimum: 200; maximum: 900}
                Slider{id:medium; propertyname: "Medium Frequency"; step: 10; minimum: 200; maximum: 900 }
                Slider{id:max; propertyname: "Maximum Frequency"; step: 10; minimum: 200; maximum: 900}
                /*Switch{ id: clockmode
                        anchors.horizontalCenter: parent.horizontalCenter
                        opt1: "Dynamic"
                        opt2: "Locked"
                        centreText: ""
                        state: "on"
                        function toggle() {
                                 if (clockmode.state == "off"){

                                     if (i8910tuning.changeClockMode_slot(1) === 0) clockmode.state = "on"
                                     else { page.errbox.success = false; page.errbox.opacity = 0.8; page.errmsg.text = "Could not set Dynamic Clock mode"}
                                 }
                                 else{

                                     if (i8910tuning.changeClockMode_slot(0) === 0) clockmode.state = "off"
                                     else { page.errbox.success = false; page.errbox.opacity = 0.8; page.errmsg.text = "Could not set Locked Clock mode"}

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
                            if (i8910tuning.changeClockMode_slot(1))
                            {
                                page.errbox.success = false;
                                page.errmsg.text = "Could not change to DYNAMIC mode";
                                page.errbox.opacity = 0.9;
                            }
                            else
                            {
                                page.errbox.success = true;
                                page.errmsg.text = "Clock mode changed to DYNAMIC mode";
                                page.errbox.opacity = 0.9;
                            }
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
                        text: "Locked frequency"
                    }

                    MouseArea{
                        id: lockedButt
                        anchors.fill: parent
                        onClicked: {
                            if (i8910tuning.changeClockMode_slot(0))
                            {
                                page.errbox.success = false;
                                page.errmsg.text = "Could not change to LOCKED mode";
                                page.errbox.opacity = 0.9;
                            }
                            else
                            {
                                page.errbox.success = true;
                                page.errmsg.text = "Clock mode changed to LOCKED mode";
                                page.errbox.opacity = 0.9;
                            }
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
                            if (i8910tuning.createOCPatch(min.value, medium.value, max.value))
                            {
                                page.errbox.success = false;
                                page.errmsg.text = "Could not create Clock Patch";
                                page.errbox.opacity = 0.9;
                                //Reset sliders' value to real values taken from power.dll
                                getclock();
                            }
                            else
                            {
                                i8910tuning.changeClockMode_slot(2);

                                page.errbox.success = true;
                                page.errmsg.text = "Clock Patch created. Now open RomPatcher+ and activate it";
                                page.errbox.opacity = 0.9;
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
                        onClicked: { parent.timer.start()}
                    }
                    states: State {
                        name: "pressed"; when: clockButt.pressed == true
                        PropertyChanges { target: clockimg; source: "images/butt_pressed.png" }
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
                model: clockmodel
                orientation: ListView.Vertical
                flickDeceleration: 1000
                highlightFollowsCurrentItem: true
                highlightMoveDuration:240
            }
}

