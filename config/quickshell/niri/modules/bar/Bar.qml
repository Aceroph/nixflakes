import Quickshell
import QtQuick.Layouts
import QtQuick
import QtQuick.Shapes

import qs.services.config

PanelWindow {
    id: root

    anchors {
        top: true
    }

    implicitHeight: Config.config.bar.height
    implicitWidth: modules.width + 50

    color: "transparent"

    Shape {
        width: modules.width + 50
        height: Config.config.bar.height
        anchors.centerIn: parent
        ShapePath {
            strokeWidth: 4
            strokeColor: "red"
            startX: 0
            startY: 0

            PathLine {
                x: modules.x
                y: modules.height
            }
            PathLine {
                x: modules.x + modules.width
                y: modules.height
            }
            PathLine {
                x: modules.x + modules.width + 25
                y: 0
            }
        }
    }

    RowLayout {
        id: modules
        anchors.centerIn: parent

        Clock {}
    }
}
