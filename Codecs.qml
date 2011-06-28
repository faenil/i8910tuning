import QtQuick 1.0


Rectangle{
        id: codecs
	color:"transparent"
	clip: true
        width: 360; height: 565;

	Image{
        source: "images//background.png"
	x:-720
	fillMode: Image.Tile
	}

	function lightRightCodec(){
		switch (i8910tuning.inUseJpeg()){
		case 2:
		i8910.group.selected = i8910.idcell
		break
		case 3:
		i8510.group.selected = i8510.idcell
		break
		case 4:
		vivaz.group.selected = vivaz.idcell
		break
		case 5:
		palm.group.selected = palm.idcell
		break
		case 6:
		milestone.group.selected = milestone.idcell
		break
		case 7:
		droidx.group.selected = droidx.idcell
		break
		case 8:
		beagle.group.selected = beagle.idcell
		break
		case 9:
		n900.group.selected = n900.idcell
		break
		case 22:
		i8910.group.selected = i8910.idcell
		break
		case 33:
		i8510.group.selected = i8510.idcell
		break
		case 44:
		vivaz.group.selected = vivaz.idcell
		break
		case 55:
		palm.group.selected = palm.idcell
		break
		case 66:
		milestone.group.selected = milestone.idcell
		break
		case 77:
		droidx.group.selected = droidx.idcell
		break
		case 88:
		beagle.group.selected = beagle.idcell
		break
		case 99:
		n900.group.selected = n900.idcell
		break
		default:
		break
		}
	return 0
	}
	


	Grid{
		id: codecgrid	
		anchors.topMargin: 10
		anchors.centerIn: parent
	
                columns:3
		property variant selected

		Column{
			id: codcol
                        spacing:20
                        Imgcodec {id: i8910; width:120; name: "i8910"; onImgClick: if (i8910tuning.i8910_slot())  {page.errbox.success = false;page.errmsg.text = "Could not change codec to i8910"; page.errbox.opacity = 1;} else group.selected = idcell; path: "images/i8910.png"; path2: "images/i8910_sel.png"; group: codecgrid}
                        Imgcodec {id: i8510; width:120; name: "i8510"; onImgClick: if (i8910tuning.i8510_slot()) {page.errbox.success = false;page.errmsg.text = "Could not change ID to i8510"; page.errbox.opacity = 1;} else group.selected = idcell; path: "images/i8510.png"; path2: "images/i8510_sel.png"; group: codecgrid}
                        Imgcodec {id: milestone; width:120; name:  "Milestone"; onImgClick: if (i8910tuning.milestone_slot()) {page.errbox.success = false;page.errmsg.text = "Could not change ID to Milestone"; page.errbox.opacity = 1;} else group.selected = idcell; path: "images/milestone.png"; path2: "images/milestone_sel.png"; group: codecgrid}
		}
		
		Column{
			id: codcol2
                        spacing:20
                        Imgcodec {id: droidx; width:120; name: "DroidX"; onImgClick: if (i8910tuning.droidx_slot()) {page.errbox.success = false;page.errmsg.text = "Could not change ID to DroidX"; page.errbox.opacity = 1;} else group.selected = idcell; path: "images/droidx.png"; path2: "images/droidx_sel.png"; group: codecgrid}
                        Imgcodec {id: palm; width:120; name: "PalmPre"; onImgClick: if (i8910tuning.palm_slot()) {page.errbox.success = false;page.errmsg.text = "Could not change ID to PalmPre"; page.errbox.opacity = 1;} else group.selected = idcell; path: "images/palm.png"; path2: "images/palm_sel.png"; group: codecgrid}
		}
                Column{
                        id: codcol3
                        spacing:20
                        Imgcodec {id: vivaz; width:120; name: "Vivaz"; onImgClick: if (i8910tuning.vivaz_slot()) {page.errbox.success = false;page.errmsg.text = "Could not change ID to Vivaz"; page.errbox.opacity = 1;} else group.selected = idcell; path: "images/vivaz.png"; path2: "images/vivaz_sel.png"; group: codecgrid}
                        Imgcodec {id: beagle; width:120; name: "Beagle"; onImgClick: if (i8910tuning.devplat_slot()){page.errbox.success = false;page.errmsg.text = "Could not change ID to Linux DevPlat"; page.errbox.opacity = 1;} else group.selected = idcell; path: "images/beagleboard.png"; path2: "images/beagleboard_sel.png"; group: codecgrid}
                        Imgcodec {id: n900; width:120; name: "N900"; onImgClick: if (i8910tuning.n900_slot()) {page.errbox.success = false;page.errmsg.text = "Could not change ID to N900"; page.errbox.opacity = 1;} else group.selected = idcell; path: "images/n900.png"; path2: "images/n900_sel.png"; group: codecgrid}
                }
	}
}
