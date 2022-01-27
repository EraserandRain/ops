import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';

const div = document.createElement('div')
const p = document.createElement('p')
const span = document.createElement('span')
div.appendChild(p)
p.appendChild(span)
span.innerHTML = "hello world"
document.body.appendChild(div)
