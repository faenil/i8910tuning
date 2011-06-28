import QtQuick 1.0

Rectangle{
	id: camera
	color:"transparent"
	clip: true
        width: 360
        height: 565
	Image{
        source: "images/background.png"
	x:-360
	fillMode: Image.Tile
	}


	function checkFocusStartup()
	{
		switch(i8910tuning.CheckPhotoFocus_slot()){
		case 0:
		photofocus.state = 'off'
		break
		case 1:
		photofocus.state = 'on'
		break
		}

		switch(i8910tuning.CheckVideoFocus_slot()){
		case 0:
		videofocus.state = 'off'
		break
		case 1:
		videofocus.state = 'on'
		break
		}


		switch(i8910tuning.checkSuppr_slot()){
		case 0:
		noisesuppr.state = 'on'
		break
		case 1:
		noisesuppr.state = 'off'
		break
		case -1: 
                noisesuppr.state = 'off'
                break
		}
                return 0;
	}


	Column{
	anchors.centerIn: parent
	spacing: 15
	
	Image{
	anchors.horizontalCenter: parent.horizontalCenter
	width: 260
	height: 75
        source: "images/butt.png"
	
	Text{
                anchors.centerIn:parent
		text: "Delete cache"
	}
	
		MouseArea{
			id: cacheButt
			anchors.fill: parent
                        onClicked: {if (i8910tuning.deleteGalleryCache_slot()) {page.errbox.success = false; page.errmsg.text = "Could not delete gallery cache"; page.errbox.opacity = 0.9;}}
                        onPressed: parent.source = "images/butt_pressed.png"
                        onReleased: parent.source = "images/butt.png"
		}
	}
	
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
                        onClicked: {i8910tuning.deleteEmptyCamera_slot(); page.errbox.success = true; page.errmsg.text = "Empty folders deleted!"; page.errbox.opacity = 1;}
		}

                states: State {
                    name: "pressed"; when: emptyfoldersButt.pressed == true
                    PropertyChanges { target: emptybutt; source: "images/butt_pressed.png" }
                }
	}
	
	Switch{ id: photofocus
	        opt1: "AF"
	        opt2: "PF"
			centreText: "Photo"

		function toggle() {
        		 if (photofocus.state == 'on'){
			
                                if (i8910tuning.PFphoto_slot() === 0) photofocus.state = 'off'
                                else { page.errbox.success = false; page.errbox.opacity = 0.8; page.errmsg.text = "Could not set photo PF"}
	         	}   
		 	else{
		
                                if (i8910tuning.AFphoto_slot() === 1) photofocus.state = 'on'
                                else { page.errbox.success = false; page.errbox.opacity = 0.8; page.errmsg.text = "Could not set photo AF"}
	     	 
			 }
     		}

	}

	Switch{ id: videofocus
		opt2: "PF" 
		opt1: "AF"
		centreText: "Video"
	    	
		function toggle() {
        		 if (videofocus.state == 'on'){
			
                                if (i8910tuning.PFvideo_slot() === 0) videofocus.state = 'off'
                                else { page.errbox.success = false; page.errbox.opacity = 0.8; page.errmsg.text = "Could not set video PF"}
	         	}   
		 	else{
		
                                if (i8910tuning.AFvideo_slot() === 1) videofocus.state = 'on'
                                else { page.errbox.success = false; page.errbox.opacity = 0.8; page.errmsg.text = "Could not set video AF"}
	     	 
			 }
     		}		
			
	}

	Switch{	id: noisesuppr
		opt1: "ON"
		opt2: "OFF"
		centreText: "NoiseSuppr"

		function toggle() {
        		 if (noisesuppr.state == 'on'){
			
                                if (i8910tuning.supprOFF_slot() === 0) noisesuppr.state = 'off'
                                else { page.errbox.success = false; page.errbox.opacity = 0.8; page.errmsg.text = "Could not disable noise suppressor"}
	         	}   
		 	else{
		
                                if (i8910tuning.supprON_slot() === 0) noisesuppr.state = 'on'
                                else { page.errbox.success = false; page.errbox.opacity = 0.8; page.errmsg.text = "Could not enable noise suppressor"}
	     	 
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
