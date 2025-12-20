pragma Singleton

import Quickshell
import Quickshell.Services.Notifications

Singleton {
    id: root

    property alias notifications: notifServer.trackedNotifications

    NotificationServer {
        id: notifServer

        actionsSupported: true
        imageSupported: true

        onNotification: notification => {
            notification.tracked = true;
        }
    }
}
