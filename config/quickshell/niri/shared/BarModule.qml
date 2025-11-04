import QtQuick

import qs.services.config

Rectangle {
    id: root

    property int marginTop: Config.config.bar.padding
    property int marginBottom: Config.config.bar.padding
    property int marginLeft: Config.config.bar.padding
    property int marginRight: Config.config.bar.padding

    radius: Config.config.bar.modules.radius
    implicitWidth: children[0].width + marginLeft + marginRight
    implicitHeight: Config.config.bar.height - marginTop - marginBottom
    color: Config.config.bar.modules.background
}
