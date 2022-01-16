var div = document.createElement('div')
document.body.appendChild(div)
var dragging = false
var lastX
var lastY
div.onmousedown = function (e) {
    dragging = true
    lastX = e.clientX
    lastY = e.clientY
}
document.onmouseup = function () {
    dragging = false
}
document.onmousemove = function (e) {
    if (dragging === true) {
        var deltaX = e.clientX - lastX
        var deltaY = e.clientY - lastY
        var top = parseInt(div.style.top) || 0
        var left = parseInt(div.style.left) || 0
        div.style.top = top + deltaY + 'px'
        div.style.left = left + deltaX + 'px'
        lastX = e.clientX
        lastY = e.clientY
    }
}