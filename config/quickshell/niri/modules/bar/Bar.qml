import Quickshell.Widgets
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

    WrapperRectangle {
        color: Config.config.bar.background
        anchors.fill: parent
        margin: Config.config.bar.padding

        Item {
            anchors.fill: parent
            anchors.margins: Config.config.bar.padding
            anchors.top: parent.top

            RowLayout {
                id: startModules

                height: parent.height
                anchors.left: parent.left

                TopLevel {
                    Layout.fillHeight: true
                }
            }

            RowLayout {
                id: centerModules

                height: parent.height
                anchors.horizontalCenter: parent.horizontalCenter

                Clock {
                    Layout.fillHeight: true
                }
            }

            RowLayout {
                id: endModules

                height: parent.height
                anchors.right: parent.right

                Battery {
                    Layout.fillHeight: true
                }
            }
        }
    }
}
