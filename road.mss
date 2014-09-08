// Basic color palette, from which variations will be derived.
@motorway:          #000;
@motorway_case:      @land;
@main:              @motorway;
@main_case:          @land;
@street:            #888;
@street_case:        @land;
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
      [zoom>=6] { line-width:0.2; }
      [zoom>=7] { line-width:0.4; }
      [zoom>=8] { line-width:0.75; }
      [zoom>=9] { line-width: 1; }
      [zoom>=10] { line-width:1.5; }
      [zoom>=12] { line-width:2; }
      [zoom>=13] { line-width:2.5; }
      [zoom>=14] { line-width:4; }
      [zoom>=15] { line-width:5; }
      [zoom>=16] { line-width:8; }
    }
    [class='street'][zoom>=12],[class='street_limited'][zoom>=12] {
      line-join:round;
      #road { line-cap: round; }
      #tunnel { line-dasharray:3,2; }
      line-color: #444;
      [zoom=12] { line-width: 1; }
      [zoom=13] { line-width: 1.5; }
      [zoom=14] { line-width: 2; }
      [zoom>=15] { line-width: 3.5; line-color: #666;}
      [zoom>=16] { line-width:6.5; }
    }
  }
  
  // fill/inlines
  ::fill[zoom>=6]['mapnik::geometry_type'=2] {
    [class='motorway'][zoom>=8] {
      line-join:round;
      #road, #bridge { line-cap:round; }
      line-color: @motorway;
      #tunnel { line-color:lighten(@motorway,4); }
      [zoom>=8] { line-width:0.5;}
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
    [class='main'][zoom>=8] {
      line-join:round;
      #road, #bridge { line-cap: round; }
      line-color: lighten(@main,10);
      #tunnel { line-color:lighten(@main,15); }
      [zoom>=7] { line-width:0.5; }
      [zoom>=10] { line-width: 0.5; }
      [zoom>=13] { line-width:1.5; }
      [zoom>=14] { line-width:2.5; }
      [zoom>=15] { line-width:3.5; }
      [zoom>=16] { line-width:6; }
    }
    [class='street'][zoom>=12], {
      line-color: #fff;
      line-join:round;
      #road, #bridge { line-cap: round; }
      [zoom=12] { line-width: 0.5; line-color: #fff; }
      [zoom>=13] { line-width: .75; }
      [zoom>=14] { line-width: 1.75; }
      [zoom>=16] { line-width: 4; }
    }
    [class='street_limited'][zoom>=15], {
      line-color: @street;
      line-join:round;
      #road, #bridge { line-cap: round; }
      [zoom>=15] { line-width:2.5; line-color:#eee; }
      [zoom>=16] { line-width:4; }
    }
    [class='service'][zoom>=16], {
      line-color: @service;
      line-join:round;
      #road, #bridge { line-cap: round; }
      [zoom>=16] { line-width:2; line-color:#fff; }
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
