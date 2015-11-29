import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3

import QtPositioning 5.5
import QtLocation 5.5

import QtMultimedia 5.4

Activity{
    id: foodSharingSetup
    signal aFoodJustShared()
    activityTitle: "Share a food"
    activityContent:
        Column {
            spacing: 15
            anchors.fill: parent
            anchors.topMargin: 20

            TextField{
                id: foodName
                width: foodSharingSetup.width * 0.8
                //                height: foodSharingSetup.height * 0.075
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

                Text { text: "amount                 ";
                    font.pointSize: 16; anchors.verticalCenter: parent.verticalCenter
                }
                SpinBox{ id: foodAmount;
                    value: 1
                    maximumValue: 100; width: foodSharingSetup.width*0.2 }
            }

            Row{
                spacing: 10
                anchors{
                    left: parent.left
                    leftMargin: 15
                }

                Text { text: "time limit (hours)  ";
                    font.pointSize: 16
                    anchors.verticalCenter: parent.verticalCenter
                }
                SpinBox{ id: timeLimit; maximumValue: 100; width: foodSharingSetup.width*0.2

                }
            }

            Rectangle{
                width: foodSharingSetup.width * 0.65
                height: width

                anchors.horizontalCenter: parent.horizontalCenter

                color: "black"
                border.color: "darkgrey"
                radius: 10


                Camera {
                    id: camera

                    imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash

                    exposure {
                        exposureCompensation: -1.0
                        exposureMode: Camera.ExposurePortrait
                    }

                    flash.mode: Camera.FlashRedEyeReduction

                    imageCapture {
                        onImageCaptured: {
                            foodPict.source = preview  // Show the preview in an Image
                        }
                    }
                    onError: {
                        console.log( errorCode+" "+errorString )
                    }
                }

                VideoOutput {
                    id: cameraStream
                    source: camera
                    autoOrientation: true
                    anchors.fill: parent
                    focus : visible // to receive focus and capture key events when visible
                }

                Image{
                    id: foodPict
                    anchors.fill: parent
                }


                Button {
                    id: btCapture
                    text: "capture"

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



                }
            }

            Button{
                id: btShare

                width: foodSharingSetup.width * 0.5
                height: foodSharingSetup.height * 0.1

                anchors.horizontalCenter: parent.horizontalCenter

                text: "Share it!"

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
                    console.log(newSharedFood.name, newSharedFood.amount, newSharedFood.picture)
//                    errorViewer.opacity = 0.85
                    foodSharingSetup.getOut()
                    /*emit*/ aFoodJustShared()
                }
            }
        }

    function clearForm(){
        foodName.text = ""
        foodAmount.value = 1
        timeLimit.value = 0
        foodPict.source = ""
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
}

//Rectangle {
//    id: foodSharingSetup

//    signal aFoodJustShared()

//    z: 3

//    anchors.fill: parent

//    color: "white"

//    opacity: 0 // initially invisible
//    visible: opacity
//    focus: visible
//    Keys.onBackPressed: { getOut() }
//    Behavior on opacity{ NumberAnimation{} }

//    function getIn(){
//        opacity = 1
//    }

//    function getOut(){
//        opacity = 0
//        clearForm()
//    }

//    function clearForm(){
//        foodName.text = ""
//        foodAmount.value = 1
//        timeLimit.value = 0
//        foodPict.source = ""
//    }

//    Image {
//        anchors.fill: parent
//        source: "qrc:/img/background.png"
//    }

//    // blocker
//    MouseArea {
//        anchors.fill: parent
//    }

//    PositionSource{
//        id: userGPS
//        active: true
//        updateInterval: 1000
//        preferredPositioningMethods: PositionSource.SatellitePositioningMethods
//        onSourceErrorChanged: {
//            console.log("location source error:", error)
//        }
//        onUpdateTimeout: {
//            console.log("couldn't get new location")
//        }
//    }

//    Rectangle{
//        id: topRect

////        color: "transparent"
////        border.color: "black"
//        color: "steelblue"

//        width: foodSharingSetup.width
//        height: foodSharingSetup.height * 0.1

//        anchors{
//            horizontalCenter: foodSharingSetup.horizontalCenter
//            top: foodSharingSetup.top
//        }

//        Text {
//            id: sharingSessionTxt
//            text: "Share a food"

//            color: "yellow"

//            anchors.centerIn: parent

//            font.pointSize: 20
//        }
//    }

