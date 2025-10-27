import Quickshell.Services.SystemTray
import QtQuick
import QtQuick.Layouts
import Quickshell

import qs.shared
import qs.services.config

BarModule {
    id: root

    property var currentTrayItem: null

    RowLayout {
        spacing: 16

        Repeater {
            model: SystemTray.items

            Item {
                id: tray

                required property int index
                required property SystemTrayItem modelData

                Layout.alignment: Qt.AlignVCenter
                Layout.margins: 1
                Layout.rightMargin: index == SystemTray.items.values.length - 1 ? 6 : 1

                Image {
                    id: icon
                    height: Config.config.bar.height - 2 - Config.config.bar.padding * 2
                    fillMode: Image.PreserveAspectFit
                    source: tray.modelData.icon
                }

                MouseArea {
                    anchors.fill: icon

                    onClicked: {
                        if (currentTrayItem == menuData) {
                            menu.item.visible = false;
                            currentTrayItem = null;
                        } else if (!currentTrayItem) {
                            currentTrayItem = menuData;
                            menu.loading = true;
                        } else {
                            currentTrayItem = menuData;
                        }
                    }
                }

                QsMenuOpener {
                    id: menuData

                    menu: modelData.menu
                }
            }
        }
    }

    LazyLoader {
        id: menu

        onActiveChanged: item.visible = !item.visible

        PopupWindow {

            anchor {
                item: root
                gravity: Edges.Bottom | Edges.Left
            }

            visible: false
            implicitHeight: menuLayout.height
            implicitWidth: getMenuWidth()

            function getMenuWidth(): number {
                const items = currentTrayItem.children.values.slice();
                items.sort((a, b) => b.text.length - a.text.length);
                console.log(items[0].text);

                return 300;
            }

            Rectangle {
                anchors.fill: parent
                color: Config.config.bar.background
                radius: Config.config.bar.modules.radius
            }

            ColumnLayout {
                id: menuLayout
                spacing: 16

                Repeater {
                    model: currentTrayItem.children

                    Item {
                        required property QsMenuEntry modelData
                        required property int index

                        Layout.topMargin: index == 0 ? Config.config.bar.padding : 0
                        Layout.bottomMargin: index == currentTrayItem.children.values.length - 1 ? Config.config.bar.padding : 0
                        Layout.leftMargin: Config.config.bar.padding
                        Layout.rightMargin: Config.config.bar.padding

                        Label {
                            text: modelData.text
                        }
                    }
                }
            }
        }
    }
}
