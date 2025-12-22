import Quickshell.Services.Notifications
import Quickshell.Widgets
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick

import qs.services.config
import qs.shared

ClippingWrapperRectangle {
    id: root

    x: width

    required property Notification modelData

    margin: Config.config.bar.padding
    color: Config.config.bar.modules.background
    radius: Config.config.bar.modules.radius

    Item {
        implicitWidth: 300
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
                    parent.state = "exiting";
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

            onClicked: parent.state = "exiting"

            onEntered: timer.stop()

            onExited: timer.start()
        }

        states: [
            State {
                name: "entering"
                PropertyChanges {
                    target: root
                    x: 0
                }
            },
            State {
                name: "exiting"
                PropertyChanges {
                    target: root
                    x: root.width
                }
            }
        ]

        transitions: Transition {
            SequentialAnimation {
                NumberAnimation {
                    properties: "x"
                    easing.type: Easing.Linear
                }
                ScriptAction {
                    script: {
                        if (root.x > 0) {
                            modelData.dismiss();
                        }
                    }
                }
            }
        }

        Component.onCompleted: state = "entering"
    }
}
