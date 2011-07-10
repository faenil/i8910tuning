import QtQuick 1.0

Item
{
id: imgrect
        width: 140; height: width+20
        //source:"images/cellbg.png"
	property variant group
	property alias path2: imgsel.source
	property alias path: imgcodec.source
        property alias name: codecText.text
	property alias idcell: imgcodec
	signal imgClick()
	
        Text{
            id: codecText
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter
        }

	Image{
		id:imgsel
                anchors.topMargin: 20
		anchors.fill: parent
		source: parent.path2
		opacity: 0
	}

	Image{
		id: imgcodec
                anchors.topMargin: 20
		anchors.fill: parent
		
		source: parent.path
		MouseArea {
			anchors.fill: parent
			onClicked: {imgClick() }
		}

		states: State{
			name: "selected"
			when: group.selected == imgcodec
			PropertyChanges {target: imgcodec; opacity: 0}
			PropertyChanges	{target: imgsel; opacity: 1}
				
		}

		transitions: Transition {
			from: ""
			to: "selected"
			PropertyAnimation { properties: "opacity"; duration: 300}
			reversible: true
		}
	}
}
