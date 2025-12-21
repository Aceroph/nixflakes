import Quickshell.Services.Notifications
import Quickshell.Wayland
import Quickshell.Widgets
import Quickshell
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick

import qs.shared
import qs.services.config
import qs.services.notifications

PanelWindow {
    id: root

    WlrLayershell.layer: WlrLayer.Overlay
    exclusionMode: ExclusionMode.Ignore
    color: "transparent"

    anchors {
        right: true
        top: true
    }
    margins {
        top: ToplevelManager.activeToplevel?.fullscreen == true ? Config.config.bar.padding : Config.config.bar.height
        right: Config.config.bar.padding
    }

    implicitWidth: column.width
    implicitHeight: column.height

    ColumnLayout {
        id: column

        Repeater {
            model: NotificationService.notifications

            ClippingWrapperRectangle {
                required property Notification modelData

                margin: Config.config.bar.padding
                color: Config.config.bar.modules.background
                radius: Config.config.bar.modules.radius

                Item {
                    implicitWidth: 180
                    implicitHeight: notificationRow.height + 8

                    RowLayout {
                        id: notificationRow

                        width: parent.width

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
                    }

                    Timer {
                        id: timer

                        interval: 50
                        running: true
                        repeat: true
                        onTriggered: {
                            progress.value += 0.01;

                            if (progress.value >= 1)
                                modelData.dismiss();
                        }
                    }

                    ProgressBar {
                        id: progress

                        anchors.bottom: parent.bottom
                        implicitWidth: parent.width
                        implicitHeight: 4

                        from: 0
                        to: 1
                        value: 0

                        background: Rectangle {
                            color: Config.config.accentMuted
                            radius: Config.config.bar.modules.radius - 2
                            anchors.fill: parent
                        }

                        contentItem: Item {
                            anchors.fill: parent

                            Rectangle {
                                color: Config.config.accent
                                radius: Config.config.bar.modules.radius - 2
                                width: progress.width * progress.visualPosition
                                height: parent.height
                            }
                        }
                    }

                    MouseArea {
                        anchors.fill: parent

                        hoverEnabled: true

                        onClicked: modelData.dismiss()

                        onEntered: timer.stop()

                        onExited: timer.start()
                    }
                }
            }
        }
    }
}
