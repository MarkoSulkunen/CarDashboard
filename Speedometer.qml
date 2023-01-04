import QtQuick 2.15

Rectangle {
        property real speed: 0
        width: image.width
        height: image.height
        border.color: Qt.darker("#200000FF")
        border.width: 10
        color: "transparent"
        radius: 500
        Behavior on border.color {
            PropertyAnimation {
                easing.type: Easing.InCubic
                duration: 1000
            }
        }


    Image {
        anchors.centerIn: parent
        id: image
        width: 500
        height: 500
        source: "speedo.png"

        Image {
            id: redNeedle
            height: parent.height * 0.35
            source: "needlered.png"
            anchors.centerIn: parent
            anchors.verticalCenterOffset: -0.5 * height
            rotation: -135 + speed / 1000 * 30
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
