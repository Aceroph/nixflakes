import Quickshell.Wayland
import Quickshell
import QtQuick.Controls
import QtQuick

import qs.services.config
import qs.services.notifications

PanelWindow {
    id: root

    WlrLayershell.layer: WlrLayer.Overlay
    exclusionMode: ExclusionMode.Ignore
    color: "transparent"

    anchors {
        right: true
        top: true
    }
    margins {
        top: ToplevelManager.activeToplevel?.fullscreen == true ? Config.config.bar.padding : Config.config.bar.height
        right: Config.config.bar.padding
    }

    implicitWidth: column.width
    implicitHeight: column.height

    Column {
        id: column

        spacing: Config.config.bar.padding / 2

        Repeater {
            model: NotificationService.notifications

            NotificationCard {}
        }
    }
}
