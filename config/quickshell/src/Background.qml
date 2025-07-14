import Quickshell.Widgets
import Quickshell
import QtQuick

import "modules"

PanelWindow {
    id: root

    color: "black"

    anchors {
        top: true
        left: true
        right: true
        bottom: true
    }

    exclusionMode: ExclusionMode.Ignore
    aboveWindows: false

    ClippingWrapperRectangle {
        radius: 30
        anchors.fill: parent

        Image { source: "/home/acero/Pictures/Wallpapers/yellow-city.png"; anchors.fill: parent }
    }
}
