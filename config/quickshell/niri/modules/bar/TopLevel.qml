import Quickshell.Wayland
import QtQuick

import qs.shared

BarModule {
    property var topLevel: ToplevelManager.activeToplevel

    Label {
        id: label
        anchors.centerIn: parent
        text: truncate(topLevel?.title, 40) || "Desktop"
    }

    function truncate(s: string, n: int): string {
        return s.length > n ? s.substring(0, n - 1) + "..." : s;
    }
}
