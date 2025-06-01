pragma Singleton
import QtQuick



QtObject {
    id: root

    property int currentIndexToAppend: 0

    property var tasksModel: [
        {
            section: 'Today',
            tasks: [
                { desc: `Dummy Task Section 1`, date: "10-9-2025"},
                { desc: `Dummy Task Section 1`, date: "15-7-2025"},
            ]
        },

        {
            section: 'Weekend',
            tasks: [
                { desc: "Dummy Text 2", date: "10-9-2025"},
                { desc: "Dummy Text 2 ", date: "15-7-2025"},
                { desc: "Dummy Text 2", date: "10-10-2025"},
            ]
        },

        {
            section: 'Tomorrow',
            tasks: [
                { desc: "Dummy Text 3", date: "10-9-2025"},
                { desc: "Dummy Text 3", date: "15-7-2025"},
                { desc: "Dummy Text 3", date: "10-10-2025"},
            ]
        }

    ]

    function addNewTask(desc, date, checked=false) {
        var currentTasks = root.tasksModel[root.currentIndexToAppend].tasks;

        currentTasks.push({ desc: desc, date: date, checked: checked });

        root.tasksModel[root.currentIndexToAppend].tasks = currentTasks;

        console.log(root.tasksModel[root.currentIndexToAppend].tasks)
    }
}
