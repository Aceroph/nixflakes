import QtQuick
import QtQuick.Layouts
import QtQuick.Shapes
import Quickshell

import "modules"

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
    exclusiveZone: 15

    color: "transparent"

    BarNotch { bar: dashboard }

    Rectangle {
        id: dashboard

        implicitHeight: modules.height + extraModules.height * extraModules.visible + 10
        implicitWidth: modules.width + 10
        anchors.horizontalCenter: parent.horizontalCenter

        color: Colors.background
        radius: 8
        
        GridLayout {
            id: extraModules
            visible: mouseArea.containsMouse
            anchors.bottom: dashboard.bottom
            
            Music { Layout.row: 2 }
        }

        RowLayout {
            id: modules

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.top
            anchors.verticalCenterOffset: this.height / 2 + 5

            WidgetWrapper { Workspaces {} }
            WidgetWrapper { Clock {} }
            WidgetWrapper { Battery {} }
            WidgetWrapper { Cava { id: cava } visible: cava.isPlaying }
            WidgetWrapper { Logo {} }
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
