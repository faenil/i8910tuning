import QtQuick 1.0
import "popups.js" as Popups

Item{
	id: page
	width: 360; height: 640
        property alias popuptitle: poptxt.text
        property alias popuptitleimg: errimg.source
	property alias errmsg: errtxt
	property alias errbox: popup
        property alias helpbox: helppopup
        property alias fwidindex: fwidlist.currentIndex
        property alias helptext: helptxt.text
        property alias disableMouseBack : disableMouseBackground.enabled
        property alias loadingRect: loadingGrey
        property alias loadingTimerDynamic: loadingTimer2
        property alias loadingTimerLocked: loadingTimer3
        property alias loadingTimerSwitch: loadingTimer4
        property alias loadingTimerCache: loadingTimer5
        property alias loadingTimerFolders: loadingTimer6
        property alias loadingTimerTemp: loadingTimer7
        property alias loader: loaderGif
        property alias forceexit: forceexitpopup
        property alias forceexitmsg: forceexittxt.text

        VisualItemModel{
		id: itemModel

                Rectangle{
                    id:idpage
                    width: 360; height: 640
                    color: "transparent"

                    VisualItemModel{
                        id: fwidModel

                        Ids{id: ids}
                        IdStatus{id: idstatus}
                        UserAgent{id: userAgent}
                    }
                    ListView{
                        id: fwidlist
                        anchors { fill: parent }
                        model: fwidModel
                        orientation: ListView.Vertical
                        boundsBehavior: Flickable.StopAtBounds
                        flickDeceleration: 5000
                        highlightFollowsCurrentItem: true
                        highlightMoveDuration:240
                        highlightRangeMode: ListView.StrictlyEnforceRange
                        currentIndex: 1
                        //onCurrentIndexChanged: if (fwidlist.currentIndex == 0) bottomtxt.text = "Firmware ID Status"; else if (fwidlist.currentIndex == 1) bottomtxt.text = "ID Status"; else if (fwidlist.currentIndex == 2) bottomtxt.text = "User Agent";
                    }
                }

                /*Loader{
                    id : listloader
                    width: 360
                    height:640
                    source: "Utilities.qml"



                }*/

                Camera{id: camera; }
                Codecs{id: codecs;}
                KsSettings{id: kssettings;}
                Clock{id: ocsettings;}
                Mic{id:mic}
                Utilities{id:utilities}
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
                //onCurrentIndexChanged: if (view.currentIndex == 0) {if (fwidlist.currentIndex == 0) bottomtxt.text = "Firmware ID Status"; else if (fwidlist.currentIndex == 1) bottomtxt.text = "ID Status"; else if (fwidlist.currentIndex == 2) bottomtxt.text = "User Agent";} else if (view.currentIndex == 1) bottomtxt.text = "Camera"; else if (view.currentIndex == 2) bottomtxt.text = "Codecs"; else if (view.currentIndex == 3) bottomtxt.text = "Scrolling Settings"; else if (view.currentIndex == 4) bottomtxt.text = "OC Settings"; else if (view.currentIndex == 5) bottomtxt.text = "Microphone Settings";
                onCurrentIndexChanged:  menuListView.currentIndex = view.currentIndex

        }

        Rectangle{
            id:topbar
            height: 75
            width: parent.width
            anchors.top: parent.top
            //source: "images/bottom.png"
            gradient: Gradient{
                    GradientStop { position: 0.7; color:"black"}
                    GradientStop { position: 1.0; color:"transparent"}
                    }
            Image{
                id:helpButtImg

                source: "images/help_home.png"
                width: 48
                height: 48
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.leftMargin: 10
                MouseArea{
                    id: helpbutt
                    anchors.fill: parent
                    onClicked:{
                        switch (view.currentIndex){
                        case 0:
                            helptext = "Welcome to i8910tuning by faenil. This is a system tweaking software, " +
                                       "and it is meant for medium-advanced users only.\n\n" +
                                    "How to use?\n It's very easy, just swipe through the settings screens with your finger, or scroll the menu bar at the bottom to change screen, as easy as that!\n\n" +
                                    "IDChange screen:\nIn this screen you can change FirmwareID and UserAgent. To change them, just tap on the corresponding box (or swipe up or down) and then choose the desired phone from the grid.\n" +
                                    "NOTE: Open4All patch must be active in RomPatcher for the FirmwareID change to work properly!\n"+
                                    "FirmwareID change is used to make OviSuite recognize the i8910, while the UserAgent change is used to change the user agent of the web browser, which could be usefult to surf websites which are restricted to Nokia phones (i.e. Nokia Store website, ecc), or to use some applications which perform a check on the useragent, i.e OviStore (which needs a Nokia UserAgent to work), and TrackID (which need a SonyEricsson phone UserAgent to work).\n\n"+
                                    "How to make OviSuite recognize my i8910?\n"+
                                    "1) Switch FirmwareID to 5800\n"+
                                    "2) Go to RomPatcher, activate FWVersionInC patch and set it to Auto (options->Add to Auto)\n"+
                                    "3) Enjoy a better suite :)\n\n"+
                                    "The current FWID and UserAgent is displayed inside the boxes.\n"
                            break
                        case 1:
                            helptext = "Photo and Video settings:\n\n"+
                                    "This screen is used to change camera related settings. Each switch shows the current value of the corresponding setting.\n"+
                                    "- Delete Empty Folders: press this buttons to delete the useless empty folder automatically created by the camera application. All empty folders in E:/Videos, F:/Videos, E:/Images/Camera, F:/Images/Camera and their subdirectories will be deleted.\n"+
                                    "- WDR Mode: use the switch to change WDR Mode (Wide Dynamic Range), you can set it to ALWAYS ON or ALWAYS OFF.\n"+
                                    "- Photo Focus: hit on the slider or move the slider to change camera focus mode. AF means AutoFocus, while PF stands for PanFocus, which is the fixed focus, useful when you need to take fast photos.\n" +
                                    "- Video Focus: same as photo focus, but this one is related to the videocamera.\n"+
                                    "- Noise Suppressor: use this slider to Enable or Disable the noise suppressor in videorecording. With noise suppress enabled, you'll hear less noise in recorded videos, but the audio will have a lower volume and a narrower frequency range.\n\n" +
                                    "After you have changed the settings, press the camera icon to start the camera and enjoy!"
                            break
                        case 2:
                            helptext ="JPEG Codecs:\n\n"+
                                    "In this screen you can select the JPEG codec you want to use when taking photos. Each codec is extracted by a different mobile phone or device.\n"+
                                    "You can easily recognize the currently used codec by looking at its image. The one which is in use will have an aura around its image.\n"+
                                    "The JPEG Codec is the codec used to compress photos into jpeg files, this means you won't see big quality changes when switching JPEG codecs, because only the compression algorythm is touched, and not the way the camera actually takes the photos.\n\n" +
                                    "After you have selected a new codec, REBOOT FOR THE CHANGE TO TAKE EFFECT.\n"
                            break
                        case 3:
                            helptext ="Kinetic Scrolling settings:\n\n"+
                                    "In this screen you have many adjustable settings. They're all related to the way the kinetic scrolling is handled in Symbian OS. When you open the i8910tuning app, each slider in this screen shows the current value of the corresponding setting.\n"+
                                    "You can change the values of the sliders just by moving the know of the corresponding slider. Plus and minus can be used for finetuning. Once you have set all the sliders to the desired values, hit the Apply button to apply the changes. Changes will immediately take effect on the system, you need no reboot.\n\n"+
                                    "Kinetic scrolling is strictly related to physics, so expect the settings to have physics-world meanings. NOTE: I can't give you a better explanation than the one it is given here, so please do not ask for it.\n"+
                                    "Short description of the keys:"+
                                    "- Mass: the value indicates the mass of the view.\n"+
                                    "- Gravity: the value indicates the gravity/friction applied.\n"+
                                    "- Surface ERP: Surface Error Reduction Parameter. It is a rate of how fast the data error is reduced.\n"+
                                    "- Surface CFM: Surface Constraint Force Mixing.\n"+
                                    "- Highlight TOut: Timeout for highlight.\n"+
                                    "- Drag Treshold: Treshold for drag.\n"+
                                    "- Frame Delay\n"+
                                    "- MinFrameInterval: the minimum frame interval.\n"+
                                    "- KS Enabled/Disabled: enable or disable Kinetic Scrolling in the system.\n"+
                                    "- ShortListEmpty: Short List Empty Space, in %.\n"+
                                    "- LongListEmpty: Long List Empty Space, in %.\n"
                            break
                        case 4:
                            helptext ="CPU Clock:\n\n"+
                                    "Here you can change the CPU min/med/max clock and related settings. Each slider shows the current value of the corresponding setting.\n"+
                                    "How to change CPU speed?\n"+
                                    "1) Move the knob of the sliders to set the desired idle/medium/maximum clock frequency, and then use the plus and minus for finetuning, if needed.\n"+
                                    "2) Once clock sliders have been set, use the Create Patch button to create the RomPatcher patch. This step may take 5-6 seconds, so please wait for it to complete. A success/error message will appear when it's done."+
                                    "3) Press Menu hardware button on your i8910 and open RomPatcher.\n"+
                                    "4) Apply the clock patch and set it to Auto (options -> Add to Auto). The name of the patch is a concatenation of the values of the clock you have choosen. For example if you have chosen 500 as minimum freq, 600 as medium, and 700 as maximum, the patch will be named 500_600_700.\n"+
                                    "5) Enjoy!\n\n"+
                                    "DO NOT APPLY MORE CLOCK PATCHES AT ONCE. ALWAYS REMEMBER TO DISABLE AND REMOVE FROM AUTO THE OLDER PATCH BEFORE ENABLING THE NEWER ONE.\n\n"+
                                    "More features:\n"+
                                    "- Dynamic Frequency: press this button to enable Dynamic Frequency mode. This means the CPU Speed will be adjusted to the CPU load, i.e. it will go from minimum/2 frequency to maximum frequncy, depending on what software you are using. NOTE THAT THE LOWEST FREQUENCY WITH THIS MODE IS MINIMUM/2 AND SOMETIMES MINIMUM/4. This is considered normal. Please wait 5-6 seconds after you have hit the button, do not keep clicking around until you see the message box.\n"+
                                    "- Locked Frequency: this button is to enable Locked Frequency mode. This means CPU Speed will always be Maximum, thus consuming more battery power. Please wait 5-6 seconds after you have hit the button, do not keep clicking around until you see the message box.\n"+
                                    "- Get Clock: this button will show you the current CPU clock.\n\n"+
                                    "NOTE: Sometimes it happens that once you create the patch the frequency mode is changed. To solve this, just change the frequency mode again to your desired one, by hitting the correct button.\n"
                            break
                        case 5:
                            helptext ="This screen is for modifying microphone sensitivity settings.\n"+
                                    "NOTE: The sliders here do not show the current value of the settings, because there is no way to retrieve such values.\n\n"+
                                    "This settings represent the sensitivity of the microphone while recording videos, and the sensitivity is here expressed in dB. Lower sensitivity values are used when you want to record a videos in a loud environmente such as a disco or a concert. The default values in i8910 are 24-25.\n"+
                                    "To change the values of the settings just move the knob of the sliders and use plus and minus for finetuning, and then hit the Apply button.\n"+
                                    "NOTE: Once you have hit Apply, please wait some seconds for the process to complete. A message box will show once the process has completed.\n"

                            break
                        case 6:
                            helptext = "This screen contains many utilities:\n\n" +
                                    "NOTE: You need CRepository4All patch to be active in RomPatcher if you want to add a new orientation setting for an app which is not in the given list."+
                                    "- Orientation settings: you can change the orientation setting of your favourite app with this utility. It enough to write the UID of your app in the white box (or select one of the apps from the list) and then click on one of the three icons in the lower part to set the desired orientation mode. You can set Portrait Only, Landscape Only, or Portrait/Landscape modes."+
                                    "- Delete Cache: press this button to delete the gallery cache, useful when you have some broken images in the gallery.\n"+
                                    "- Delete Temp files: press this button to delete all the files in C:/Private/1020735b and free up some space in C drive.\n"+
                                    "- Call Summary : use the switch to Enable or Disable the call summary after the end of calls.\n"+
                                    "- Dim Light: use the switch to Enable or Disable the dim light mode, which lowers the screen backlight thus saving more battery power.\n"


                            break
                        }

                        page.loadingRect.opacity=0.6;
                        helpbox.opacity = 1
                        disableMouseBackground.enabled = true
                    }
                }

                states: State{
                        name: "pressed"
                        when: helpbutt.pressed
                        PropertyChanges {target: helpButtImg; opacity: 0.7}
                }
            }
            Image{
                id:donateimg
                source: "images/donate.gif"
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.verticalCenter: parent.verticalCenter;

                MouseArea{
                    id:donatebutt
                    anchors.fill: parent
                    onClicked: {
                        Popups.confirmcomp = Qt.createComponent("ConfirmBox.qml");
                        Popups.confirmitem = Popups.confirmcomp.createObject(page)
                        Popups.confirmitem.anchors.centerIn = page;
                        Popups.confirmitem.title = "Donate"
                        Popups.confirmitem.msg = "Thanks. You'll now be redirected to Paypal's webpage to complete the donation."

                        page.loadingRect.opacity = 0.6

                        Popups.confirmitem.opacity = 1;

                        page.disableMouseBack = true

                        Popups.confirmitem.confirmed.connect(Popups.donate)
                    }

                }

                states: State{
                        name: "pressed"
                        when: donatebutt.pressed
                        PropertyChanges {target: donatetxt; color: "white"}
                }
            }

            Image{
                id:exitimg
                source: "images/exit.png"

                width: 48
                height: width
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.top: parent.top
                anchors.topMargin: 10

                MouseArea{
                    id:exitbutt
                    anchors.fill: parent
                    onClicked: {
                        Popups.confirmcomp = Qt.createComponent("ConfirmBox.qml");
                        Popups.confirmitem = Popups.confirmcomp.createObject(page)
                        Popups.confirmitem.anchors.centerIn = page;
                        Popups.confirmitem.title = "EXIT"
                        Popups.confirmitem.msg = "Do you really want to exit?"

                        page.loadingRect.opacity = 0.6

                        Popups.confirmitem.opacity = 1;

                        page.disableMouseBack = true

                        Popups.confirmitem.confirmed.connect(Popups.confirmExit)
                    }

                }

                states: State{
                        name: "pressed"
                        when: exitbutt.pressed
                        PropertyChanges {target: exitimg; opacity : 0.7}
                }
            }
        }

        Rectangle{
            id:menulist
            height: 75
            width: parent.width
            anchors.bottom: parent.bottom
            //source: "images/bottom.png"
            gradient: Gradient{
                    GradientStop { position: 0.0; color:"transparent"}
                    GradientStop { position: 0.30; color:"black"}
                    }

            MouseArea{
                anchors.fill: parent
            }

            ListModel{
                id: menuListModel

                ListElement{
                    name: "IDChange"
                }
                ListElement{
                    name: "Camera"
                }
                ListElement{
                    name: "JPEGCodecs"
                }
                ListElement{
                    name: "KSSettings"
                }
                ListElement{
                    name: "CPUClock"
                }
                ListElement{
                    name: "Microphone"
                }
                ListElement{
                    name: "Utilities"
                }
            }

            Component{
                id: menuDelegate
                Item{
                    height: parent.parent.height
                    width: menutxt.width+6
                    Item{
                        width: menutxt.width
                        height:parent.height
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter

                        Text{
                            id: menutxt;
                            anchors.horizontalCenter: parent.horizontalCenter;
                            anchors.verticalCenter: parent.verticalCenter;
                            text: name;
                            color: "grey"
                            font.pointSize: 14

                            states:State{
                                name:"selected"
                                when: menuListView.currentIndex == index
                                PropertyChanges{target: menutxt; color: "White"}
                            }
                        }

                        MouseArea{
                            anchors.fill: parent
                            onClicked:  {
                                menuListView.currentIndex = index;
                                view.currentIndex = index;

                                /*switch (index){
                                case 0:{
                                    listloader.source = "IdStatus.qml";
                                    break
                                }
                                case 1:
                                    listloader.source = "Camera.qml";
                                    break
                                case 2:
                                    listloader.source = "Codecs.qml"
                                    break
                                case 3:
                                    listloader.source = "KsSettings.qml"
                                    break
                                case 4:
                                    listloader.source = "Clock.qml"
                                    break
                                case 5:
                                    listloader.source = "Mic.qml"
                                    break
                                case 6:
                                    listloader.source = "Utilities.qml"
                                    break
                                }*/
                            }
                        }
                    }


                }

            }

            //highlight component
            Component{
                id:high;
                Rectangle {
                    height: 40;
                    width: menuListView.currentItem.width;
                    anchors.verticalCenter: parent.verticalCenter ;
                    x: menuListView.currentItem.x;
                    color: "green"; radius: 10
                }
            }

            ListView{
                id:menuListView
                spacing: 20
                clip:true
                anchors.fill: parent
                anchors.leftMargin: 5
                anchors.rightMargin: 5
                orientation: ListView.Horizontal
                //highlight: high
                highlightFollowsCurrentItem: true
                highlightMoveDuration:240
                highlightRangeMode: ListView.NoHighlightRange
                currentIndex: 1
                model: menuListModel
                delegate: menuDelegate
            }
        }



        /*Rectangle{
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
        }*/


        // MOUSEAREA USED TO DISABLE EVENTS TO BACKGROUND WHEN POPUP IS OPENED
        MouseArea{
            z: 80
            id:disableMouseBackground
            anchors.fill: parent
            enabled:false
        }

        Rectangle{
            id:loadingGrey
            anchors.fill:parent
            color: "black"
            opacity: 0


        }
        // POPUP ELEMENT
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
				anchors { verticalCenter: parent.verticalCenter ; left: parent.left; leftMargin: 80}
			}

			Image{
				id: errimg
				
				width: 48
				height: width
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
			
                        onClicked: {popup.opacity = 0; page.loadingRect.opacity=0; disableMouseBackground.enabled = false}
			}
		}
		
	}


        //HELP ELEMENT
        Rectangle{
                id: helppopup
                z: 100
                width: parent.width - 20
                height: parent.height - 150
                anchors.centerIn: parent
                opacity:0
                border.color: "black"
                Image{
                        id: helpbackground
                        anchors.fill : parent
                        source: "images/popup.png"
                }
                VisualItemModel{
                    id:helpmodel

                    Text{
                        width: helpscrollview.width

                            id: helptxt
                            wrapMode: Text.Wrap
                            text: ""
                    }
                }


                ListView{
                    id:helpscrollview
                    anchors {top: helptitle.bottom; bottom: closeimg.top; topMargin: 20; bottomMargin: 20; leftMargin: 20; left:parent.left; right: parent.right; rightMargin:20;}
                    clip:true
                    model:helpmodel
                    boundsBehavior: Flickable.DragOverBounds
                    orientation: ListView.Vertical
                    flickDeceleration: 1000



                }

                Behavior on opacity {PropertyAnimation {duration: 200}}




                Rectangle{
                        id: helptitle
                        anchors { top: parent.top; left: parent.left; right: parent.right }
                        height: 65
                        border.color: "black"
                        border.width:  1
                        color: "transparent"
                        Text{
                                id: titletxt
                                wrapMode: Text.WordWrap
                                text: "Help"
                                anchors { verticalCenter: parent.verticalCenter ; left: parent.left; leftMargin: 80}
                        }

                        Image{
                                id: helpimg
                                source: "images/help.png"

                                width: 48
                                height: width
                                anchors { verticalCenter: parent.verticalCenter; left: parent.left;  leftMargin: 10}
                        }
                }


                Image{
                        id: closeimg
                        source: "images/close.png"
                        width: 64
                        height: width
                        anchors { bottom: parent.bottom; right: parent.right; bottomMargin: 10; rightMargin: 15 }
                        MouseArea{
                        anchors.fill: parent

                        onClicked: {helppopup.opacity = 0; page.loadingRect.opacity=0; disableMouseBackground.enabled = false}
                        }
                }

        }

        //FORCE EXIT POPUP, ONLY USED FOR WDR SETTING CHANGING
        Rectangle{
                id: forceexitpopup
                z: 100
                width: 260
                height: 300
                anchors.centerIn: parent
                opacity:0
                border.color: "black"
                property bool success:  true
                Image{
                        id: popexitbackground
                        anchors.fill : parent
                        source: "images/popup.png"
                }

                Text{
                        id: forceexittxt
                        wrapMode: Text.WordWrap
                        text: ""
                        anchors {leftMargin: 20; left:parent.left; right: parent.right; rightMargin:20; verticalCenter:parent.verticalCenter}
                }

                Behavior on opacity {PropertyAnimation {duration: 200}}

                Rectangle{
                        id: forceexittitle
                        anchors { top: parent.top; left: parent.left; right: parent.right }
                        height: 65
                        border.color: "black"
                        border.width:  1
                        color: "transparent"
                        Text{
                                id: exitpoptxt
                                wrapMode: Text.WordWrap
                                text: "WARNING"
                                anchors { verticalCenter: parent.verticalCenter ; left: parent.left; leftMargin: 80}
                        }

                        Image{
                                id: forceexitimg

                                source: "images/warning.png"
                                width: 48
                                height: width
                                anchors { verticalCenter: parent.verticalCenter; left: parent.left;  leftMargin: 10}
                        }
                }


                Image{
                        id: exitpopupimg
                        source: "images/yes.png"
                        width: 64
                        height: width
                        anchors { bottom: parent.bottom; right: parent.right; bottomMargin: 10; rightMargin: 15 }
                        MouseArea{
                        anchors.fill: parent

                        onClicked: {Qt.quit()}
                        }
                }

        }


        AnimatedImage{
            id: loaderGif
            anchors.centerIn: parent

            opacity : 0
            source: "images/loader.gif"

            Text{
                anchors.centerIn: parent
                text: "Please wait..."
            }

            Timer{
                id:loadingTimer2
                interval: 200; running: false; repeat: false;
                onTriggered: Popups.set_dynamic_mode()
            }
            Timer{
                id:loadingTimer3
                interval: 200; running: false; repeat: false;
                onTriggered: Popups.set_locked_mode()
            }
            Timer{
                id:loadingTimer4
                interval: 200; running: false; repeat: false;
                onTriggered: Popups.switch_mode()
            }
            Timer{
                id:loadingTimer5
                interval: 200; running: false; repeat: false;
                onTriggered: Popups.deleteGalleryCacheFun()
            }
            Timer{
                id:loadingTimer6
                interval: 200; running: false; repeat: false;
                onTriggered: Popups.deleteCameraFoldersFun()
            }
            Timer{
                id:loadingTimer7
                interval: 200; running: false; repeat: false;
                onTriggered: Popups.deleteTempFilesFun()
            }
        }



}
