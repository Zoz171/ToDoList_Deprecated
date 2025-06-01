pragma ComponentBehavior: Bound
import QtQuick

ListView {
    id: lsvw

    //anchors.fill: parent
    anchors.margins: 20
    spacing : 30

    signal nextPage

    model: Backend.tasksModel

    delegate: TaskList{
        required property string section
        required property int index

        currentIndex: index
        headerText: section

        onAddButtonClicked: {
            Backend.currentIndexToAppend = index
            lsvw.nextPage()
        }
    }

}
