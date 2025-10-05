pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
    id: root
    property alias config: adapter

    FileView {
        path: Quickshell.env("HOME") + "/.config/qsbar/config.json"

        watchChanges: true

        onFileChanged: reload()
        onAdapterChanged: writeAdapter()

        JsonAdapter {
            id: adapter

            property string font: "Sono"
            property JsonObject bar: JsonObject {
                property string foreground: "black"
                property string background: "white"
                property int height: 30
                property int radius: 10
                property int padding: 10
                property int marginTop: 0
            }
        }
    }
}
