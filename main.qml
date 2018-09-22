import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Window 2.3

ApplicationWindow {
    id: root
    visible: true
    width: 1920
    height: 1200
    title: qsTr("Auto Atendimento")
    visibility: Qt.platform.os == "android"? Window.FullScreen : Window.Maximized

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: telaLogin
        function restart(){
            stackView.clear()
            stackView.push(telaLogin)
        }
    }
    Component{
        id: telaLogin
        Login{}

    }
    Component{
        id: telaPedido
        Pedido{}

    }
    Component{
        id: telaPagamento
        Pagamento{}
    }
}
