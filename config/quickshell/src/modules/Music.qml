import Quickshell.Services.Mpris
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Effects
import QtQuick

import "root:/utils"

Rectangle {
    id: root

    property var player: Mpris.players.values[0]

    color: Colors.background_lighter
    radius: 8
    implicitHeight: 72
    implicitWidth: 250

    Image {
        id: trackArt
        source: player.trackArtUrl
        width: 64
        height: 64

        anchors {
            top: parent.top
            left: parent.left
            margins: 4
        }
    }

    Text {
        id: trackTitle
        
        elide: Text.ElideRight
        width: 150
        text: player.trackTitle || "Unknown Title"
        font.bold: true
        color: Colors.text

        anchors {
            left: trackArt.right
            top: parent.top
            margins: 8
        }
    }

    Text {
        id: trackArtist

        elide: Text.ElideRight
        width: 150
        text: player.trackArtist || "Unknown Artist"
        color: Colors.text

        anchors {
            left: trackArt.right
            top: trackTitle.bottom
            leftMargin: 8
            topMargin: 4
        }
    }
    
    RowLayout {
        id: position

        anchors {
            top: trackArtist.bottom
            left: trackArt.right
            margins: 8
        }

        Text {
            text: displayTime(player.position)
            color: Colors.text
        }

        Slider {
            id: slider

            value: player.position / player.length
            implicitWidth: root.width - trackArt.width - 110

            onMoved: player.position = slider.position * player.length

            background: Rectangle {
                width: parent.width
                height: 6
                color: Colors.primary_muted
                radius: 8
                anchors.verticalCenter: parent.verticalCenter

                Rectangle {
                    width: parent.width * slider.visualPosition
                    height: 6
                    color: Colors.primary
                    radius: 8
                }
            }

            handle: Rectangle {
                x: slider.leftPadding + slider.visualPosition * (slider.availableWidth - width)
                y: slider.topPadding + slider.availableHeight / 2 - height / 2
                width: 16
                height: width
                radius: 8
                color: Colors.primary
            }
        }

        Text {
            text: displayTime(player.length)
            color: Colors.text
        }
    }

    ColumnLayout {
        id: controls

        anchors {
            top: root.top
            right: root.right
            bottom: root.bottom
            margins: 2
            rightMargin: 6
        }
        
        Button {
            background: Text {
                text: ""
                color: Colors.text
                font.pixelSize: 16
            }
            onClicked: player.previous()
        }

        Button {
            background: Text {
                text: player.isPlaying ? "" : ""
                color: Colors.text
                font.pixelSize: 16
            }
            onClicked: player.togglePlaying()
        }

        Button {
            background: Text {
                text: ""
                color: Colors.text
                font.pixelSize: 16
            }
            onClicked: player.next()
        }
    }


    function displayTime(n) {
        let minutes = (n / 60).toFixed()
        let seconds = (n % 60).toFixed().padStart(2, '0')
        return `${minutes}:${seconds}`
    }
}
