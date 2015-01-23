import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2

import Curso.Verao 1.5

ScrollView {
    Component.onDestruction: {
        console.log("Fui!")
    }
    Column {
        Row {
            id: loadPanel
            Button {
                id: btn
                text: "Load"
                onClicked: downloader.load("https://ww.google.com.br")
                style: ButtonStyle {
                    background: Rectangle {
                        color: control.pressed ? "#88ff00ff" : "#ff00ff"
                        radius: height*0.2
                    }
                }
            }
            BusyIndicator {
                running: downloader.loading
            }
        }
        Canvas {
            id: root
            // canvas size
            width: 200; height: 200
            // handler to override for drawing
            onPaint: {
                // get context to draw with
                var ctx = getContext("2d")
                // setup the stroke
                ctx.lineWidth = 4
                ctx.strokeStyle = "blue"
                // setup the fill
                ctx.fillStyle = "steelblue"
                // begin a new path to draw
                ctx.beginPath()
                // top-left start point
                ctx.moveTo(50,50)
                // upper line
                ctx.lineTo(150,50)
                // right line
                ctx.lineTo(150,150)
                // bottom line
                ctx.lineTo(50,150)
                // left line through path closing
                ctx.closePath()
                // fill using fill style
                ctx.fill()
                // stroke using line width and stroke style
                ctx.stroke()
            }
        }

        /*Text {
            id: content
            width: ui.width
            wrapMode: Text.WordWrap
            textFormat: Text.PlainText
            Downloader {
                id: downloader
                onDataReady: {
                    loadPanel.destroy()
                    content.text = data
                }
            }
        }*/
    }
}

