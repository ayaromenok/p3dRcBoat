include <rcBoatBody.scad>
include <engine2212Basket_5inch.scad>
include <chassis.scad>
include <fuselage.scad>

chassisCenter(60,0,0);
chassisCenter(260,0,0);
engine2212_basket_inch5_assembly(-40,0,86);


fuselageSupport(30,0,8);
fuselageMainBot(60,0,58);

//floats v1
translate([500,90,-75])
rotate([0,0,180])
            scale([1.2,0.6,1])
            import("../stl/in/hull_complete.stl");;            

translate([500,-90,-75])
rotate([0,0,180])
            scale([1.2,0.6,1])
            import("../stl/in/hull_complete.stl");;            
