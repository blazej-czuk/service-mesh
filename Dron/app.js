const express = require('express');
const axios = require('axios')
const consoleStamp = require('console-stamp');
consoleStamp(console, {
  format: ':date(dd.mm.yyyy HH:MM:ss.l) :label',
});

const app = express();

app.use(express.json())
app.set('view engine', 'ejs');

const sleep = (delay) =>
  new Promise((resolve) => setTimeout(resolve, delay))

// gets the style information from the env variables
// {
//   styleClass: "background-color: #000000; color: #FFFFFF",
//   message: 'Hello',
// }
function getStyleFromEnv() {
  const backgroundColor = process.env.BG_COLOR || '#000000';
  const foregroundColor = process.env.FG_COLOR || '#FFFFFF';
  const message = process.env.MESSAGE || backgroundColor;

  return {
    styleClass: `background-color:${backgroundColor}; color:${foregroundColor}`,
    message,
  };
}

async function pingDrone(service) {
  while (true) {
    try {
      await axios.post(`http://${service}:${process.env.PORT}/ping-me`, {
        from: process.env.NAME,
        message: `Hello from ${process.env.NAME}`,
      },
      {
        headers: {
          dron: process.env.NAME
        }
      }
      ); 
    } catch (err) {
      console.error(err)
    }
    await sleep(2000)
  }
}

async function initPing() {
  await sleep(5000)
  const drones = process.env.DRONES.split(',')
  for (const drone of drones) {
    pingDrone(drone)
  }
}

app.get('/version', (req, res) => {
  const pkg = require('./package.json');
  const version = process.env.VERSION || pkg.version;
  res.status(200).json({ version });
});

app.get('/siemka', (req, res) => {
  res.status(200).json({ message: `Siemka from ${process.env.NAME}` });
});

app.get('*', (req, res) => {
  const { styleClass, message } = getStyleFromEnv();
  res.render('index', { style: styleClass, message });
});

app.post('/ping-me', (req, res) => {
  console.log(`I'm ${process.env.NAME} and I've just got pinged by ${req.body.from}!`)
  res.sendStatus(200);
});

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`${process.env.NAME} running on port ${port}`);
});

initPing()