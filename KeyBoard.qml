import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Controls.Styles 1.2
import QtQuick.Controls.Material 2.1
import QtGraphicalEffects 1.0
Item {
    width: parent.width
    height: parent.height
    Rectangle{
        height: parent.height
        width: parent.width
        //border.color: "orange"
        anchors.bottom: parent.bottom

        Rectangle{
            id: lineZero
            height: parent.height*0.24; width: parent.width*0.8
            anchors.left: parent.left; anchors.top: parent.top; anchors.leftMargin: parent.width*0.1;anchors.topMargin: parent.width*0.001
         //   border.color: "black"
            Row{
                spacing: 1
                Rectangle{
                    height: lineTwo.height; width: lineTwo.width*0.0955
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("1")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldChange.visible){
                                fieldChange.text = fieldChange.text + "1"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                Rectangle{
                    height: lineTwo.height; width: lineTwo.width*0.095
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("2")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldChange.visible){
                                fieldChange.text = fieldChange.text + "2"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                Rectangle{
                    height: lineTwo.height; width: lineTwo.width*0.095
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("3")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldChange.visible){
                                fieldChange.text = fieldChange.text + "3"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                Rectangle{
                    height: lineTwo.height; width: lineTwo.width*0.095
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("4")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldChange.visible){
                                fieldChange.text = fieldChange.text + "4"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                Rectangle{
                    height: lineTwo.height; width: lineTwo.width*0.095
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("5")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldChange.visible){
                                fieldChange.text = fieldChange.text + "5"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                Rectangle{
                    height: lineTwo.height; width: lineTwo.width*0.095
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("6")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldChange.visible){
                                fieldChange.text = fieldChange.text + "6"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                Rectangle{
                    height: lineTwo.height; width: lineTwo.width*0.095
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("7")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldChange.visible){
                                fieldChange.text = fieldChange.text + "7"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                Rectangle{
                    height: lineTwo.height; width: lineTwo.width*0.095
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("8")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldChange.visible){
                                fieldChange.text = fieldChange.text + "8"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                Rectangle{
                    height: lineTwo.height; width: lineTwo.width*0.095
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("9")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldChange.visible){
                                fieldChange.text = fieldChange.text + "9"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                Rectangle{
                    height: lineTwo.height; width: lineTwo.width*0.095
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("0")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldChange.visible){
                                fieldChange.text = fieldChange.text + "0"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
            }
        }



        Rectangle{
            id: lineOne
            height: parent.height*0.24; width: parent.width*0.8
            anchors.left: parent.left; anchors.top: lineZero.bottom; anchors.topMargin: parent.height*0.01; anchors.leftMargin: parent.width*0.05
          //  border.color: "black"
            Row{
                spacing: 1
                Rectangle{
                    height: lineOne.height; width: lineOne.width*0.0955
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("Q")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldName.visible){
                                fieldName.text = fieldName.text + "Q"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                Rectangle{
                    height: lineOne.height; width: lineOne.width*0.095
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("W")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldName.visible){
                                fieldName.text = fieldName.text + "W"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                Rectangle{
                    height: lineOne.height; width: lineOne.width*0.095
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("E")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldName.visible){
                                fieldName.text = fieldName.text + "E"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                Rectangle{
                    height: lineOne.height; width: lineOne.width*0.095
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("R")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldName.visible){
                                fieldName.text = fieldName.text + "R"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                Rectangle{
                    height: lineOne.height; width: lineOne.width*0.095
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("T")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldName.visible){
                                fieldName.text = fieldName.text + "T"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                Rectangle{
                    height: lineOne.height; width: lineOne.width*0.095
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("Y")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldName.visible){
                                fieldName.text = fieldName.text + "Y"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                Rectangle{
                    height: lineOne.height; width: lineOne.width*0.095
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("U")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldName.visible){
                                fieldName.text = fieldName.text + "U"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                Rectangle{
                    height: lineOne.height; width: lineOne.width*0.095
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("I")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldName.visible){
                                fieldName.text = fieldName.text + "I"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                Rectangle{
                    height: lineOne.height; width: lineOne.width*0.095
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("O")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldName.visible){
                                fieldName.text = fieldName.text + "O"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                Rectangle{
                    height: lineOne.height; width: lineOne.width*0.095
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("P")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldName.visible){
                                fieldName.text = fieldName.text + "P"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                Rectangle{
                    height: lineOne.height; width: lineOne.width*0.095
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr(".")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldChange.visible){
                                fieldChange.text = fieldChange.text + "."
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
            }
        }






        Rectangle{
            id: lineTwo
            height: parent.height*0.24; width: parent.width*0.8
            anchors.left: parent.left; anchors.top: lineOne.bottom; anchors.leftMargin: parent.width*0.1; anchors.topMargin: parent.height*0.01
            //border.color: "black"
            Row{
                spacing: 1
                Rectangle{
                    height: lineTwo.height; width: lineTwo.width*0.0955
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("A")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldName.visible){
                                fieldName.text = fieldName.text + "A"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                Rectangle{
                    height: lineTwo.height; width: lineTwo.width*0.095
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("S")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldName.visible){
                                fieldName.text = fieldName.text + "S"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                Rectangle{
                    height: lineTwo.height; width: lineTwo.width*0.095
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("D")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldName.visible){
                                fieldName.text = fieldName.text + "D"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                Rectangle{
                    height: lineTwo.height; width: lineTwo.width*0.095
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("F")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldName.visible){
                                fieldName.text = fieldName.text + "F"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                Rectangle{
                    height: lineTwo.height; width: lineTwo.width*0.095
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("G")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldName.visible){
                                fieldName.text = fieldName.text + "G"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                Rectangle{
                    height: lineTwo.height; width: lineTwo.width*0.095
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("H")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldName.visible){
                                fieldName.text = fieldName.text + "H"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                Rectangle{
                    height: lineTwo.height; width: lineTwo.width*0.095
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("J")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldName.visible){
                                fieldName.text = fieldName.text + "J"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                Rectangle{
                    height: lineTwo.height; width: lineTwo.width*0.095
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("K")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldName.visible){
                                fieldName.text = fieldName.text + "K"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                Rectangle{
                    height: lineTwo.height; width: lineTwo.width*0.095
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("L")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldName.visible){
                                fieldName.text = fieldName.text + "L"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                Rectangle{
                    height: lineTwo.height; width: lineTwo.width*0.15
                    border.color: "orange"
                    radius: 5
                    Image {
                        anchors.centerIn: parent
                        source: "qrc:/images/delete.png"
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldName.visible){
                                fieldName.remove(fieldName.length-1, fieldName.length)
                            }
                            else{
                                fieldChange.remove(fieldChange.length-1, fieldChange.length)
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
            }
        }



        Rectangle{
            id: lineThree
            height: parent.height*0.24; width: parent.width*0.95
            anchors.left: parent.left; anchors.top: lineTwo.bottom; anchors.topMargin: parent.height*0.01; anchors.leftMargin:  parent.height*0.06
            Row{
                spacing: 1
             /*   RoundButton{
                    height: lineThree.height; width: lineThree.width*0.2
                    text: "Cancelar"
                    font.bold: true
                    font.family: "Roboto"
                    focus: true
                    Material.background: "#5cb860"
                    Material.foreground: "white"
                }*/
                RoundButton {
                    id: cancelButton
                    //visible: false
                    text: "Cancelar"
                    font.family: "Roboto"
                    focus: true
                    Material.background: "#ef494e"
                    Material.foreground: "white"
                    font.pixelSize: 20
                    font.bold: true
                    height: lineThree.height
                    width: lineThree.width*0.2
                    onClicked: {
                        pay = ""
                        name = ""
                        change = ""
                        stackView.pop()
                    }
                }
                Rectangle{
                    height: lineTwo.height; width: lineTwo.width*0.0955
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("Z")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldName.visible){
                                fieldName.text = fieldName.text + "Z"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                Rectangle{
                    height: lineTwo.height; width: lineTwo.width*0.095
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("X")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldName.visible){
                                fieldName.text = fieldName.text + "X"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                Rectangle{
                    height: lineTwo.height; width: lineTwo.width*0.095
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("C")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldName.visible){
                                fieldName.text = fieldName.text + "C"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                Rectangle{
                    height: lineTwo.height; width: lineTwo.width*0.095
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("V")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldName.visible){
                                fieldName.text = fieldName.text + "V"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                Rectangle{
                    height: lineTwo.height; width: lineTwo.width*0.095
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("B")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldName.visible){
                                fieldName.text = fieldName.text + "B"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                Rectangle{
                    height: lineTwo.height; width: lineTwo.width*0.095
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("N")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldName.visible){
                                fieldName.text = fieldName.text + "N"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                Rectangle{
                    height: lineTwo.height; width: lineTwo.width*0.095
                    border.color: "orange"
                    radius: 5
                    Text {
                        anchors.centerIn: parent
                        font.bold: true
                        font.pixelSize: parent.height*0.3
                        text: qsTr("M")
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldName.visible){
                                fieldName.text = fieldName.text + "M"
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
                /*RoundButton{
                    height: lineThree.height; width: lineThree.width*0.22
                    text: "Finalizar"
                    font.bold: true
                    font.family: "Roboto"
                    focus: true
                    Material.background: "#5cb860"
                    Material.foreground: "white"
                }*/

                RoundButton {
                    id: nextButton
                   // visible: false
                    enabled: {
                        if(columnChange.visible == true)
                            return fieldChange.text == "" ? false:true
                        else
                            return fieldName.text == "" ? false:true
                    }
                    text: "Prosseguir"
                    font.family: "Roboto"
                    focus: true
                    Material.background: "#5cb860"
                    Material.foreground: "white"
                    font.pixelSize: 20
                    font.bold: true
                    height: lineThree.height; width: lineThree.width*0.22
                    onClicked: {
                        if(nextButton.text == "Finalizar"){
                            name = fieldName.text
                            change = fieldChange.text
                            creatjson.addClient(name, pay,change, tValue)
                            buttonsRow.visible = false
                            columnPagamento.visible = false
                            columnValidate.visible = true
                            if(creatjson.finishOrder()) {
                                titleBar.title = "Pedido feito corretamente"
                                animCheck.playing = true
                                timer.start()
                            } else {
                                titleBar.title = "Erro no pedido"
                                msgValidate.text = "Por favor, chame um de nossos atendentes para verificar o ocorrido."
                                animCheck.source = "qrc:/images/error.png"

                            }

                            name = ""
                            pay = ""
                            change = ""
                        }
                        if(columnChange.visible == true) {
                            titleBar.title = "Informe seu nome para ser chamado"
                            nextButton.text = "Finalizar"
                            columnChange.visible = false
                            fieldName.visible = true
                            fieldName.focus = true
                        }
                    }
                }
            }
        }
    }
}
