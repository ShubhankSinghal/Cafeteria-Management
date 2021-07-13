// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
const images = require.context('../images', true)
channels.keys().forEach(channels)
