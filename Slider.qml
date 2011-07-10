import QtQuick 1.0
import "startupChecks.js" as Checks

Item{
    id: background
    width: 340
    height: 110

    // value is read/write.
    property int value: 1
    property int value2: 1
    property int module: 0
    property int step: 10
    onValueChanged: slider.updatePos();
    property int maximum: 1
    property int minimum: 1
    property int xMax: slider.width - handle.width - 10
    onXMaxChanged: slider.updatePos();
    onMinimumChanged: slider.updatePos();
    property alias propertyname: property_name.text
    property alias valuename: value_name.text

    Image{
        id: imgslidertop
        width:slider.width - 10
        anchors.horizontalCenter: parent.horizontalCenter
        height: 30
        source: "images/bottom.png"

        Text{
            id: property_name
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 12

            text: "TODO"
        }
        Text{
            id: value_name
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 12

            text: background.value
        }
    }



    Item {
        id: slider;
        width: sliderimg.width
        height: sliderimg.height

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: imgslidertop.top
        anchors.topMargin: 25

        function updatePos() {
            if (maximum > minimum) {
                var pos = 5 + (value - minimum) * (xMax / (maximum - minimum));
                pos = Math.min(pos, width - handle.width - 5);
                pos = Math.max(pos, 5);
                handle.x = pos;
            } else {
                handle.x = 5;
            }
        }


            Image {
                id: sliderimg
                source: "images/slideswitch_back.png"
            }

            Image {
                id: handle
                x: 5; y: 7
                source: "images/slideswitch_knob.png"


                MouseArea {
                    id: mouse
                    anchors.fill: parent; drag.target: parent
                    drag.axis: Drag.XAxis; drag.minimumX: 5; drag.maximumX: xMax+5
                    onPositionChanged: {
                        value2 = ((maximum - minimum) * (handle.x-5) / xMax) + minimum;
                        value = value2 - (value2 % step)
                        slider.updatePos()
                    }
                }
            }

            PressAndHoldButton{
                anchors.right: parent.left
                anchors.top:  parent.top
                source:"images/minus.png"
                onClicked: if (value >= step) value-=step;
            }

            PressAndHoldButton{
                anchors.left: parent.right
                anchors.top:  parent.top
                source:"images/plus.png"
                onClicked: if (value <= maximum - step) value+=step;
            }
    }


}
