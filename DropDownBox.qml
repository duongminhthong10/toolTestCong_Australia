import QtQuick 2.0
import QtQuick.Controls 2.12
Rectangle {
    id: root
    width: 280
    property alias model: control.model
    property alias currentIndex: control.currentIndex
    property alias currentText: control.currentText
    ComboBox {
        id: control
        delegate: ItemDelegate {
            width: control.width - 20
            contentItem: Text {
                text: modelData
                color: "#787878"
                font: control.font
                elide: Text.ElideRight
                verticalAlignment: Text.AlignVCenter
            }
            highlighted: control.highlightedIndex === index
        }

        indicator: Canvas {
            id: canvas
            x: control.width - width - control.rightPadding
            y: control.topPadding + (control.availableHeight - height) / 2
            width: 12
            height: 8
            contextType: "2d"

            Connections {
                target: control
                function onPressedChanged() { canvas.requestPaint(); }
            }

            onPaint: {
                context.reset();
                context.moveTo(0, 0);
                context.lineTo(width, 0);
                context.lineTo(width / 2, height);
                context.closePath();
                context.fillStyle = control.pressed ? "#17a81a" : "#B4C8DA";
                context.fill();
            }
        }

        contentItem: Text {
            anchors.left: parent.left
            anchors.leftMargin: 10

            text: control.displayText
            font: control.font
            color: control.pressed ? "#17a81a" : "#787878"
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }

        background: Rectangle {
            implicitWidth: 250
            implicitHeight: 40
            border.color: control.pressed ? "#17a81a" : "#B4C8DA"
            border.width: control.visualFocus ? 2 : 1
            radius: 20
        }

        popup: Popup {
            y: control.height + 3
            width: control.width
            implicitHeight: contentItem.implicitHeight + 20
            padding: 10

            contentItem: ListView {
                clip: true
                implicitHeight: contentHeight
                model: control.popup.visible ? control.delegateModel : null
                currentIndex: control.highlightedIndex

                ScrollIndicator.vertical: ScrollIndicator { }
            }

            background: Rectangle {
                border.color: "#B4C8DA"
                radius: 20
            }
        }
    }
}
