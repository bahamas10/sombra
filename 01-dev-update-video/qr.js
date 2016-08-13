var s = [
  "FEC-820-BA9-BAD-BAF-824-FEA-5-F28-980-5B0-F59",
  "4B1-2C7-F83-748-7F4-719-AAA-2C8-1F6-47C-5A8-DBA",
  "7F-1541-85D-E5D-35D-1C41-157F-500-49D-122-11D8-D9C",
  "279-919-4AA-800-1E9-308-3F1-EDC-CB3-602-DE9-8",
  "153-690-BF0-CA1-2B-D03-9C8-866-DF7-EF9-C21-20",
  "1FD7-1F79-1582-1252-806-1B4B-1FB7-1050-532-9A9-1870-1FEF",
  "3A0-A43-AFF-793-658-C-FE4-821-BA4-BA8-BAA-82F-FED",
  "B6A-BD4-496-324-A2F-3C3-78E-723-634-B9-287-EFA-172",
  "1B5E-17F9-83D-160-1BFE-1D14-956-318-5F1-6D7-1BC-C24-18CF"
];

function h2b(h) {
  return parseInt(h, '16').toString(2);
}

function lpad(s, i, c) {
  while (s.length < i)
    s = c + s;
  return s;
}

var foo = [];
s.forEach(function(line) {
  line.split('-').forEach(function(h, i) {
    var b = lpad(h2b(h), 12, '0');
    foo.push(b);
  });
});

var col = 3;

var n = Math.floor(foo.length / col);
var newlines = [];

foo.forEach(function (line, i) {
  var key = Math.floor(i / n);
  newlines[key] = newlines[key] || [];
  newlines[key].push(line);
});

for (var i = 0; i < newlines[0].length; i++) {
  var line = [];
  for (var j = 0; j < n; j++) {
    var l = newlines[j];
    if (l)
      line.push(l[i]);
  }
  console.log(line.join(''));
}
