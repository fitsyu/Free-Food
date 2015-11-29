import QtQuick 2.4
import QtQuick.Controls 1.3

Rectangle {
    id: sharesRect

    z: 3

    anchors.fill: parent

    color: "white"

    opacity: 0 // initially invisible
    visible: opacity
    focus: visible
    Keys.onBackPressed: { getOut(); }
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

        width: sharesRect.width
        height: sharesRect.height * 0.1

        anchors{
            horizontalCenter: sharesRect.horizontalCenter
            top: sharesRect.top
        }

        Text {
            id: sharingSessionTxt
            text: "Your Shares"

            color: "yellow"

            anchors.centerIn: parent

            font.pointSize: 20
        }
    }

    Rectangle {
        id: contentRect
        color: "transparent"
//        border.color: "black"

        width: sharesRect.width
        height: sharesRect.height * 0.75

        anchors{
            top: topRect.bottom
            topMargin: 20
            horizontalCenter: parent.horizontalCenter
        }

        ListView{
            id: sharedFoodsList
            anchors.fill: parent

            model: ListModel {
                ListElement{
                    foodName: "Roti Maryam"
                    foodAmount: 20
                    timeLimit: 2
                    pict: "qrc:/img/roti.jpg"
                }
                ListElement{
                    foodName: "Donat"
                    foodAmount: 10
                    timeLimit: 7
                    pict: "qrc:/img/donat.jpg"
                }
                ListElement{
                    foodName: "Pukis"
                    foodAmount: 60
                    timeLimit: 3
                    pict: "qrc:/img/pukis.jpg"
                }
            }

            delegate: Rectangle {
                width:  sharedFoodsList.width
                height:  sharedFoodsList.height * 0.15
                color: "black"
                border.color: "grey"
                opacity: 0.85

                Rectangle {
                    // for food pict
                    id: foodPicture
                    width: 50 //parent.width * 0.25
                    height: width
                    anchors{
                        left: parent.left
                        leftMargin: 15
                        verticalCenter: parent.verticalCenter
                    }
                    Image {
                        anchors.fill: parent
                        source: pict
                    }
                }

                Text{
                    id: foodData
                    text: foodName+"\n"+foodAmount+"\n"+timeLimit
                    color: "white"

                    anchors{
                        left: foodPicture.right
                        leftMargin: 15
                        verticalCenter: parent.verticalCenter
                    }
                }



                Link {
                    text: "edit"

                    width: parent.width * 0.15
                    height: parent.height

                    onClicked: {
                        var food = [foodName, foodAmount, timeLimit, pict]
                        updateFood.fillForm(food)
                        updateFood.getIn()
                    }

                    anchors{
                        right: parent.right
                        rightMargin: 15
                        verticalCenter: parent.verticalCenter
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

        width: sharesRect.width
        height: sharesRect.height * 0.08

        anchors{
            horizontalCenter: sharesRect.horizontalCenter
            bottom: sharesRect.bottom
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
                sharesRect.getOut()
            }
        }
    }

    FoodUpdate{
        id: updateFood
        z:  3
    }
}


