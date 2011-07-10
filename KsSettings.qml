import QtQuick 1.0
import "startupChecks.js" as Checks
import "popups.js" as Popups

Rectangle{
    id: kssettings
    color:"transparent"
    clip: true
    width: 360
    height: 640

    Component.onCompleted: Checks.getks()

    function setks(){
        return i8910tuning.setks_slot(mass.value, gravity.value, erp.value, cfm.value, highlight_timeout.value, drag_threshold.value,
                                      frame_delay.value, min_frame_interval.value, ode_enabled.value, short_list_empty_space.value, long_list_empty_space.value)
    }


    Image{
        source: "images/background.png"
        x:-1080
        fillMode: Image.Tile
    }

    VisualItemModel{
        id: ksmodel
        Item{
            width:360
            anchors.horizontalCenter: kssettings.horizontalCenter
            height: col.height
            Column{
                id: col
                spacing: 5
                anchors.top:  parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                Slider{id:mass; anchors.horizontalCenter: parent.horizontalCenter; propertyname: "Mass"; step: 1; minimum: 0; maximum: 50}
                Slider{id:gravity; anchors.horizontalCenter: parent.horizontalCenter; propertyname: "Gravity"; step: 1; minimum: 0; maximum: 50 }
                Slider{id:erp; anchors.horizontalCenter: parent.horizontalCenter; propertyname: "Surface ERP"; step: 1; minimum: 0; maximum: 100}
                Slider{id:cfm; anchors.horizontalCenter: parent.horizontalCenter; propertyname: "Surface CFM"; step: 1; minimum: 0; maximum: 50}
                Slider{id:highlight_timeout; anchors.horizontalCenter: parent.horizontalCenter; propertyname: "Highlight TOut"; step: 1; minimum: 0; maximum: 100}
                Slider{id:drag_threshold; anchors.horizontalCenter: parent.horizontalCenter; propertyname: "Drag Threshold"; step: 1; minimum: 0; maximum: 100}
                Slider{id:frame_delay; anchors.horizontalCenter: parent.horizontalCenter; propertyname: "Frame Delay"; step: 1; minimum: 0; maximum: 50}
                Slider{id:min_frame_interval; anchors.horizontalCenter: parent.horizontalCenter; propertyname: "MinFrameInterval"; step: 1; minimum: 0; maximum: 100}
                Slider{id:ode_enabled; anchors.horizontalCenter: parent.horizontalCenter; propertyname: "KS Enable/Disable"; step: 1; minimum: 0; maximum: 1}
                Slider{id:short_list_empty_space; anchors.horizontalCenter: parent.horizontalCenter; propertyname: "ShortListEmpty"; step: 1; minimum: 0; maximum: 200}
                Slider{id:long_list_empty_space; anchors.horizontalCenter: parent.horizontalCenter; propertyname: "LongListEmpty"; step: 1; minimum: 0; maximum: 200}
                Image{
                    id:ksimg
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 260
                    height: 75
                    source: "images/butt.png"

                    Text{
                        anchors.centerIn:parent
                        text: "Apply"
                    }

                    MouseArea{
                        id: ksButt
                        anchors.fill: parent
                        onClicked: {if (setks()) {Popups.showErrorBox("Could not set ks values");} else {Popups.showSuccessBox("KS Settings successfully changed!")}; Checks.getks()}
                    }
                    states: State {
                        name: "pressed"; when: ksButt.pressed == true
                        PropertyChanges { target: ksimg; source: "images/butt_pressed.png" }
                    }
                }

                Image{
                    id:defaultks
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 260
                    height: 75
                    source: "images/butt.png"

                    Text{
                        anchors.centerIn:parent
                        text: "Restore Default"
                    }

                    MouseArea{
                        id: defaultksButt
                        anchors.fill: parent
                        onClicked: {
                            Popups.confirmcomp = Qt.createComponent("ConfirmBox.qml");
                            Popups.confirmitem = Popups.confirmcomp.createObject(page)
                            Popups.confirmitem.anchors.centerIn = page;
                            Popups.confirmitem.title = "WARNING"
                            Popups.confirmitem.msg = "Do you really want to restore default ks settings?"
                            page.loadingRect.opacity=0.6;

                            Popups.confirmitem.opacity = 1;
                            page.disableMouseBack = true

                            Popups.confirmitem.confirmed.connect(Popups.defaultks)

                        }
                        states: State {
                            name: "pressed"; when: defaultksButt.pressed == true
                            PropertyChanges { target: defaultks; source: "images/butt_pressed.png" }
                        }
                    }
                }

                Image{
                    id:refreshks
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 260
                    height: 75
                    source: "images/butt.png"

                    Text{
                        anchors.centerIn:parent
                        text: "Refresh"
                    }

                    MouseArea{
                        id: refreshksButt
                        anchors.fill: parent
                        onClicked: {

                            Checks.getks()

                        }
                        states: State {
                            name: "pressed"; when: refreshksButt.pressed == true
                            PropertyChanges { target: refreshks; source: "images/butt_pressed.png" }
                        }
                    }
                }
            }
        }
    }

    ListView{
        id: kslist
        anchors.fill: parent
        anchors.bottomMargin: 75
        anchors.topMargin: 75
        model: ksmodel
        orientation: ListView.Vertical
        flickDeceleration: 1000
        highlightFollowsCurrentItem: true
        highlightMoveDuration:240
    }

}
