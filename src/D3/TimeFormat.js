import * as timeFormat from "d3-time-format";

export const timeFormat = timeFormat.timeFormat;

export function localeTimeFormat(str) {
  return (locale) => locale.format(str);
}

export function timeFormatLocale(def) {
  return timeFormat.timeFormatLocale(def);
}
