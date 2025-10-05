pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
    id: root
    property alias config: adapter

    FileView {
        path: Quickshell.env("HOME") + "/.config/qsbar/config.json"

        printErrors: false
        watchChanges: true

        onFileChanged: reload()
        onAdapterChanged: writeAdapter()

        JsonAdapter {
            id: adapter

            property string font: "Sono"
            property string foreground: "black"
            property JsonObject bar: JsonObject {
                property string background: "white"
                property int height: 30
                property JsonObject border: JsonObject {
                    property string color: "black"
                    property int width: 2
                }
                property int radius: 10
                property int margin: 10
                property JsonObject modules: JsonObject {
                    property string background: "gray"
                }
            }
        }
    }
}
