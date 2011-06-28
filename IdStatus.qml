import QtQuick 1.0
Rectangle
{
id: idstatus
	border.color: "transparent"
	color:"transparent"
        clip: true
        width: 360; height: 565;

        Image{
        source: "images/background.png"
        x:0
        fillMode: Image.Tile
        }

        Column{
            id: uastatus
            anchors.centerIn: parent
            spacing: 40
            Rectangle{
                id: fwrect
                width: 340; height: 150
                color: "grey"
                radius: 20
                Text{
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right:  parent.right
                    anchors.rightMargin: 20
                    text: "Firmware ID"
                }

                Image{
                    id: fwidphone
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    source: ids.inusefw.source
                }
                MouseArea{
                    id: fwmouse
                    anchors.fill:  parent
                    onClicked: page.codeclistindex = 0
                }
                states: State{
                    name: "pressed"; when: fwmouse.pressed
                    PropertyChanges{target: fwrect; opacity: 0.5}
                }

            }

            Rectangle{
                id: uarect
                width: 340; height: 150
                color: "grey"
                radius: 20

                Text{
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 20
                    anchors.left:  parent.left
                    text: "User Agent"
                }

                Image{
                    id: uaphone
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 20
                    source: userAgent.inuseua.source
                }

                MouseArea{
                    id: uamouse
                    anchors.fill:  parent
                    onClicked: page.codeclistindex = 2
                }

                states: State{
                    name: "pressed"; when: uamouse.pressed
                    PropertyChanges{target: uarect; opacity: 0.5}
                }
            }


        }
}
