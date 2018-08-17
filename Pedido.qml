import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1

Item {
    height: root.height
    width: root.width
    property var pedidofinal1: ""
    property var pedidofinal2: ""
    property var auxvalor1: ""
    property var auxvalor2: ""
    property var valorFinal: 0
    ListModel{
        id: contactModel
        ListElement { produto: "Executivo de Galeto"; valor: "13.00"; tipo: 1; chave: "Executivos"}
        ListElement { produto: "Executivo de Boi   ";    valor: "14.00"; tipo: 1; chave: "Executivos"}
        ListElement { produto: "Executivo de Porco   ";    valor: "14.00"; tipo: 1; chave: "Executivos"}
        ListElement { produto: "Executivo de Calabresa   ";    valor: "14.00"; tipo: 1; chave: "Executivos"}
        ListElement { produto: "Executivo de Galinha Guisada   ";    valor: "14.00"; tipo: 1; chave: "Executivos"}
        ListElement { produto: "Coxa e SobreCoxa   ";    valor: "6.00"; tipo: 2; chave: "Carnes"}
        ListElement { produto: "Calabresa de Frango";   valor: "2.50"; tipo: 2; chave: "Carnes"}
        ListElement { produto: "Calabresa mista";   valor: "2.00"; tipo: 2; chave: "Carnes"}
        ListElement { produto: "Coca-Cola 2l   ";    valor: "8.50"; tipo: 2; chave: "Bebidas"}
    }


    Component {
        id: sectionHeading
        Rectangle {
            width: listPedido.width
            height: listPedido.height/10
            color: "white"
            Text {
                text: section
                font.bold: true
                font.family: "Cursive"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 20
            }
        }
    }
    Component {
        id: contactDelegate
        Rectangle {
            id: recDelegate
            width: parent.width; height: listPedido.height/10
//            border.color: "grey"
            //            radius: 5
            Text { text: produto;
                font.family: "Cursive"
                font.pixelSize: 20
                anchors.left: recDelegate.left
                anchors.leftMargin: 10
                anchors.verticalCenter: recDelegate.verticalCenter
            }
            Text { text: '<b>R$: ' + valor + '</b>';
                font.family: "Cursive"
                font.pixelSize: 20
                anchors.right: recDelegate.right
                anchors.rightMargin: 10
                anchors.verticalCenter: recDelegate.verticalCenter
            }
            MouseArea{
                id: mouseDelegate
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if(tipo === 1){
                        pedidofinal1 = pedidofinal1 + produto + "\n"
                        auxvalor1 = valor
                        //console.log(pedidofinal1)
                        if(produto == "Executivo de Galeto"){
                            textProteinaPedido1.text = "Escolha a Parte do Galeto"
                            buttonCoxa.text = "Coxa e Sobre-Coxa"
                            buttonPeito.text = "Peito e Asa"

                        }
                        else{

                            textProteinaPedido1.text = "Como deseja a Carne?"
                            buttonCoxa.text = "Bem Passada"
                            buttonPeito.text = "Ao Ponto"
                        }

                        popUpPedido1.open()
                    }
                    else if(tipo == 2){
                        pedidofinal2 = pedidofinal2 + produto
                        auxvalor2 = valor
                        popUpPedido2.open()
                    }

                }
            }
        }
    }

    Rectangle{
        id: recPopUp
        height: parent.height*0.9
        width: parent.width*0.5
        anchors.centerIn: parent

        Popup{
            id: popUpPedido1
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
                Button{
                    id: buttonFinalizarPedido1
                    //enabled: false
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
        Rectangle{
            id: recPopUp2
            height: parent.height*0.6
            width: parent.width*0.6
            anchors.centerIn: parent

            Popup{
                id: popUpPedido2
                height: parent.height
                width: parent.width
                modal: true
                focus: true
                closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
                onClosed: {
                    pedidofinal2 = ""
                    auxvalor2 = ""
                }

                Column{
                    id: columnPedido2
                    anchors.centerIn: parent
                    spacing: parent.height*0.07

                    Label{
                        id: labelPedido2
                        text: "Escolha a quantidade"
                        font.family: "Cursive"
                        font.pixelSize: 20
                    }

                    SpinBox{
                        id: spinPedido2
                        focusReason: Qt.MouseFocusReason
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: popUpPedido2.width*0.4
                    }
                    Button {
                        id: finalizarButtonPedido2
                        //anchors.rightMargin: 20
                        //height: paneResultado.height *0.15
                        width: popUpPedido2.width*0.4
                        text: "Finalizar"
                        font.family: "Cursive"
                        focus: true
                        Material.background: "#4CAF50"
                        Material.foreground: "white"
                        font.pixelSize: 20
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            if(spinPedido2.value != 0){
                                pedidofinal2 = spinPedido2.value + "x " + pedidofinal2
                                var aux1 = 0
                                var aux2 = 0
                                var i = 0
                                var charr = ""
                                aux1 = parseFloat(auxvalor2)
                                aux2 = parseFloat(spinPedido2.value)
                                aux1 = aux1 * aux2

                                auxvalor2 = aux1.toString()
                                while(i < auxvalor2.length){
                                    charr = auxvalor2.charAt(i)
                                    if(charr == '.'){
                                        auxvalor2 = auxvalor2 + "0"
                                        break
                                    }
                                    i = i + 1
                                }
                                if(i == auxvalor2.length){
                                    auxvalor2 = auxvalor2 + ".00"
                                }

                                listResultado.model.append({textResultado: pedidofinal2, valorResultado: auxvalor2})
                                spinPedido2.value = 0
                                valorFinal = valorFinal + aux1
                                popUpPedido2.close()
                                pedidofinal2 = ""
                            }
                        }
                    }
                }

            }
        }
    }

    Rectangle{
        id: recPedido
        height: parent.height
        width: parent.width
        color: Material.accent

        Rectangle {
            id: panePedido
            height: parent.height*0.93
            width: parent.width*0.46
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            Material.elevation: 13
            clip: true

            color: "grey"
            ListView{
                id: listPedido
                spacing: 2
                anchors.fill: parent
                topMargin: 40
//                anchors.margins: 10
                model: contactModel
                delegate: contactDelegate
                section.property: "chave"
                section.criteria: ViewSection.FullString
                section.delegate: sectionHeading
            }

            TitleBar {
                title: "Escolha uma opção abaixo"
                height: 70
                width: parent.width
                anchors.top: panePedido.top
            }
        }

        Rectangle {
            id: paneResultado
            height: parent.height*0.93
            width: parent.width*0.46
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            clip: true
            Material.elevation: 13

            Rectangle{
                id: recPaneResultado
                height: parent.height * 0.7
                width: parent.width
                //border.color: "black"
                clip: true

                ListView{
                    id: listResultado
                    anchors.fill: parent
                    topMargin: 60
                    anchors.margins: 10
                    model: ListModel{}
                    spacing: 2
                    delegate: Rectangle{
                        //  property int indexx: 0
                        id: recListResultado
                        width: listResultado.width; height: listResultado.height/4
                        border.color: "grey"
                        //                        radius: 5
                        clip: true

                        Text {
                            id: textListResultado
                            text: textResultado
                            wrapMode: Text.WordWrap
                            width: recListResultado.width*0.7
                            font.family: "Cursive"
                            font.pixelSize: 20
                            anchors.left: recListResultado.left
                            anchors.leftMargin: 10
                            anchors.verticalCenter: recListResultado.verticalCenter
                        }
                        Text {
                            id: textValorListResultado
                            text: '<b>R$: ' + valorResultado + '</b>';
                            anchors.left: textListResultado.right
                            anchors.leftMargin: textListResultado.width*0.04
                            font.family: "Cursive"
                            font.pixelSize: 20
                            anchors.verticalCenter: buttonExcluirResultado.verticalCenter
                        }
                        Button{
                            id: buttonExcluirResultado
                            anchors.right: recListResultado.right
                            anchors.rightMargin: recListResultado.width*0.001
                            anchors.verticalCenter: textListResultado.verticalCenter
                            width: recListResultado.width*0.1
                            height: 60
                            background: Rectangle{
                                //border.color: "black"
                                Image {
                                    id: imageExcluirResultado
                                    source: "qrc:/lixeira.png"
                                    height: 35
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    //anchors.left: parent.left
                                    //anchors.leftMargin: columnListResultado.width*0.1
                                    //anchors.top: parent.top
                                    //anchors.topMargin: columnListResultado.height*0.05
                                }
                            }
                            onClicked: {
                                var stop = 1
                                var indexx = 0
                                while(stop == 1){
                                    if(listResultado.model.get(indexx).textResultado == textResultado){
                                        stop = 0
                                    }
                                    else{
                                        indexx++
                                    }
                                }
                                valorFinal = valorFinal - parseFloat(listResultado.model.get(indexx).valorResultado)
                                listResultado.model.remove(indexx)
                            }
                        }
                    }
                }
            }
            Rectangle{
                id: recPaneFinalizarResultado
                height: paneResultado.height*0.3
                width: paneResultado.width*0.962
                anchors.top: recPaneResultado.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                //border.color: "black"

                Text {
                    id: textValorFinalResultado
                    //anchors.left: parent.left
                    //anchors.leftMargin: parent.height*0.1
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: parent.height*0.2
                    font.family: "Cursive"
                    font.pixelSize: 20
                    text: "Valor Total <b>R$:  " + valorFinal + "</b>"

                }

                Row {
                    anchors.horizontalCenter: parent.horizontalCenter
//                    anchors.margins: 10
                    anchors.bottom: parent.bottom
                    spacing: 20

                    Button {
                        id: finalizarButton
//                        anchors.bottom: parent.bottom
//                        anchors.left: parent.left
                        //anchors.rightMargin: 20
                        height: paneResultado.height *0.15
                        width: paneResultado.width * 0.45
                        text: "Finalizar"
                        font.family: "Cursive"
                        focus: true
                        Material.background: "#4CAF50"
                        Material.foreground: "white"
                        font.pixelSize: 20
                        onClicked: {
                            stackView.push(telaPagamento)
                        }
                    }
                    Button {
                        id: cancelarButton
//                        anchors.bottom: parent.bottom
//                        anchors.right: parent.right
                        height: paneResultado.height *0.15
                        width: paneResultado.width * 0.45
                        text: "Cancelar"
                        font.family: "Cursive"
                        focus: true
                        Material.background: "#ED3237"
                        Material.foreground: "white"
                        font.pixelSize: 20
                        onClicked: {
                            listResultado.model.clear()
                            valorFinal = 0
                            stackView.pop()

                        }
                    }
                }
            }

            TitleBar {
                title: "Seu Pedido"
                height: 60
                width: parent.width
                anchors.top: paneResultado.top
            }
        }
    }
}
