import QtQuick 1.0
import "startupChecks.js" as Checks
import "popups.js" as Popups

Item{
	id: camera
        //color:"transparent"
        width: 360
        height: 640

        Component.onCompleted: Checks.checkFocusAndWDRStartup()

        property int mode: 0

	Image{
        source: "images/bg2.jpg"

	}

	Column{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top:  parent.top
        anchors.topMargin: 75
        spacing: 5

	
	Image{
        id:emptybutt
	anchors.horizontalCenter: parent.horizontalCenter
	width: 260
	height: 75
        source: "images/butt.png"
                Text{
                    anchors.centerIn:parent
                    text: "Delete empty folders"
                }
	
		MouseArea{
			id: emptyfoldersButt
			anchors.fill: parent
                        onClicked: {
                            Popups.confirmcomp = Qt.createComponent("ConfirmBox.qml");
                            Popups.confirmitem = Popups.confirmcomp.createObject(page)
                            Popups.confirmitem.anchors.centerIn = page;
                            Popups.confirmitem.title = "WARNING"
                            Popups.confirmitem.msg = "Do you really want to delete empty folders created by camera application?"
                            page.loadingRect.opacity=0.6;

                            Popups.confirmitem.opacity = 1;
                            page.disableMouseBack = true

                            Popups.confirmitem.confirmed.connect(Popups.deleteCameraFolders)

                        }
		}

                states: State {
                    name: "pressed"; when: emptyfoldersButt.pressed == true
                    PropertyChanges { target: emptybutt; source: "images/butt_pressed.png" }
                }
	}
	
        Switch{ id: wdr
                opt2: "OFF"
                opt1: "ON"
                centreText: "WDR"
                anchors.horizontalCenter: parent.horizontalCenter

                function toggle() {

                    if (wdr.state == 'on'){
                        if (i8910tuning.wdr_slot() === 0) { wdr.state = 'off'; page.loadingRect.opacity=0.7; page.forceexit.opacity = 1; page.forceexitmsg = "WDR Mode changed, i8910tuning will now close, and camera focus settings reset to default."}
                        else { wdr.knob_x = wdr.maxpixel; Popups.showErrorBox("Could not set WDR to ALWAYS OFF")}
                    }
                    else{
                        if (i8910tuning.wdr_slot() === 0) {wdr.state = 'on'; page.loadingRect.opacity=0.7; page.forceexit.opacity = 1;page.forceexitmsg = "WDR Mode changed, i8910tuning will now close, and camera focus settings reset to default."}
                        else { wdr.knob_x = wdr.minpixel; Popups.showErrorBox("Could not set WDR to ALWAYS ON")}
                    }

                }

        }

	Switch{ id: photofocus
            opt1: "AF"
            opt2: "PF"
            centreText: "Photo"
            anchors.horizontalCenter: parent.horizontalCenter

            function toggle() {
                if (photofocus.state == 'on'){

                    if (i8910tuning.PFphoto_slot() === 0) photofocus.state = 'off'
                    else { photofocus.knob_x = photofocus.maxpixel; Popups.showErrorBox("Could not set photo PF")}
                }
                else{

                    if (i8910tuning.AFphoto_slot() === 1) photofocus.state = 'on'
                    else { photofocus.knob_x = photofocus.minpixel; Popups.showErrorBox("Could not set photo AF")}

                }
            }

	}

	Switch{ id: videofocus
		opt2: "PF" 
		opt1: "AF"
		centreText: "Video"
                anchors.horizontalCenter: parent.horizontalCenter

		function toggle() {
        		 if (videofocus.state == 'on'){
			
                                if (i8910tuning.PFvideo_slot() === 0) videofocus.state = 'off'
                                else { videofocus.knob_x = videofocus.maxpixel; Popups.showErrorBox("Could not set video PF")}
	         	}   
		 	else{
		
                                if (i8910tuning.AFvideo_slot() === 1) videofocus.state = 'on'
                                else {videofocus.knob_x = videofocus.minpixel; Popups.showErrorBox("Could not set video AF")}
	     	 
			 }
     		}		
			
	}

	Switch{	id: noisesuppr
		opt1: "ON"
		opt2: "OFF"
		centreText: "NoiseSuppr"
                anchors.horizontalCenter: parent.horizontalCenter

		function toggle() {
        		 if (noisesuppr.state == 'on'){
			
                                if (i8910tuning.supprOFF_slot() === 0) noisesuppr.state = 'off'
                                else {  noisesuppr.knob_x = noisesuppr.maxpixel; Popups.showErrorBox("Could not disable noise suppressor")}
	         	}   
		 	else{
		
                                if (i8910tuning.supprON_slot() === 0) noisesuppr.state = 'on'
                                else {  noisesuppr.knob_x = noisesuppr.minpixel; Popups.showErrorBox("Could not enable noise suppressor")}
	     	 
			 }
     		}	
	}

	Image{
	anchors.horizontalCenter: parent.horizontalCenter
	width: 128
	height: 128
        source: "images/camera.png"
	
		MouseArea{
			id: camerabuttstart
			anchors.fill: parent
			onClicked: i8910tuning.startcamera_slot()
		}
	}
   }

}

