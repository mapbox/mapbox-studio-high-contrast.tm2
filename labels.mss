// =====================================================================
// LABELS

// ---------------------------------------------------------------------
// Languages

// There are 5 language options in the MapBox Streets vector tiles:
// - Local/default: '[name]'
// - English: '[name_en]'
// - French: '[name_fr]'
// - Spanish: '[name_es]'
// - German: '[name_de]'
@name: '[name_en]';  


// ---------------------------------------------------------------------
// Fonts

// All fontsets should have a good fallback that covers as many glyphs
// as possible. 'Arial Unicode MS Regular' and 'Arial Unicode MS Bold' 
//are recommended as final fallbacks if you have them available. 
//They support all the characters used in the MapBox Streets vector tiles.
@fallback: 'Arial Unicode MS Regular';
@serif: 'Meta Serif Offc Pro Regular', @fallback;
@serif_md: 'Meta Serif Offc Pro Medium', @fallback;
@serif_bd: 'Meta Serif Offc Pro Bold', @fallback;
@serif_it: 'Meta Serif Offc Pro Italic', @fallback;
//sans
@sans: 'Meta Offc Pro Normal', @fallback;
@sans_md: 'Meta Offc Pro Medium', @fallback;
@sans_bd: 'Meta SC Offc Pro Bold', @fallback;
@sans_bk: 'Meta SC Offc Pro Black', @fallback;
@sans_it: 'Meta SC Offc Pro Normal Italic', @fallback;
@sans_it_bd: 'Meta SC Offc Pro Bold Italic', @fallback;

/*
@sans: 'Meta Offc Pro Normal', @fallback;
@sans_bd: 'Meta Offc Pro Medium', @fallback;
@sans_ex: 'Clan Offc Pro Extd Book', @fallback;
@sans_ex_bd: 'Clan Offc Pro Extd Medium', @fallback;
@sans_news: 'Clan Offc Pro Extd News', @fallback;
@sans_news_it: 'Clan Offc Pro Narrow News Italic', @fallback;
*/

// ---------------------------------------------------------------------
// Countries

// The country labels in MapBox Streets vector tiles are placed by hand,
// optimizing the arrangement to fit as many as possible in densely-
// labeled areas.
#country_label[zoom>=3] {
  text-name: @name;
  text-face-name: @serif_bd;
  text-transform: uppercase;
  text-wrap-width: 100;
  text-wrap-before: true;
  text-fill: #000;
  text-halo-fill: #fff;//fadeout(#fff,80%);
  text-halo-radius: 1.5;
  text-halo-rasterizer: fast;
  text-line-spacing: -4;
  text-character-spacing: 0.5;
  text-size: 10;
  [zoom>=3][scalerank=1],
  [zoom>=4][scalerank=2],
  [zoom>=5][scalerank=3],
  [zoom>=6][scalerank>3] {
    text-size: 14;
  }
  [zoom>=4][scalerank=1],
  [zoom>=5][scalerank=2],
  [zoom>=6][scalerank=3],
  [zoom>=7][scalerank>3] {
    text-size: 18;
  }
}

#country_label_line {
  // Lines that connect offset labels to small
  // island & coastal countries at small scales.
  line-color: #fff;
  line-dasharray: 3,1;
}

// ---------------------------------------------------------------------
// Marine

#marine_label {
  text-name: @name;
  text-face-name: @serif_it;
  text-wrap-width: 60;
  text-wrap-before: true;
  text-fill: #000;
  text-size: 10;
  text-character-spacing: 1;
  // Some marine labels should be drawn along a line 
  // rather than on a point (the default)
  [placement='line'] {
    text-placement: line;
    text-avoid-edges: true;
  }
  // Oceans
  [labelrank=1] { 
    text-size: 18;
    text-wrap-width: 120;
    text-character-spacing:	4;
    text-line-spacing:	8;
  }
  [labelrank=2] { text-size: 14; }
  [labelrank=3] { text-size: 11; }
  [zoom>=5] {
    text-size: 12;
    [labelrank=1] { text-size: 22; }
    [labelrank=2] { text-size: 16; }
    [labelrank=3] {
      text-size: 14;
      text-character-spacing: 2;
     }
   }
}

