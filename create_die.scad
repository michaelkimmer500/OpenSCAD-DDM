font = "DejaVu Sans";//"Noto Emoji:style=Bold";  //"DejaVu Sans";

cube_size = 60; //60
letter_size = cube_size/3; //20
letter_height = cube_size/20; //3

//offset variable top/bottom
o = cube_size / 2 - letter_height / 2;
//offset variable sides
//os = cube_side / 2 - letter_height / 2;

module letter(l, font=font, letter_size=letter_size) {
  // Use linear_extrude() to make the letters 3D objects as they
  // are only 2D shapes when only using text()
  linear_extrude(height = letter_height) {
    text(l, size = letter_size, font = font, halign = "center", valign = "center", $fn = 16);
  }
}

//x-axis side
    //left: 0
        //rotation[90,0,270]
        //translation[-o, 0, 0]
    //right: 1
        //rotation[90,0,90]
        //translation[o, 0, 0]
//y-axis side
    //front: 2
        //rotation[90,0,0]
        //translation[0, -o, 0]
    //back: 3
        //rotation[90,0,180]
        //translation[0, o, 0]
//z-axis side:
    //top: 4
        //translate([0, 0, o])
    //bottom: 5
        //translate([0, 0, -o])

//Die Sides
s0="M2"; //magic x2
s1="A3"; //attack x3
s2="P4"; //movement x4
s3="D1"; //defense x1
s4="S4"; //summon lv 4
s5="T5"; //trap x5

args = [s0, s1, s2, s3, s4, s5];



text_dict = [
    [[90,0,270], [-o, 0, 0]],
    [[90,0,90], [o, 0, 0]],
    [[90,0,0], [0, -o, 0]],
    [[90,0,180], [0, o, 0]],
    [[0,0,0],[0, 0, o]],
    [[0,0,0],[0, 0, -o - letter_height]]
];

invert_rot_dic = [
    [0,180,0], [0,180,0],
    [0,180,0], [0,180,0],
    [0,0,180], [0,0,180]
];

cent_shft_dic = [
    [0, 0, 4.5], [0, 0, 0.5],
    [0, 0, 0.5], [0, 0, 0.5],
    [0, 0.5, 0], [0, 0.5, 0],
];

mult_shift_dic = [
    [0,-22,-22], [0,22,-22],
    [22,0,-22], [-22,0,-22],
    [22,-22,0], [22,-22,0]
];

module attack(axis=0, mult="1") {

  //swords
  translate(text_dict[axis][1])
  rotate(text_dict[axis][0])
  linear_extrude(height = letter_height) { //25
    text("\u2694", font="Noto Emoji", size = cube_size/60*25, halign = "center", valign = "center", $fn = 16);
  }
  //letter("\u2694", font="Noto Emoji", letter_size=25);
  
  //multiplier
  if (mult!="1") {
      //echo("MULT");
    scale(axis==5 ? [-1,1,1] : [1,1,1])
    translate(text_dict[axis][1] + mult_shift_dic[axis])
    rotate(text_dict[axis][0])
    linear_extrude(height = letter_height) {
        text(str("x",mult), font="Arial", size = cube_size/60*8,    valign = "center", halign = "center");
  }
  }
}

module magic(axis=0, mult="1") {
  // hexagram
  translate(text_dict[axis][1])
  rotate(text_dict[axis][0])
  linear_extrude(height = letter_height) {
    text("\u2721", font="DejaVu Sans", size = cube_size/60*35, halign = "center", valign = "center", $fn = 16);
  }
  //circle
  translate(text_dict[axis][1])
  rotate(text_dict[axis][0])
  linear_extrude(height = letter_height) {
    text("\u25EF", font="DejaVu Sans", size = cube_size/2, halign = "center", valign = "center", $fn = 16);
  }
  
  //multiplier
  if (mult!="1") {
      //echo("MULT");
    translate(text_dict[axis][1] + mult_shift_dic[axis])
    rotate(text_dict[axis][0])
    linear_extrude(height = letter_height) {
    text(str("x",mult), font="Arial", size = cube_size/60*8, valign = "center", halign = "center");
  }
  }
}



module summon(level="1", axis=0) {
  // star
  translate(text_dict[axis][1])
  rotate(text_dict[axis][0])
  linear_extrude(height = letter_height) {
    text("\u2606", font="DejaVu Sans", size = cube_size/60*50, halign = "center", valign = "center", $fn = 16);
  }

  //number
  translate(text_dict[axis][1])
  scale(axis==5 ? [-1,1,1] : [1,1,1])
  rotate(text_dict[axis][0])
  linear_extrude(height = letter_height) {
    text(level, font="Arial", size = cube_size/5, halign = "center", valign = "center", $fn = 16);
  }
}


module movement(axis=0, mult="1") {

  //arrow
  translate(text_dict[axis][1])
  rotate(text_dict[axis][0])
  linear_extrude(height = letter_height) {
    text("\u21E7", font="Arial Unicode MS", size = cube_size/3*2, halign = "center", valign = "center", $fn = 16);
  }
  //letter("\u2694", font="Noto Emoji", letter_size=25);
  
