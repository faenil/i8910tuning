import QtQuick 1.0
import "startupChecks.js" as Checks
import "popups.js" as Popups

Rectangle{
        id: codecs
	color:"transparent"
	clip: true
        width: 360; height: 640;

	Image{
        source: "images//background.png"
	x:-720
	fillMode: Image.Tile
	}

        Component.onCompleted: Checks.lightRightCodec()

	Grid{
		id: codecgrid	
		anchors.topMargin: 10
		anchors.centerIn: parent
	
                columns:3
		property variant selected

		Column{
			id: codcol
                        spacing:20
                        Imgcodec {id: i8910; width:120; name: "i8910"; onImgClick: if (i8910tuning.i8910_slot())  {Popups.showErrorBox("Could not change codec to i8910");} else group.selected = idcell; path: "images/i8910.png"; path2: "images/i8910_sel.png"; group: codecgrid}
                        Imgcodec {id: i8510; width:120; name: "i8510"; onImgClick: if (i8910tuning.i8510_slot()) {Popups.showErrorBox("Could not change ID to i8510")} else group.selected = idcell; path: "images/i8510.png"; path2: "images/i8510_sel.png"; group: codecgrid}
                        Imgcodec {id: milestone; width:120; name:  "Milestone"; onImgClick: if (i8910tuning.milestone_slot()) {Popups.showErrorBox("Could not change ID to Milestone");} else group.selected = idcell; path: "images/milestone.png"; path2: "images/milestone_sel.png"; group: codecgrid}
		}
		
		Column{
			id: codcol2
                        spacing:20
                        Imgcodec {id: droidx; width:120; name: "DroidX"; onImgClick: if (i8910tuning.droidx_slot()) {Popups.showErrorBox("Could not change ID to DroidX"); } else group.selected = idcell; path: "images/droidx.png"; path2: "images/droidx_sel.png"; group: codecgrid}
                        Imgcodec {id: palm; width:120; name: "PalmPre"; onImgClick: if (i8910tuning.palm_slot()) {Popups.showErrorBox("Could not change ID to PalmPre"); } else group.selected = idcell; path: "images/palm.png"; path2: "images/palm_sel.png"; group: codecgrid}
		}
                Column{
                        id: codcol3
                        spacing:20
                        Imgcodec {id: vivaz; width:120; name: "Vivaz"; onImgClick: if (i8910tuning.vivaz_slot()) {Popups.showErrorBox("Could not change ID to Vivaz"); } else group.selected = idcell; path: "images/vivaz.png"; path2: "images/vivaz_sel.png"; group: codecgrid}
                        Imgcodec {id: beagle; width:120; name: "Beagle"; onImgClick: if (i8910tuning.devplat_slot()){Popups.showErrorBox("Could not change ID to Linux DevPlat"); } else group.selected = idcell; path: "images/beagleboard.png"; path2: "images/beagleboard_sel.png"; group: codecgrid}
                        Imgcodec {id: n900; width:120; name: "N900"; onImgClick: if (i8910tuning.n900_slot()) {Popups.showErrorBox("Could not change ID to N900"); } else group.selected = idcell; path: "images/n900.png"; path2: "images/n900_sel.png"; group: codecgrid}
                }
	}
}
