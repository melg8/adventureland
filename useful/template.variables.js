const path = require("node:path");

module.exports = {
  cfunctions_path: path.resolve(__dirname, "../js/common_functions.js"),
  functions_path: path.resolve(__dirname, "server_functions.js"),
  worker_path: path.resolve(__dirname, "server_worker.js"),
  data_path: path.resolve(__dirname, "data.js"),
  base_url: "http://127.0.0.1",
  keyword: "123",
  access_master: "123",
  bot_key: "123",
  discord_token: "NDXXXXXXXXXXX...",
  apple_token: "acXXXXXXXX...",
  steam_key: "8aXXXXXXXXX...",
  steam_web_key: "B4XXXXXXX...",
  steam_partner_key: "F9XXXXXXX...",
  is_sdk: false,
  close_timeout: 4000,
  ip_limit: 3,
  character_limit: 5,
  fast_sdk: 0,
};
