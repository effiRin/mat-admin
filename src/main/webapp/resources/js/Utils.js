const MONTHS = [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];

function months(config) {
  var cfg = config || {};
  var count = cfg.count || 12;
  var section = cfg.section;
  var values = [];
  var i, value;

  for (i = 0; i < count; ++i) {
    value = MONTHS[Math.ceil(i) % 12];
    values.push(value.substring(0, section));
  }

  return values;
}