// ---------------------------------------------------------------------
// Cities, towns, villages, etc
// City labels with dots for low zoom levels.
// The separate attachment keeps the size of the XML down.
#place_label::citydots[type='city'][zoom>=4][zoom<=7][localrank<=3] {
  // explicitly defining all the `ldir` values wer'e going
  // to use shaves a bit off the final project.xml size
  [ldir='N'],[ldir='S'],[ldir='E'],[ldir='W'],
  [ldir='NE'],[ldir='SE'],[ldir='SW'],[ldir='NW'] {
    shield-file: url('img/dot.png');
    shield-unlock-image: true;
    shield-name: @name;
    shield-size: 12;
    shield-face-name: @serif_bd;
    shield-placement: point;
    shield-fill: #333;
    shield-halo-fill: #fff;
    shield-halo-radius: 1;
    shield-halo-rasterizer: fast;
    [ldir='E'] { shield-text-dx: 5; }
    [ldir='W'] { shield-text-dx: -5; }
    [ldir='N'] { shield-text-dy: -5; }
    [ldir='S'] { shield-text-dy: 5; }
    [ldir='NE'] { shield-text-dx: 4; shield-text-dy: -4; }
    [ldir='SE'] { shield-text-dx: 4; shield-text-dy: 4; }
    [ldir='SW'] { shield-text-dx: -4; shield-text-dy: 4; }
    [ldir='NW'] { shield-text-dx: -4; shield-text-dy: -4; }
  }
}

#place_label[zoom>=8][localrank<=3] {
  text-name: @name;
  text-face-name: @serif;
  text-wrap-width: 170;
  text-wrap-before: true;
  text-fill: #333;
  text-halo-fill: #fff;
  text-halo-radius: 1.5;
  text-halo-rasterizer: fast;
  text-size: 10;
  [type='city'][zoom>=8][zoom<=15] {
  	text-face-name: @serif_md;
    text-size: 14;
   [zoom>=10] { 
      text-size: 16;
      text-wrap-width: 140;
      text-character-spacing: 0;
    }
   [zoom>=12] { 
      text-face-name: @serif_bd;
      text-size: 24;
      text-wrap-width: 200;
      text-line-spacing: -8;
      text-halo-radius: 2.5;
    }
   [zoom>=14] { 
      text-face-name: @serif_bd;
      text-size: 30;
      text-wrap-width: 250;
      text-line-spacing: -12;
      text-halo-radius: 3;
    }
    // Hide at largest scales:
    [zoom>=16] { text-name: "''"; }
  }
  [type='town'] {
    text-face-name: @serif_md;
    text-size: 14;
    [zoom>=12] { text-size: 16; }
    [zoom>=14] { text-size: 20; }
    [zoom>=16] { text-size: 24; }
    // Hide at largest scales:
    [zoom>=18] { text-name: "''"; }
  }
  [type='village'] {
    text-size: 12;
    [zoom>=12] { text-size: 14; }
    [zoom>=14] { text-size: 18; }
    [zoom>=16] { text-size: 22; }
  }
  [type='hamlet'],
  [type='suburb'],
  [type='neighbourhood'] {
    text-fill: #666;
    text-face-name:	@sans_it;
    text-transform: uppercase;
    text-character-spacing: 1;
    text-halo-radius: 2;
    text-halo-fill: #fff;//fadeout(#fff,80);
    text-avoid-edges: true;
    text-wrap-width: 100;
    text-size: 10;
    [zoom=13] {
      text-size: 10;
      text-halo-radius: 1.5;
      }
    [zoom>=14] { text-size: 12; text-halo-radius: 1.5; }
    [zoom>=15] { 
      text-size: 14; 
      text-wrap-width: 180; 
      text-character-spacing: 1; 
      text-halo-radius: 2;
    }
    [zoom>=16] { text-size: 18; text-character-spacing: 2; text-halo-radius: 2; }
  }
}


