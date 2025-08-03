import Quickshell.Widgets
import Quickshell
import QtQuick
import QtQuick.Controls

import qs.utils

PanelWindow {
    id: root

    color: Colors.background

    anchors {
        top: true
        left: true
        right: true
        bottom: true
    }
    margins.top: 30

    exclusionMode: ExclusionMode.Ignore
    aboveWindows: false

    ClippingWrapperRectangle {
        radius: 30
        anchors.fill: parent

        Image { source: "/home/acero/Pictures/Wallpapers/yellow-city.png"; anchors.centerIn: parent }
    }
}
