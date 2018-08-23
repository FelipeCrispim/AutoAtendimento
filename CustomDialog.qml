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
    height: parent.height
    width: parent.width
    modal: true
    focus: true
    clip: true
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
    onClosed: {
        pedidofinal1 = ""
        auxvalor1 = ""
        flickableScroll.position = 0.0
    }

    Flickable {
        id: flickable
        anchors.fill: parent
        contentWidth: popUpPedido1.width
        contentHeight: popUpPedido1.height*1.15
        flickableDirection: Flickable.VerticalFlick

        //ScrollIndicator.vertical: ScrollIndicator { }
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
            onClicked: console.log("clicked:", button.text)
        }
        Column{
            id: columnFeijaoPedido1
            anchors.top: popUpPedido1.top
            anchors.left: popUpPedido1.Left
            anchors.right: popUpPedido1.Right
            Text {
                id: textFeijaoPedido1
                text: qsTr("Escolha o Feijão")
                font.family: "Cursive"
                font.pixelSize: 20
            }
            RadioButton{
                id: buttonFeijaoTropeiro
                text: "Feijão Tropeiro"
                font.family: "Cursive"
                checked: true
                height: 35
            }
            RadioButton{
                id: buttonFeijaoCaseiro
                text: "Feijão Caseiro"
                font.family: "Cursive"
                height: 35
            }
            RadioButton{
                id: buttonSemFeijao
                text: "Sem Feijão"
                font.family: "Cursive"
                height: 35
            }
        }
        ButtonGroup {
            id: mayonnaiseGroup
            buttons: columnMaionesePedido1.children
            onClicked: console.log("clicked:", button.text)
        }
        Column{
            id: columnMaionesePedido1
            anchors.top: columnFeijaoPedido1.bottom
            anchors.left: popUpPedido1.Left
            anchors.right: popUpPedido1.Right
            Text {
                id: textMaionesePedido1
                text: qsTr("Escolha entre Maionese ou Purê")
                font.family: "Cursive"
                font.pixelSize: 20
            }
            RadioButton{
                id: buttonMaionese
                height: 35
                text: "Maionese"
                font.family: "Cursive"
                checked: true
            }
            RadioButton{
                id: buttonPure
                text: "Purê"
                font.family: "Cursive"
                height: 35
            }
            RadioButton{
                id: buttonMaionesePure
                text: "Sem Maionese e Sem Purê"
                font.family: "Cursive"
                height: 35
            }
        }
        ButtonGroup {
            id: proteinGroup
            buttons: columnProteinaPedido1.children
            onClicked: console.log("clicked:", button.text)
        }
        Column{
            id: columnProteinaPedido1
            anchors.top: columnMaionesePedido1.bottom
            anchors.left: popUpPedido1.Left
            anchors.right: popUpPedido1.Right
            Text {
                id: textProteinaPedido1
                text: qsTr("Escolha a Parte do Galeto")
                font.family: "Cursive"
                font.pixelSize: 20
            }
            RadioButton{
                id: buttonCoxa
                height: 35
                font.family: "Cursive"
                checked: true
                text: "Coxa e Sobre-Coxa"

            }
            RadioButton{
                id: buttonPeito
                text: "Peito e Asa"
                font.family: "Cursive"
                height: 35
            }
        }
        Column{
            id: columnRetirarPedido1
            anchors.top: columnProteinaPedido1.bottom
            anchors.left: popUpPedido1.Left
            anchors.right: popUpPedido1.Right
            Text {
                id: textRetirarPedido1
                text: qsTr("Deseja modificar o Acompanhamento? O acrescimo ou retirada não muda\no valor nem a quantidade total de comida")
                font.family: "Cursive"
                font.pixelSize: 20
            }
            CheckBox{
                id: buttonSemArroz
                height: 35
                font.family: "Cursive"
                text: "Sem Arroz"
            }
            CheckBox{
                id: buttonSemMacarrao
                text: "Sem Macarrão"
                font.family: "Cursive"
                height: 35
            }
            CheckBox{
                id: buttonSemFritas
                text: "Sem Fritas"
                font.family: "Cursive"
                height: 35
            }
            CheckBox{
                id: buttonMaisArroz
                text: "Mais Arroz"
                font.family: "Cursive"
                height: 35
            }
            CheckBox{
                id: buttonMaisMacarrao
                text: "Mais Macarrao"
                font.family: "Cursive"
                height: 35
            }
            CheckBox{
                id: buttonMaisFritas
                text: "Mais Fritas"
                font.family: "Cursive"
                height: 35
            }
            CheckBox{
                id: buttonMaisFeijao
                text: "Mais Feijão"
                font.family: "Cursive"
                height: 35
            }
            CheckBox{
                id: buttonMaisMaionese
                text: "Mais Maionese ou Purê"
                font.family: "Cursive"
                height: 35
            }
        }
    }
    Rectangle {
        color: "#22333333"
        width: parent.width + 50
        height: 150
        anchors.bottom: parent.bottom
        Button{
            id: buttonFinalizarPedido1
            anchors.top: columnRetirarPedido1.bottom
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.3
            // anchors.horizontalCenter: columnRetirarPedido1.horizontalCenter
            height: popUpPedido1.height*0.1
            width: popUpPedido1.width * 0.4
            text: "Finalizar"
            font.family: "Cursive"
            focus: true
            Material.background: "#4CAF50"
            Material.foreground: "white"
            font.pixelSize: 20
            onClicked: {
                pedidofinal1 += beansGroup.checkedButton.text +"\\ "+ mayonnaiseGroup.checkedButton.text +"\\ "+
                        proteinGroup.checkedButton.text

                for(var i=1; i< columnRetirarPedido1.children.length; i++){
                    if(columnRetirarPedido1.children[i].checked)
                        pedidofinal1 += "\\ "+columnRetirarPedido1.children[i].text
                }

                listResultado.model.append({textResultado: pedidofinal1, valorResultado: auxvalor1})
                //console.log(auxIndex)
                buttonFeijaoTropeiro.checked = true
                buttonMaisMaionese.checked = false
                buttonMaisMacarrao.checked = false
                buttonMaisFritas.checked = false
                buttonMaisFeijao.checked = false
                buttonMaisArroz.checked = false
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
                pedidofinal1 = ""
            }
        }
    }

}
