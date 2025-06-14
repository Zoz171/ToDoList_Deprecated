cmake_minimum_required(VERSION 3.16)

project(ToDoList VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appToDoList
    main.cpp
)

set_source_files_properties(
    Backend.qml
    PROPERTIES QT_QML_SINGLETON_TYPE TRUE
)

qt_add_qml_module(appToDoList
    URI ToDoList
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES HomePage.qml
        RESOURCES qt_logo.png
        QML_FILES Task.qml
        QML_FILES TaskList.qml
        QML_FILES Backend.qml
        QML_FILES CustomButton.qml
        RESOURCES plus.png
        RESOURCES ../../Downloads/plus.png
        RESOURCES plus.png
        QML_FILES AddNewTaskPane.qml
        QML_FILES TasksPage.qml
        QML_FILES SidePane.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appToDoList PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appToDoList
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appToDoList
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appToDoList
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
