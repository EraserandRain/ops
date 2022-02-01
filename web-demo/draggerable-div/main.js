var div = document.createElement('div')
div.id = "demo"
document.body.appendChild(div)
var dragging = false
var position = [0, 0]
div.onmousedown = function (e) {
    dragging = true
    position = [e.clientX, e.clientY]
}
document.onmouseup = function () {
    dragging = false
}
document.onmousemove = function (e) {
    if (dragging === true) {
        var deltaX = e.clientX - position[0]
        var deltaY = e.clientY - position[1]
        var top = parseInt(div.style.top) || 0
        var left = parseInt(div.style.left) || 0
        div.style.top = top + deltaY + 'px'
        div.style.left = left + deltaX + 'px'
        position = [e.clientX, e.clientY]
    }
}