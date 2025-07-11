import Quickshell.Services.Pipewire
import Quickshell.Io
import QtQuick.Controls
import QtQuick

Module {
    id: root

    property PwNode device: Pipewire.defaultAudioSink

    Row {
        spacing: 4

        PwObjectTracker {
            objects: [device]
        }

        Text {
            anchors.verticalCenter: parent.verticalCenter
            text: device.audio.muted ? "" : device.audio.volume > 50 ? "" : ""
            color: Colors.primary
        }

        ProgressBar {
            id: progress
            value: device.audio.volume / 100
            anchors.verticalCenter: parent.verticalCenter

            implicitWidth: device.audio.muted ? 0 : 40
            implicitHeight: 6
            visible: implicitWidth > 0

            background: Rectangle {
                color: Colors.primary_muted
                radius: 5
                anchors.fill: parent
            }

            contentItem: Item {
                anchors.fill: parent

                Rectangle {
                    color: Colors.primary
                    radius: 5
                    width: progress.implicitWidth * progress.visualPosition
                    height: progress.height
                }
            }
        }
    }

    IpcHandler {
        target: "volume"

        function toggleMute(): void { device.audio.mute = !device.audio.mute; }
        function increase(step: int): void { device.audio.volume += step; }
        function decrease(step: int): void { device.audio.volume -= step; }
    }
}
