import QtQuick 2.4
import QtLocation 5.5
//MapQuickItem {
//        center:  userGPS.position.coordinate
MapCircle {
    radius: 10
    color: "lightsteelblue"
//    anchorPoint.x: image.width/4
//        anchorPoint.y: image.height

//    sourceItem: Image {
//        id: image
//        anchors.fill: parent
//        source: "qrc:/img/cake.png"
//    }

    signal activated()
    MouseArea {
        anchors.fill: parent
        onClicked: activated()
    }
}
