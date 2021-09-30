const brush = require("@visx/brush");
const baseBrush = require("@visx/brush/lib/BaseBrush");

exports.brushImpl = brush.Brush;
exports.baseBrushImpl = baseBrush.default;
exports.baseBrushStateImpl = baseBrush.BaseBrushState;
exports.baseBrushUpdateImpl = baseBrush.BaseBrushUpdate;
