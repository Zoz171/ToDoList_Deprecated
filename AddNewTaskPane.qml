import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Pane {
    id: root

    signal cancelButtonClicked
    signal addButtonClicked

    property alias day: day.currentText
    property alias month: month.currentText
    property alias year: year.currentText
    property alias description: textArea.text

    property alias hours: hoursTumbler.currentItem

    ColumnLayout {
        id: col
        anchors.fill: parent

        RowLayout {

            Layout.alignment: Qt.AlignHCenter
            Layout.bottomMargin: 24
            spacing: 15

            ComboBox {
                id: day
                Label {
                    anchors.bottom: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottomMargin: 8
                    font.pixelSize: 18
                    text: "Day"
                }

                down: true
                Layout.preferredWidth: 100

                model: [...Array(30).keys()].map(i => i + 1)

            }

            ComboBox {
                id: month

                Label {
                    anchors.bottom: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottomMargin: 8
                    font.pixelSize: 18
                    text: "Month"
                }

                Layout.preferredWidth: 100
                model: [...Array(12).keys()].map(i => i + 1)

            }

            ComboBox {
                id: year

                Label {
                    anchors.bottom: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottomMargin: 8
                    font.pixelSize: 18
                    text: "Year"
                }

                Layout.preferredWidth: 100
                model: Array.from({
                                      length: 2030 - 2025 + 1
                                  }, (_, i) => 2025 + i)
            }
        }


        TextArea {
            id: textArea
            placeholderText: "Task Description here."
            Layout.preferredWidth: 300
            Layout.preferredHeight: 150
            Layout.alignment: Qt.AlignHCenter

            font.pixelSize: 18

            background: Rectangle {
                color: 'transparent'
                border.color: 'grey'
            }

            wrapMode: Text.Wrap
        }

        RowLayout {
            id: row

            Layout.alignment: Qt.AlignHCenter
            spacing: 15

            Label {
                Layout.alignment: Qt.AlignLeft
                Layout.rightMargin: 40
                font.pixelSize: 22
                font.bold: true
                text: "Time"
            }

            Tumbler {
                id: hoursTumbler
                model: 12
                font.pixelSize: 22

                background: Rectangle {
                    color: 'transparent'
                    border.color: 'black'
                    radius: 5
                }

                Label {
                    anchors.bottom: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottomMargin: 8
                    font.pixelSize: 18
                    text: "Hours"
                }

            }

            Tumbler {
                id: minutesTumbler
                model: 60
                font.pixelSize: 22

                background: Rectangle {
                    color: 'transparent'
                    border.color: 'black'
                    radius: 5
                }

                Label {
                    anchors.bottom: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottomMargin: 8
                    font.pixelSize: 18
                    text: "Minutes"
                }
            }

            Tumbler {
                id: amPmTumbler
                model: ["AM", "PM"]
                font.pixelSize: 22

                background: Rectangle {
                    color: 'transparent'
                    border.color: 'black'
                    radius: 5
                }


            }

        }

        RowLayout {
            Layout.preferredWidth: col.width
            Layout.alignment: Qt.AlignBottom

            Button {
                id: cancelButton
                text: "Cancel"
                //Layout.fillHeight: true
                Layout.topMargin: 30
                Layout.preferredWidth: 120
                Layout.preferredHeight: 45

                onClicked: root.cancelButtonClicked()
            }

            Button {
                id: addButton
                enabled: root.description.length != 0

                property color color: "#43b05c"

                text: "Add"
                Layout.topMargin: 30
                Layout.preferredWidth: 120
                Layout.preferredHeight: 45
                Layout.alignment: Qt.AlignRight
                //highlighted: true

                background: Rectangle {
                    color: enabled ? addButton.color : addButton.color.lighter()
                    opacity: addButton.pressed ? 0.5 : 1

                }

                onClicked: {
                    let dateStr = root.day + '-' + root.month + '-' + root.year
                    Backend.addNewTask(root.description, dateStr)
                    root.addButtonClicked()
                }
            }
        }

    }
}
