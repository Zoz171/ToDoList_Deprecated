pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

ApplicationWindow {
    id: window

    width: 400
    height: 800
    visible: true
    title: qsTr("To-Do List App")

    // Note 1 : ListView is not needed for "TaskList" Component, as the user does not need scroll in a given
    //          "TasksSection" Component (ListView Inheirts from "Flickable")
    // Note 2 : re-write "TaskList" to be either a [Column Positioner + Repeater] or [ColumnLayout + Repeater]  ==> [[ MOST CRITICAL PART ]]
    // Note 3 : write "TasksSection" which will be a ColumnLayout of a Label (Header of TaskList) and a TaskList
    // Note 4(UPDATED) : write an actual Task Component, CheckBox is not suffiecient alone for example: for out of bounds texts (text of CheckBoxes does not has wrapMode property)
    // Note 5 : write "Backend.qml" that holds most of data/functions and ui setting for the app. most qt quick application developers does this for some reason

    /* ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ DONE ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ */

    // Note 6 : play around and try different navigations controls, starting with "StackView" (the standard for navigations apparently)

    // Main HomePage will be A ColumnLayout of TasksSection's
    // after successfully laying ui elements around without going insane over Delegates not showing correctly or Layouts not working as expected :
    // -> ((( try ))) to add more features like delete selected and dark-white mode, also try "SwipeView" for settings panel
    // -> consider putting "By: Ziad" Label in that menu/settings panel

    // PS: Cannot Align child element in a Layout IF AND ONLY IF THE SAME ELEMENT FILLS THE WHOLE SPACE.
    // -> use preferredWidth and Height to specify child dimensions and Make the Layout itself fills the required of the space (usually with anchors)
    // -> and from there, you can lay the child as you like (it has free space now it can move around), and can also freely stop from going insane for another 3-4 hours.

    /**************************/

    //Sandbox -> Delete Later


    TasksPage {
        id: tasksPage
        onNextPage: {
            stack.push(addNewPane)
        }
    }




    AddNewTaskPane {
        id: addNewPane
        onCancelButtonClicked: stack.pop()
        onAddButtonClicked: stack.pop()
    }


    HomePage {
        anchors.fill: parent

        // Switch {
        //     anchors.top: parent.top
        //     anchors.right: parent.right
        //     text: "Dark Theme"

        //     onCheckedChanged: {
        //         if(checked){
        //             window.palette.windowText = 'white'
        //             window.palette.window = 'dark'
        //         }
        //         else
        //             window.palette.window = 'white'
        //     }
        // }

        StackView {
            id: stack

            anchors.margins: 26
            anchors.topMargin: 30

            anchors.fill: parent
            initialItem: tasksPage

        }
    }
    // Rectangle {
    //     anchors.fill: parent
    //     color: 'transparent'
    //     border.color: 'red'
    // }
}
