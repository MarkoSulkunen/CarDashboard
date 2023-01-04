import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    property int oil: 1
    property int battery: 1
    property int engine: 1
    property int temp: 1

    width: 1000
    height: 500
    visible: true
    title: qsTr("Dashboard")

    Rectangle {
        id: dashboardBackground
        property bool engineRunning: false
        property bool isVisible: false
        property int fuelValue: 0
        anchors.fill: parent
        color: "black"


        Behavior on color {
            PropertyAnimation {
                easing.type: Easing.InCubic
                duration: 1000
            }
        }
        Tachometer{
            id: tachometer
            opacity: 0
            rpm: 0
            Behavior on opacity {
                PropertyAnimation {
                    easing.type: Easing.InCubic
                    duration: 2000
                }
          }
        }
        Speedometer{
            id: speedometer
            opacity: 0
            x: 500
            speed: 0
            Behavior on opacity {
                PropertyAnimation {
                    easing.type: Easing.InCubic
                    duration: 2000
                }
            }
        }
        OilLight {
            id: oillight
            opacity: 0
            x: 450
            y: 1
            Behavior on opacity {
                PropertyAnimation {
                    easing.type: Easing.InCubic
                    duration: 1000
                }
            }
        }
        BatteryLight {
            id: batterylight
            opacity: 0
            x: 500
            y: 1
            Behavior on opacity {
                PropertyAnimation {
                    easing.type: Easing.InCubic
                    duration: 1000
                }
            }
        }
        EngineLight {
            id: enginelight
            opacity: 0
            x: 450
            y: 50
            Behavior on opacity {
                PropertyAnimation {
                    easing.type: Easing.InCubic
                    duration: 1000
                }
            }
        }
        TempLight {
            id: templight
            opacity: 0
            x: 500
            y: 50
            Behavior on opacity {
                PropertyAnimation {
                    easing.type: Easing.InCubic
                    duration: 1000
                }
            }
        }

        Button {
            buttonText: "Start/\nStop"
            backgroundColor: "grey"
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            onButtonClicked: {
                if ( dashboardBackground.engineRunning == false) {
                    startEngine()
                }
                else {
                    stopEngine()
                }
        }
        }
        Button2 {
            buttonText: "Show/\nHide"
            backgroundColor: "grey"
            anchors.right: parent.right
            anchors.top: parent.top
            onButtonClicked: {
                if (dashboardBackground.isVisible == false) {
                    showDashboard()
                }
                else {
                    hideDashboard()
                }

        }
        }
         Button3 {
            buttonText: "Gas"
            backgroundColor: "grey"
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            onButtonClicked: {
            if ( dashboardBackground.engineRunning == true )
              {
                giveGas()
              }
        }
        }
         FuelMeter {
                     id: fuelmeter
                     x: 450
                     y: 400
                     width: 100
                     height: 100
                     z: 1
                     value: id_root.fuelValue
                     opacity: 0
                     fuel: 0
                     Behavior on opacity {
                         PropertyAnimation {
                             easing.type: Easing.InCubic
                             duration: 2000
                         }
                     }
                 }
    }

  function startEngine() {
      if(oil === 1) {
        oillight.opacity = 0
      }
      else {
          oillight.opacity = 1
      }

      if(battery === 1) {
        batterylight.opacity = 0
        dashboardBackground.engineRunning = true
        fuelmeter.fuel += 2000

        tachometer.rpm += 1000
        tachometer.border.color = Qt.darker("#90000FFF")
        speedometer.border.color = Qt.darker("#90000FFF")
      }
      else {
          batterylight.opacity = 1
      }
      if(engine === 1) {
        enginelight.opacity = 0
      }
      else {
          enginelight.opacity = 1
      }
      if(temp === 1) {
        templight.opacity = 0
      }
      else {
          templight.opacity = 1
      }
  }

  function stopEngine() {
      speedometer.opacity = 1
      tachometer.opacity = 1
      fuelmeter.opacity = 1
      tachometer.rpm = 0
      speedometer.speed = 0
      fuelmeter.fuel = 0
      dashboardBackground.engineRunning = false

      tachometer.border.color = Qt.darker("#200000FF")
      speedometer.border.color = Qt.darker("#200000FF")
  }

  function showDashboard() {
      speedometer.opacity = 1
      tachometer.opacity = 1
      oillight.opacity = 1
      batterylight.opacity = 1
      enginelight.opacity = 1
      templight.opacity = 1
      fuelmeter.opacity = 1

      dashboardBackground.isVisible = true
  }

  function hideDashboard() {
      speedometer.opacity = 0
      tachometer.opacity = 0
      oillight.opacity = 0
      batterylight.opacity = 0
      enginelight.opacity = 0
      templight.opacity = 0
      fuelmeter.opacity = 0
      dashboardBackground.isVisible = false
  }

  function giveGas() {
        dashboardBackground.engineRunning = true

        speedometer.speed += 1000
        tachometer.rpm += 1000
  }
}
