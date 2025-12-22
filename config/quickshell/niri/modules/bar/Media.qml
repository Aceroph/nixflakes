import Quickshell.Services.Mpris
import Quickshell.Widgets
import QtQuick.Layouts
import QtQuick

import qs.shared
import qs.services.config

BarModule {
    id: root

    property MprisPlayer player: Mpris.players.values[0]

    leftMargin: player?.trackArtUrl ? 0 : rightMargin
    visible: Mpris.players.values.length > 0

    RowLayout {
        ClippingRectangle {
            implicitHeight: root.height
            implicitWidth: root.height
            color: "transparent"
            radius: Config.config.bar.modules.radius
            visible: player?.trackArtUrl != ""

            IconImage {
                source: player?.trackArtUrl
                anchors.fill: parent
            }
        }

        Label {
            Layout.alignment: Qt.AlignVCenter
            text: truncate(player?.trackTitle + " - " + player?.trackArtist, 40)
            function truncate(s: string, n: int): string {
                return s.length > n ? s.substring(0, n - 1) + "..." : s;
            }
        }
    }
}
