var Bar = require('bar-provider');
var Promise = require('bluebird');
var exec = Promise.promisify(require('child_process').exec);

var bar = new Bar();
var batteryLevel = '100';

bar
  .center(time)
  .right(battery)
  .interval(1000);

function *time() {
  return (new Date()).toLocaleString();
}

function *battery() {
  exec("acpi -i")
    .then(function(level) {
      var parts = level[0].split(',');

      batteryLevel = parts[1];
    })
    .catch(function(err) {
      console.error(err);
    });
  return batteryLevel;
}
