import QtQuick.Layouts
import Quickshell
import QtQuick

import qs.modules
import qs.utils

PanelWindow {
    id: root

    anchors {
        top: true
    }

    color: "transparent"
    
    Notch { 
        id: notch
        color: Colors.background
        border: 0
        radiusBottomLeft: 8; radiusBottomRight: 8
    }

    implicitHeight: modules.height + 10
    implicitWidth: modules.width + 10 + notch.radiusTopLeft + notch.radiusTopRight
    exclusiveZone: modules.height + modules.y - 5

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

    Behavior on implicitWidth { PropertyAnimation { duration: 100 } }
}
