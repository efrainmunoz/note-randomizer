var node = document.getElementById('elm-app');
var app = Elm.App.embed(node);


setInitialSettings();


app.ports.requestSavedSettings.subscribe(function() {
  var savedSettings = getSettings();
  app.ports.responseSavedSettings.send(savedSettings);
});

app.ports.requestSetRandomBgColor.subscribe(function(setting) {
  setRandomBgColor(setting);
});

app.ports.requestSetTimer.subscribe(function(setting) {
  setTimer(setting);
});

app.ports.requestSetTimerInterval.subscribe(function(setting) {
  setTimerInterval(setting);
});


function getSettings() {
  return {
    randomBgColorOn : JSON.parse(localStorage.getItem('randomBgColorOn')),
    timerOn : JSON.parse(localStorage.getItem('timerOn')),
    timerInterval : JSON.parse(localStorage.getItem('timerInterval'))
  }
}


function setInitialSettings() {
  if (JSON.parse(localStorage.getItem('randomBgColorOn')) == null)
    localStorage.setItem('randomBgColorOn', true);

  if (JSON.parse(localStorage.getItem('timerOn')) == null)
    localStorage.setItem('timerOn', false);

  if (JSON.parse(localStorage.getItem('timerInterval')) == null)
    localStorage.setItem('timerInterval', 2000);
}


function setRandomBgColor(setting) {
  localStorage.setItem('randomBgColorOn', setting);
}


function setTimer(setting) {
  localStorage.setItem('timerOn', setting);
}


function setTimerInterval(setting) {
  localStorage.setItem('timerInterval', setting);
}
