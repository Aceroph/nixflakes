pragma Singleton

import Quickshell
import QtQuick

import qs.shared
import qs.modules.bar

Singleton {
    id: root

    property Item leftMenu: null
    property Item centerMenu: null
    property Item rightMenu: null
}
