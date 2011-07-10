import QtQuick 1.0

Rectangle{
	id: menu
	color: "transparent"

	Rectangle{
		id: crazyButton
		anchors.horizontalCenter: menu.horizontalCenter
		anchors.top: menu.top
		anchors.topMargin: 100
		width: 200; height: 50
		color: "black"

		Text{
			id: buttText
			text: "TurnBanana!!"
			color: "yellow"
			anchors.horizontalCenter: crazyButton.horizontalCenter
			anchors.verticalCenter: crazyButton.verticalCenter
			font.pointSize: 10; font.bold: true
		}

		MouseArea{
			id: buttArea
			anchors.fill: parent
		}

		states: State {
             		name: "pressed"; when: buttArea.pressed == true
             		PropertyChanges { target: crazyButton; color: "pink" }
             	}
	}

	Image{
	source:"images/Banana.png"
        id:banana
        anchors.bottom: menu.bottom
	anchors.bottomMargin: 30
	anchors.horizontalCenter: menu.horizontalCenter
        width:250
        height:290
	
	RotationAnimation on rotation{ running: buttArea.pressed; paused: buttArea.released; alwaysRunToEnd: false; loops: Animation.Infinite; duration: 800; to: banana.rotation+360}
	
	
	}
}
