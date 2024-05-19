import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    minimumWidth: 640
    minimumHeight: 520
    maximumHeight: 480
    maximumWidth: 520
    title: qsTr("Hello World")

    InputText {
        id: toaAndTang
        textField: "Tầng/Tòa (0101) (Sáng cổng)"
        anchors.left: parent.left
        anchors.leftMargin: 300
        anchors.top: parent.top
        anchors.topMargin: 10
        maxLength: 4
    }
    Rectangle {
        id: buttonOK
        width: 80
        height: 40
        radius: 4
        border.width: 1
        color: "lightgray"
        border.color: "black"
        anchors.left: toaAndTang.right
        anchors.leftMargin: 30
        anchors.top: toaAndTang.top
        anchors.topMargin: 2
        Text {
            font.pixelSize: buttonOK.height/2
            anchors.fill: parent
            anchors.centerIn: parent
            horizontalAlignment: TextInput.AlignHCenter
            verticalAlignment: TextInput.AlignVCenter
            text: "OK"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                buttonOK.color = "lightgray";
                var portUrl = DataBase.findPort("port", toaAndTang.text)
                console.log(portUrl)
                if (portUrl !== "")
                {
                    TcpClient.sendOnly(0, portUrl); // 123.123.123.150
                }
            }
            onPressed: {
                buttonOK.color = "blue";
            }
            onReleased: {
                buttonOK.color = "lightgray";
            }
        }
    }

    InputText {
        id: midiOnly
        textField: "Test Midi (1/C-1)"
        anchors.left: toaAndTang.left
        anchors.top: toaAndTang.top
        anchors.topMargin: 80
        maxLength: 8
    }
    Rectangle {
        id: buttonOKMidi
        width: 80
        height: 40
        radius: 4
        border.width: 1
        color: "lightgray"
        border.color: "black"
        anchors.left: toaAndTang.right
        anchors.leftMargin: 30
        anchors.top: midiOnly.top
        anchors.topMargin: 4
        Text {
            font.pixelSize: buttonOK.height/2
            anchors.fill: parent
            anchors.centerIn: parent
            horizontalAlignment: TextInput.AlignHCenter
            verticalAlignment: TextInput.AlignVCenter
            text: "OK"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                buttonOKMidi.color = "lightgray";
                console.log("midiOnly text: ", midiOnly.text)
                TcpClient.sendOnly(1, midiOnly.text) // 123.123.123.151
            }
            onPressed: {
                buttonOKMidi.color = "blue";
            }
            onReleased: {
                buttonOKMidi.color = "lightgray";
            }
        }
    }
    InputText {
        id: uartOnly
        textField: "Test Uart (R,S,C)"
        anchors.left: toaAndTang.left
        anchors.top: midiOnly.top
        anchors.topMargin: 80
        maxLength: 2
    }
    Rectangle {
        id: buttonOKUart
        width: 80
        height: 40
        radius: 4
        border.width: 1
        color: "lightgray"
        border.color: "black"
        anchors.left: toaAndTang.right
        anchors.leftMargin: 30
        anchors.top: uartOnly.top
        anchors.topMargin: 4
        Text {
            font.pixelSize: buttonOK.height/2
            anchors.fill: parent
            anchors.centerIn: parent
            horizontalAlignment: TextInput.AlignHCenter
            verticalAlignment: TextInput.AlignVCenter
            text: "OK"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                buttonOKUart.color = "lightgray";
                TcpClient.sendOnly(2, uartOnly.text) // 123.123.123.152
            }
            onPressed: {
                buttonOKUart.color = "blue";
            }
            onReleased: {
                buttonOKUart.color = "lightgray";
            }
        }
    }

    InputText {
        id: effectAndMapping
        textField: "Send code effect or Mapping"
        anchors.left: toaAndTang.left
        anchors.top: uartOnly.top
        anchors.topMargin: 80
        maxLength: 6
    }
    Rectangle {
        id: buttonOKeffectAndMapping
        width: 80
        height: 40
        radius: 4
        border.width: 1
        color: "lightgray"
        border.color: "black"
        anchors.left: toaAndTang.right
        anchors.leftMargin: 30
        anchors.top: effectAndMapping.top
        anchors.topMargin: 4
        Text {
            font.pixelSize: buttonOK.height/2
            anchors.fill: parent
            anchors.centerIn: parent
            horizontalAlignment: TextInput.AlignHCenter
            verticalAlignment: TextInput.AlignVCenter
            text: "OK"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                buttonOKeffectAndMapping.color = "lightgray";
                TcpClient.sendOnly(0, effectAndMapping.text) // 123.123.123.150
            }
            onPressed: {
                buttonOKeffectAndMapping.color = "blue";
            }
            onReleased: {
                buttonOKeffectAndMapping.color = "lightgray";
            }
        }
    }

//    Text {
//        id: note
//        text: "Midi and UART"
//        font.pixelSize: 20
//        anchors.top: midiOnly.bottom
//        anchors.topMargin: 20
//        anchors.horizontalCenter: parent.horizontalCenter
//    }
//    DropDownBox {
//        id: carControl
//        anchors.top: note.bottom
//        anchors.topMargin: 10
//        anchors.left: parent.left
//        anchors.leftMargin: 40
//        model: ["CarControl", "CarMove", "CarStop", "CarTurnRight"]
//    }
//    DropDownBox {
//        id: traffic
//        anchors.top: carControl.bottom
//        anchors.topMargin: 80
//        anchors.left: carControl.left
//        model: ["Traffic", "TrafficOn", "TrafficOff"]
//    }
//    DropDownBox {
//        id: prjMapping
//        anchors.top: carControl.top
//        anchors.left: carControl.right
//        anchors.leftMargin: 30
//        model: ["PrjMapping", "PrjMapping1", "PrjMapping2", "PrjMapping3"]
//    }
//    DropDownBox {
//        id: lightEffect
//        anchors.top: traffic.top
//        anchors.left: prjMapping.left
//        model: ["LightEffect", "LightEffect1", "LightEffect2", "LightEffect3", "LightEffect4", "LightEffect5"]
//    }
//    DropDownBox {
//        id: modelAndBack
//        anchors.top: lightEffect.bottom
//        anchors.topMargin: 80
//        anchors.horizontalCenter: parent.horizontalCenter
//        model: ["VietModelAndBack", "VietModel", "Back"]
//    }
}
