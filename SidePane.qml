import QtQuick
import QtQuick.Controls

Pane {

    width: parent.width / 3
    height: parent.height

    background: Rectangle {
        color: 'black'
    }

    Switch {
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 50
    }
}
