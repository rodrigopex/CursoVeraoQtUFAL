import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

ApplicationWindow {
    id: ui
    title: qsTr("Hello World")
    width: 640
    height: 480
    visible: true

    toolBar: ToolBar {
        RowLayout {
            anchors.fill: parent
            ToolButton {
                text: "Back"
                visible: stackView.depth > 1
                onClicked: {
                    stackView.pop()
                }
            }
        }
        Text {
            id: title
            text: qsTr("Album View")
            anchors.centerIn: parent
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: AlbumView {
            onItemSelected: {
                stackView.push({ item: "qrc:/DiscView.qml", properties : { urlSource : url}})
            }
        }
        //        Component.onCompleted: push("qrc:/AlbumView.qml")
    }

    MessageDialog {
        id: messageDialog
        title: qsTr("May I have your attention, please?")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }
    }
}
