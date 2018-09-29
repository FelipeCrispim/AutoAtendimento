import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.1
import QtQuick.Controls.Universal 2.1
import Qt.labs.settings 1.0

Dialog {
    id: popUpPedido1
    property alias textProtein: textProteinaPedido1.text
    property alias coxaTextButton: buttonCoxa.text
    property alias peitoTextButton: buttonPeito.text
    property string fatherProduto: ""
    property int radioButtonFontSize: 18
    height: parent.height
    width: parent.width
    modal: true
    focus: true
    clip: true
    padding: 0
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
    onClosed: {
        pedidofinal1 = ""
        listpedidofinal.produto = ""; listpedidofinal.quantidade = ""; listpedidofinal.valor = ""; listpedidofinal.acompanhamento= ""
        auxvalor1 = ""
        flickableScroll.position = 0.0
    }

    Rectangle {
        id: recTop
        width: parent.width
        height: parent.height * 0.83
        anchors.left: parent.Left
//        anchors.leftMargin: 20
        Flickable {
            id: flickable
            anchors.fill: parent
            contentWidth: popUpPedido1.width
            contentHeight: popUpPedido1.height*1.12
            flickableDirection: Flickable.VerticalFlick
            anchors.leftMargin: 15
            anchors.rightMargin: 15
            ScrollBar.vertical: ScrollBar {
                id: flickableScroll
                parent: flickable
                anchors.top: flickable.top
                //anchors.left: flickable.right
                //anchors.bottom: flickable.bottom
                orientation: Qt.Vertical }       // uncomment to test

            ButtonGroup {
                id: beansGroup
                buttons: columnFeijaoPedido1.children
                //onClicked: console.log("clicked:", button.text)
            }
            Column{
                id: columnFeijaoPedido1
                anchors.top: popUpPedido1.top
                anchors.left: popUpPedido1.Left
                anchors.right: popUpPedido1.Right
                Text{
                    id: textTop
                    text: fatherProduto
                    font.pixelSize: 30
                    font.bold: true
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Text{
                    id: textInfo
                    text: "Seu prato acompanha: Arroz, Macarrão, Fritas, Feijão Tropeiro ou Caseiro, Maionese ou Purê.\n"
                    font.family: "Roboto"
                    font.pixelSize: 20
                    wrapMode: Text.WordWrap
                    //horizontalAlignment: Text.AlignJustify
                   horizontalAlignment: Text.AlignHCenter
                    width: flickable.width
                }

                Text {
                    id: textFeijaoPedido1
                    text: qsTr("Escolha o Feijão")
                    font.family: "Roboto"
                    font.pixelSize: 20
                }
                RadioButton{
                    id: buttonFeijaoTropeiro
                    text: "Feijão Tropeiro"
                    font.pixelSize: radioButtonFontSize
                    font.family: "Roboto"
                    checked: true
                    height: 35
                }
                RadioButton{
                    id: buttonFeijaoCaseiro
                    text: "Feijão Caseiro"
                    font.pixelSize: radioButtonFontSize
                    font.family: "Roboto"
                    height: 35
                }
                RadioButton{
                    id: buttonSemFeijao
                    text: "Sem Feijão"
                    font.pixelSize: radioButtonFontSize
                    font.family: "Roboto"
                    height: 35
                }
            }
            ButtonGroup {
                id: mayonnaiseGroup
                buttons: columnMaionesePedido1.children
                //onClicked: console.log("clicked:", button.text)
            }
            Column{
                id: columnMaionesePedido1
                anchors.top: columnFeijaoPedido1.bottom
                anchors.topMargin: 20
                anchors.left: popUpPedido1.Left
                anchors.right: popUpPedido1.Right
                Text {
                    id: textMaionesePedido1
                    text: qsTr("Escolha entre Maionese ou Purê")
                    font.family: "Roboto"
                    font.pixelSize: 20
                }
                RadioButton{
                    id: buttonMaionese
                    height: 35
                    text: "Maionese"
                    font.pixelSize: radioButtonFontSize
                    font.family: "Roboto"
                    checked: true
                }
                RadioButton{
                    id: buttonPure
                    text: "Purê"
                    font.pixelSize: radioButtonFontSize
                    font.family: "Roboto"
                    height: 35
                }
                RadioButton{
                    id: buttonMaionesePure
                    text: "Sem Maionese e Sem Purê"
                    font.pixelSize: radioButtonFontSize
                    font.family: "Roboto"
                    height: 35
                }
            }
            ButtonGroup {
                id: proteinGroup
                buttons: columnProteinaPedido1.children
               // onClicked: console.log("clicked:", button.text)
            }
            Column{
                id: columnProteinaPedido1
                anchors.top: columnMaionesePedido1.bottom
                anchors.topMargin: 20
                anchors.left: popUpPedido1.Left
                anchors.right: popUpPedido1.Right
                Text {
                    id: textProteinaPedido1
                    text: qsTr("Escolha a Parte do Galeto")
                    font.family: "Roboto"
                    font.pixelSize: 20
                }
                RadioButton{
                    id: buttonCoxa
                    height: 35
                    font.pixelSize: radioButtonFontSize
                    font.family: "Roboto"
                    checked: true
                    text: "Coxa e Sobre-Coxa"

                }
                RadioButton{
                    id: buttonPeito
                    text: "Peito e Asa"
                    font.pixelSize: radioButtonFontSize
                    font.family: "Roboto"
                    height: 35
                }
            }
            Column{
                id: columnRetirarPedido1
                anchors.top: columnProteinaPedido1.bottom
                anchors.topMargin: 20
                anchors.left: popUpPedido1.Left
                anchors.right: popUpPedido1.Right
                Text {
                    id: textRetirarPedido1
                    text: qsTr("Deseja retirar algum Acompanhamento?")
                    wrapMode: Text.WordWrap
                    width: flickable.width*0.9
                    font.family: "Roboto"
                    font.pixelSize: 20
                }
                CheckBox{
                    id: buttonSemArroz
                    height: 35
                    font.pixelSize: radioButtonFontSize
                    font.family: "Roboto"
                    text: "Sem Arroz"
                }
                CheckBox{
                    id: buttonSemMacarrao
                    text: "Sem Macarrão"
                    font.pixelSize: radioButtonFontSize
                    font.family: "Roboto"
                    height: 35
                }
                CheckBox{
                    id: buttonSemFritas
                    text: "Sem Fritas"
                    font.pixelSize: radioButtonFontSize
                    font.family: "Roboto"
                    height: 35
                }
            }
        }
    }
    Rectangle {
        color: "white"//"#22333333"
        width: parent.width - 10
        height: parent.height * 0.15
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        Image {
            id: arrow
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: divider.top
            source: "qrc:/images/arrow.png"
            rotation: 180
            opacity: flickable.atYEnd ? 0 : 0.5
            Behavior on opacity { NumberAnimation { duration: 500 } }
            NumberAnimation { id: anim; target: flickable; property: "contentY"; easing.type: Easing.OutCubic; duration: 500 }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    var pos = flickable.contentY;
                    var destPos;
                    destPos = flickable.contentHeight-flickable.height;
                    anim.from = pos;
                    anim.to = destPos;
                    anim.running = true;
                }
            }
        }
        Rectangle {
            id: divider
            width: parent.width
            height: 2
            color: "#11333333"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
        }
        Row {
            anchors.centerIn: parent
            spacing: (parent.width - buttonFinish.width*2)/3
            Button{
                id: buttonFinish
                height: popUpPedido1.height*0.1
                width: popUpPedido1.width * 0.4
                text: "Finalizar"
                font.family: "Roboto"
                font.bold: true
                focus: true
                Material.background: "#5cb860"
                Material.foreground: "white"
                font.pixelSize: 20
                onClicked: {
                    pedidofinal1 += beansGroup.checkedButton.text +"\\ "+ mayonnaiseGroup.checkedButton.text +"\\ "+
                            proteinGroup.checkedButton.text

                    listpedidofinal.acompanhamento = beansGroup.checkedButton.text +"\\ "+ mayonnaiseGroup.checkedButton.text +"\\ "+
                            proteinGroup.checkedButton.text
                    for(var i=1; i< columnRetirarPedido1.children.length; i++){
                        if(columnRetirarPedido1.children[i].checked){
                            pedidofinal1 += "\\ "+columnRetirarPedido1.children[i].text
                            listpedidofinal.acompanhamento += "\\ " + columnRetirarPedido1.children[i].text
                        }
                    }

                    listResultado.model.append({textResultado: pedidofinal1, valorResultado: auxvalor1})
                    //console.log(listpedidofinal.produto,listpedidofinal.quantidade,listpedidofinal.valor,listpedidofinal.acompanhamento)
                    creatjson.addNewProduct(listpedidofinal.produto, listpedidofinal.quantidade, listpedidofinal.valor, listpedidofinal.acompanhamento)
                    //console.log(auxIndex)
                    buttonFeijaoTropeiro.checked = true
                    buttonSemMacarrao.checked = false
                    buttonSemFritas.checked = false
                    buttonSemFeijao.checked = false
                    buttonSemArroz.checked = false
                    buttonFeijaoCaseiro.checked = false
                    buttonPeito.checked = false
                    buttonCoxa.checked = true
                    buttonMaionesePure.checked = false
                    buttonPure.checked = false
                    buttonMaionese.checked = true
                    buttonSemFeijao.checked = false
                    valorFinal = valorFinal + parseFloat(auxvalor1)
                    popUpPedido1.close()
                    listpedidofinal.produto = ""; listpedidofinal.quantidade = ""; listpedidofinal.valor = ""; listpedidofinal.acompanhamento= ""
                    pedidofinal1 = ""
                }
            }
            Button{
                id: buttonCancel
                height: popUpPedido1.height*0.1
                width: popUpPedido1.width * 0.4
                text: "Cancelar"
                font.pixelSize: 20
                font.bold: true
                Material.background: "#ef494e"
                Material.foreground: "white"
                onClicked: popUpPedido1.close()
            }
        }
    }

}
