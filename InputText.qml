import QtQuick 2.0

Item {
    width: 120
    height: 48
    property alias text: inputField.text
    property alias textField: nameField.text
    property int maxLength: 2
    Rectangle {
        width: parent.width
        height: parent.height

        Rectangle {
            id: box
            width: parent.width
            height: 40
            color: "lightgray"
            border.color: "black"
            radius: 5
            anchors.centerIn: parent

            TextInput {
                id: inputField
                width: parent.width
                height: 40
                font.pixelSize: 20
                maximumLength: maxLength
                anchors.fill: parent
                anchors.centerIn: parent
                horizontalAlignment: TextInput.AlignHCenter
                verticalAlignment: TextInput.AlignVCenter
            }
        }
        Text {
            id: nameField
            anchors.right: box.left
            anchors.rightMargin: 10
            anchors.verticalCenter: box.verticalCenter
            font.pixelSize: 15
        }
    }
}
