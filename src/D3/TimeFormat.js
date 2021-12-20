var d3TimeFormat = require("d3-time-format");
var d3TimeFormatDefault = _interopRequireDefault(d3TimeFormat);

function _interopRequireDefault(obj) {
  return obj && obj.__esModule ? obj : { default: obj };
}

exports.timeFormat = d3TimeFormatDefault.timeFormat;

exports.localeTimeFormat = (str) => (locale) => locale.format(str);

exports.timeFormatLocale = (def) => d3TimeFormat.timeFormatLocale(def);
