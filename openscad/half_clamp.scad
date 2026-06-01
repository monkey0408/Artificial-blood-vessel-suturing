// half_clamp.scad
// 半弧夹具（配合 mandrel 使用）
// 参数：inner_diameter（匹配 mandrel）、arc_angle（半弧角度）、厚度、螺栓孔位置

$fn = 128;

module half_clamp(inner_diameter=50, arc_angle=180, thickness=10, width=30, hole_d=4, bolt_offset=10) {
  r = inner_diameter/2;
  // 基本半圆壳体
  difference() {
    // 外形：扇形柱
    rotate_extrude(angle=arc_angle)
      translate([r + thickness,0,0]) square([thickness, width], center=true);
    // 内腔：去除与 mandrel 配合的半圆
    translate([0,0,-1])
      rotate_extrude(angle=arc_angle)
        translate([r - 0.1,0,0]) square([0.2, width+2], center=true);
  }

  // 螺栓孔（两个）
  translate([0, (width/2 - bolt_offset), thickness/2])
    rotate([90,0,0])
      translate([0,0,0])
        cylinder(h=thickness+2, r=hole_d/2, center=true);
  translate([0, -(width/2 - bolt_offset), thickness/2])
    rotate([90,0,0])
      cylinder(h=thickness+2, r=hole_d/2, center=true);
}

// 输出示���：一对对称半夹具
translate([-40,0,0]) half_clamp(inner_diameter=50, arc_angle=180, thickness=12, width=30);
translate([40,0,0]) mirror([1,0,0]) half_clamp(inner_diameter=50, arc_angle=180, thickness=12, width=30);
