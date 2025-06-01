import QtQuick
import QtQuick.Controls.Basic

Button {
    id: button

    background: Image {
        id: background
        anchors.fill: parent
        // width: 30
        // height: 30
        source: Qt.resolvedUrl('plus.png')
    }

    onPressed:{
        // button.width *= 0.8
        // button.height *= 0.8
        background.opacity = 0.5
    }
    onReleased:{
        // button.width *= 1.25
        // button.height *= 1.25
        background.opacity = 1
    }
}
