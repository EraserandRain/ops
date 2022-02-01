var div = document.createElement('div')
div.id = 'demo'
document.body.appendChild(div)
var toggle = false
var position = [0, 0]
document.onmousedown = (e) => {
    toggle = true
    position[0] = e.clientX
    position[1] = e.clientY
}
document.onmouseup = (e) => {
    toggle = false
}
document.onmousemove = (e) => {
    if (toggle === true) {
        var deltaX = e.clientX - position[0]
        var deltaY = e.clientY - position[1]
        var top = parseInt(div.style.top!) || 0
        var left = parseInt(div.style.left!) || 0
        div.style.top = deltaY + top + 'px'
        div.style.left = deltaX + left + 'px'
        position = [e.clientX, e.clientY]
    }
}