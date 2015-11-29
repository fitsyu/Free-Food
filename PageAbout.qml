import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3

Rectangle {
    id: aboutRect

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

        width: aboutRect.width
        height: aboutRect.height * 0.1

        anchors{
            horizontalCenter: aboutRect.horizontalCenter
            top: aboutRect.top
        }

        Text {
            id: sharingSessionTxt
            text: "About Us"

            color: "yellow"

            anchors.centerIn: parent

            font.pointSize: 20
        }
    }

    Rectangle {
        id: contentRect
        color: "transparent"
        //        border.color: "black"

        width: aboutRect.width
        height: aboutRect.height * 0.75

        anchors{
            top: topRect.bottom
            //            topMargin: 20
            horizontalCenter: parent.horizontalCenter
        }

        ScrollView{
            anchors.fill: parent
            Column {
                Text {
                    id: aboutTxt
                    //                anchors.centerIn: parent
                    anchors{
                        left: parent.left
                        leftMargin: 15
                    }

                    width: aboutRect.width * 0.8
                    height: aboutRect.height * 1.5 //0.8
                    text:
                        "There are tons of foods thrown everyday and some of them "+
                        "actually are still very fine to consume while there might be someone "+
                        "around you who can't afford for food starving.\n"+
                        "No matter how rich someone is. He never know what may happen. \n"+
                        "Say, he went to someplace and by any chance, he lost his wallet. \n"+
                        "There, this little app could be of your help to save your life and survive.\n\n"+
                        "We are young developers "+
                        "who care for humanity related "+
                        "problems and try to come up with "+
                        "our own simple solutions "+
                        "embedded in our apps. \n"+
                        "Hopefully they really could be useful for you." +
                        "\n\n"+
                        "Code: fitsyu (@fitsyu)\n"+
                        "Design: [put your name here]\n"+
                        "Mentor: [put your name here]\n"+
                        "Financial Support: [put your name here] \n"+
                        "Any one who wants to contribute: [put your names here] \n"+
                        "\n\n"+
                        "JOIN THE PROJECT\n\n"+
                        "SAVE THE FINE FOODS FROM BEING THROWN IN VAIN\n"+
                        "\n\n"+

                        "Thanks to:\n"+
                        "- My God for giving me will anda power\n"+
                        "- My beloved family\n"+
                        "- The Qt Project www.qt.io\n"+
                        "- The Slackware Linux www.slackware.org\n"+
                        "- The GNU/LINUX Project www.kernel.org\n"+

                        "\n\n\n"+
                        "Questions, suggestions, critics are welcome."





                    wrapMode: Text.Wrap
                    font.pointSize: 14
                }
                Link{
                    width: aboutRect.width * 0.5
                    height: aboutRect.height * 0.1

                    text: "mail us"
                    onClicked: Qt.openUrlExternally("mailto:fitrahsyuhada@rocketmail.com"
                                                    +"?subject=free food apps")

//                    anchors.top: aboutTxt.bottom
//                    anchors.topMargin: 15
                    anchors.horizontalCenter: parent.horizontalCenter

                    style: ButtonStyle{
                        background: Rectangle{
                            color: control.pressed?"grey":"black"
                            radius: 10
                            border.color: "grey"
                            Text{
                                text: control.text;
                                anchors.centerIn: parent
                                color: "white"
                                font.pointSize: 12
                                font.underline: true
                            }
                        }
                        label: Item {}
                    }
                }

            }
        }
    }

    Rectangle{
        id: bottomRect

        //        border.color: "black"
        //        color: "transparent"
        color: Qt.darker("steelblue")

        width: aboutRect.width
        height: aboutRect.height * 0.08

        anchors{
            horizontalCenter: aboutRect.horizontalCenter
            bottom: aboutRect.bottom
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
                aboutRect.getOut()
            }
        }
    }
}


