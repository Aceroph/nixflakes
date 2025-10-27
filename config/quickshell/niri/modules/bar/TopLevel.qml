import Quickshell.Wayland

import qs.shared

BarModule {
    property var topLevel: ToplevelManager.activeToplevel

    Label {
        anchors.centerIn: parent
        text: topLevel?.title || "Desktop"
    }
}
