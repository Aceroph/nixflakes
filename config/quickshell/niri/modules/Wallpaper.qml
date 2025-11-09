import Quickshell.Widgets
import Quickshell
import QtQuick

import qs.services.config

Variants {
    model: Quickshell.screens

    PanelWindow {
        required property var modelData

        anchors {
            top: true
            bottom: true
            left: true
            right: true
        }

        aboveWindows: false
        color: Config.config.bar.background

        ClippingWrapperRectangle {
            radius: 20
            anchors.bottom: parent.bottom
            width: modelData.width
            height: modelData.height - Config.config.bar.height

            Image {
                source: Config.config.wallpaper
                fillMode: Image.PreserveAspectCrop
            }
        }
    }
}
