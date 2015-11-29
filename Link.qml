import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3

Button{
    style:ButtonStyle{
        background: Rectangle{
            color: control.pressed?"black":"transparent"
            Text{
                text: control.text;
                anchors.centerIn: parent
                color: "white"
                font.pointSize: 12
//                font.underline: true
//                font.pixelSize: 15
            }
        }
        label: Item {}
    }
}