//    Rectangle {
//        id: foodSharingSetup
//        color: "transparent"
////        border.color: "black"

//        width: foodSharingSetup.width
//        height: foodSharingSetup.height * 0.75

//        anchors{
//            top: topRect.bottom
//            topMargin: 20
//            horizontalCenter: parent.horizontalCenter
//        }
//        Column {
//            spacing: 15
//            anchors.fill: parent

//            TextField{
//                id: foodName
//                width: foodSharingSetup.width * 0.8
//                //                height: foodSharingSetup.height * 0.075
//                placeholderText: "Food name"

//                anchors{
//                    left: parent.left
//                    leftMargin: 15
//                }
//            }

//            Row{
//                spacing: 10
//                anchors{
//                    left: parent.left
//                    leftMargin: 15
//                }

//                Text { text: "amount                 ";
//                    font.pointSize: 16; anchors.verticalCenter: parent.verticalCenter
//                }
//                SpinBox{ id: foodAmount;
//                    value: 1
//                    maximumValue: 100; width: foodSharingSetup.width*0.2 }
//            }

//            Row{
//                spacing: 10
//                anchors{
//                    left: parent.left
//                    leftMargin: 15
//                }

//                Text { text: "time limit (hours)  ";
//                    font.pointSize: 16
//                    anchors.verticalCenter: parent.verticalCenter
//                }
//                SpinBox{ id: timeLimit; maximumValue: 100; width: foodSharingSetup.width*0.2

//                }
//            }

//            Rectangle{
//                width: foodSharingSetup.width * 0.65
//                height: width

//                anchors.horizontalCenter: parent.horizontalCenter

//                color: "black"
//                border.color: "darkgrey"
//                radius: 10


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
//                    onError: {
//                        console.log( errorCode+" "+errorString )
//                    }
//                }

//                VideoOutput {
//                    id: cameraStream
//                    source: camera
//                    autoOrientation: true
//                    anchors.fill: parent
//                    focus : visible // to receive focus and capture key events when visible
//                }

//                Image{
//                    id: foodPict
//                    anchors.fill: parent
//                }


//                Button {
//                    id: btCapture
//                    text: "capture"

//                    width: parent.width * 0.5
//                    height: parent.height * 0.15

//                    anchors{
//                        bottom: parent.bottom
//                        bottomMargin: 10
//                        horizontalCenter: parent.horizontalCenter
//                    }

//                    onClicked: {

//                        if ( text==="capture" ){
//                            camera.imageCapture.capture()
//                            text = "change"
//                            cameraStream.visible = false
//                            foodPict.visible = true
//                        }
//                        else{
//                            text = "capture"
//                            cameraStream.visible = true
//                            foodPict.visible = false
//                        }
//                    }



//                }
//            }

//            Button{
//                id: btShare

//                width: foodSharingSetup.width * 0.5
//                height: foodSharingSetup.height * 0.1

//                anchors.horizontalCenter: parent.horizontalCenter

//                text: "Share it!"

//                enabled: foodName.text.trim().length>2 && foodAmount.value >0

//                onClicked: {
//                    //                if (!foodPict.source) // suggest to set it up
//                    // send the newly shared food to the server
//                    var newSharedFood =
//                            {
//                        "name":foodName.text,
//                        "amount":foodAmount.value,
//                        "time_limit":timeLimit.value,
//                        "picture":foodPict.source,
//                        "position":userGPS.position.coordinate,
//                        "sharer":"nice person"
//                    };
//                    // slack.send(newSharedFood)
//                    console.log(newSharedFood.name, newSharedFood.amount, newSharedFood.picture)
////                    errorViewer.opacity = 0.85
//                    foodSharingSetup.getOut()
//                    /*emit*/ aFoodJustShared()
//                }
//            }
//        }
//    }


//    Rectangle{
//        id: bottomRect

////        border.color: "black"
////        color: "transparent"
//        color: Qt.darker("steelblue")

//        width: foodSharingSetup.width
//        height: foodSharingSetup.height * 0.08

//        anchors{
//            horizontalCenter: foodSharingSetup.horizontalCenter
//            bottom: foodSharingSetup.bottom
//        }

//        Link{
//            id: btBack
//            text: "back"
//            width: bottomRect.width * 0.15
//            height: bottomRect.height

//            anchors{
//                leftMargin: 20
//                left: parent.left
//            }

//            onClicked: {
//                foodSharingSetup.getOut()
//            }
//        }
//    }
//}


