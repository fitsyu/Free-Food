import QtQuick 2.4
import QtQuick.Controls 1.3

//Rectangle {
//    id: foodViewer

//    z: 3

//    anchors.fill: parent

//    color: "white"

//    opacity: 0 // initially invisible
//    visible: opacity
//    focus: visible
//    Keys.onBackPressed: { getOut(); parent.focus = true }
//    Behavior on opacity{ NumberAnimation{} }

//    function getIn(){
//        opacity = 1
//    }

//    function getOut(){
//        opacity = 0
//    }

//    Image {
//        anchors.fill: parent
//        source: "qrc:/img/background.png"
//    }

//    // blocker
//    MouseArea {
//        anchors.fill: parent
//    }


//    Rectangle{
//        id: topRect

//        //        color: "transparent"
//        //        border.color: "black"
//        color: "steelblue"

//        width: foodViewer.width
//        height: foodViewer.height * 0.1

//        anchors{
//            horizontalCenter: foodViewer.horizontalCenter
//            top: foodViewer.top
//        }

//        Text {
//            id: sharingSessionTxt
//            text: "Shared by "+"<u>very nice one</u>"

//            color: "yellow"

//            anchors.centerIn: parent

//            font.pointSize: 20
//        }
//    }

//    Rectangle {
//        id: contentRect
//        color: "transparent"
//        //        border.color: "black"

//        width: foodViewer.width
//        height: foodViewer.height * 0.75

//        anchors{
//            top: topRect.bottom
//            topMargin: 20
//            horizontalCenter: parent.horizontalCenter
//        }

//        Column {
//            spacing: 15
//            anchors.fill: parent

//            Text{
//                id: foodName
//                width: foodViewer.width * 0.8
//                //                height: foodViewer.height * 0.075
//                text: "Donat"

//                font.pointSize: 18

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

//                Text { text: "amount    : "+ 10;
//                    font.pointSize: 16; anchors.verticalCenter: parent.verticalCenter
//                }
//            }

//            Row{
//                spacing: 10
//                anchors{
//                    left: parent.left
//                    leftMargin: 15
//                }

//                Text { text: "time limit : "+ 3 +" hours";
//                    font.pointSize: 16
//                    anchors.verticalCenter: parent.verticalCenter
//                }

//            }

//            Rectangle{
//                width: foodViewer.width * 0.65
//                height: width

//                anchors.horizontalCenter: parent.horizontalCenter

//                color: "black"
//                border.color: "darkgrey"
//                radius: 10


//                Image{
//                    id: foodPict
//                    anchors.fill: parent
//                    source: "qrc:/img/roti.jpg"
//                }

//        }

//        Button{
//            id: btTake

//            width: foodViewer.width * 0.5
//            height: foodViewer.height * 0.1

//            anchors.horizontalCenter: parent.horizontalCenter

//            text: "Take me there"
//        }
//    }
//}

//Rectangle{
//    id: bottomRect

//    //        border.color: "black"
//    //        color: "transparent"
//    color: Qt.darker("steelblue")

//    width: foodViewer.width
//    height: foodViewer.height * 0.08

//    anchors{
//        horizontalCenter: foodViewer.horizontalCenter
//        bottom: foodViewer.bottom
//    }

//    Link{
//        id: btBack
//        text: "back"
//        width: bottomRect.width * 0.15
//        height: bottomRect.height

//        anchors{
//            leftMargin: 20
//            left: parent.left
//        }

//        onClicked: {
//            foodViewer.getOut()
//        }
//    }
//}
//}

Activity{
    id: foodViewer
    activityTitle: "Shared by "+"<u>a very nice one</u>"
    activityContent: Column {
        spacing: 15
        anchors.fill: parent

        Text{
            id: foodName
            width: foodViewer.width * 0.8
            //                height: foodViewer.height * 0.075
            text: "Donat"

            font.pointSize: 18

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

            Text { text: "amount    : "+ 10;
                font.pointSize: 16; anchors.verticalCenter: parent.verticalCenter
            }
        }

        Row{
            spacing: 10
            anchors{
                left: parent.left
                leftMargin: 15
            }

            Text { text: "time limit : "+ 3 +" hours";
                font.pointSize: 16
                anchors.verticalCenter: parent.verticalCenter
            }

        }

        Rectangle{
            width: foodViewer.width * 0.65
            height: width

            anchors.horizontalCenter: parent.horizontalCenter

            color: "black"
            border.color: "darkgrey"
            radius: 10


            Image{
                id: foodPict
                anchors.fill: parent
                source: "qrc:/img/roti.jpg"
            }

        }

        Button{
            id: btTake

            width: foodViewer.width * 0.5
            height: foodViewer.height * 0.1

            anchors.horizontalCenter: parent.horizontalCenter

            text: "Take me there"
        }
    }
}

