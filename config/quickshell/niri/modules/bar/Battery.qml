import QtQuick.Controls
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.UPower

import qs.services.config
import qs.shared

BarModule {
    id: root

    property var battery: UPower.displayDevice
    property var padding: 5

    RowLayout {

        anchors.centerIn: parent

        Label {
            text: battery.changeRate > 0 ? '' : battery.percentage * 100
            Layout.alignment: Qt.AlignVCenter
        }

        ProgressBar {
            id: progress
            Layout.alignment: Qt.AlignVCenter

            implicitWidth: 100
            implicitHeight: root.height - root.padding * 2
            value: battery.percentage

            background: Rectangle {
                color: Config.config.accentMuted
                radius: Config.config.bar.modules.radius - padding / 2
                anchors.fill: parent
            }

            contentItem: Item {
                anchors.fill: parent

                Rectangle {
                    color: Config.config.accent
                    radius: Config.config.bar.modules.radius - padding / 2
                    width: progress.width * progress.visualPosition
                    height: parent.height
                }
            }
        }
    }
}
