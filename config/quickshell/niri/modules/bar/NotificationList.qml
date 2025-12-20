import Quickshell.Services.Notifications
import Quickshell.Widgets
import QtQuick.Layouts
import QtQuick.Shapes
import QtQuick.Controls
import QtQuick

import qs.shared
import qs.services.config
import qs.services.notifications

Item {
    implicitWidth: column.width + Config.config.bar.padding * 4
    implicitHeight: column.height + Config.config.bar.padding * 6

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
                relativeY: column.height - Config.config.bar.padding * 3
            }

            PathArc {
                relativeX: Config.config.bar.padding * 2
                relativeY: Config.config.bar.padding * 2
                radiusX: Config.config.bar.padding * 2
                radiusY: Config.config.bar.padding * 2
                direction: PathArc.Counterclockwise
            }

            PathLine {
                relativeX: column.width - Config.config.bar.padding * 2
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
                relativeY: -column.height - Config.config.bar.padding * 3
            }
        }
    }

    ColumnLayout {
        id: column

        anchors.right: parent.right
        anchors.rightMargin: Config.config.bar.padding
        anchors.topMargin: Config.config.bar.padding

        Repeater {
            model: NotificationService.notifications

            WrapperRectangle {
                required property Notification modelData

                margin: Config.config.bar.padding
                color: Config.config.bar.modules.background
                radius: Config.config.bar.modules.radius

                RowLayout {
                    implicitWidth: 97

                    IconImage {
                        source: modelData.image
                        visible: modelData.image !== ""
                        implicitSize: 48
                        asynchronous: true
                    }

                    ColumnLayout {
                        Label {
                            text: modelData.summary + " - " + modelData.appName
                        }
                        Label {
                            text: modelData.body
                            visible: modelData.body !== ""
                            opacity: 0.6
                        }
                        RowLayout {
                            visible: modelData.actions.length > 0

                            Repeater {
                                model: modelData.actions

                                Button {
                                    required property NotificationAction modelData

                                    onClicked: modelData.invoke()

                                    contentItem: Label {
                                        text: modelData.text
                                    }

                                    background: Rectangle {
                                        color: Config.config.bar.background
                                        radius: Config.config.bar.modules.radius
                                    }
                                }
                            }
                        }
                    }

                    MouseArea {
                        anchors.fill: parent

                        hoverEnabled: true

                        onClicked: {
                            modelData.dismiss();
                        }

                        onEntered: {
                            parent.parent.opacity = 0.75;
                        }

                        onExited: {
                            parent.parent.opacity = 1;
                        }
                    }
                }
            }
        }
    }
}
