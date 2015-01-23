import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

Rectangle {
    id: self
    signal itemSelected(string url)
    Image {
        id: img
        anchors.fill: parent
        source: "qrc:/assets/metallica.jpg"
        layer.enabled: true
        layer.effect: RecursiveBlur {
            anchors.fill: img
            source: img
            radius: 7.5
            loops: 10
        }
    }
    ListView {
        id: list
        anchors.fill: parent
        Component.onCompleted: currentIndex = -1
        model: ListModel {
            id: albumModel
            Component.onCompleted: {
                albumModel.append({"artist": "Master of Puppets", "url": "http://www.metallica.com/images/cover_masterofpuppets_lg.jpg"})
                albumModel.append({"artist": "Justice for All", "url": "http://www.rockcellarmagazine.com/wp-content/uploads/2011/10/Metallica-Justice-for-All-album.jpg"})
                albumModel.append({"artist": "St. Anger", "url": "http://www.rockcellarmagazine.com/wp-content/uploads/2011/10/Metallica-St.-Anger-album.jpg"})
                albumModel.append({"artist": "Reload", "url": "http://assets.rollingstone.com/assets/images/album_review/bbf9a11468d15218ac534ec6ed20645823720f61.jpg"})
            }
        }
        delegate: Image {
            height: 80
            width: self.width
            fillMode: Image.PreserveAspectFit
            source: url
            Rectangle {
                anchors.fill: parent
                color: touch.pressed ? "#99000000" : "#66000000"
                Behavior on color {
                    ColorAnimation {
                        duration: 200
                    }
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
                    self.itemSelected(url)
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

