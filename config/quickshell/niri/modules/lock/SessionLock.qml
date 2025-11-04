import Quickshell.Services.Pam
import Quickshell.Wayland
import Quickshell.Widgets
import Quickshell.Io
import Quickshell
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Layouts
import QtQuick.Effects
import QtQuick

import qs.services.config

WlSessionLock {
    id: root

    WlSessionLockSurface {
        id: surface

        color: Config.config.bar.background

        ScreencopyView {
            captureSource: surface.screen
            anchors.fill: parent

            layer.enabled: true
            layer.effect: MultiEffect {
                blurEnabled: true
                blur: 1
                blurMax: 48
            }
        }

        WrapperRectangle {
            id: panel

            color: Config.config.bar.background
            margin: 15
            radius: Config.config.bar.modules.radius

            anchors.left: parent.left
            anchors.leftMargin: 50
            anchors.verticalCenter: parent.verticalCenter

            ColumnLayout {
                id: panelLayout

                width: 900
                spacing: 15

                WrapperRectangle {
                    margin: 40
                    color: Config.config.bar.modules.background
                    radius: Config.config.bar.modules.radius

                    Label {
                        font.pixelSize: 96
                        color: Config.config.bar.foreground
                        text: Qt.formatDateTime(clock.date, "hh:mm")
                        SystemClock {
                            id: clock
                            precision: SystemClock.Minutes
                        }
                    }
                }

                TextField {
                    id: textField
                    placeholderText: "Password"
                    echoMode: TextInput.Password
                    color: Config.config.bar.foreground
                    horizontalAlignment: Qt.AlignHCenter
                    passwordMaskDelay: 250
                    font.pixelSize: 24

                    Layout.fillWidth: true

                    onAccepted: pam.start()

                    background: Rectangle {
                        implicitHeight: 60
                        radius: Config.config.bar.modules.radius
                        color: Config.config.bar.modules.background
                    }
                }
            }
        }

        IpcHandler {
            target: "lock"

            function lock(): void {
                locked = true;
            }

            function unlock(): void {
                locked = false;
            }
        }

        PamContext {
            id: pam

            onPamMessage: {
                if (this.responseRequired) {
                    this.respond(textField.text);
                }
            }

            onCompleted: result => {
                if (result == PamResult.Success) {
                    locked = false;
                }
            }
        }
    }
}
