import QtQuick.Shapes
import QtQuick

import qs.modules.notifications
import qs.services.config

Item {
    implicitWidth: notifList.width + Config.config.bar.padding * 4
    implicitHeight: notifList.height + Config.config.bar.padding * 6

    Shape {
        id: shape

        anchors.fill: parent
        preferredRendererType: Shape.CurveRenderer

        ShapePath {
            fillColor: Config.config.bar.background
            strokeWidth: 0
            startX: 0
            startY: 0

            PathArc {
                relativeX: Config.config.bar.padding * 2
                relativeY: Config.config.bar.padding * 2
                radiusX: Config.config.bar.padding * 2
                radiusY: Config.config.bar.padding * 2
            }

            PathLine {
                relativeX: 0
                relativeY: notifList.height - Config.config.bar.padding * 3
            }

            PathArc {
                relativeX: Config.config.bar.padding * 2
                relativeY: Config.config.bar.padding * 2
                radiusX: Config.config.bar.padding * 2
                radiusY: Config.config.bar.padding * 2
                direction: PathArc.Counterclockwise
            }

            PathLine {
                relativeX: notifList.width - Config.config.bar.padding * 2
                relativeY: 0
            }

            PathArc {
                relativeX: Config.config.bar.padding * 2
                relativeY: Config.config.bar.padding * 2
                radiusX: Config.config.bar.padding * 2
                radiusY: Config.config.bar.padding * 2
            }

            PathLine {
                relativeX: 0
                relativeY: -notifList.height - Config.config.bar.padding * 3
            }
        }
    }

    NotificationList {
        id: notifList
    }
}
