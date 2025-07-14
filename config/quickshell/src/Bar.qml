import QtQuick.Layouts
import QtQuick.Shapes
import Quickshell
import QtQuick

import qs.modules

PanelWindow {
    id: root

    property alias notch: dashboard

    anchors {
        top: true
        left: true
        right: true
    }
    mask: Region { item: dashboard }
    implicitHeight: 200
    exclusiveZone: modules.height + modules.y - 5

    color: "transparent"

    Rectangle {
        id: dashboard

        implicitHeight: modules.height + extraModules.height * extraModules.visible + 10
        implicitWidth: modules.width + 10
        anchors.horizontalCenter: parent.horizontalCenter

        color: Colors.background_darker
        radius: 8
        
        GridLayout {
            id: extraModules
            visible: mouseArea.containsMouse
            anchors.bottom: dashboard.bottom
        }

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
            Cava {}
            Logo {}
        }

        MouseArea {
            id: mouseArea
            hoverEnabled: true
            anchors.fill: parent
            acceptedButtons: Qt.NoButton
        }

        Behavior on implicitWidth { PropertyAnimation { duration: 100 } }
        Behavior on implicitHeight { PropertyAnimation { duration: 100 } }
    }
}
