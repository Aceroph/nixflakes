import Quickshell
import QtQuick.Layouts
import QtQuick

import qs.services.config

PanelWindow {
    id: root

    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: Config.config.bar.height

    color: Config.config.bar.background

    RowLayout {
        id: startModules

        anchors.left: parent.left
        anchors.top: parent.top
        anchors.margins: Config.config.bar.padding

        TopLevel {
            Layout.alignment: Qt.AlignVCenter
        }
    }

    RowLayout {
        id: centerModules

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.margins: Config.config.bar.padding

        Clock {
            Layout.alignment: Qt.AlignVCenter
        }
    }

    RowLayout {
        id: endModules

        anchors.right: parent.right
        anchors.margins: Config.config.bar.padding
        anchors.top: parent.top

        Battery {
            Layout.alignment: Qt.AlignVCenter
        }
    }
}
