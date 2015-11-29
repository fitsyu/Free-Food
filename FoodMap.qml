import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3

import QtPositioning 5.5
import QtLocation 5.5



//Rectangle {
//    id: mapRect

//    anchors.fill: parent


//    opacity: 0 // initially invisible
//    visible: opacity
//    focus: visible
//    Keys.onBackPressed: { getOut() }
//    Behavior on opacity{ NumberAnimation{} }

//    PositionSource{
//        id: userGPS
//        active: true
//        updateInterval: 1000

//        onPositionChanged: {
//            foodMap.center = position.coordinate
//        }
//    }

//    MapCircle {
//        id: userCircle
//        center:  userGPS.position.coordinate
////        center: QtPositioning.coordinate(-6.353942, 106.838180)
//        radius: 8
//        color: "lightsteelblue"
//        border.color: "grey"
//        border.width: 2
//        MouseArea {
//            anchors.fill: parent
//            onClicked: foodViewer.getIn()
//        }
//    }

//    FoodView{ id: foodViewer }

//    Map{
//        id: foodMap

//        plugin: Plugin { name: "osm" }
//        gesture.enabled: true

//        center:  userGPS.position.coordinate
////        center: QtPositioning.coordinate(-6.353942, 106.838180)

////        anchors.fill: parent
//        width: parent.width
//        height: parent.height - bottomRect.height

//        zoomLevel: deepControl.value

//        Component.onCompleted: {
//            foodMap.addMapItem(userCircle)
//            var nearbyFood = [
//                        0.000100, -0.000100,
//                        -0.000550, 0.000150,
//                        0.00060, -0.000180,
//                        -0.000800, 0.000200,
//                        0.000150, -0.000250,
//                        -0.000720, 0.000400,

//                    ]
//            var component = Qt.createComponent("FoodPlace.qml");
//            var circle;
//            for (var i=0; i<nearbyFood.length; i+=2){
//                circle = component.createObject(foodMap)
//                circle.center = QtPositioning.coordinate(
////console.log(
//                            userCircle.center.latitude + nearbyFood[i],
//                            userCircle.center.longitude + nearbyFood[i+1]
//                            )
////                circle.radius = 10
////                circle.color = 'green'
////                circle.border.width = 3
//                circle.activated.connect(showTheFoodPlace)
//                foodMap.addMapItem(circle)
//            }


//        }

//        function showTheFoodPlace(){
//            foodViewer.getIn()
//        }


//        Rectangle {
//            width: parent.width * 0.8
//            height: width

//            anchors.centerIn: parent

//            color: "black"
//            opacity: 0.85

//            visible:  userGPS.sourceError!==PositionSource.NoError  // foodMap.error!==Map.NoError

//            Text{
//                id: mapErrorViewer

//                text:  userGPS.sourceError //foodMap.errorString

//                anchors.centerIn: parent
//                font.pointSize: 12
//                color: "white"

//                width: parent.width

//                horizontalAlignment: Text.AlignHCenter
//                wrapMode: Text.WordWrap
//            }
//        }
//    }

//    // overlay
//    Rectangle{
//        id: topRect

//        //        color: "transparent"
//        //        border.color: "black"
//        color: "steelblue"

//        width: mapRect.width
//        height: mapRect.height * 0.1

//        anchors{
//            horizontalCenter: mapRect.horizontalCenter
//            top: mapRect.top
//        }

//        Text {
//            id: sharingSessionTxt
//            text: "The Food Map"

//            color: "yellow"

//            anchors.centerIn: parent

//            font.pointSize: 20
//        }
//    }

//    Column{
//        anchors{
//            right: parent.right
//            verticalCenter: parent.verticalCenter
//        }

//        Slider{
//            id: deepControl
//            height: mapRect.height - topRect.height - bottomRect.height

//            maximumValue: foodMap.maximumZoomLevel
//            minimumValue: foodMap.minimumZoomLevel

//            value: foodMap.zoomLevel

//            orientation: Qt.Vertical
//            anchors.horizontalCenter: parent.horizontalCenter

//            Component.onCompleted: {
//                value = 18
//            }
//        }

//        Text{
//            id: deepControlTxt
//            text: Math.round( deepControl.value )
//            anchors.horizontalCenter: parent.horizontalCenter
//        }
//    }


//    Rectangle{
//        id: bottomRect

////                border.color: "black"
//        //        color: "transparent"
//        color: Qt.darker("steelblue")

//        width: mapRect.width
//        height: mapRect.height * 0.08

//        anchors{
//            //            horizontalCenter: mapRect.horizontalCenter
//            bottom: mapRect.bottom
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
//                getOut()
//            }
//        }
//    }
//    function getIn(){
//        opacity = 1
//    }

//    function getOut(){
//        opacity = 0
//    }


//}


Activity{
    id: mapRect
    activityTitle: "The Food Map"
    activityContent: Map{
        id: foodMap

        plugin: Plugin { name: "osm" }
        gesture.enabled: true

        center:  userGPS.position.coordinate
//        center: QtPositioning.coordinate(-6.353942, 106.838180)

        anchors.fill: parent


//        zoomLevel: deepControl.value

        Component.onCompleted: {
            foodMap.addMapItem(userCircle)
            var nearbyFood = [
                        0.000100, -0.000100,
                        -0.000550, 0.000150,
                        0.00060, -0.000180,
                        -0.000800, 0.000200,
                        0.000150, -0.000250,
                        -0.000720, 0.000400,

                    ]
            var component = Qt.createComponent("FoodPlace.qml");
            var circle;
            for (var i=0; i<nearbyFood.length; i+=2){
                circle = component.createObject(foodMap)
                circle.center = QtPositioning.coordinate(
//console.log(
                            userCircle.center.latitude + nearbyFood[i],
                            userCircle.center.longitude + nearbyFood[i+1]
                            )
//                circle.radius = 10
//                circle.color = 'green'
//                circle.border.width = 3
                circle.activated.connect(showTheFoodPlace)
                foodMap.addMapItem(circle)
            }


        }

    PositionSource{
        id: userGPS
        active: true
        updateInterval: 1000

        onPositionChanged: {
            foodMap.center = position.coordinate
        }
    }

    MapCircle {
        id: userCircle
        center:  userGPS.position.coordinate
//        center: QtPositioning.coordinate(-6.353942, 106.838180)
        radius: 8
        color: "lightsteelblue"
        border.color: "grey"
        border.width: 2
        MouseArea {
            anchors.fill: parent
            onClicked: foodViewer.getIn()
        }
    }

    FoodView{ id: foodViewer }



        function showTheFoodPlace(){
            foodViewer.getIn()
        }


        Rectangle {
            width: parent.width * 0.8
            height: width

            anchors.centerIn: parent

            color: "black"
            opacity: 0.85

            visible:  userGPS.sourceError!==PositionSource.NoError  // foodMap.error!==Map.NoError

            Text{
                id: mapErrorViewer

                text:  userGPS.sourceError //foodMap.errorString

                anchors.centerIn: parent
                font.pointSize: 12
                color: "white"

                width: parent.width

                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
            }
        }
    }

}
