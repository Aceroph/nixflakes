import QtQuick.Controls
import Quickshell.Services.Pipewire
import QtQuick

Item {
    id: root

    Slider {
        id: slider

        orientation: Qt.Vertical
    }
    
    Text {
        text: Pipewire.defaultAudioSink.audio.volume
    }
}
