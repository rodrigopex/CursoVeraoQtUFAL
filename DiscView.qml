import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

Rectangle {
    id: self
    property alias urlSource: img.source
    Image {
        id: img
        anchors.fill: parent
        source: "qrc:/assets/album01.jpg"
        layer.enabled: true
        layer.effect: RecursiveBlur {
            anchors.fill: img
            source: img
            radius: 7.5
            loops: 10
        }
    }
    ListView {
        anchors.fill: parent
        model: ListModel {
            id: albumModel
            Component.onCompleted: {
                for(var i = 0; i < 10; i++) {
                    albumModel.append({"artist": "Metallica", "Album": i})
                }
            }
        }
        delegate: Rectangle {
            height: 80
            width: self.width
            color: touch.pressed ? "#99000000" : "#66000000"
            Behavior on color {
                ColorAnimation {
                    duration: 200
                }
            }
            Text {
                text: artist
                color: "white"
                font.pixelSize: 20
                anchors.centerIn: parent
            }
            MouseArea {
                id: touch
                anchors.fill: parent
                onClicked: {
                    stackView.push("qrc:/ContentView.qml")
                }
            }

            Rectangle {
                width: parent.width
                height: 1
                opacity: 0.3
            }
        }
    }
}

