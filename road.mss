// Basic color palette, from which variations will be derived.
// ---------------------------------------------------------------------
// Common Colors
@water: #fff;
@land: #fff;

@fill1: #fff;
@fill2: #bbb;
@fill3: #777;
@fill4: #000;

@motorway:           @fill4;
@motorway_case:      @fill1;
@main:              @motorway;
@main_case:          @fill1;
@street:            #888;
@street_case:        @fill1;
@service:		    #ccc;
@service_case:	     #ccc;
@path:			    #fff;
@path_case:		    #ededed;
@rail: 			    #444;
@aeroway: 		    #eee;

// ---------------------------------------------------------------------
// Roads are split across 3 layers: #road, #bridge, and #tunnel. Each
// road segment will only exist in one of the three layers. The
// #bridge layer makes use of Mapnik's group-by rendering mode;
// attachments in this layer will be grouped by layer for appropriate
// rendering of multi-level overpasses.

// The main road style is for all 3 road layers and divided into 2 main
// attachments. The 'case' attachment is 

#road, #bridge, #tunnel {
  // casing/outlines & single lines
  ::case[zoom>=6]['mapnik::geometry_type'=2] {
    [class='service'][zoom>=16], {
      line-color: @fill3;
      line-join:round;
      #road, #bridge { line-cap: round; }
      [zoom>=16] { line-width: 8; }
    }
    [class='motorway'] {
      line-join:round;
      line-color: @motorway_case;
      #road { line-cap: round; }
      #tunnel { line-dasharray:3,2; }
      [zoom>=6]  { line-width:0.4; }
      [zoom>=7]  { line-width:0.6; }
      [zoom>=8] { line-width:1.5; }
      [zoom>=9] { line-width: 1.75; }
      [zoom>=10]  { line-width:2; }
      [zoom>=13] { line-width:3.5;  }
      [zoom>=14] { line-width:5; }
      [zoom>=15] { line-width:7; }
      [zoom>=16] { line-width:9; }
    }
    [class='motorway_link'][zoom>=13] {
      line-join:round;
      line-color: @motorway_case;
      #road { line-cap: round; }
      #tunnel { line-dasharray:3,2; }
      [zoom>=13] { line-width:1; }
      [zoom>=14] { line-width:3; }
      [zoom>=15] { line-width:5; }
      [zoom>=16] { line-width:6.5; }
    }
    [class='main'] {
      line-join:round;
      line-color: @main_case;
      #road { line-cap: round; }
      #tunnel { line-dasharray:3,2; }
      [zoom=7] { line-width: 0; }
      [zoom>=12] { line-width: 0; }
      [zoom=13] { line-width:2.5; }
      [zoom=14] { line-width:4; }
      [zoom=15] { line-width:5; }
      [zoom>=16] { line-width:8; }
    }
    [class='street'][zoom>=12],[class='street_limited'][zoom>=12] {
      line-join:round;
      #road { line-cap: round; }
      #tunnel { line-dasharray:3,2; }
      line-color: @motorway;
      [zoom=7] { line-width: 0; }
      [zoom=12] { line-width: 0; }
      [zoom=13] { line-width: 0; }
      [zoom=14] { line-width: 0; }
      [zoom>=15] { line-width: 5; line-color: @fill3; }
      [zoom>=16] { line-width: 10; }
    } 
  }
  
  // fill/inlines
  ::fill[zoom>=4]['mapnik::geometry_type'=2] {
    [class='service'][zoom>=16], {
      line-color: @service;
      line-join:round;
      #road, #bridge { line-cap: round; }
      [zoom>=16] { line-width: 7; line-color: @fill1; }
    }
    [class='street_limited'][zoom>=15], {
      line-color: @street;
      line-join:round;
      #road, #bridge { line-cap: round; }
      [zoom>=15] { line-width: 3.5; line-color: @fill1; }
      [zoom>=16] { line-width: 9; line-color: @fill1; }
    }
    [class='motorway'][zoom>=5] {
      line-join:round;
      #road, #bridge { line-cap:round; }
      line-color: @motorway;
      #tunnel { line-color:lighten(@motorway,4); }
      [zoom=5] { line-color:lighten(@motorway,50); line-width:0.5;}
      [zoom=6] { line-width:0.5;}
      [zoom>=8] { line-width:0.75; }
      [zoom>=10] { line-width:1; }
      [zoom>=13] { line-width:2; }
      [zoom>=14] { line-width:3.5; }
      [zoom>=15] { line-width:5; }
      [zoom>=16] { line-width:7; }
    }
    [class='motorway_link'][zoom>=14] {
      line-join:round;
      #road, #bridge { line-cap: round; }
      line-color: @motorway;
      #tunnel {  line-color:lighten(@motorway,4); }
      [zoom>=14] { line-width:1.5; }
      [zoom>=15] { line-width:3; }
      [zoom>=16] { line-width:4.5; }
    }
    [class='main'][zoom>=6] {
      line-join:round;
      #road, #bridge { line-cap: round; }
      line-color: @fill4;
      #tunnel { line-color:lighten(@main,25); }
      [zoom=6] { line-width: 0.5; }
      [zoom>=7] { line-width: 0.25; }
      [zoom>=9] { line-width: 0.5; }
      [zoom>=11] { line-width: 0.75; }
      [zoom=12] { line-width: 0.75; }
      [zoom=13] { line-width: 1.5; }
      [zoom=14] { line-width: 3; }
      [zoom=15] { line-width: 4.5; }
      [zoom>=16] { line-width: 8; }
    }
    [class='street'][zoom>=12], {
      line-color: @fill2;
      line-join:round;
      #road, #bridge { line-cap: round; }
      [zoom=12] { line-width: 0.5; line-color: @fill1; }
      [zoom>=14] { line-width: 1.5; }
      [zoom=15] { line-width: 3.5; line-color: @fill1; }
      [zoom>=16] { line-width: 9; line-color: @fill1; }
    }
    [class='major_rail'] {
      line-width: 0.4;
      line-color: @rail;
      [zoom>=16] {
        line-width: 0.75;
      	// Hatching
      	h/line-width: 3;
      	h/line-color: @rail;
      	h/line-dasharray: 1,31;
      }
    }
  }
}