// ---------------------------------------------------------------------
// Points of interest
#poi_label[zoom=14][scalerank<=1],
#poi_label[zoom=15][scalerank<=2],
#poi_label[zoom=16][scalerank<=3],
#poi_label[zoom=17][scalerank<=4][localrank<=2],
#poi_label[zoom>=18] {
  // Separate icon and label attachments are created to ensure that
  // all icon placement happens first, then labels are placed only
  // if there is still room.
  ::icon[maki!=null] {
    // The [maki] field values match a subset of Maki icon names, so we
    // can use that in our url expression.
    // Not all POIs have a Maki icon assigned, so we limit this section
    // to those that do. See also <https://www.mapbox.com/maki/>
    marker-fill:#666;
    marker-file:url('icon/[maki]-12.svg');
  }
  ::label {
    text-name: @name;
    text-face-name: @serif_md;
    text-size: 8;
    text-fill: #666;
    text-halo-fill: fadeout(#fff, 50%);
    text-halo-radius: 1;
    text-halo-rasterizer: fast;
    text-wrap-width: 70;
    text-line-spacing:	-1.5;
    // POI labels with an icon need to be offset:
    [maki!=null] { text-dy: 8; }
  }
}


// ---------------------------------------------------------------------
// Roads
#road_label[reflen>=1][reflen<=6]::shield {
  // Motorways with a 'ref' tag that is 1-6 characters long have a
  // [ref] value for shield-style labels.
  // Custom shield png files can be created using make_shields.sh
  // in _src folder
  shield-name: [ref];
  shield-face-name: @serif_md;
  shield-fill: #000;
  shield-min-distance: 60;
  shield-min-padding: 8;  // prevents clipped shields at tile edges
  shield-size: 8;
  shield-file: url('shield/motorway_sm_[reflen].png');
  [zoom>=15] {
    shield-size: 10;
    shield-file: url('shield/motorway_lg_[reflen].png');
  }
}

#road_label {
  [class='main'][zoom>=14] {
    text-name: @name;
    text-face-name: @sans_bd;
    text-placement: line;  // text follows line path
    text-halo-fill: #fff;
    text-size: 7;
    text-character-spacing: 1;
    text-avoid-edges: true;  // prevents clipped labels at tile edges
    text-halo-radius: 1;
    text-halo-rasterizer: fast;
    text-transform: uppercase;
    text-min-distance: 100;
    text-allow-overlap: false;
    text-fill: #333;
    }
  [class='street'][zoom>=14], [class='street_limited'][zoom>=15] {
  text-name: @name;
  text-placement: line;
  text-face-name: @serif_bd;
  text-transform: uppercase;
  text-fill: #999;
  text-halo-fill: #eee;
  text-halo-radius: 0.75;
  text-halo-rasterizer: fast;
  text-size: 7;
  text-character-spacing: 1.2;
  text-avoid-edges: true;
  text-min-distance: 70;
  text-allow-overlap: false;
  [zoom>=15] { 
      text-size: 8; 
      text-halo-radius: 1;
      text-halo-fill: #fff;
      }
    }
  }


// ---------------------------------------------------------------------
// Water
#water_label {
  [zoom<=13],  // automatic area filtering @ low zooms
  [zoom>=14][area>500000],
  [zoom>=16][area>10000],
  [zoom>=17] {
    text-name: @name;
    text-face-name: @serif_it;
    text-fill: #000;
    text-size: 12;
    text-wrap-width: 100;
    text-wrap-before: true;
    text-halo-fill: #888;
    text-halo-radius: 0.5;
    text-character-spacing: 2;
  }
}


// ---------------------------------------------------------------------
// House numbers

#housenum_label[zoom>=18] {
  text-name: [house_num];
  text-face-name: @serif_it;
  text-fill: #ccc;
  text-size: 8;
  [zoom=19] { text-size: 10; }
  [zoom>=20] { text-size: 12; }
}