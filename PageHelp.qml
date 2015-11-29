import QtQuick 2.4
import QtQuick.Controls 1.3

Rectangle {
    id: helpRect

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

        width: helpRect.width
        height: helpRect.height * 0.1

        anchors{
            horizontalCenter: helpRect.horizontalCenter
            top: helpRect.top
        }

        Text {
            id: sharingSessionTxt
            text: "Help"

            color: "yellow"

            anchors.centerIn: parent

            font.pointSize: 20
        }
    }

    Rectangle {
        id: contentRect
        color: "transparent"
        //        border.color: "black"

        width: helpRect.width
        height: helpRect.height * 0.75

        anchors{
            top: topRect.bottom
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
                width: helpRect.width * 0.9
                height: helpRect.height * 2 //0.9
                text:
                      "<b>Note:</b><br>"+
                      "<font size=\"10\">This app is still a preview. Because to get it up and"+
                      " running we "+
                      "need to set a dedicated server to distribute data to all users. <br>"+
                      "However, don't worry! We are going to launch it in these few days.<br>"+
                      "So please stay tuned!, we'll notify you as soon as possible. :-)</b><br><br>"+
                      "<b>Sharing a food</font><br>"+
                      "Firstly, let us say \"thanks\" for sharing it with the world.<br>"+
                      "We hope you'll get better return for it.<br><br>"+
                      "To share, please follow these steps:<br>"+
                      "<ul>"+
                      "<li>Tap \"Share\"</li>"+
                      "<li>Fill in the food data</li>"+
                      "<li>Tap share it!</li>"+
                      "</ul>"+
                      "<br>"+
                      "<b>Managing the shared foods</b><br>"+
                      "Once you share a food, you're the best one we got to keep "+
                      "informed for it status.<br>"+
                      "For example when a food you share <br>"+
                      "has run out already, you could tell us that. <br>"+
                      "So then we can notify the finders to not take it.<br>"+
                      "<ul>"+
                      "<li>Tap \"shares\" at the bottom menu</li>"+
                      "<li>Tap \"edit\" on the food you want to edit</li>"+
                      "<li>Tap \"update\"</li>"+
                      "</ul>"+
                      "<br>"+
                      "<b> Finding a food </b><br>"+
                      "The app uses your location data to search for <br>"+
                      "the foods shared by people nearby your current location.<br>"+
                      "It is easy. follow these steps:<br>"+

                      "<ul>"+
                      "<li>Tap \"Find\"</li>"+
                      "<li>Tap on one of green circles</li>"+
                      "<li>Tap \"Take me there\"</li>"+
                      "</ul>"



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

        width: helpRect.width
        height: helpRect.height * 0.08

        anchors{
            horizontalCenter: helpRect.horizontalCenter
            bottom: helpRect.bottom
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
                helpRect.getOut()
            }
        }
    }
}


