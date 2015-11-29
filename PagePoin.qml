import QtQuick 2.4
import QtQuick.Controls 1.3

Rectangle {
    id: poinRect

    z: 3

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


    Rectangle{
        id: topRect

//        color: "transparent"
//        border.color: "black"
        color: "steelblue"

        width: poinRect.width
        height: poinRect.height * 0.1

        anchors{
            horizontalCenter: poinRect.horizontalCenter
            top: poinRect.top
        }

        Text {
            id: sharingSessionTxt
            text: "Your Poins"

            color: "yellow"

            anchors.centerIn: parent

            font.pointSize: 20
        }
    }

    Rectangle {
        id: contentRect
        color: "transparent"
//        border.color: "black"

        width: poinRect.width
        height: poinRect.height * 0.75

        anchors{
            top: topRect.bottom
            topMargin: 20
            horizontalCenter: parent.horizontalCenter
        }
        ScrollView{
            anchors.fill: parent
            Text {
                //                anchors.centerIn: parent
                anchors{
                    left: parent.left
                    leftMargin: 15
                }
                width: poinRect.width * 0.9
                height: poinRect.height * 2 //0.9
                text: "You have: <br>"+
                      "<b>"+ 10 + "</b>"+
                      "<br><br>"+
                      "You could exchange them with items in our upcoming great game "+
                      "or in our partners apps."+
                      "<br>"+
                      "But you better think of it just as a \"bonus\" for your contribution to "+
                      "make our life and living better.<br><br>"+
                      "<i>Let's help each other!</i>"


//                textFormat: Text.RichText

                wrapMode: Text.WordWrap
                font.pointSize: 14
            }
        }
    }

    Rectangle{
        id: bottomRect

//        border.color: "black"
//        color: "transparent"
        color: Qt.darker("steelblue")

        width: poinRect.width
        height: poinRect.height * 0.08

        anchors{
            horizontalCenter: poinRect.horizontalCenter
            bottom: poinRect.bottom
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
                poinRect.getOut()
            }
        }
    }
}


