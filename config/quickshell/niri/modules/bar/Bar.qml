import Quickshell.Widgets
import Quickshell
import QtQuick.Layouts
import QtQuick

import qs.services.config
import qs.services.menu
import qs.shared

PanelWindow {
    id: root

    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: modules.height + menus.height
    exclusiveZone: Config.config.bar.height
    color: "transparent"

    mask: Region {
        Region {
            item: startModules
        }
        Region {
            item: centerModules
        }
        Region {
            item: endModules
        }
        Region {
            item: leftMenu
        }
        Region {
            item: centerMenu
        }
        Region {
            item: rightMenu
        }
    }

    Rectangle {
        id: modules

        height: Config.config.bar.height
        width: parent.width
        color: Config.config.bar.background

        RowLayout {
            id: startModules

            height: parent.height - Config.config.bar.padding * 2
            anchors.left: parent.left
            anchors.leftMargin: Config.config.bar.padding
            anchors.verticalCenter: parent.verticalCenter

            TopLevel {
                Layout.fillHeight: true
            }
        }

        RowLayout {
            id: centerModules

            height: parent.height - Config.config.bar.padding * 2
            anchors.centerIn: parent

            Clock {
                Layout.fillHeight: true
            }
        }

        RowLayout {
            id: endModules

            height: parent.height - Config.config.bar.padding * 2
            anchors.right: parent.right
            anchors.rightMargin: Config.config.bar.padding
            anchors.verticalCenter: parent.verticalCenter

            Battery {
                Layout.fillHeight: true
            }
        }
    }

    Item {
        id: menus

        anchors.top: modules.bottom
        width: parent.width
        height: Math.max(leftMenu.height, centerMenu.height, rightMenu.height)

        BarMenu {
            id: leftMenu
            anchors.left: parent.left
            isLeft: true
            menu: Menu.leftMenu
        }

        BarMenu {
            id: centerMenu
            anchors.horizontalCenter: parent.horizontalCenter
            menu: Menu.centerMenu
        }

        NotificationList {
            id: rightMenu
            anchors.right: parent.right
        }
    }
}
