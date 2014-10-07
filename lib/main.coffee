window.React = require 'react-atom-fork'
App = require './components/app'

React.renderComponent(App(null), document.getElementById('app'))
