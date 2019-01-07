
var bspline = require('b-spline');

//var N = 9;
var Nx = 11;
var Ny = 15;

var X = 1;
//var Y = 2;
var Y = 11/8.5;
//var Y = 1;
var A = -1/16;

//var endAttenuate = 1/4;
var endAttenuate = 0;

var endF = [ 0.0, 0.1 ];

var degree = 2;

var points=[];

var px = -X/2;
var py =  Y/2;
for (var ii=0; ii<Nx; ii++) {
  if ((A < 0) && (ii==(Nx-1))) { break; }
  dx =  (1/(Nx-1)) * ii * X;
  dy = (((ii%2)==0) ? A : -A);
  if ((ii==0) || (ii==(Nx-1))) { dy *= endAttenuate; }
  if ((ii==1) || (ii==(Nx-2))) { dy *= endF[1];  }
  points.push([ px + dx, py + dy ]);
}

px = X/2;
py = Y/2;
for (var ii=0; ii<Ny; ii++) {
  if ((A < 0) && (ii==(Ny-1))) { break; }
  dx = (((ii%2)==0) ? A : -A); 
  dy = -(1/(Ny-1)) * ii * Y;
  if ((ii==0) || (ii==(Ny-1))) { dx *= endAttenuate; }
  if ((ii==1) || (ii==(Ny-2))) { dx *= endF[1];  }
  points.push([ px + dx, py + dy ]);
}

px = X/2;
py = -Y/2;
for (var ii=0; ii<Nx; ii++) {
  if ((A < 0) && (ii==(Nx-1))) { break; }
  dx =  -(1/(Nx-1)) * ii * X;
  dy = (((ii%2)==0) ? -A : A);
  if ((ii==0) || (ii==(Nx-1))) { dy *= endAttenuate; }
  if ((ii==1) || (ii==(Nx-2))) { dy *= endF[1];  }
  points.push([ px + dx, py + dy ]);
}

px = -X/2;
py = -Y/2;
for (var ii=0; ii<Ny; ii++) {
  if ((A < 0) && (ii==(Ny-1))) { break; }
  dx = (((ii%2)==0) ? -A : A); 
  dy = (1/(Ny-1)) * ii * Y;
  if ((ii==0) || (ii==(Ny-1))) { dx *= endAttenuate; }
  if ((ii==1) || (ii==(Ny-2))) { dx *= endF[1];  }
  points.push([ px + dx, py + dy ]);
}

px = -X/2;
py =  Y/2;
for (var ii=0; ii<Nx; ii++) {
  if ((A < 0) && (ii==(Nx-1))) { break; }
  if (ii > degree) { break; }
  dx =  (1/(Nx-1)) * ii * X;
  dy = (((ii%2)==0) ? A : -A);
  if ((ii==0) || (ii==(Nx-1))) { dy *= endAttenuate; }
  if ((ii==1) || (ii==(Nx-2))) { dy *= endF[1];  }
  points.push([ px + dx, py + dy ]);
}


for (var ii=0; ii<points.length; ii++) {
  //console.log(points[ii][0], points[ii][1]);
}


console.log("\n\n");

for (var t=0; t<1; t+=0.001) {
  var p = bspline(t, degree, points);
  console.log(p[0], p[1]);
}



/*
var N = 100;
var points = [];

for (var ii=0; ii < N; ii++) {
  points.push([ ii, Math.sin(Math.PI * ii *0.2) ]);
}

for(var t=0; t<1; t+=0.001) {
  var p = bspline(t, degree, points);
  console.log(p[0], p[1]);
}
*/
