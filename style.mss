// ---------------------------------------------------------------------
// Common Colors
@water: #fff;
@land: #fff;

@fill1: #fff;
@fill2: #bbb;
@fill3: #777;
@fill4: #000;

Map {
  background-color: @land;
}

// ---------------------------------------------------------------------
// Political boundaries
#admin {
	line-width: 0.2;
	line-color: @fill4;
  [maritime=1] {
    // downplay boundaries that are over water
    line-color: @water;
  }
  // Countries
  [admin_level=2] {
    line-width: 0.8;
    line-cap: round;
    [zoom>=4] { line-width: 1.2; }
    [zoom>=6] { line-width: 2; }
    [zoom>=8] { line-width: 4; }
    [disputed=1] { line-dasharray: 4,4; }
  }
  // States / Provices / Subregions
  [admin_level>=3] {
	line-width: 0.2;
	line-color: @fill4;
    [zoom=6] { line-width: 0.6; }
    [zoom=7] { 
      line-width: 1.5;
	  line-color: @fill3;
	  line-dasharray: 1,5;
	  line-cap: round;
    }
    [zoom>=8] {
	line-width: 2;
	line-color: @fill3;
	line-dasharray: 1,5;
	line-cap: round;
    }
    [zoom>=12] { line-width: 2; }
  }
}

// ---------------------------------------------------------------------
// Water Features 
#water {
  polygon-fill: @fill2;
  polygon-pattern-file: url('img/patterns/halftone2.png');
  polygon-pattern-alignment: global;
  polygon-pattern-opacity: 0.15;
  polygon-pattern-gamma: 1;
  // Map tiles are 256 pixels by 256 pixels wide, so the height 
  // and width of tiling pattern images must be factors of 256. 
  //polygon-pattern-file: url(pattern/wave.png);
  [zoom<=5] {
    // Below zoom level 5 we use Natural Earth data for water,
    // which has more obvious seams that need to be hidden.
    polygon-gamma: 0.4;
  }
  ::blur {
    // This attachment creates a shadow effect by creating a
    // light overlay that is offset slightly south. It also
    // create a slight highlight of the land along the
    // southern edge of any water body.
    polygon-fill: @fill3;
    polygon-opacity: 0.25;
    comp-op: soft-light;
    image-filters: agg-stack-blur(2,2);
    polygon-geometry-transform: translate(0,1);
    polygon-clip: false;
  }
}

#waterway {
  line-color: @water * 0.9;
  line-cap: round;
  line-width: 0.5;
  [class='river'] {
    [zoom>=12] { line-width: 1; }
    [zoom>=14] { line-width: 2; }
    [zoom>=16] { line-width: 3; }
  }
  [class='stream'],
  [class='stream_intermittent'],
  [class='canal'] {
    [zoom>=14] { line-width: 1; }
    [zoom>=16] { line-width: 2; }
    [zoom>=18] { line-width: 3; }
  }
  [class='stream_intermittent'] { line-dasharray: 6,2,2,2; }
}


// ---------------------------------------------------------------------
// Aeroways 
#aeroway[zoom>=12] {
  ['mapnik::geometry_type'=2] {
    line-color: @land * 0.96;
    [type='runway'] { line-width: 5; }    
    [type='taxiway'] {  
      line-width: 1;
      [zoom>=15] { line-width: 2; }
    }
  }    
  ['mapnik::geometry_type'=3] {
    polygon-fill: @land * 0.96;
    [type='apron'] {
      polygon-fill: @land * 0.98;  
    }  
  }
}

// ---------------------------------------------------------------------
// Landuse areas 
#landuse[zoom>=11] {
  [class='park'], [class='cemetery'] { 
    polygon-fill: @fill2;
    polygon-opacity: 0.45;
  }
  [class='hospital'][zoom>13],[class='school'][zoom>13] { 
    polygon-fill: @fill2;
    polygon-opacity: 0.3;
  }
  [class='wood'] { 
    polygon-fill: @fill2;
    polygon-opacity: 0.6;  }
    ::overlay {
    opacity: 0.05;
    }
}


// ---------------------------------------------------------------------
// Terrain //
#hillshade {
  ::0[zoom<=13][zoom>2],
  ::1[zoom=14][zoom>2],
  ::2[zoom>=15][zoom<=16],
  ::3[zoom>=17][zoom<=18],
  ::4[zoom>=19] {
    comp-op: hard-light;
    polygon-clip: false;
    polygon-simplify: 7;
    [class='shadow'] {
      polygon-fill: @fill4;
      polygon-opacity: 0.06;
      [zoom>=15][zoom<=16] { polygon-opacity: 0.05; }
      [zoom>=17][zoom<=18] { polygon-opacity: 0.03; }
      [zoom>=18] { polygon-opacity: 0.0045; }
      }
    [class='highlight'] {
      polygon-fill: @fill1;
      polygon-opacity: 0.12;
      polygon-gamma: 50;
      [zoom>=15][zoom<=16] { polygon-opacity: 0.09; }
      [zoom>=17][zoom<=18] { polygon-opacity: 0.06; }
      [zoom>=18] { polygon-opacity: 0.03; }
      }
    ::1 { image-filters: agg-stack-blur(2,2); }
    ::2 { image-filters: agg-stack-blur(8,8); }
    ::3 { image-filters: agg-stack-blur(16,16); }
    ::4 { image-filters: agg-stack-blur(32,32); }
    }
  }

  
  
#landuse[class='pitch'],
#landuse[class='sand'] { 
  polygon-fill: mix(@land,@fill4,90);
}

#landuse[class='hospital'],
#landuse[class='industrial'],
#landuse[class='school'] { 
  polygon-fill: mix(@land,@fill1,95);
}


// ==================================================================
// CONTOURS
// ================================================================== 

#contour {
  line-color: @fill2;
  line-opacity: 0.75;
  }

#contour.label {
    text-name: "[ele]+' m'";
    text-face-name: @sans;
    text-placement: line;
    text-size: 9;
    text-fill: darken(@land,50);
    text-avoid-edges: true;
    text-halo-fill: @land;
    text-halo-radius: 1.5;
    text-halo-rasterizer: fast;
}



// ---------------------------------------------------------------------
// Buildings 

#building {
  [zoom>=14] {
  line-width: 0.5; 
  line-color: @fill3;
  }
  [zoom>=16] {
	line-width: 0.5; 
	polygon-pattern-file: url('img/patterns/stripe_sm.png');
    polygon-pattern-opacity: 0.2;
  }
  ::overlay {
    opacity: 0.05;
    }
  }

/**/