import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


RowLayout {

    spacing: 8

    property alias taskText: taskDesc.text

    CheckBox {
        id: checkBox

    }

    Label {
        id: taskDesc

        Layout.preferredWidth: 200

        //text: "Dummy Text Dummy Text Dummy Text Dummy Text"
        wrapMode: Label.Wrap
    }
}
