import QtQuick 2.0

Item {
    id: id_root

    property int value: 0
    property real fuel: 0

    BorderImage {
        source: "fuelbackground.png"
        anchors.fill: parent

    Rectangle {
        id: id_fuel

        property int numberIndexs: 5

        anchors.centerIn: parent
        height: Math.min(id_root.width, id_root.height)
        width: height
        radius: width/2
        color: "black"

        border.width: 10
        border.color: Qt.darker("#800000FF")



        Canvas {
            id:canvas
            anchors.fill: parent
            contextType: "2d"
            antialiasing: true

            onPaint: {
                var context = canvas.getContext('2d');

                context.strokeStyle = "red";
                context.lineWidth = id_fuel.height * 0.02;
                context.beginPath();
                context.arc(id_fuel.height / 2, id_fuel.height / 2, id_fuel.height / 2 - id_fuel.height * 0.07, Math.PI, Math.PI * 1.25, false);
                context.stroke();

                context.strokeStyle = "green";
                context.lineWidth = id_fuel.height * 0.02;
                context.beginPath();
                context.arc(id_fuel.height / 2, id_fuel.height / 2, id_fuel.height / 2 - id_fuel.height * 0.07, Math.PI * 1.25, Math.PI * 2.0, false);
                context.stroke();
            }
        }

        Repeater {
            model: id_fuel.numberIndexs

            Item {
                height: id_fuel.height/2
                transformOrigin: Item.Bottom
                rotation: index * 45 + 270
                x: id_fuel.width/2

                Rectangle {
                    height: index % 2 == 0 ? id_fuel.height * 0.15 : id_fuel.height * 0.1
                    width: height / 2
                    color: index === 0 ? "red" : "darkgrey"
                    antialiasing: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: id_fuel.height * 0.03
                }
            }
        }

        Text {
            anchors {
                top: parent.verticalCenter
                left: parent.left
                topMargin: id_fuel.height * 0.01
                leftMargin: id_fuel.height * 0.1
            }
            text: "E"
            color: "red"
            font.pixelSize: id_fuel.height * 0.15
            font.family: "Impact"
        }

        Text {
            anchors {
                top: parent.verticalCenter
                right: parent.right
                topMargin: id_fuel.height * 0.01
                rightMargin: id_fuel.height * 0.1
            }
            text: "F"
            color: "light green"
            font.pixelSize: id_fuel.height * 0.15
            font.family: "Impact"
        }
    }

    Rectangle {
        id: id_center

        anchors.centerIn: parent
        height: id_fuel.height * 0.1
        width: height
        radius: width/2
        color: "darkgrey"
    }
    Text {
        anchors {
            horizontalCenter: id_root.horizontalCenter
        }
        text: "1/2"
        color: "light green"
        font.pixelSize: id_fuel.height * 0.10
        font.family: "Impact"
        y: id_fuel.height * 0.25
        height: id_fuel.height * 0.075
        x: 43
    }
    Image {
        id: redNeedle
        height: parent.height * 0.35
        source: "needlered.png"
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -0.5 * height
        rotation: -90 + fuel / 1000 * 30
        transformOrigin: Item.Bottom
        Behavior on rotation {
            PropertyAnimation {
                easing.type: Easing.OutQuad
                duration: 1000
            }
        }
    }
}
}
