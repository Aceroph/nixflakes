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
            property string accent: "green"
            property string accentMuted: "darkgreen"
            property JsonObject bar: JsonObject {
                property string foreground: "black"
                property string background: "white"
                property int height: 30
                property int padding: 10
                property JsonObject modules: JsonObject {
                    property string background: "red"
                    property int padding: 5
                    property int radius: 10
                }
            }
        }
    }
}
