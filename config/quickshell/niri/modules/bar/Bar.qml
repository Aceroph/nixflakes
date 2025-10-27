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

    exclusiveZone: Config.config.bar.height

    mask: Region {
        width: root.width
        height: Config.config.bar.height
        regions: [
            Region {
                item: startModules
            },
            Region {
                item: centerModules
            },
            Region {
                item: endModules
            }
        ]
    }

    Rectangle {
        anchors {
            top: root.top
        }
        implicitWidth: root.width
        height: Config.config.bar.height
        color: Config.config.bar.background
    }

    color: "transparent"

    RowLayout {
        id: modules

        anchors.fill: parent
        uniformCellSizes: true

        RowLayout {
            id: startModules

            Layout.leftMargin: Config.config.bar.padding
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.topMargin: Config.config.bar.padding

            TopLevel {
                Layout.alignment: Qt.AlignTop
            }
        }

        RowLayout {
            id: centerModules

            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
            Layout.topMargin: Config.config.bar.padding

            Clock {
                Layout.alignment: Qt.AlignTop
            }
        }

        RowLayout {
            id: endModules

            Layout.rightMargin: Config.config.bar.padding
            Layout.alignment: Qt.AlignRight | Qt.AlignTop
            Layout.topMargin: Config.config.bar.padding

            Battery {
                Layout.alignment: Qt.AlignTop
            }

            Systray {
                Layout.alignment: Qt.AlignTop
            }
        }
    }
}
