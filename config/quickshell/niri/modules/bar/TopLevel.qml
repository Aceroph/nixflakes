import Quickshell.Wayland
import Quickshell.Widgets
import Quickshell
import QtQuick.Layouts
import QtQuick

import qs.services.config
import qs.shared

BarModule {
    id: root

    property var topLevel: ToplevelManager.activeToplevel
    property DesktopEntry entry: DesktopEntries.byId(topLevel?.appId)
    leftMargin: topLevel?.activated ? 0 : rightMargin

    RowLayout {

        ClippingWrapperRectangle {
            visible: topLevel?.activated || false
            radius: Config.config.bar.modules.radius
            color: "transparent"

            IconImage {
                source: Quickshell.iconPath(entry?.icon)
                anchors.fill: parent
                implicitSize: root.height
            }
        }

        Label {
            id: label
            Layout.alignment: Qt.AlignVCenter
            text: topLevel?.activated ? truncate(topLevel.title, 40) : "Desktop"
            function truncate(s: string, n: int): string {
                return s.length > n ? s.substring(0, n - 1) + "..." : s;
            }
        }
    }
}
