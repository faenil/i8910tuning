function checkFocusAndWDRStartup()
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
        noisesuppr.state = 'off'
        break
        case 1:
        noisesuppr.state = 'on'
        break
        default:
        noisesuppr.knob_x = 40
        break
        }

        switch(i8910tuning.getWDR_slot()){
        case 0:
        wdr.state = 'off'
        break
        case 1:
        wdr.state = 'on'
        break
        case -1:
        wdr.knob_x = 40
        break
        }
        return 0;
}

function getclock(){
    var clockvalues = i8910tuning.getClock_slot()
    min.value = clockvalues[0]
    medium.value = clockvalues[1]
    max.value = clockvalues[2]
}

function getCallSummaryAndLight()
{
        switch(i8910tuning.getcallSummary_slot()){
        case 0:
        callsummary.state = 'off'
        break
        case 1:
        callsummary.state = 'on'
        break
        }

        switch(i8910tuning.getDimLight_slot()){
        case 0:
        dimmedlight.state = 'off'
        break
        case 1:
        dimmedlight.state = 'on'
        break
        }
}

function lightRightUA(){
        switch (i8910tuning.inUseUA()){
        case -1:
        uagrid.selected = -1
        // COULD NOT DETECT FW IN USE, I RESET BUTTONS
        break
        case 2:
        uagrid.selected = i8910.idcell
        break
        case 3:
        uagrid.selected = v52_5800.idcell
        break
        case 4:
        uagrid.selected = vivaz.idcell
        break
        case 5:
        uagrid.selected = c6.idcell
        break
        case 6:
        uagrid.selected = desktop.idcell
        break
        case 7:
        uagrid.selected = iphone.idcell
        break
        case 8:
        uagrid.selected = android.idcell
        break
        default:
        break
        }
return 0
}

function getks(){
    var ksvalues = i8910tuning.getks_slot()
    mass.value = ksvalues[0]
    gravity.value = ksvalues[1]
    erp.value = ksvalues[2]
    cfm.value = ksvalues[3]
    highlight_timeout.value = ksvalues[4]
    drag_threshold.value = ksvalues[5]
    frame_delay.value = ksvalues[6]
    min_frame_interval.value = ksvalues[7]
    ode_enabled.value = ksvalues[8]
    short_list_empty_space.value = ksvalues[9]
    long_list_empty_space.value = ksvalues[10]
}

function lightRightFW(){
        switch (i8910tuning.inUseFWID()){
        case -1:
        fwgrid.selected = -1
        // COULD NOT DETECT FW IN USE, I RESET BUTTONS
        break
        case 2:
        fwgrid.selected = i8910.idcell
        break
        case 3:
        fwgrid.selected = v52_5800.idcell
        break
        case 4:
        fwgrid.selected = vivaz.idcell
        break
        case 5:
        fwgrid.selected = c6.idcell
        break
        case 6:
        fwgrid.selected = n8.idcell
        break
        default:
        break
        }
return 0
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
