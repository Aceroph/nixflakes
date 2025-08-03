import Quickshell.Services.UPower
import QtQuick.Controls
import QtQuick

Module {
    id: root
    
    property UPowerDevice device: UPower.displayDevice

    Row {

        spacing: 4

        Text {
            text: (device.percentage * 100).toFixed()
            color: Colors.primary
        }
        
        ProgressBar {
            id: progress
            value: device.percentage
            anchors.verticalCenter: parent.verticalCenter

            background: Rectangle {
                id: bar
                implicitWidth: 40
                implicitHeight: 6
                color: Colors.primary_muted
                radius: 5
            }

            contentItem: Item {
                implicitWidth: bar.width
                implicitHeight: bar.height

                Rectangle {
                    width: parent.implicitWidth * progress.visualPosition
                    height: parent.height
                    radius: bar.radius
                    color: Colors.primary
                }
            }
        }
    }
}
