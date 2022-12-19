import React from 'react';
import ReactDOM from 'react-dom';
import 'bootstrap/dist/css/bootstrap.min.css';
import './index.css';
import App from './App';
import * as serviceWorker from './serviceWorker';

document.addEventListener('DOMContentLoaded', () => {
  // ReactDOM.render(<App />, document.getElementById('root'));

  ReactDOM.render(
    <App/>,
    document.body.appendChild(document.createElement('div')),
  )
})


serviceWorker.unregister();
