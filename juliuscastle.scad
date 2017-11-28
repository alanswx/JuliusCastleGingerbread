//1inch=25.4mm 
inchfactor = 25.4;
scale=0.96;

module cookie_profile(file,h) {
  linear_extrude(height = h)
    scale([scale,scale,scale])import(file = file,center=true);
    
}
module offset_shell(thickness = 0.5) {
  difference() {
    render() {
      minkowski() {
        children();
        cube([2 * thickness, 2 * thickness, 2 * thickness], center=true);
      }
    }
    translate([0, 0, -5 * thickness]) scale([1, 1, 100])
      children();
  }
}

module moulding(h)
{
    translate([0,100,0]) cube([11*inchfactor,5,h]);
}
/*
difference() {
  children();
  translate([0, 0, -5]) scale([1, 1, 100])
    translate([0, 0, -2])
      invert(0.9 * bbox)
        minkowski() {
          invert() knight_profile();
          cube([1, 1, 1], center=true);
        }
}
*/

module inset_shell(thickness = 0.5, bbox = [5000, 5000, 5000]) {
  module invert(bbox = [5000, 5000, 5000]) {
    difference() {
      cube(bbox, true);
      children();
    }        
  }

  module inset(thickness = 0.5, bbox = [5000, 5000, 5000]) {
    render() {
      invert(0.9 * bbox)
        minkowski() {
          invert() children();
          cube([2 * thickness, 2 * thickness, 2 * thickness], center=true);
        }
    }
  }

  render() {
    difference() {
      children();
      translate([0, 0, -5 * thickness]) scale([1, 1, 100]) translate([0, 0, -2 * thickness])
        inset(thickness, bbox)
          children();
    }
  }
}

if (0)
{
translate([250,100,0]) rotate([0,0,90]) inset_shell(1)
  cookie_profile("dxf/smallturret.dxf",10);
}
if (0)
{
translate([250,50,0]) rotate([0,0,90]) inset_shell(1)
  cookie_profile("dxf/bigturret.dxf",10);
}

// fix this -- weird shape
if (0)
{
translate([0,0,0])inset_shell(1)
  cookie_profile("dxf/frontwall.dxf",10);
  translate([80,42,8])cube([10,225,2]);
  translate([200,42,8])cube([10,150,2]);
  translate([0,135,8])cube([268.2,10,2]);
}
// fix this -- weird shape
if (0)
{
translate([0,0,0])inset_shell(1)
  cookie_profile("dxf/backmiddlewall.dxf",10);
  translate([80,42,8])cube([10,225,2]);
}
if (0)
{
inset_shell(1)
  cookie_profile("dxf/frontwall_lower2.dxf",12);
  translate([80,42,8])cube([10,93,2]);
  translate([200,42,8])cube([10,90,2]);
}

if (0)
{
translate([0,0,0])inset_shell(1)
  cookie_profile("dxf/side1.dxf",10);
      translate([70,69,8])cube([10,152,2]);
  translate([170,69,8])cube([10,152,2]);

}
if(0)
{
translate([0,0,0])inset_shell(1)
  cookie_profile("dxf/side2.dxf",10);
          translate([70,69,8])cube([10,152,2]);

}
if (0)
{
translate([0,0,0])inset_shell(1)
  cookie_profile("dxf/side3.dxf",10);
  translate([70,69,8])cube([10,152,2]);
  translate([125,69,8])cube([10,152,2]);

}
if (1)
{
translate([0,0,0])inset_shell(1)
  cookie_profile("dxf/hexspacer.dxf",10);
  //translate([70,69,8])cube([10,152,2]);
  translate([125,158,8])cube([10,42,2]);

}
//translate([0,0,0])inset_shell(1)
 // cookie_profile("dxf/bigside.dxf",10);
//translate([0,0,0])inset_shell(1)
//  cookie_profile("dxf/bigside2.dxf",10);
//translate([0,0,0])inset_shell(1)
//  cookie_profile("dxf/frontwall_lower.dxf",10);
