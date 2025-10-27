import QtQuick

import qs.services.config

Rectangle {
    radius: Config.config.bar.modules.radius
    implicitWidth: children[0].width + Config.config.bar.modules.padding * 2
    implicitHeight: Config.config.bar.height - Config.config.bar.padding * 2
    color: Config.config.bar.modules.background
}
