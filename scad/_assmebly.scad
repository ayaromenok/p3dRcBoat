include <rcBoatBody.scad>
include <engine2212Basket_5inch.scad>
include <chassis.scad>
include <fuselage.scad>
include <hydrofoil.scad>
include <floatsHiSpeed_v2.scad>

chassisCenter(60,0,0);
engine2212_basket_inch5_assembly(-40,0,86);

//frontSection(0,80,-24);
//backSection(0,80,-24);
//frontSection(0,-80,-24);
//backSection(0,-80,-24);

fuselageSupport(30,0,8);
fuselageMainBot(60,0,58);


wingMainNACA(140,0,-58, 90,10,180);
wingHolder(120,10,-35,  0,180,180, length=60);
wingHolder(120,-10,-35,  0,180,180, length=60);


floatHiSpeed_front_v2(300,80,32, 0,90,-90);
floatHiSpeed_front_top_v2(300,80,-100, 0,-90,-90);
floatHiSpeed_center_v2(300,80,32, 0,90,-90);
floatHiSpeed_center_v2(100,80,32, 0,90,-90);

floatHiSpeed_front_v2(300,-80,32, 0,90,-90);
floatHiSpeed_front_top_v2(300,-80,-100, 0,-90,-90);
floatHiSpeed_center_v2(300,-80,32, 0,90,-90);
floatHiSpeed_center_v2(100,-80,32, 0,90,-90);

//floats v1
/*
translate([400,90,-75])
rotate([0,0,180])
            scale([1.2,0.6,1])
            import("../stl/in/hull_complete.stl");;            

translate([400,-90,-75])
rotate([0,0,180])
            scale([1.2,0.6,1])
            import("../stl/in/hull_complete.stl");;            
*/