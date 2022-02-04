const fs = require('fs')
const path = require('path')
const action = process.argv[2]
const content = process.argv[3]
const content2 = process.argv[4]
const dbPath = path.join(__dirname,'db')
ensureDb()
const list = fetch()
switch (action) {
    case 'add':
        addTask()
        break
    case 'list':
        break
    case 'delete':
        deleteTask(list, content)
        break
    case 'done':
        doneTask(list, content)
        break
    case 'edit':
        editTask(list, content,content2)
        break
    default:
        console.log('you got an error')
        break
}
display(list)
if (action !== 'list') {
    save(list)
}


// function
function ensureDb() {
    try {
        fs.statSync(dbPath)
    } catch (error) {
        fs.writeFileSync(dbPath, '')
    }
}
function save(list) {
    fs.writeFileSync(dbPath, JSON.stringify(list))
}
function fetch() {
    let list
    const fileContent = fs.readFileSync(dbPath).toString()
    try {
        list = JSON.parse(fileContent) || []
    } catch (error) {
        list = []
    }
    return list
}
function display(list) {
    console.log(list);
}
function addTask() {
    list.push([content, false])
}
function deleteTask(list, content) {
    list.splice(content - 1, 1)
}
function doneTask(list, content) {
    list[content - 1][1] = true
}
function editTask(list, content, content2) {
    list[content - 1][0] = content2
}