  //multiplier
  if (mult!="1") {
      //echo("MULT");
    scale(axis==5 ? [-1,1,1] : [1,1,1])
    translate(text_dict[axis][1] + mult_shift_dic[axis])
    rotate(text_dict[axis][0])
    linear_extrude(height = letter_height) {
        text(str("x",mult), font="Arial", size = cube_size/60*8,    valign = "center", halign = "center");
  }
  }
}

module defense(axis=0, mult="1") {

  //arrow
  translate(text_dict[axis][1])
  rotate(text_dict[axis][0])
  linear_extrude(height = letter_height) {
    text("\u2756", font="DejaVu Sans", size = cube_size/4*3, halign = "center", valign = "center", $fn = 16);
  }
  //letter("\u2694", font="Noto Emoji", letter_size=25);
  
  //multiplier
  if (mult!="1") {
      //echo("MULT");
    scale(axis==5 ? [-1,1,1] : [1,1,1])
    translate(text_dict[axis][1] + mult_shift_dic[axis])
    rotate(text_dict[axis][0])
    linear_extrude(height = letter_height) {
        text(str("x",mult), font="Arial", size = cube_size/60*8,    valign = "center", halign = "center");
  }
  }
}

module trap(axis=0, mult="1") {

  //circle
  translate(text_dict[axis][1])
  rotate(text_dict[axis][0])
  linear_extrude(height = letter_height) {
    text("\u25EF", font="DejaVu Sans", size = cube_size/2, halign = "center", valign = "center", $fn = 16);
  }
  
  //bowtie
  translate(text_dict[axis][1])
  rotate(text_dict[axis][0])
  scale([1,0.4,1])
  linear_extrude(height = letter_height) {
    text("\u29D3", font="DejaVu Sans", size = cube_size/60*35, halign = "center", valign = "center", $fn = 16);
  }
  
  //X
  translate(text_dict[axis][1])
  rotate(text_dict[axis][0])
  linear_extrude(height = letter_height) {
    text("X", font="DejaVu Sans", size = cube_size/60*32, halign = "center", valign = "center", $fn = 16);
  }  
  
  //letter("\u2694", font="Noto Emoji", letter_size=25);
  
  //multiplier
  if (mult!="1") {
      //echo("MULT");
    scale(axis==5 ? [-1,1,1] : [1,1,1])
    translate(text_dict[axis][1] + mult_shift_dic[axis])
    rotate(text_dict[axis][0])
    linear_extrude(height = letter_height) {
        text(str("x",mult), font="Arial", size = cube_size/60*8,    valign = "center", halign = "center");
  }
  }
}



difference() {
  union() {
    color("gray") cube(cube_size, center = true);
  }
  //translate([0, -o, 0]) rotate([90, 0, 0]) letter("\u2756");
  //translate([o, 0, 0]) rotate([90, 0, 90]) letter("U");
  //translate([0, o, 0]) rotate([90, 0, 180]) letter("B");
  for (i= [0 : len(args)-1]) {
      arg=args[i];
      crest_type=arg[0];
      val=arg[1];
      if (crest_type=="A") {
          attack(axis=i, mult=val);
      }
      else if (crest_type=="M") {
          magic(axis=i, mult=val);
      }
      else if (crest_type=="S") {
          summon(val, axis=i);
      }
      else if (crest_type=="P") {
          movement(axis=i, mult=val);
      }
      else if (crest_type=="D") {
          defense(axis=i, mult=val);
      }
      else if (crest_type=="T") {
          trap(axis=i, mult=val);
      }
      else {
          echo("ERROR: INVALID CREST TYPE SPECIFIED");
          exit();
      }
  }
  
  //summon
  //summon("4", axis=0);
  //summon("4", axis=4);
  
  //magic crest
  //magic(axis=0, mult="2");
  
  //attack crest
  //attack(axis=1, mult="2");
  //attack(axis=3, mult="2");
  //attack(axis=4, mult="2");
  //attack(axis=5, mult="3");
  
  //movement
  //movement(axis=2, mult="4");
  
  //defense
  //defense(axis=3, mult="4");
  
  //trap
  //trap(axis=5, mult="3");
  
  //translate([-o, 0, 0]) rotate([90, 0, 270]) letter("\u2721");
  // Put some symbols on top and bottom using symbols from the
  // Unicode symbols table.
  // (see https://en.wikipedia.org/wiki/Miscellaneous_Symbols)
  //
  // Note that depending on the font used, not all the symbols
  // are actually available.
  //translate([0, 0, o]) letter("\u2694", font="Noto Emoji", letter_size=25);
  
  //bottom
  //translate([0, 0, -o - letter_height])
  //scale([-1,1,1])
  //letter("3", font="DejaVu Sans");
}
// star: letter("\u2606", font="DejaVu Sans", letter_size=50)
//swords: letter("\u2694", font="Noto Emoji", letter_size=25);
//shield

// Fonts:
// https://fonts.google.com/noto/specimen/Noto+Emoji
