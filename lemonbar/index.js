var Bar = require('bar-provider');
var bar = new Bar();

bar
  .center(time)
  .interval(1000);

function *time() {
  return (new Date()).toLocaleString();
}
