/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/

import QtQuick 6.4
import QtQuick.Controls 6.4
import Pr2230408

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height

    color: Constants.backgroundColor

    MyBack {
        id: back
        x: 0
        y: 0
        fillMode: Image.PreserveAspectFit
        source: "images/back.jpg"
        layer.mipmap: false
        layer.enabled: false
        asynchronous: false

        Button {
            id: button
            x: 1202
            y: 504
            width: 293
            height: 101
            opacity: 1
            visible: true
            text: qsTr("Пуск")
            anchors.verticalCenter: parent.verticalCenter
            layer.format: ShaderEffectSource.Alpha
            layer.effect: button
            layer.mipmap: true
            activeFocusOnTab: true
            smooth: true
            font.kerning: true
            font.hintingPreference: Font.PreferDefaultHinting
            focusPolicy: Qt.StrongFocus
            layer.enabled: true
            clip: false
            highlighted: false
            display: AbstractButton.TextOnly
            hoverEnabled: true
            enabled: true
            icon.height: 1200
            icon.width: 1200
            icon.color: "#00ffffff"
            icon.source: "button.png"
            flat: false
            font.family: "Verdana"
            font.pointSize: 20
            anchors.verticalCenterOffset: 43
            anchors.horizontalCenterOffset: 1
            checkable: true
            anchors.horizontalCenter: parent.horizontalCenter

            Connections {
                target: button
                onClicked: animation.start()
            }
        }

        Text {
            id: label
            x: 1420
            y: 623
            width: 293
            height: 105
            color: "#7a005e"
            text: qsTr("Перший проект")
            anchors.top: button.bottom
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            clip: true
            font.pointSize: 14
            anchors.horizontalCenterOffset: 1
            font.family: Constants.font.family
            anchors.topMargin: 9
            anchors.horizontalCenter: parent.horizontalCenter

            SequentialAnimation {
                id: animation

                ColorAnimation {
                    id: colorAnimation1
                    target: rectangle
                    property: "color"
                    to: "#2294c6"
                    from: Constants.backgroundColor
                }

                ColorAnimation {
                    id: colorAnimation2
                    target: rectangle
                    property: "color"
                    to: Constants.backgroundColor
                    from: "#2294c6"
                }
            }
        }

    }
    states: [
        State {
            name: "clicked"
            when: button.checked

            PropertyChanges {
                target: label
                width: 292
                height: 144
                color: "#7a005e"
                text: qsTr("Перший проект
(кнопка натиснута)
")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.horizontalCenterOffset: 1
                anchors.topMargin: -5
                font.family: "Verdana"
            }

            PropertyChanges {
                target: button
                highlighted: true
                hoverEnabled: true
                icon.cache: true
                icon.height: 1200
                icon.width: 1200
                clip: false
                icon.source: "button1.png"
                checkable: true
                flat: false
                font.family: "Verdana"
            }
        }
    ]
}
