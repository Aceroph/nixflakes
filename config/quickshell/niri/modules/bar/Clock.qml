import QtQuick
import Quickshell

import qs.shared

BarModule {
    Label {
        text: Qt.formatDateTime(clock.date, "dddd MMM d - hh:mm").replace('-', 'at')
        SystemClock {
            id: clock
            precision: SystemClock.Minutes
        }
    }
}
