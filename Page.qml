import QtQuick 1.0

Rectangle{
	id: page
	width: 360; height: 640
	color: "transparent"
	property alias errmsg: errtxt
	property alias errbox: popup
        property alias codeclistindex: codeclist.currentIndex
        Component.onCompleted: { codecs.lightRightCodec(); camera.checkFocusStartup(); utilities.getks(); ocsettings.getclock(); userAgent.lightRightUA(); ids.lightRightFW();}
	VisualItemModel{
		id: itemModel


                Rectangle{
                    id:idpage
                    width: 360; height: 640
                    color: "transparent"

                    VisualItemModel{
                        id: codeclistModel

                        Ids{id: ids}
                        IdStatus{id: idstatus}
                        UserAgent{id: userAgent}
                    }
                    ListView{
                        id: codeclist
                        anchors { fill: parent }
                        model: codeclistModel
                        orientation: ListView.Vertical
                        boundsBehavior: Flickable.StopAtBounds
                        flickDeceleration: 5000
                        highlightFollowsCurrentItem: true
                        highlightMoveDuration:240
                        highlightRangeMode: ListView.StrictlyEnforceRange
                        currentIndex: 1
                        onCurrentIndexChanged: if (codeclist.currentIndex == 0) bottomtxt.text = "Firmware ID Status"; else if (codeclist.currentIndex == 1) bottomtxt.text = "ID Status"; else if (codeclist.currentIndex == 2) bottomtxt.text = "User Agent";
                    }
                }

                Camera{id: camera; }
                Codecs{id: codecs;}
                KsSettings{id: utilities;}
                Clock{id: ocsettings;}
                Mic{id:mic}
	}


	ListView{
		id: view
		anchors { fill: parent }
		model: itemModel
        	orientation: ListView.Horizontal
        	boundsBehavior: Flickable.StopAtBounds
         	flickDeceleration: 5000
         	highlightFollowsCurrentItem: true
         	highlightMoveDuration:240
         	highlightRangeMode: ListView.StrictlyEnforceRange
                onCurrentIndexChanged: if (view.currentIndex == 0) {if (codeclist.currentIndex == 0) bottomtxt.text = "Firmware ID Status"; else if (codeclist.currentIndex == 1) bottomtxt.text = "ID Status"; else if (codeclist.currentIndex == 2) bottomtxt.text = "User Agent";} else if (view.currentIndex == 1) bottomtxt.text = "Camera"; else if (view.currentIndex == 2) bottomtxt.text = "Codecs"; else if (view.currentIndex == 3) bottomtxt.text = "Scrolling Settings"; else if (view.currentIndex == 4) bottomtxt.text = "OC Settings"; else if (view.currentIndex == 5) bottomtxt.text = "Microphone Settings";
	}
	
	Rectangle{
		id:bottompage
		anchors { bottom: parent.bottom; left: leftbut.right; right: rightbut.left}
		height: 75

		gradient: Gradient{
			GradientStop { position: 0.0; color:"white"}
			GradientStop { position: 0.05; color:"grey"}
			}

		Text{
			id: bottomtxt
			text: "Main"
			signal updateBottomTxt()
			anchors.centerIn: parent	
		}

                MouseArea{
                    anchors.fill: parent
                }

		
	}
	
	
	Rectangle{
		id:rightbut	
		width:75
		height: width
		anchors{ right:parent.right; bottom: parent.bottom;}

		gradient: Gradient{
			GradientStop { position: 0.0; color:"white"}
			GradientStop { position: 0.05; color:"grey"}
			}
		Image{
			id: rightimg
			anchors { centerIn: parent}
			source: "images/right.png"
		
			MouseArea{
				anchors.fill:parent		
                                onClicked: if (view.currentIndex < 5) {view.currentIndex = view.currentIndex + 1;}
			}

		}
                states: State{
                        name: "listrightend"
                        when: view.currentIndex == 5
                        PropertyChanges {target: rightimg; opacity: 0}
                }
	}
	
	Rectangle{
		id:leftbut 	
		width:75
		height: width	
		anchors{ left:parent.left; bottom: parent.bottom;}
		color:"grey"
		gradient: Gradient{
			GradientStop { position: 0.0; color:"white"}
			GradientStop { position: 0.05; color:"grey"}
			}
		Image{
			id: leftimg
			anchors { centerIn: parent}	
			source: "images/left.png"
		
			MouseArea{
				anchors.fill:parent		
                                onClicked: {
                                    if (view.currentIndex > 0) {view.currentIndex = view.currentIndex - 1;}
                                }
			}

		}
                states: State{
                        name: "listleftend"
                        when: view.currentIndex == 0
                        PropertyChanges {target: leftimg; opacity: 0}
                }
	}
	Rectangle{
		id: popup
		z: 100
		width: 260
		height: 300
		anchors.centerIn: parent
		opacity:0
		border.color: "black"
                property bool success:  true
		Image{
			id: popbackground
			anchors.fill : parent
			source: "images/popup.png"
		}

		Text{
			id: errtxt
			wrapMode: Text.WordWrap
                        text: ""
			anchors {leftMargin: 20; left:parent.left; right: parent.right; rightMargin:20; verticalCenter:parent.verticalCenter}
		}
		
		Behavior on opacity {PropertyAnimation {duration: 200}}

		MouseArea{
			anchors.fill: parent
		}


		Rectangle{
			id: errtitle
			anchors { top: parent.top; left: parent.left; right: parent.right }
			height: 65
                        border.color: "black"
                        border.width:  1
			color: "transparent"
			Text{
				id: poptxt
				wrapMode: Text.WordWrap
                                text: parent.parent.success ? "SUCCESS" : "ERROR"
				anchors { verticalCenter: parent.verticalCenter ; left: parent.left; leftMargin: 80}
			}

			Image{
				id: errimg
                                source: parent.parent.success ? "images/success.jpg" : "images/err.png"
				
				width: 48
				height: width
				opacity: 0.6
				anchors { verticalCenter: parent.verticalCenter; left: parent.left;  leftMargin: 10}
			}
		}
		
		
		Image{
			id: okimg
			source: "images/close.png"
			width: 64
			height: width
			anchors { bottom: parent.bottom; right: parent.right; bottomMargin: 10; rightMargin: 15 }
			MouseArea{
			anchors.fill: parent
			
			onClicked: popup.opacity = 0		
			}
		}
		
	}
}
