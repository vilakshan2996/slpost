const functions = require("firebase-functions");

// // Create and deploy your first functions
// // https://firebase.google.com/docs/functions/get-started
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
const axios = require("axios");
const express = require("express");
const cors = require("cors");
const app = express();


app.use(cors({origin: true}));

app.post("/", async (req, res) => {
  try {
    // Replace the following with the request body you want to send
    const requestBody = {
      "asset": "USDT",
      "fiat": "LKR",
      "merchantCheck": true,
      "page": 1,
      "payTypes": ["BANK"],
      "publisherType": null,
      "rows": 5,
      "tradeType": "BUY",

      // ...
    };
    const response = await axios.post("https://p2p.binance.com/bapi/c2c/v2/friendly/c2c/adv/search", requestBody);

    const prices = response.data.data.map((item) => item.adv.price); // Extract the prices into an array

    const sum = prices.reduce((acc, curr) => acc + parseFloat(curr), 0); // Calculate the sum of prices

    const mean = sum / prices.length; // Calculate the mean of prices


    res.send({
      prices: prices,
      averagePrice: mean,
    });
  } catch (error) {
    console.error(error);
    res.status(500).send("Error occurred while making POST request");
  }
});

exports.postRequestFunction = functions.https.onRequest(app);

// exports.callApiFiveTimesADay = functions.pubsub.schedule("every day 09:00, 12:00, 15:00, 18:00, 20:07, 22:45").timeZone("Asia/Colombo").onRun(async (context) => {
//   try {
//     const response = await axios.post("https://p2p.binance.com/bapi/c2c/v2/friendly/c2c/adv/search",
//         {"asset": "USDT",
//           "fiat": "LKR",
//           "merchantCheck": true,
//           "page": 1,
//           "payTypes": ["BANK"],
//           "publisherType": null,
//           "rows": 5,
//           "tradeType": "BUY",

//         });
//     console.log(response.data);
//   } catch (error) {
//     console.error(error);
//   }
// });

exports.callApiFiveTimesADay = functions.pubsub.schedule("* * * * *").timeZone("Asia/Colombo").onRun(async (context) => {
  try {
    const requestBody = {
      "asset": "USDT",
      "fiat": "LKR",
      "merchantCheck": true,
      "page": 1,
      "payTypes": ["BANK"],
      "publisherType": null,
      "rows": 5,
      "tradeType": "BUY",

      // ...
    };
    const response = await axios.post("https://p2p.binance.com/bapi/c2c/v2/friendly/c2c/adv/search", requestBody);

    const prices = response.data.data.map((item) => item.adv.price); // Extract the prices into an array

    const sum = prices.reduce((acc, curr) => acc + parseFloat(curr), 0); // Calculate the sum of prices

    const mean = sum / prices.length; // Calculate the mean of prices
  } catch (error) {
    console.error(error);
  }
});

