include <rcBoatBody.scad>
include <engine2212Basket_5inch.scad>
include <chassis.scad>
include <fuselage.scad>
include <chassis_v2.scad>

chassisCenter(60,0,10);
//chassisCenter(260,0,10);
chassisSide(0,0,0,  0,0,0);
chassisSide(0,0,0,  0,0,180);
chassisSide(160,0,0,  0,0,0);
chassisSide(160,0,0,  0,0,180);

fuselageWithMotorMount(-40,0,20, isMetal=true);
//engine2212_basket_inch5_assembly(-40,0,86);
//fuselageSupport(30,0,8);
//fuselageMainBot(60,0,58);

//floats v1
translate([500,160,-75])
rotate([0,0,180])
            scale([1.2,0.6,1])
            import("../stl/in/hull_complete.stl");;            

translate([500,-160,-75])
rotate([0,0,180])
            scale([1.2,0.6,1])
            import("../stl/in/hull_complete.stl");;            
