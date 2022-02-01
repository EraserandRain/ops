import React, { useState } from "react";
import reactDom from "react-dom";
import "./style.css";
// Cell
const Cell = function (props) {
    return (
        <div className="cell" onClick={props.onClick}>
            {props.text}
        </div>
    )
}
//Cellboard
const Cellboard = function () {
    const [cells, setCells] = useState([
        [null, null, null],
        [null, null, null],
        [null, null, null]
    ])
    const [n, setN] = useState(0)
    const [finshed, setFinshed] = useState(false)
    const [result, setResult] = useState('')
    const tell = (cells) => {
        for (let i = 0; i < 3; i++) {
            if (cells[i][0] == cells[i][1] &&
                cells[i][1] == cells[i][2] &&
                cells[i][2] !== null) {
                setFinshed(true)
                setResult(cells[i][2])
                break
            } else if (
                cells[0][i] == cells[1][i] &&
                cells[1][i] == cells[2][i] &&
                cells[2][i] !== null
            ) {
                setFinshed(true)
                setResult(cells[2][i])
                break
            }
        }
        if (
            cells[0][0] == cells[1][1] &&
            cells[1][1] == cells[2][2] &&
            cells[2][2] !== null
        ) {
            setFinshed(true)
            setResult(cells[1][1])
        } else if (
            cells[0][2] == cells[1][1] &&
            cells[1][1] == cells[2][0] &&
            cells[2][0] !== null
        ) {
            setFinshed(true)
            setResult(cells[1][1])
        }
    }
    const onClickCell = (row, col) => {
        setN(n + 1)
        const copy = JSON.parse(JSON.stringify(cells))
        copy[row][col] = n % 2 == 0 ? 'x' : 'o'
        setCells(copy)
        tell(copy)
    }
    return (
        <div className="cellboard">
            {cells.map((items, row) => <div className="row">
                {items.map((item, col) => <div className="col">
                    <Cell text={item} onClick={() => onClickCell(row, col)} />
                </div>)}
            </div>)}
            {finshed && <div className="gameOver">{ result + '获胜'}</div>}
        </div>
    )
}
reactDom.render(<div className="container">
    <Cellboard />
</div>, document.getElementById('root'))