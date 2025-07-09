import QtQuick.Controls
import QtQuick

import "root:/services"

Module {
    id: root

    Text {
        text: Time.time
        color: Colors.text
    }
}
