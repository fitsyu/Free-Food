import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3

import QtPositioning 5.5
import QtLocation 5.5

//import QtMultimedia 5.4

Rectangle {
    id: updateFoodRect

    z: 3

    anchors.fill: parent

    color: "white"

    opacity: 0 // initially invisible
    visible: opacity
    focus: visible
    Keys.onBackPressed: { getOut(); parent.focus = true  }
    Behavior on opacity{ NumberAnimation{} }

    function getIn(){
        opacity = 1
    }

    function getOut(){
        opacity = 0
        clearForm()
    }

    function fillForm(food){
        foodName.text = food[0]
        foodAmount.value = food[1]
        timeLimit.value = food[2]
        foodPict.source = food[3]

        runOutCheck.oldAmount = food[1]
    }

    Image {
        anchors.fill: parent
        source: "qrc:/img/background.png"
    }

    // blocker
    MouseArea {
        anchors.fill: parent
    }

    PositionSource{
        id: userGPS
        active: true
        updateInterval: 1000
        preferredPositioningMethods: PositionSource.SatellitePositioningMethods
        onSourceErrorChanged: {
            console.log("location source error:", error)
        }
        onUpdateTimeout: {
            console.log("couldn't get new location")
        }
    }

    Rectangle{
        id: topRect

//        color: "transparent"
//        border.color: "black"
        color: "steelblue"

        width: updateFoodRect.width
        height: updateFoodRect.height * 0.1

        anchors{
            horizontalCenter: updateFoodRect.horizontalCenter
            top: updateFoodRect.top
        }

        Text {
            id: sharingSessionTxt
            text: "Update the shared foods"

            color: "yellow"

            anchors.centerIn: parent

            font.pointSize: 20
        }
    }

    Rectangle {
        id: contentRect
        color: "transparent"
//        border.color: "black"

        width: updateFoodRect.width
        height: updateFoodRect.height * 0.75

        anchors{
            top: topRect.bottom
            topMargin: 20
            horizontalCenter: parent.horizontalCenter
        }
        Column {
            spacing: 15
            anchors.fill: parent

            TextField{
                id: foodName
                width: updateFoodRect.width * 0.8
                //                height: updateFoodRect.height * 0.075
                placeholderText: "Food name"

                anchors{
                    left: parent.left
                    leftMargin: 15
                }
            }

            Row{
                spacing: 10
                anchors{
                    left: parent.left
                    leftMargin: 15
                }

                Text {
                    text: "amount                ";
                    font.pointSize: 16; anchors.verticalCenter: parent.verticalCenter
                }
                SpinBox{ id: foodAmount;
//                    value: 1
                    maximumValue: 100; width: contentRect.width*0.2 }
                // set run out
                CheckBox {
                    id: runOutCheck
                    text: "run out"
                    property int oldAmount
                    onCheckedChanged: {
                        if (checked){
                            foodAmount.value = 0
                        } else {
                            foodAmount.value = oldAmount
                        }
                    }
                }
            }

            Row{
                spacing: 10
                anchors{
                    left: parent.left
                    leftMargin: 15
                }

                Text { text: "time limit (hours) ";
                    font.pointSize: 16
                    anchors.verticalCenter: parent.verticalCenter
                }
                SpinBox{ id: timeLimit; maximumValue: 100; width: contentRect.width*0.2 }
            }

            Rectangle{
                width: updateFoodRect.width * 0.65
                height: width

                anchors.horizontalCenter: parent.horizontalCenter

                color: "black"
                border.color: "darkgrey"
                radius: 10


//                Camera {
//                    id: camera

//                    imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash

//                    exposure {
//                        exposureCompensation: -1.0
//                        exposureMode: Camera.ExposurePortrait
//                    }

//                    flash.mode: Camera.FlashRedEyeReduction

//                    imageCapture {
//                        onImageCaptured: {
//                            foodPict.source = preview  // Show the preview in an Image
//                        }
//                    }
//                }

//                VideoOutput {
//                    id: cameraStream
//                    source: camera
//                    autoOrientation: true
//                    anchors.fill: parent
//                    focus : visible // to receive focus and capture key events when visible
//                }

                Image{
                    id: foodPict
                    anchors.fill: parent
                }


                Button {
                    id: btCapture
                    text: "change"

                    width: parent.width * 0.5
                    height: parent.height * 0.15

                    anchors{
                        bottom: parent.bottom
                        bottomMargin: 10
                        horizontalCenter: parent.horizontalCenter
                    }

                    onClicked: {

                        if ( text==="capture" ){
                            camera.imageCapture.capture()
                            text = "change"
                            cameraStream.visible = false
                            foodPict.visible = true
                        }
                        else{
                            text = "capture"
                            cameraStream.visible = true
                            foodPict.visible = false
                        }
                    }

//                    style: ButtonStyle {
//                        background: Rectangle{
//                            color: "transparent"
//                            Image {
//                                width: btCapture.width * 0.5
//                                height: width
//                                anchors.centerIn: parent
//                                source: "qrc:/img/shoot.png"
//                            }
//                        }
//                    }

                }
            }

            Button{
                id: btShare

                width: updateFoodRect.width * 0.5
                height: updateFoodRect.height * 0.1

                anchors.horizontalCenter: parent.horizontalCenter

                text: "Update"

                enabled: foodName.text.trim().length>2 && foodAmount.value >0

                onClicked: {
                    //                if (!foodPict.source) // suggest to set it up
                    // send the newly shared food to the server
                    var newSharedFood =
                            {
                        "name":foodName.text,
                        "amount":foodAmount.value,
                        "time_limit":timeLimit.value,
                        "picture":foodPict.source,
                        "position":userGPS.position.coordinate,
                        "sharer":"nice person"
                    };
                    // slack.send(newSharedFood)
                    console.log(newSharedFood.name, newSharedFood.amount)

                    updateFoodRect.getOut()
                }
            }
        }
    }

    Rectangle{
        id: bottomRect

//        border.color: "black"
//        color: "transparent"
        color: Qt.darker("steelblue")

        width: updateFoodRect.width
        height: updateFoodRect.height * 0.08

        anchors{
            horizontalCenter: updateFoodRect.horizontalCenter
            bottom: updateFoodRect.bottom
        }

        Link{
            id: btBack
            text: "back"
            width: bottomRect.width * 0.15
            height: bottomRect.height

            anchors{
                leftMargin: 20
                left: parent.left
            }

            onClicked: {
                updateFoodRect.getOut()
            }
        }
    }
}


