import Quickshell.Widgets
import QtQuick

import qs.services.config

Rectangle {
    border.color: Config.config.bar.border.color
    border.width: Config.config.bar.border.width
    radius: Config.config.bar.radius
    color: Config.config.bar.modules.background
}
