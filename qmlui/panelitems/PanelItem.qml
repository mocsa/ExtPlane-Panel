import QtQuick 2.0

Item {
    id: panelItem
    property bool editMode: false

    Rectangle {
        id: highlightRect
        color: "transparent"
        border.color: "yellow"
        anchors.fill: parent
        visible: editMode
        z: 100
    }

    MouseArea { // Dragging
        width: highlightRect.width
        height: highlightRect.height
        enabled: editMode && !dragArea.busy
        onPressed: {
            dragArea.dragItem = panelItem
            dragArea.xOffset = mouseX
            dragArea.yOffset = mouseY
            mouse.accepted = false
        }
    }
    Rectangle {
        id: resizeHandle
        color: "transparent"
        border.color: "yellow"
        x: parent.width - width
        y: parent.height - height
        width: 20
        height: 20
        z: 100
        visible: editMode
        MouseArea {
            anchors.fill: parent
            enabled: editMode && !dragArea.busy
            onPressed: {
                dragArea.resizeItem = panelItem
                dragArea.xOffset = mouseX
                dragArea.yOffset = mouseY
                mouse.accepted = false
            }
        }
    }
}