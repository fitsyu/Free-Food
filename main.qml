import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import QtQuick.Window 2.2

Window {
    id: window
    title: qsTr("Free Food")

    width:  Qt.platform.os==="linux"?540:Screen.width
    height: Qt.platform.os==="linux"?960:Screen.height

    visibility: Qt.platform.os==="linux"?"Windowed":"AutomaticVisibility"
    visible: true

    color: "white" //  Qt.darker("grey")


    Image {
        anchors.fill: parent
        source: "qrc:/img/background.png"
        Image {
            anchors{
                top: parent.top
                topMargin: 20
                horizontalCenter: parent.horizontalCenter
            }

            width: parent.width
            height: parent.height * 0.2

            source: "qrc:/img/FreeFoodLogo.png"
        }
    }

    Rectangle {
        id: mainMenu

        z: 2

        width: window.width * 0.8
        height: window.height * 0.5
        radius: 15

        color: "black"
        opacity: 0.8

        anchors.centerIn: parent
        Column {
            anchors.centerIn: parent

            spacing: 20
            Button {
                id: btShareSetup
                text: "Share"

                width: mainMenu.width * 0.8
                height: mainMenu.height * 0.25
                anchors.horizontalCenter: parent.horizontalCenter

                onClicked: {
                    myFoodShare.getIn()
                }

                style: ButtonStyle {
                    background: Rectangle{
                        color: control.pressed?Qt.darker("grey"):"grey"
                        opacity: 0.8
                        border.width: 1
                        radius: 5
                        Text{
                            text: control.text
                            anchors.centerIn: parent
                            color: "white"
                            font.pointSize: 24
                        }

                    }
                    label: Item {}
                }
            }
            Button {
                id: btFind
                text: "Find"

                width: mainMenu.width * 0.8
                height: mainMenu.height * 0.25
                anchors.horizontalCenter: parent.horizontalCenter

                onClicked: {
                    myFoodMap.getIn()
                }

                style: ButtonStyle {
                    background: Rectangle{
                        color: control.pressed?Qt.darker("grey"):"grey"
                        opacity: 0.8
                        border.width: 1
                        radius: 5
                        Text{
                            text: control.text
                            anchors.centerIn: parent
                            color: "white"
                            font.pointSize: 24
                        }

                    }
                    label: Item {}
                }

            }
        }
    }

    Rectangle {
        id: bottomRect
        width: parent.width
        height: parent.height * 0.08

        color: "#1a2b3a"
        anchors.bottom: parent.bottom



        Row {
            spacing: 5
            //            anchors.verticalCenter: parent.verticalCenter
            anchors.centerIn: parent

            Link {
                id: poinCount
                text: "10 poins"

                width: bottomRect.width * 0.15
                height: bottomRect.height

                anchors.verticalCenter: parent.verticalCenter

                onClicked: myPoinPage.getIn()
            }
            Link {
                id: sharedFoodCount
                text: "3 shares"

                width: bottomRect.width * 0.15
                height: bottomRect.height

                anchors.verticalCenter: parent.verticalCenter

                onClicked: mySharesPage.getIn()
            }
            Link {
                text: "settings"

                width: bottomRect.width * 0.15
                height: bottomRect.height

                anchors.verticalCenter: parent.verticalCenter

                onClicked: mySettingsPage.getIn()
            }
            Link {

                text: "help"

                width:  bottomRect.width * 0.1 //5
                height: bottomRect.height

                anchors.verticalCenter: parent.verticalCenter

                onClicked: helpPage.getIn()
            }

            Link {
                text: "about"

                width: bottomRect.width * 0.1//5
                height: bottomRect.height

                anchors.verticalCenter: parent.verticalCenter

                onClicked: aboutPage.getIn()
            }

            Link {
                text: "exit"
                width: bottomRect.width * 0.1//5
                height: bottomRect.height

                anchors.verticalCenter: parent.verticalCenter

                onClicked: Qt.quit()
            }


        }

    }

    FoodShare {
        id: myFoodShare
        z: 3
        onAFoodJustShared: {
            thanksViewer.opacity = 0.95
        }
    }

    FoodMap {
        id: myFoodMap
        z: 3
    }

    //    PageAbout {
    //        id: aboutPage
    //        z: 3
    //    }
    Activity{
        id: aboutPage
        z: 3

        activityTitle: "About"
        activityContent:
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

                    width: aboutPage.width * 0.8
                    height: aboutPage.height * 1.5 //0.8
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignJustify
                    font.pointSize: 14
                    text:
                        "\n"+
                        "There are tons of foods thrown everyday and some of them "+
                        "actually are still very fine to consume while there might be someone "+
                        "around you who can't afford for food starving."+
                        "No matter how rich someone is, he never know what may happen. \n"+
                        "Say, he went to someplace and by any chance, he lost his wallet. "+
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
                        "- My God for giving me will and power\n"+
                        "- My beloved family\n"+
                        "- The Qt Project www.qt.io\n"+
                        "- The Slackware Linux www.slackware.org\n"+
                        "- The GNU/LINUX Project www.kernel.org\n"+

                        "\n\n\n"+
                        "Questions, suggestions, critics are welcome."


                }
                Link{
                    width: aboutPage.width * 0.5
                    height: aboutPage.height * 0.1

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

    //    PageHelp {
    //        id: helpPage
    //        z: 3
    //    }
    Activity{
        id: helpPage
        z: 3

        activityTitle: "Help"
        activityContent:
            ScrollView{
            anchors.fill: parent
            Text {
                //                anchors.centerIn: parent
                anchors{
                    left: parent.left
                    leftMargin: 15
                }
                width: helpPage.width * 0.9
                height: helpPage.height * 2 //0.9
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

    //    PageSettings {
    //        id: mySettingsPage
    //        z: 3
    //    }
    Activity{
        id: mySettingsPage
        z: 3
        activityTitle: "Settings"
        activityContent:  Column {
            anchors.fill: parent
            spacing: 10

            Item{
                width: aboutPage.width
                height: aboutPage.height * 0.05

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
                width: aboutPage.width
                height: aboutPage.height * 0.05

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
                width: aboutPage.width
                height: aboutPage.height * 0.05

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
                width: aboutPage.width
                height: aboutPage.height * 0.05

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

    //    PagePoin{
    //        id: myPoinPage
    //        z: 3
    //    }
    Activity {
        id: myPoinPage
        z: 3

        activityTitle: "My Poins"
        activityContent:
            ScrollView{
            anchors.fill: parent
            Text {
                //                anchors.centerIn: parent
                anchors{
                    left: parent.left
                    leftMargin: 15
                }
                width: myPoinPage.width * 0.9
                height: myPoinPage.height * 2 //0.9
                text: "<br> You have: <br>"+
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

//    PageShares {
//        id: mySharesPage
//        z: 3
//    }
    Activity{
        id: mySharesPage
        z: 3
        activityTitle: "My Shares"
        activityContent:   ListView{
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
        FoodUpdate{
            id: updateFood
            z:  3
        }
    }

    Rectangle {
        id: thanksViewer
        z: 5
        width: parent.width //* 0.8
        height: parent.height //* 0.05
        color: "black"
        opacity: 0
        visible: opacity>0
        onVisibleChanged: {
            if (visible)
                fade.start()
        }

        Timer {
            id: fade
            interval: 3000
            onTriggered: thanksViewer.opacity = 0
        }

        Text{
            text: "The Food has been shared. \n\nThank you for sharing.\n\n\n"+
                  "please see \"help\" page \nif you don't see it yet."
            color: "white"
            font.pointSize: 18
            anchors.centerIn: parent

            horizontalAlignment: Text.AlignHCenter
        }
    }
}
