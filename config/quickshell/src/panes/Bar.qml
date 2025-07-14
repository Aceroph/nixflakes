import QtQuick.Layouts
import Quickshell
import QtQuick

import qs.modules

PanelWindow {
    id: root

    anchors {
        top: true
        left: true
        right: true
    }

    color: "transparent"

    implicitHeight: modules.height + 10
    implicitWidth: modules.width + 10
    exclusiveZone: modules.height + modules.y - 5

    BarNotch { item: modules }
    
    RowLayout {
        id: modules

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.top
        anchors.verticalCenterOffset: this.height / 2 + 5

        Workspaces {}
        Clock {}
        Battery {}
        Volume {}
        Logo {}
    }

    Behavior on implicitWidth { PropertyAnimation { duration: 100 } }
}
