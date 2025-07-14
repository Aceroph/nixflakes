import Quickshell.Wayland
import QtQuick.Layouts
import QtQuick.Shapes
import Quickshell
import QtQuick

import qs.modules

PanelWindow {
    property real r: launcher.height / 2
    property Toplevel currentWindow: ToplevelManager.activeToplevel

    anchors {
        left: true
        top: true
    }

    exclusionMode: ExclusionMode.Ignore
    implicitHeight: launcher.height + r
    implicitWidth: launcher.width + r

    color: "transparent"

    Shape {
        preferredRendererType: Shape.CurveRenderer

        ShapePath {
            id: path
            
            startX: 0; startY: launcher.height + r
            fillColor: Colors.background
            strokeColor: Colors.primary_muted
            strokeWidth: 2
            
            PathArc { x: r; y: launcher.height; radiusX: r; radiusY: r }
            PathLine { x: launcher.width - r; y: launcher.height }
            PathArc { x: launcher.width; y: r; radiusX: r; radiusY: r; direction: PathArc.Counterclockwise }
            PathArc { x: launcher.width + r; y: 0; radiusX: r; radiusY: r }
            PathLine { relativeX: 0; relativeY: -path.strokeWidth }
            PathLine { x: -path.strokeWidth; y: -path.strokeWidth }
        }
    }


    Loader {
        id: launcher

        readonly property Component current: RowLayout {
            Text {
                text: ToplevelManager.activeToplevel.title
                color: Colors.text
                Layout.margins: 5
                Layout.rightMargin: currentWindow.title == currentWindow.appId ? Layout.margins * 2 : 0
            }

            Text {
                visible: currentWindow.title != currentWindow.appId
                text: `(${ToplevelManager.activeToplevel.appId})`
                color: Colors.text_muted
                Layout.margins: 5
                Layout.leftMargin: 0
            }
        }

        sourceComponent: current
    }
}
