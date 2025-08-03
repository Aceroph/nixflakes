import QtQuick.Layouts
import Quickshell
import QtQuick

import qs.modules
import qs.utils

PanelWindow {
    id: root

    anchors {
        top: true
        left: true
        right: true
    }

    color: Colors.background

    implicitHeight: modules.height + 10
    exclusiveZone: modules.height + 8

    RowLayout {
        id: modules

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.top
        anchors.verticalCenterOffset: this.height / 2 + 5

        Logo {}
        Workspaces {}
        Clock {}
        Volume {}
        Battery {}
    }
}
