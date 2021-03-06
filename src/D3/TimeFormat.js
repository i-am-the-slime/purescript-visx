var d3TimeFormat = require("d3-time-format");

exports.timeFormat = d3TimeFormat.timeFormat;

exports.localeTimeFormat = (str) => (locale) => locale.format(str);

exports.timeFormatLocale = (def) => d3TimeFormat.timeFormatLocale(def);
