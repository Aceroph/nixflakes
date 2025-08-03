import QtQuick.Controls
import QtQuick.Effects
import Quickshell.Io
import Quickshell
import QtQuick

import qs.modules

Menu {
    id: root

    property int selX: 0
    property int selY: 0
    property int selW: 0
    property int selH: 0

    popupType: Popup.Window

    Action { text: "Resize"; onTriggered: getSelection.running = true }
    Action { text: "Delete" }

    delegate: MenuItem {
        id: menuItem

        implicitWidth: 150
        implicitHeight: 30

        background: Rectangle {
            anchors.fill: parent
            radius: 8
            color: menuItem.highlighted ? Colors.primary : "transparent"
        }

        contentItem: Text {
            verticalAlignment: Text.AlignVCenter
            text: menuItem.text
            color: menuItem.highlighted ? Colors.primary_muted : Colors.text
        }
    }

    background: Rectangle {
        implicitWidth: 150
        implicitHeight: 30
        radius: 8

        color: "#282828"
    }

    onAboutToShow: getMouseProcess.running = true

    Process {
        id: getMouseProcess
        command: [ "swaymsg", "-t", "get_mouse" ]
        stdout: StdioCollector {
            onStreamFinished: {
                const mouse = JSON.parse(this.text);
                root.x = mouse.x
                root.y = mouse.y;
            }
        }
    }

    Process {
        id: getSelection
        command: [ "slurp" ]
        stderr: StdioCollector {
            onStreamFinished: console.log(this.text);
        }
        stdout: StdioCollector {
            onStreamFinished: {
                console.log(this.text);
                const [position, dimension] = this.text.split();
                [selX, selY] = position.split(",");
                [selW, selH] = position.split("x");
                resizeWindow.running = true;
            }
        }
    }

    Process {
        id: resizeWindow
        command: [ "swaymsg", "resize", selW, selH ]
    }
}
