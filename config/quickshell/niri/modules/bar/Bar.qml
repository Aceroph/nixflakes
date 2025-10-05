import Quickshell
import QtQuick.Layouts
import QtQuick
import QtQuick.Shapes
import QtQuick.Effects

import qs.services.config

PanelWindow {
    id: root

    anchors {
        top: true
    }

    margins.top: Config.config.bar.marginTop
    implicitHeight: modules.height + Config.config.bar.padding * 2
    implicitWidth: modules.width + Config.config.bar.padding * 2
    exclusionMode: ExclusionMode.Ignore
    color: "transparent"

    Rectangle {
        id: background
        radius: Config.config.bar.radius
        anchors.fill: parent
        color: Config.config.bar.background

        layer.enabled: true
        layer.effect: MultiEffect {
            blur: 0.4
            blurEnabled: true
        }
    }

    RowLayout {
        id: modules
        anchors.centerIn: background

        Clock {}
    }
}
