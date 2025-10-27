import Quickshell
import QtQuick.Layouts
import QtQuick

import qs.services.config

PanelWindow {
    id: root

    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: Config.config.bar.height

    color: Config.config.bar.background

    RowLayout {
        id: modules

        anchors.fill: parent
        uniformCellSizes: true

        RowLayout {
            id: startModules

            Layout.leftMargin: Config.config.bar.padding
            Layout.alignment: Qt.AlignLeft

            TopLevel {
                Layout.alignment: Qt.AlignVCenter
            }
        }

        RowLayout {
            id: centerModules

            Layout.alignment: Qt.AlignHCenter

            Clock {
                Layout.alignment: Qt.AlignVCenter
            }
        }

        RowLayout {
            id: endModules

            Layout.rightMargin: Config.config.bar.padding
            Layout.alignment: Qt.AlignRight

            Battery {
                Layout.alignment: Qt.AlignVCenter
            }
        }
    }
}
