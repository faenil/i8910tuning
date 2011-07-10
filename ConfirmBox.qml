import QtQuick 1.0

Rectangle{
        id: confirmbox
        z: 120
        width: 260
        height: 240

        property alias title: confirmtitletxt.text
        property alias msg: confirmtxt.text
        //property alias disableMouseBackground: page.disableMouseBack

        signal confirmed()

        opacity:0
        border.color: "black"

        Image{
                id: confirmbackground
                anchors.fill : parent
                source: "images/popup.png"
        }

        Text{
                id: confirmtxt
                wrapMode: Text.WordWrap
                text: "You really want to exit?"
                anchors {verticalCenter:parent.verticalCenter; left:parent.left; right: parent.right; leftMargin: 20; rightMargin: 20}
        }

        Behavior on opacity {PropertyAnimation {duration: 400}}

        Rectangle{
                id: confirmtitle
                anchors { top: parent.top; left: parent.left; right: parent.right }
                height: 65
                border.color: "black"
                border.width:  1
                color: "transparent"
                Text{
                        id: confirmtitletxt
                        wrapMode: Text.WordWrap
                        text: "CONFIRM"
                        anchors { verticalCenter: parent.verticalCenter ; left: parent.left; leftMargin: 80}
                }

                Image{
                        id: confirmimg

                        source: "images/warning.png"
                        width: 48
                        height: width
                        anchors { verticalCenter: parent.verticalCenter; left: parent.left;  leftMargin: 10}
                }
        }


        Image{
                id: noimg
                source: "images/no.png"
                width: 64
                height: width
                anchors { bottom: parent.bottom; right: parent.right; bottomMargin: 10; rightMargin: 15 }
                MouseArea{
                anchors.fill: parent

                onClicked: {confirmbox.opacity = 0; page.loadingRect.opacity=0; page.disableMouseBack = false; confirmbox.destroy()}
                }
        }

        Image{
                id: yesimg
                source: "images/yes.png"
                width: 64
                height: width
                anchors { bottom: parent.bottom; left: parent.left; bottomMargin: 10; leftMargin: 15 }
                MouseArea{
                    id: yesarea
                    anchors.fill: parent
                    onClicked: confirmbox.confirmed()
                }
        }

}
