import Quickshell.Services.Mpris
import Quickshell.Widgets
import Quickshell.Io
import QtQuick

Module {
    property bool isPlaying: Mpris.players.values.filter(p => p.isPlaying).length > 0
    visible: isPlaying

    Canvas {
        id: img

        property int barWidth: 5
        property int barSpacing: 5
        property list<int> values: []

        implicitWidth: values.length * (barWidth + barSpacing)
        anchors.fill: parent

        Process {
            id: cava

            command: [ "sh", "-c", "cava -p $HOME/.config/quickshell/cava.ini" ]
            running: isPlaying
            stdout: SplitParser {
                onRead: data => {
                    img.values = data.slice(0, -1).split(";").map(v => parseInt(v, 10));
                    img.requestPaint();
                }
            }
        }

        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();
            ctx.fillStyle = Colors.primary;

            for (let i = 0; i < values.length; i++) {
                let h = values[i] / 100 * img.height
                ctx.fillRect(i * (barWidth + barSpacing) + barSpacing, (img.height - h) / 2 + 1, barWidth, h);
            }
        }
    }
}
