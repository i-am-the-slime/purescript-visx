var d3TimeFormat = _interopRequireDefault(require("d3-time-format"));

function _interopRequireDefault(obj) {
  return obj && obj.__esModule ? obj : { default: obj };
}

exports.timeFormat = d3TimeFormat.timeFormat;

exports.localeTimeFormat = (str) => (locale) => locale.format(str);

exports.timeFormatLocale = (def) => d3TimeFormat.timeFormatLocale(def);
