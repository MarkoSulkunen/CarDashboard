import QtQuick 2.15

Rectangle {
    property string buttonText: ""
    property color backgroundColor: "lightgreen"
    signal buttonClicked
    color: backgroundColor
    border.color: "blue"
    width: 100
    height: 100
    radius: 50
    BorderImage {
        id: button
        source: "button.png"
        width: 100; height: 100
        anchors.centerIn: parent
    }
    Text {
        text: parent.buttonText
        anchors.centerIn: parent
        color: "white"
    }
    MouseArea {
        anchors.fill: parent
        onPressed: {
            parent.width = 90
            parent.height = 90
        }
        onReleased: {
            parent.width = 100
            parent.height = 100
            parent.buttonClicked()
        }
    }
}
