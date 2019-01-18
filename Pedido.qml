import QtQuick 2.8
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtGraphicalEffects 1.0

Item {
    id: rootPed
    height: root.height
    width: root.width

    property var listpedidofinal: {"produto": "", "quantidade": "", "valor": "", "acompanhamento": ""}
    property var pedidofinal1: ""
    property var pedidofinal2: ""
    property var auxvalor1: ""
    property var auxvalor2: ""
    property var valorFinal: 0
    ListModel{
        id: contactModel
        ListElement { produto: "Executivo de Galeto"; valor: "14.00"; tipo: 1; chave: "Executivos"}
        ListElement { produto: "Executivo de Galeto Gratinado   ";    valor: "15.00"; tipo: 1; chave: "Executivos"}
        ListElement { produto: "Executivo Galinha Guisada   ";    valor: "14.00"; tipo: 1; chave: "Executivos"}
        ListElement { produto: "Executivo de Boi";    valor: "17.00"; tipo: 1; chave: "Executivos"}
        ListElement { produto: "Executivo de Boi Guisado   ";    valor: "15.00"; tipo: 1; chave: "Executivos"}
        ListElement { produto: "Executivo de Carneiro Guisado   ";    valor: "17.00"; tipo: 1; chave: "Executivos"}
        ListElement { produto: "Executivo de Porco";    valor: "16.00"; tipo: 1; chave: "Executivos"}
        ListElement { produto: "Executivo de Calabresa";    valor: "13.00"; tipo: 1; chave: "Executivos"}
        ListElement { produto: "Mista(Galeto/Boi)   ";    valor: "21.00"; tipo: 1; chave: "Executivos"}
        ListElement { produto: "Mista(Galeto/Porco)   ";    valor: "21.00"; tipo: 1; chave: "Executivos"}
        ListElement { produto: "Mista(Galeto/Calabresa)   ";    valor: "21.00"; tipo: 1; chave: "Executivos"}
        ListElement { produto: "Mista(Galeto Gratinado/Boi)   ";    valor: "22.00"; tipo: 1; chave: "Executivos"}
        ListElement { produto: "Mista(Galeto Gratinado/Porco)   ";    valor: "22.00"; tipo: 1; chave: "Executivos"}
        ListElement { produto: "Mista(Galeto Grat/Calabresa)";    valor: "22.00"; tipo: 1; chave: "Executivos"}
        ListElement { produto: "Mista(Boi/Porco)   ";    valor: "21.00"; tipo: 1; chave: "Executivos"}
        ListElement { produto: "Mista(Boi/Calabresa)   ";    valor: "21.00"; tipo: 1; chave: "Executivos"}
        ListElement { produto: "Mista(Porco/calabresa)   ";    valor: "21.00"; tipo: 1; chave: "Executivos"}

        ListElement { produto: "1/4 Galeto(Coxa)";    valor: "7.00"; tipo: 2; chave: "Carnes"}
        ListElement { produto: "1/4 Galeto(Peito)";    valor: "7.00"; tipo: 2; chave: "Carnes"}
        ListElement { produto: "1/2 Galeto";   valor: "11.00"; tipo: 2; chave: "Carnes"}
        ListElement { produto: "1/4 Galeto Gratinado(Coxa)";   valor: "8.00"; tipo: 2; chave: "Carnes"}
        ListElement { produto: "1/4 Galeto Gratinado(Peito)";    valor: "7.00"; tipo: 2; chave: "Carnes"}
        ListElement { produto: "1/4 Boi";   valor: "9.00"; tipo: 2; chave: "Carnes"}
        ListElement { produto: "1/4 Porco";   valor: "9.00"; tipo: 2; chave: "Carnes"}
        ListElement { produto: "Calabresa de Frango";   valor: "2.50"; tipo: 2; chave: "Carnes"}
        ListElement { produto: "Calabresa mista";   valor: "2.00"; tipo: 2; chave: "Carnes"}

        ListElement { produto: "Água Mineral";    valor: "2.00"; tipo: 2; chave: "Bebidas"}
        ListElement { produto: "Suco 1L";    valor: "12.00"; tipo: 2; chave: "Bebidas"}
        ListElement { produto: "Suco 500mL";    valor: "6.00"; tipo: 2; chave: "Bebidas"}
        ListElement { produto: "Suco 300mL";    valor: "4.00"; tipo: 2; chave: "Bebidas"}
        ListElement { produto: "Refrigerante 2L";    valor: "9.00"; tipo: 2; chave: "Bebidas"}
        ListElement { produto: "Refrigerante 1L";    valor: "6.00"; tipo: 2; chave: "Bebidas"}
        ListElement { produto: "Refrigerante 500ml";    valor: "4.00"; tipo: 2; chave: "Bebidas"}
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
                font.family: "Roboto"
                leftPadding: 10
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 20
            }
            Rectangle {
                width: parent.width-10
                height: 2
                color: "#11333333"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
            }
        }
    }
    Component {
        id: contactDelegate
        Rectangle {
            id: recDelegate
            width: parent.width; height: listPedido.height/6.8
            //            border.color: "grey"
            //            radius: 5
            Text {
                id: productId
                text: produto;
                font.family: "Roboto"
                font.pixelSize: 21
                anchors.left: recDelegate.left
                anchors.leftMargin: 20
                anchors.verticalCenter: recDelegate.verticalCenter
            }
            Text { text: '<b>R$: ' + valor + '</b>';
                font.family: "Roboto"
                font.pixelSize: 21
                anchors.right: recDelegate.right
                anchors.rightMargin: 20
                anchors.verticalCenter: recDelegate.verticalCenter
            }
            Rectangle {
                width: parent.width -10
                height: 2
                color: "#11333333"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
            }
            MouseArea{
                id: mouseDelegate
                anchors.fill: parent
                hoverEnabled: true
                onPressed: {
                    recDelegate.color = "grey"
                }
                onReleased: {
                    recDelegate.color = "white"
                }
                onExited: {
                    recDelegate.color = "white"
                }
                onCanceled: {
                    recDelegate.color = "white"
                }

                onClicked: {
                    var positionInWindow = mapToItem(root.contentItem, mouse.x, mouse.y)
                    listResultado.mouseY = positionInWindow.y-150//recDelegate.y-20
                    //console.log("Teste: ", listResultado.mouseY)
                    if(tipo === 1){
                        pedidofinal1 = pedidofinal1 + produto + "\n"
                        auxvalor1 = valor
                        listpedidofinal.produto = produto
                        listpedidofinal.quantidade = "1"
                        listpedidofinal.valor = valor
                        //console.log(listpedidofinal.produto,listpedidofinal.quantidade,listpedidofinal.valor,listpedidofinal.acompanhamento)
                        //console.log(pedidofinal1)
                        if(produto == "Executivo de Galeto"){
                            orderDialog.textProtein = "Escolha a Parte do Galeto"
                            orderDialog.coxaTextButton = "Coxa e Sobre-Coxa"
                            orderDialog.peitoTextButton = "Peito e Asa"

                        }
                        else{

                            orderDialog.textProtein = "Como deseja a Carne?"
                            orderDialog.coxaTextButton = "Bem Passada"
                            orderDialog.peitoTextButton = "Ao Ponto"
                        }
                        orderDialog.fatherProduto = produto
                        orderDialog.open()
                    }
                    else if(tipo == 2){
                        pedidofinal2 = pedidofinal2 + produto
                        listpedidofinal.produto = produto
                        auxvalor2 = valor
                        rowPopUp.topPadding = 0
                        drinkText.visible = true
                        drinkColumn.visible = true
                        recPopUp2.height = rootPed.height*0.9

                        if(produto.includes("Suco"))
                            drinks.model = ["Laranja", "Tangerina", "Acerola", "Goiaba", "Maracujá"]
                        else if(produto.includes("Refrigerante"))
                            drinks.model = ["Coca-Cola", "Coca-Cola Zero", "Guaraná", "Pepsi", "Fanta"]
                        else {
                            rowPopUp.topPadding = 50
                            drinkText.visible = false
                            drinkColumn.visible = false
                            recPopUp2.height = rootPed.height*0.7
                            drinks.model = [""]
                        }

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

        CustomDialog {
            id: orderDialog
        }

        Rectangle{
            id: recPopUp2
            height: parent.height*0.9
            width: parent.width
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
                    listpedidofinal.produto = ""; listpedidofinal.quantidade = ""; listpedidofinal.valor = ""; listpedidofinal.acompanhamento= ""
                    auxvalor2 = ""
                }

                Column{
                    id: columnPedido2
                    anchors.centerIn: parent
                    spacing: parent.height*0.05

                    Label{
                        id: labelPedido2
                        text: "Escolha a quantidade:"
                        font.family: "Roboto"
                        font.pixelSize: 22
                    }

                    SpinBox{
                        id: spinPedido2
                        focusReason: Qt.MouseFocusReason
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.pointSize: 20
                        width: popUpPedido2.width*0.4
                        value: 1
                        from: 1
                    }

                    Text {
                        id: drinkText
                        text: qsTr("Escolha o tipo:")
                        font.family: "Roboto"
                        font.pixelSize: 22
                    }

                    ButtonGroup {
                        id: drinkGroup
                        buttons: drinkColumn.children
                    }
                    Column{
                        id: drinkColumn
                        anchors.horizontalCenter: parent.horizontalCenter
                        spacing: 20
                        Repeater {
                            id: drinks
                            onModelChanged: drinkColumn.children[0].checked = true
                            RadioButton{
                                id: drinkbutton
                                text: modelData
                                font.pixelSize: 20
                                font.family: "Roboto"
                                height: 20
                            }
                        }
                    }

                    Row {
                        id: rowPopUp
                        spacing: (popUpPedido2.width - buttonOrder2.width*2)/3
                        RoundButton{
                            height: popUpPedido2.height*0.2
                            width: popUpPedido2.width*0.4
                            text: "Cancelar"
                            font.pixelSize: 20
                            font.bold: true
                            Material.background: "#ef494e"
                            Material.foreground: "white"
                            onClicked: popUpPedido2.close()
                        }
                        RoundButton {
                            id: buttonOrder2
                            height: popUpPedido2.height*0.2
                            width: popUpPedido2.width*0.4
                            text: "Finalizar"
                            font.family: "Roboto"
                            font.bold: true
                            focus: true
                            Material.background: "#4CAF50"
                            Material.foreground: "white"
                            font.pixelSize: 20
                            onClicked: {
                                if(spinPedido2.value != 0){
                                    pedidofinal2 = pedidofinal2 + " " + drinkGroup.checkedButton.text
//                                    pedidofinal2 = spinPedido2.value + "x " + pedidofinal2
                                    var aux1 = 0
                                    var aux2 = 0
                                    var i = 0
                                    var charr = ""
                                    aux1 = parseFloat(auxvalor2)
                                    aux2 = parseFloat(spinPedido2.value)
                                    aux1 = aux1 * aux2
                                    listpedidofinal.quantidade = spinPedido2.value; listpedidofinal.valor = aux1;
                                    creatjson.addNewProduct(pedidofinal2,listpedidofinal.quantidade,listpedidofinal.valor,listpedidofinal.acompanhamento)
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

                                    listResultado.model.insert(0, {textResultado: pedidofinal2, valorResultado: auxvalor2})
                                    spinPedido2.value = 1
                                    valorFinal = valorFinal + aux1
                                    popUpPedido2.close()
                                    listpedidofinal.produto = ""; listpedidofinal.quantidade = ""; listpedidofinal.valor = ""; listpedidofinal.acompanhamento= ""
                                    pedidofinal2 = ""
                                    spinPedido2.value
                                }
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
        color: "#88FF9800"
        //Material.accent

        //        DropShadow {
        //            anchors.fill: panePedido
        //            horizontalOffset: 6
        //            verticalOffset: 6
        //            radius: 8.0
        //            samples: 17
        //            color: "#55000000"
        //            source: panePedido
        //        }
        Rectangle {
            height: parent.height*0.93
            width: parent.width*0.46
            anchors.left: parent.left
            anchors.leftMargin: 30
            anchors.top: panePedido.top
            anchors.topMargin: 10
            color: "#33000000"
        }
        Rectangle {
            id: panePedido
            height:parent.height*0.93
            width: parent.width*0.46
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            clip: true

            ListView{
                id: listPedido
                spacing: 2
                anchors.fill: parent
                topMargin: 70
                //                anchors.margins: 10
                model: contactModel
                delegate: contactDelegate
                section.property: "chave"
                section.criteria: ViewSection.FullString
                section.delegate: sectionHeading

            }

            TitleBar {
                id: titleBar
                title: "Clique no que deseja"
                icon: "qrc:/images/list.png"
                height: 70
                width: parent.width
                anchors.top: panePedido.top
            }
            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: titleBar.bottom
                anchors.topMargin: 5
                height: 35
                width: 35
                source: "qrc:/images/arrow.png"
                rotation: -90
                opacity: listPedido.atYEnd ? 0.8 : 0
                Behavior on opacity { NumberAnimation { duration: 500 } }
                NumberAnimation { id: botArrowAnim; target: listPedido; property: "contentY"; easing.type: Easing.OutCubic; duration: 1500 }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        var pos = listPedido.contentY;
                        var destPos;
                        listPedido.positionViewAtIndex(listPedido.count - 1, ListView.Beginning);
                        destPos = listPedido.contentY;
                        botArrowAnim.from = destPos;
                        botArrowAnim.to = 0;
                        botArrowAnim.start()
                    }
                }
            }
            Image {
                id: topArrow
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                height: 35
                width: 35
                source: "qrc:/images/arrow.png"
                rotation: 90//180
                opacity: listPedido.atYEnd ? 0 : 0.8
                Behavior on opacity { NumberAnimation { duration: 500 } }
                NumberAnimation { id: topArrowAnim; target: listPedido; property: "contentY"; easing.type: Easing.OutCubic; duration: 1500 }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        var pos = listPedido.contentY;
                        var destPos;
                        listPedido.positionViewAtIndex(listPedido.count - 1, ListView.Beginning);
                        destPos = listPedido.contentY;
                        topArrowAnim.from = pos;
                        topArrowAnim.to = destPos;
                        topArrowAnim.start()
                    }
                }
            }
        }

        Rectangle {
            height: recPaneResultado.height
            width: recPaneResultado.width
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.top: paneResultado.top
            anchors.topMargin: 10
            color: "#33000000"
        }
        Rectangle {
            id: paneResultado
            height: parent.height*0.93
            width: parent.width*0.46
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            Material.elevation: 13
            color: "transparent"
            TitleBar {
                title: "Seu pedido final"
                icon: "qrc:/images/cart.png"
                height: 70
                width: parent.width
                anchors.top: paneResultado.top
                z: 1
            }
            Column {
                height: parent.height
                width: parent.width
                spacing: paneResultado.height*0.04
                Rectangle {
                    id: recPaneResultado
                    height: parent.height* 0.7
                    width: parent.width
                    //border.color: "black"
                    clip: addTrans.running? false: true
                    ListView{
                        id: listResultado
                        anchors.fill: parent
                        topMargin: 80
                        model: ListModel{}
                        //                    spacing: 2
                        property int mouseY: 0
                        add: Transition {
                            id: addTrans

                            //                NumberAnimation { property: "opacity"; from: 0; to: 1.0; duration: 4000 }
                            NumberAnimation {property: "scale"; from: 0.1; to: 1.0; duration: 800}
                            PathAnimation {
                                duration: 500
                                path: Path {
                                    startX: -root.width*0.55//addTrans.ViewTransition.destination.x + 200
                                    startY: listResultado.mouseY//addTrans.ViewTransition.destination.y + 200
                                    //                        PathCurve { relativeX: -100; relativeY: -50 }
                                    //                        PathCurve { relativeX: 50; relativeY: -150 }
                                    PathCurve {
                                        x: addTrans.ViewTransition.destination.x
                                        y: addTrans.ViewTransition.destination.y
                                    }
                                }
                            }
                        }
                        displaced: Transition {
                            id: dispTrans
                            SequentialAnimation {
                                PauseAnimation {
                                    duration: (dispTrans.ViewTransition.index -
                                               dispTrans.ViewTransition.targetIndexes[0]) * 100
                                }
                                NumberAnimation { properties: "x,y"; duration: 400; easing.type: Easing.OutBounce }
                            }
                        }
                        delegate: Rectangle{
                            //  property int indexx: 0
                            id: recListResultado
                            width: listResultado.width; height: listResultado.height/4
                            // color: "grey"
                            clip: true
                            visible: (addTrans.running && index >2) ? false: true
                            Text {
                                id: textListResultado
                                text: textResultado
                                wrapMode: Text.WordWrap
                                width: recListResultado.width*0.65
                                font.family: "Roboto"
                                font.pixelSize: 20
                                anchors.left: recListResultado.left
                                anchors.leftMargin: 10
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            Text {
                                id: textValorListResultado
                                text: '<b>R$: ' + valorResultado + '</b>';
                                anchors.right: trashIcon.left
                                anchors.rightMargin: 5
                                font.family: "Roboto"
                                font.pixelSize: 20
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            Image {
                                id: trashIcon
                                source: "qrc:/images/trash.png"
                                anchors.right: recListResultado.right
                                anchors.rightMargin: recListResultado.width*0.01
                                anchors.verticalCenter: parent.verticalCenter
                                width: 40
                                height: 35
                                MouseArea {
                                    anchors.fill: parent
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
                                        creatjson.removeProduct(indexx)
                                    }
                                }
                            }
                            Rectangle {
                                width: parent.width-10
                                height: 2
                                color: "#22333333"
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.bottom: parent.bottom
                            }
                        }
                    }
                }
                Rectangle{
                    id: recPaneFinalizarResultado
                    height: paneResultado.height*0.26
                    width: parent.width
                    border.pixelAligned: true

                    Rectangle {
                        z: -1
                        height: recPaneFinalizarResultado.height
                        width: recPaneFinalizarResultado.width
                        anchors.right: parent.right
                        anchors.rightMargin: -10
                        anchors.top: recPaneFinalizarResultado.top
                        anchors.topMargin: 10
                        color: "#33000000"
                    }
                    Column {
                        spacing: height*0.15
                        anchors.centerIn: parent
                        Text {
                            id: textValorFinalResultado
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.family: "Roboto"
                            font.pixelSize: 20
                            text: "<b> Valor Total R$: " + valorFinal + "</b>"
                        }

                        Row {
                            anchors.horizontalCenter: parent.horizontalCenter
                            spacing: (parent.width - finalizarButton.width*2)/3

                            RoundButton {
                                id: cancelarButton
                                height: paneResultado.height *0.125
                                width: paneResultado.width * 0.4
                                text: "Cancelar"
                                font.family: "Roboto"
                                font.bold: true
                                focus: true
                                Material.background: "#ef494e"//"#ED3237"
                                Material.foreground: "white"
                                font.pixelSize: 20
                                onClicked: {
                                    creatjson.clearJson()
                                    listResultado.model.clear()
                                    pedidofinal1 = ""
                                    listpedidofinal.produto = ""; listpedidofinal.quantidade = ""; listpedidofinal.valor = ""; listpedidofinal.acompanhamento= ""
                                    pedidofinal2 = ""
                                    valorFinal = 0
                                    stackView.pop()

                                }
                            }
                            RoundButton {
                                id: finalizarButton
                                height: paneResultado.height *0.125
                                width: paneResultado.width * 0.4
                                enabled: rootPed.valorFinal == 0? false : true
                                text: "Finalizar"
                                font.family: "Roboto"
                                font.bold: true
                                focus: true
                                Material.background: "#5cb860"//"#4CAF50"
                                Material.foreground: "white"
                                font.pixelSize: 20
                                onClicked: {
                                    stackView.push(telaPagamento,{"tValue": valorFinal})
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
