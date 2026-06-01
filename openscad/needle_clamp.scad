// needle_clamp.scad
// 简单的针夹（可用螺丝夹紧缝针），含安装孔与夹缝槽
// 参数化：夹槽宽度 / 深度，安装孔距

$fn = 128;

module needle_clamp(body_len=30, body_w=12, body_h=10, groove_w=2, groove_h=2, mount_hole_d=3, mount_spacing=20) {
  // 主块
  difference() {
    cube([body_len, body_w, body_h], center=true);
    // 中央夹槽（开口面位于上表面）
    translate([0,0,body_h/4])
      cube([body_len-4, groove_w, groove_h], center=true);
  }
  // 安装孔（通过整个块）
  translate([ mount_spacing/2, 0, 0]) rotate([90,0,0]) cylinder(h=body_w+2, r=mount_hole_d/2, center=true);
  translate([-mount_spacing/2, 0, 0]) rotate([90,0,0]) cylinder(h=body_w+2, r=mount_hole_d/2, center=true);
}

// 输出示例：两件，正反放置
translate([-25,0,0]) needle_clamp();
translate([25,0,0]) mirror([1,0,0]) needle_clamp();
