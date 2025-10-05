import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell

import qs.services.config

PanelWindow {
    id: root

    focusable: true
    implicitWidth: content.width
    implicitHeight: content.height
    color: "transparent"

    property list<DesktopEntry> entries: []

    function getApps(query: string) {
        const entries = DesktopEntries.applications.values;

        for (var entry of entries) {
            console.log(entry.name);
            if (entry.name.startsWith(query)) {
                entries.push(entry);
            }
        }
    }

    ColumnLayout {
        id: content

        spacing: 8

        TextField {
            id: input

            placeholderText: "Search: "
            Layout.alignment: Qt.AlignTop
            placeholderTextColor: "#eeeeee"
            color: "#eeeeee"

            background: Rectangle {
                color: Config.config.bar.background
                implicitWidth: 200
                implicitHeight: 50
                radius: Config.config.bar.radius
            }
        }

        Repeater {
            model: getApps(input.text)

            delegate: Rectangle {
                required property DesktopEntry modelData

                Text {
                    text: modelData.name
                }
            }
        }
    }
}
