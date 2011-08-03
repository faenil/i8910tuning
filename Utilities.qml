import QtQuick 1.0
import "startupChecks.js" as Checks
import "popups.js" as Popups

Item{
    id: utilities
    //color:"transparent"
    width: 360
    height: 640

    property int err: 0;
    Component.onCompleted: Checks.getCallSummaryAndLight();

    Image{
        source: "images/bg7.jpg"
    }

    VisualItemModel{
        id: utilitiesmodel
        Item{
            width:360
            height: col.height

            Column{
                id: col
                spacing: 5
                anchors.top:  parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle{

                    height:480
                    width:parent.width
                    radius:10
                    color:"lightgray"
                    Column{
                        id: uidcol
                        spacing: 10
                        anchors.fill:parent
                        Text{
                            id: text1
                            text: "Orientation settings"
                            anchors.horizontalCenter:parent.horizontalCenter

                        }
                        Text{
                            id: textUID
                            text: "1a) Write UID here:"
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                        }
                        Row{
                            anchors.horizontalCenter:parent.horizontalCenter
                            spacing: 10
                            Text{
                                id: text2

                                anchors.verticalCenter: parent.verticalCenter
                                text: "0x"
                            }
                            Rectangle{

                                color: "white"
                                radius: 5
                                width: 140
                                height: orientationUid.height + 5
                                TextInput{
                                    id:orientationUid
                                    anchors.centerIn: parent

                                    validator: RegExpValidator{regExp:/[0-9a-fA-F]{8}/}
                                }

                                MouseArea{
                                    anchors.fill: parent
                                    onClicked:{
                                        if (!orientationUid.activeFocus) {
                                            orientationUid.forceActiveFocus()
                                            orientationUid.openSoftwareInputPanel();
                                        } else {
                                            orientationUid.focus = false;
                                        }

                                    }
                                }
                            }
                        }
                        Text{
                            id: textchoose
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            text: "1b) Or click on one of the\n" +
                                  "apps in the list:"
                        }

                        ListModel{
                            id: uidlistmodel

                            ListElement
                            {
                                name:"Menu"
                                uid: "101F4CD2"
                            }
                            ListElement
                            {
                                name:"Dialer"
                                uid: "100058B3"
                            }
                            ListElement
                            {
                                name:"Messaging"
                                uid: "100058C5"
                            }
                            ListElement
                            {
                                name:"Calendar"
                                uid: "10005901"
                            }
                            ListElement
                            {
                                name:"Calculator"
                                uid: "10005902"
                            }
                            ListElement
                            {
                                name:"RealPlayer"
                                uid: "10005A3E"
                            }
                            ListElement
                            {
                                name:"Media Settings"
                                uid: "10005A3F"
                            }
                            ListElement
                            {
                                name:"Browser"
                                uid: "10008D39"
                            }
                            ListElement
                            {
                                name:"Contacts"
                                uid: "101F4CCE"
                            }
                            ListElement
                            {
                                name:"Call Log"
                                uid: "101F4CD5"
                            }
                            ListElement
                            {
                                name:"Image Viewer"
                                uid: "101F4D90"
                            }
                            ListElement
                            {
                                name:"Image/Video Gallery"
                                uid: "101F8599"
                            }
                            ListElement
                            {
                                name:"GPS Data"
                                uid: "101F85A0"
                            }
                            ListElement
                            {
                                name:"Video Telephony"
                                uid: "101F8681"
                            }
                            ListElement
                            {
                                name:"Music Store"
                                uid: "101FFB51"
                            }
                            ListElement
                            {
                                name:"Music Player"
                                uid: "102072C3"
                            }
                            ListElement
                            {
                                name:"Homescreen"
                                uid: "102750F0"
                            }
                            ListElement
                            {
                                name:"Search"
                                uid: "20000907"
                            }
                            ListElement
                            {
                                name:"Ovi Maps"
                                uid: "20001F63"
                            }
                            ListElement
                            {
                                name:"Search Settings"
                                uid: "20009B72"
                            }
                            ListElement
                            {
                                name:"Friends Widg"
                                uid: "20019536"
                            }
                            ListElement
                            {
                                name:"Notes"
                                uid: "10005907"
                            }
                            ListElement
                            {
                                name:"NotepadViewer"
                                uid: "1000599D"
                            }
                            ListElement
                            {
                                name:"App Manager"
                                uid: "101F8512"
                            }
                            ListElement
                            {
                                name:"File Manager"
                                uid: "101f84EB"
                            }
                            ListElement
                            {
                                name:"Voice Recorder"
                                uid: "100058CA"
                            }
                            ListElement
                            {
                                name:"Settings"
                                uid: "100058EC"
                            }
                            ListElement
                            {
                                name:"Alarm"
                                uid: "10005903"
                            }
                            ListElement
                            {
                                name:"GPS+"
                                uid: "20003AE5"
                            }
                            ListElement
                            {
                                name:"Converter"
                                uid: "101F4668"
                            }
                            ListElement
                            {
                                name:"Bluetooth"
                                uid: "10005951"
                            }
                            ListElement
                            {
                                name:"Print"
                                uid: "2001702D"
                            }
                            ListElement
                            {
                                name:"Conn. Manager"
                                uid: "101F84D0"
                            }
                            ListElement
                            {
                                name:"DLNA"
                                uid: "2001E90C"
                            }
                            ListElement
                            {
                                name:"Device Mngmt."
                                uid: "101F6DE5"
                            }
                            ListElement
                            {
                                name:"PhonebookServer"
                                uid: "10207277"
                            }
                            ListElement
                            {
                                name:"MyMedia"
                                uid: "2001F342"
                            }
                            ListElement
                            {
                                name:"Call Mailbox"
                                uid: "100058f5"
                            }
                            ListElement
                            {
                                name:"Speed Dial"
                                uid: "1000590a"
                            }
                            ListElement
                            {
                                name:"Image Editor"
                                uid: "101ffa91"
                            }
                            ListElement
                            {
                                name:"Chat NG"
                                uid: "101f4673"
                            }
                            ListElement
                            {
                                name:"Bluetooth Print"
                                uid: "2001715a"
                            }
                        }

                        Component{
                            id:uidlistcomp

                            Item{
                                id: uiditem
                                width: uidListView.width
                                height: uidtxt1.paintedHeight

                                Text{
                                    id:uidtxt1
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    text: name
                                }
                                MouseArea{
                                    anchors.fill: parent
                                    onClicked: orientationUid.text = uid
                                }
                            }
                        }

                        Rectangle{
                            border.color: "Black"
                            border.width: 1
                            color: "transparent"
                            height: parent.height - text1.height - text2.height - text3.height - textUID.height - textchoose.height - orientrow.height - (uidcol.spacing * 7)
                            width:  parent.width - 20
                            anchors.horizontalCenter: parent.horizontalCenter

                            ListView{
                                id:uidListView
                                spacing: 10
                                clip: true

                                anchors.fill: parent
                                anchors.margins: 5

                                orientation: ListView.Vertical
                                //highlight: high
                                highlightFollowsCurrentItem: true
                                highlightMoveDuration:240
                                highlightRangeMode: ListView.NoHighlightRange
                                model: uidlistmodel
                                delegate: uidlistcomp
                            }
                        }

                        Text{
                            id: text3
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            text: "2) Select the desired\n" +
                                  "mode for that app:"
                        }

                        Row{
                            id: orientrow
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 10
                            width: parent.width - 20
                            anchors.horizontalCenter: parent.horizontalCenter
                            spacing: 10
                            height: 40
                            Rectangle{
                                height:40
                                radius: 5
                                color: "darkgrey"
                                width: parent.width/3 - 6
                                Image{
                                    source:"images/i8910_P.png"
                                    anchors.centerIn: parent
                                }

                                MouseArea{
                                    anchors.fill: parent
                                    onClicked: {
                                        err = i8910tuning.changeOrientation_slot("0x"+orientationUid.text.toUpperCase(), 65536)
                                        if (err) Popups.showErrorBox("Error encountered: enable CRepository4All patch in RomPatcher")
                                        else Popups.showSuccessBox("Orientation of UID 0x"+orientationUid.text+" set to Portrait only"+err)
                                    }
                                }
                            }
                            Rectangle{
                                height:40
                                radius: 5
                                color: "darkgrey"

                                width: parent.width/3 - 6
                                Image{
                                    source:"images/i8910_L.png"
                                    anchors.centerIn: parent
                                }
                                MouseArea{
                                    anchors.fill: parent
                                    onClicked: {


                                        if (i8910tuning.changeOrientation_slot("0x"+orientationUid.text.toUpperCase(), 196608)) Popups.showErrorBox("Error encountered: enable CRepository4All patch in RomPatcher")
                                        else Popups.showSuccessBox("Orientation of UID 0x"+orientationUid.text+" set to Landscape only")
                                    }
                                }

                            }
                            Rectangle{
                                height:40
                                radius: 5
                                color: "darkgrey"

                                width: parent.width/3 - 6
                                Image{
                                    source:"images/i8910_PL.png"
                                    anchors.centerIn: parent
                                }
                                MouseArea{
                                    anchors.fill: parent
                                    onClicked: {
                                        if (i8910tuning.changeOrientation_slot("0x"+orientationUid.text.toUpperCase(), 327680)) Popups.showErrorBox("Error encountered: enable CRepository4All patch in RomPatcher")
                                        else Popups.showSuccessBox("Orientation of UID 0x"+orientationUid.text+" set to follow device orientation")
                                    }
                                }
                            }
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
                        text: "Delete gallery cache"
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

                Image{
                    id:tmpbuttimg
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 260
                    height: 75
                    source: "images/butt.png"

                    Text{
                        anchors.centerIn:parent
                        text: "Delete temp files in C"
                    }

                    MouseArea{
                        id: tmpButt
                        anchors.fill: parent
                        onClicked: {
                            Popups.confirmcomp = Qt.createComponent("ConfirmBox.qml");
                            Popups.confirmitem = Popups.confirmcomp.createObject(page)
                            Popups.confirmitem.anchors.centerIn = page;
                            Popups.confirmitem.title = "WARNING"
                            Popups.confirmitem.msg = "Do you really want to delete temporary files in C:/Private/1020735b?"
                            page.loadingRect.opacity=0.6;
                            Popups.confirmitem.opacity = 1;
                            page.disableMouseBack = true

                            Popups.confirmitem.confirmed.connect(Popups.deleteTempFiles)

                        }
                    }

                    states: State {
                        name: "pressed"; when: tmpButt.pressed == true
                        PropertyChanges { target:tmpbuttimg ; source: "images/butt_pressed.png" }
                    }
                }

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

            }

        }
    }

    ListView{
        id: utilitieslist
        anchors.fill: parent
        anchors.bottomMargin: 75
        anchors.topMargin: 75
        model: utilitiesmodel
        orientation: ListView.Vertical
        flickDeceleration: 1000
        highlightFollowsCurrentItem: true
        highlightMoveDuration:240
    }

}
