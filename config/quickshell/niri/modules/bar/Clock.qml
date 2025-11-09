import QtQuick
import Quickshell

import qs.shared
import qs.services.config

BarModule {
    Label {
        text: Qt.formatDateTime(clock.date, "dddd MMM d - hh:mm").replace('-', 'at')
        SystemClock {
            id: clock
            precision: SystemClock.Minutes
        }
    }
}
