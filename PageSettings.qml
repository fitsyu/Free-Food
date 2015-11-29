import QtQuick 2.4
import QtQuick.Controls 1.3


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
            text: "Settings"

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
            topMargin: 20
            horizontalCenter: parent.horizontalCenter
        }

        // contents go here
        Column {
            anchors.fill: parent
            spacing: 10

            Item{
                width: aboutRect.width
                height: aboutRect.height * 0.05

                Text {
                    text: "Location update interval (s)"
                    font.pointSize: 14
                    anchors{
                        left: parent.left
                        leftMargin: 15
                        verticalCenter: parent.verticalCenter
                    }
                }
                SpinBox{
                    minimumValue: 1
                    maximumValue: 60
                    anchors{
                        right: parent.right
                        rightMargin: 15
                        verticalCenter: parent.verticalCenter
                    }
                    width: parent.width * 0.15
                }
            }
            Item{
                width: aboutRect.width
                height: aboutRect.height * 0.05

                Text {
                    text: "Foods search range (KM)"
                    font.pointSize: 14
                    anchors{
                        left: parent.left
                        leftMargin: 15
                        verticalCenter: parent.verticalCenter
                    }
                }
                SpinBox{
                    minimumValue: 1
                    maximumValue: 10
                    anchors{
                        right: parent.right
                        rightMargin: 15
                        verticalCenter: parent.verticalCenter
                    }
                    width: parent.width * 0.15
                }
            }
            Item{
                width: aboutRect.width
                height: aboutRect.height * 0.05

                Text {
                    text: "Enable notification  (coming soon)"
                    font.pointSize: 14
                    anchors{
                        left: parent.left
                        leftMargin: 15
                        verticalCenter: parent.verticalCenter
                    }
                }
                CheckBox {
                    anchors{
                        right: parent.right
                        rightMargin: 15
                        verticalCenter: parent.verticalCenter
                    }
                    width: parent.width * 0.15
                }
            }
            Item{
                width: aboutRect.width
                height: aboutRect.height * 0.05

                Text {
                    text: "Enable widget (coming soon)"
                    font.pointSize: 14
                    anchors{
                        left: parent.left
                        leftMargin: 15
                        verticalCenter: parent.verticalCenter
                    }
                }
                CheckBox {
                    anchors{
                        right: parent.right
                        rightMargin: 15
                        verticalCenter: parent.verticalCenter
                    }
                    width: parent.width * 0.15
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


