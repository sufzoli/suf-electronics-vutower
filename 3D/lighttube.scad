
dia = 50;
wall = 2.5;
height = 100;
profil_width =30.5;
profil_thick = 2.8;
join_tolerance = 0.5;

$fn=360;

difference()
{
    union()
    {
        cylinder(d=dia,h=height);
        translate([0,0,height])
            cylinder(d=dia-wall-join_tolerance,h=2);
    }
    translate([0,0,-0.001])
        cylinder(d=dia-2*wall,h=height+2.002);
    translate([0,0,-0.001])
        cylinder(d=dia-wall + join_tolerance,h=2);
}

difference()
{
    union()
    {
        translate([wall*-0.5,(dia-wall-2*join_tolerance)*-0.5,2])
            cube([wall,dia-wall-2*join_tolerance,height]);
        hull()
        {
            translate([(wall*2 + profil_thick)*-0.5,(profil_width+2*wall)*-0.5,2])
                cube([wall*2 + profil_thick ,profil_width+2*wall,height]);
            translate([wall*-0.5,(profil_width+4*wall)*-0.5,2])
                cube([wall,profil_width+4*wall,height]);
        }
    }
    translate([profil_thick*-0.5,profil_width*-0.5,1.999])
        cube([profil_thick,profil_width,height+0.002]);
    translate([(profil_thick+2*wall+0.002)*-0.5,(profil_width-2*wall)*-0.5,1.999])
        cube([profil_thick+2*wall+0.002,profil_width-2*wall,height+0.002]);
}

