import QtQuick 1.0

Rectangle{
        id: kssettings
	color:"transparent"
	clip: true
        width: 360
        height: 565

        function setks(){
            return i8910tuning.setks_slot(mass.value, gravity.value, erp.value, cfm.value, highlight_timeout.value, drag_threshold.value,
                                   frame_delay.value, min_frame_interval.value, ode_enabled.value, short_list_empty_space.value, long_list_empty_space.value)
        }

        function getks(){
            var ksvalues = i8910tuning.getks_slot()
            mass.value = ksvalues[0]
            gravity.value = ksvalues[1]
            erp.value = ksvalues[2]
            cfm.value = ksvalues[3]
            highlight_timeout.value = ksvalues[4]
            drag_threshold.value = ksvalues[5]
            frame_delay.value = ksvalues[6]
            min_frame_interval.value = ksvalues[7]
            ode_enabled.value = ksvalues[8]
            short_list_empty_space.value = ksvalues[9]
            long_list_empty_space.value = ksvalues[10]
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
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                Slider{id:mass; propertyname: "Mass"; step: 1; minimum: 0; maximum: 50}
                Slider{id:gravity; propertyname: "Gravity"; step: 1; minimum: 0; maximum: 50 }
                Slider{id:erp; propertyname: "Surface ERP"; step: 1; minimum: 0; maximum: 100}
                Slider{id:cfm; propertyname: "Surface CFM"; step: 1; minimum: 0; maximum: 50}
                Slider{id:highlight_timeout; propertyname: "Highlight Timeout"; step: 1; minimum: 0; maximum: 100}
                Slider{id:drag_threshold; propertyname: "Drag Threshold"; step: 1; minimum: 0; maximum: 100}
                Slider{id:frame_delay; propertyname: "Frame Delay"; step: 1; minimum: 0; maximum: 50}
                Slider{id:min_frame_interval; propertyname: "Min Frame Interval"; step: 1; minimum: 0; maximum: 100}
                Slider{id:ode_enabled; propertyname: "KS Enable/Disable"; step: 1; minimum: 0; maximum: 1}
                Slider{id:short_list_empty_space; propertyname: "ShortList Empty (%)"; step: 1; minimum: 0; maximum: 200}
                Slider{id:long_list_empty_space; propertyname: "LongList Empty (%)"; step: 1; minimum: 0; maximum: 200}
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
                        onClicked: {if (setks()) {page.errbox.success = false; page.errmsg.text = "Could not set ks values"; page.errbox.opacity = 0.9;} else {page.errbox.success = true; page.errmsg.text = "KS Settings successfully changed!"; page.errbox.opacity = 0.9;}; getks()}
                    }
                    states: State {
                        name: "pressed"; when: ksButt.pressed == true
                        PropertyChanges { target: ksimg; source: "images/butt_pressed.png" }
                    }
                }
            }
            }
        }

        ListView{
            id: kslist
            anchors.fill: parent
            model: ksmodel
            orientation: ListView.Vertical
            flickDeceleration: 1000
            highlightFollowsCurrentItem: true
            highlightMoveDuration:240
        }
}
