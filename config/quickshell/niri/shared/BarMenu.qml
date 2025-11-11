import Quickshell.Widgets
import QtQuick.Shapes
import QtQuick

import qs.services.config

Shape {
    id: root

    property Item menu: null
    property int margin: 15
    property bool isLeft: false
    property bool isRight: false

    preferredRendererType: Shape.CurveRenderer
    width: menuContainer.width + margin * !isLeft + margin * !isRight
    height: menuContainer.height + Config.config.bar.padding
    visible: menu

    WrapperRectangle {
        id: menuContainer

        anchors.horizontalCenter: parent.horizontalCenter

        color: Config.config.bar.modules.background
        margin: Config.config.bar.padding
        radius: Config.config.bar.modules.radius

        child: menu
    }

    ShapePath {
        startX: 0
        startY: 0
        fillColor: "red"
        strokeWidth: 0

        PathCubic {
            x: menuContainer.x + Config.config.bar.padding
            y: root.height
            control1X: menuContainer.x + Config.config.bar.padding
            control1Y: 0
            control2X: 0
            control2Y: root.height
        }
        PathLine {
            x: menuContainer.x + menuContainer.width - Config.config.bar.padding
            y: root.height
        }
        PathCubic {
            x: root.width
            y: 0
            control1X: root.width
            control1Y: root.height
            control2X: menuContainer.x + menuContainer.width - Config.config.bar.padding
            control2Y: 0
        }
    }
}
