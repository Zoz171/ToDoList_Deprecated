import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ColumnLayout {
    id: root

    property int currentIndex
    signal addButtonClicked
    property alias headerText: taskSectionHeader.text

    spacing: 2

    RowLayout {
        spacing: 12
        //Layout.alignment: Qt.AlignVCenter
        Label {
            id: taskSectionHeader

            Layout.bottomMargin: 8

            font.pixelSize: 20
            font.bold: true

            text: "This is a Dummy header"
        }

        CustomButton {
            id: addButton
            Layout.alignment: Qt.AlignTop
            Layout.preferredWidth: 26
            Layout.preferredHeight: 26

            onClicked: root.addButtonClicked()
        }
    }

    ColumnLayout {
        id: columnOfTasks

        Repeater {
            id: repeater

            model: Backend.tasksModel[root.currentIndex]["tasks"]

            delegate: Task {
                required property string desc
                required property string date
                required property int index

                taskText: desc

            }

        }
    }

}
