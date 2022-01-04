import { timeFormat, timeFormatLocale } from "d3-time-format";

export const timeFormat = timeFormat;

export function localeTimeFormat(str) {
  return (locale) => locale.format(str);
}

export function timeFormatLocale(def) {
  return timeFormatLocale(def);
}
