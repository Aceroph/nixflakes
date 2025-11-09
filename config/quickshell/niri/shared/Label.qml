import QtQuick

import qs.services.config

Text {
    color: Config.config.bar.foreground
    font: Config.config.font
    verticalAlignment: Text.AlignVCenter
}
