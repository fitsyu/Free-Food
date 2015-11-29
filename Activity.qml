import QtQuick 2.4
import QtQuick.Controls 1.3

Rectangle {
    id: baseRect

    anchors.fill: parent

    color: "white"

    opacity: 0 // initially invisible
    visible: opacity
    focus: visible
    Keys.onBackPressed: { getOut() }
    Behavior on opacity{ NumberAnimation{} }

    function getIn(){
        opacity = 1
    }

    function getOut(){
        opacity = 0
    }

    Image {
        anchors.fill: parent
        source: "qrc:/img/background.png"
    }

    // blocker
    MouseArea {
        anchors.fill: parent
    }


    // properties you need to set
    property string activityTitle: "Activity"
    Rectangle{
        id: topRect

//        border.color: "black"
        color: "#1a2b3a"

        width: baseRect.width
        height: baseRect.height * 0.1

        anchors{
            horizontalCenter: baseRect.horizontalCenter
            top: baseRect.top
        }

        Text {
            id: titleTxt
            text: activityTitle

            color: "#47b5ae"

            anchors.centerIn: parent

            font.pointSize: 20
        }
    }

    property var activityContent
    Rectangle {
        id: contentRect
        color: "transparent"
//        border.color: "black"

        width: baseRect.width
        height: baseRect.height * 0.82

        anchors{
            top: topRect.bottom
            //            topMargin: 20
            horizontalCenter: parent.horizontalCenter
        }

        children: activityContent
      }

    Rectangle{
        id: bottomRect

//        border.color: "black"
//        color: Qt.darker("steelblue")
        color: topRect.color

        width: baseRect.width
        height: baseRect.height * 0.08

        anchors{
            horizontalCenter: baseRect.horizontalCenter
            bottom: baseRect.bottom
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
                baseRect.getOut()
            }
        }
    }
}


