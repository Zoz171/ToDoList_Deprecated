import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id: homePage

    header: Rectangle {

        anchors.left: parent.left
        anchors.right: parent.right

        color: '#43b05c'

        height: 60

        RowLayout {

            anchors.fill: parent
            RowLayout {

                Layout.leftMargin: 8

                Image {
                    source: Qt.resolvedUrl('qt_logo.png')
                    Layout.preferredWidth: 60
                    Layout.preferredHeight: 45
                    //fillMode: Image.PreserveAspectFit
                }

                Label {
                    id: appName

                    //Layout.alignment: Qt.AlignVCenter
                    Layout.alignment: Qt.AlignLeft
                    Layout.leftMargin: 10

                    text: "To-Do List"
                    color: 'white'
                    font.pixelSize: 18
                    font.bold: true
                }
            }

            Label {
                id: devName

                //Layout.alignment: Qt.AlignVCenter
                Layout.alignment: Qt.AlignRight
                Layout.rightMargin: 10

                text: "By: Ziad.M"
                font.pixelSize: 18
                font.bold: true
                color: 'white'

            }

        }


    }
}
