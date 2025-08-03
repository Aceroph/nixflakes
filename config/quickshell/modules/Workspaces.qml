import Quickshell
import QtQuick
import QtQuick.Controls
import Quickshell.I3

Module {
    id: root
    
    readonly property int iconSize: 10
    readonly property int activeCoefficient: 4

    Row {
        spacing: 4

        Repeater {
            id: workspaces

            anchors.fill: parent
            model: I3.workspaces

            delegate: Button {
                id: workspace

                required property I3Workspace modelData

                onClicked: modelData.activate()
                
                background: Rectangle {
                    color: modelData.active ? Colors.primary : Colors.primary_muted
                    radius: 5
                    implicitHeight: iconSize
                    implicitWidth: modelData.active ? iconSize * activeCoefficient : iconSize

                    Behavior on implicitWidth { PropertyAnimation { duration: 100 } }
                    Behavior on color { PropertyAnimation { duration: 100 } }
                }
            }
        }
    }
}
