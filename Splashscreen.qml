import QtQuick 1.0

Rectangle {
    id: splashMain

    signal splashTimeout()
    property int timeout: 2500
    property string image: "images/splash.png"
    property bool show: false

    state: show ? "showingSplashScreen" : ""

    onStateChanged: {
        if (state == "showingSplashScreen" ){
            splashTimer.start();
        }
    }

    opacity: 0.0

    Image {
        source: image
        anchors.centerIn: parent
    }

    Timer {
        id: splashTimer
        interval: timeout
        running: false
        repeat: false;
        onTriggered: { splashMain.splashTimeout(); splashMain.show = false }
    }

    states: [
        State {
            name: "showingSplashScreen"
            PropertyChanges {
                target: splashMain
                opacity: 1.0
            }
        }
    ]

    transitions: [
        Transition {
            from: ""
            to: "showingSplashScreen"
            reversible: true
            PropertyAnimation {
                property: "opacity"
                duration: 500
            }
        }
    ]
}
