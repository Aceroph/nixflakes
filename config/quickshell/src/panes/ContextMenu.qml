import QtQuick.Controls
import Quickshell.I3
import Quickshell

PanelWindow {
    function open() {
        console.log("ah")
    }

    I3.onRawEvent: {
        console.log(event.type);
    }
}
