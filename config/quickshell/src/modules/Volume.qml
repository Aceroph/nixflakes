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
            text: device == null || device.audio.muted ? "" : device.audio.volume > 0.5 ? "" : ""
            color: Colors.primary
        }

        ProgressBar {
            id: progress
            value: device == null ? 0 : device.audio.volume
            anchors.verticalCenter: parent.verticalCenter

            implicitWidth: device == null || device.audio.muted ? 0 : 40
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

        function toggleMuted(): void { device.audio.muted = !device.audio.muted; }
        function increase(step: real): void { device.audio.volume = Math.min(1, device.audio.volume + step); }
        function decrease(step: real): void { device.audio.volume = Math.max(0, device.audio.volume - step); }
    }
}
