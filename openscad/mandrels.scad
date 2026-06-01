// mandrels.scad
// 两个 mandrel 示例：50 mm 和 18 mm（单位：mm）
// 参数化，调整 diameter 与 length 即可

$fn = 128; // 平滑度（导出 STL 时可降低/提高）
module mandrel(diameter=50, length=80, end_chamfer=2) {
  r = diameter/2;
  // 中心实心芯
  translate([0,0,0]) cylinder(h=length, r=r, center=false);
  // 两端倒角（做为差集避免尖锐）
  translate([0,0,length-end_chamfer]) rotate([0,0,0]) cylinder(h=end_chamfer, r1=r, r2=r-0.01);
  translate([0,0,0]) rotate([0,0,0]) cylinder(h=end_chamfer, r1=r, r2=r-0.01);
}

// 示例：两件 mandrel 放在同一文件中，便于一次渲染/导出
// 保存时可注释掉不需要的一个或移动到原点导出
// Mandrel for large vessel (50 mm)
translate([-60,0,0]) mandrel(diameter=50, length=80);

// Mandrel for small vessel (18 mm)
translate([60,0,0]) mandrel(diameter=18, length=80);
