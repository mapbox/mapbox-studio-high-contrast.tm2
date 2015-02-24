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
@sans_bd: 'Meta Offc Pro Bold', @fallback;
@sans_bk: 'Meta Offc Pro Black', @fallback;
@sans_it: 'Meta Offc Pro Normal Italic', @fallback;
@sans_it_md: 'Meta Offc Pro Medium Italic', @fallback;
@sans_it_bd: 'Meta Offc Pro Bold Italic', @fallback;

// ---------------------------------------------------------------------
// Countries

// The country labels in MapBox Streets vector tiles are placed by hand,
// optimizing the arrangement to fit as many as possible in densely-
// labeled areas.
#country_label[zoom>=2] {
  text-name: @name;
  text-face-name: @serif_bd;
  text-transform: uppercase;
  text-wrap-width: 100;
  text-wrap-before: true;
  text-fill: #000;
  text-halo-fill: #fff;
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
    text-size: 24;
  }
}

// =====================================================================
// 1__ OCEAN & MARINE LABELS
// =====================================================================

#marine_label[zoom>=2]["mapnik::geometry_type"=1],
#marine_label[zoom>=2]["mapnik::geometry_type"=2] {
  text-name: @name;
  text-face-name: @serif_it;
  text-wrap-width: 60;
  text-wrap-before: true;
  text-fill: #000;
  text-size: 10;
  text-character-spacing: 1;
  ["mapnik::geometry_type"=1] {
    text-placement: point;
    text-wrap-width: 30;
  }
  ["mapnik::geometry_type"=2] {
    text-placement: line;
  }
  [labelrank=1][zoom>=2],
  [labelrank=2][zoom>=3],
  [labelrank=3][zoom>=4],
  [labelrank=4][zoom>=5],
  [labelrank=5][zoom>=6],
  [labelrank=6][zoom>=7] {
    text-size: 11;
    text-character-spacing: 1;
  }
  [labelrank=1][zoom>=3],
  [labelrank=2][zoom>=4],
  [labelrank=3][zoom>=5],
  [labelrank=4][zoom>=6],
  [labelrank=5][zoom>=7],
  [labelrank=6][zoom>=8] {
    text-size: 14;
    text-character-spacing: 2;
  }
  [labelrank=1][zoom>=4],
  [labelrank=2][zoom>=5],
  [labelrank=3][zoom>=6] {
    text-size: 16;
    text-character-spacing: 4;
  }
  [labelrank=1][zoom>=5],
  [labelrank=2][zoom>=6],
  [labelrank=3][zoom>=7] {
    text-size: 18;
    text-character-spacing: 8;
  }
}

// ---------------------------------------------------------------------
// Cities, towns, villages, etc
// City labels with dots for low zoom levels.
// The separate attachment keeps the size of the XML down.
#place_label::citydots[type='city'][zoom>=4][zoom<=7][localrank<=1] {
  // explicitly defining all the `ldir` values wer'e going
  // to use shaves a bit off the final project.xml size
  [ldir='N'],[ldir='S'],[ldir='E'],[ldir='W'],
  [ldir='NE'],[ldir='SE'],[ldir='SW'],[ldir='NW'] {
    shield-file: url('img/dot-8.svg');
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
    [zoom=5]{
      shield-size: 14;
      }
    [zoom=6]{
      shield-size: 15;
      }
    [zoom=7]{
      shield-size: 16;
      }
  }
}

#place_label[zoom>=8][localrank<=1] {
  text-name: @name;
  text-face-name: @serif;
  text-wrap-width: 170;
  text-wrap-before: true;
  text-fill: #333;
  text-halo-fill: #fff;
  text-halo-radius: 1.5;
  text-halo-rasterizer: fast;
  text-size: 10;
  [type='city'][zoom>=8][zoom<=22] {
  	text-face-name: @serif_md;
    text-size: 16;
    text-fill: #555;
   [zoom=8] { 
      text-fill: #000;
      text-face-name: @serif_bd;
      text-size: 18;
      text-wrap-width: 140;
      text-character-spacing: 0;
      text-halo-radius: 2;
    }
   [zoom=9] { 
      text-fill: #000;
      text-face-name: @serif_bd;
      text-size: 18;
      text-wrap-width: 160;
      text-character-spacing: 0;
      text-halo-radius: 2;
    }
   [zoom=10] { 
      text-fill: #000;
      text-face-name: @serif_bd;
      text-size: 16;
      text-wrap-width: 140;
      text-character-spacing: 0;
      text-halo-radius: 2;
    }
   [zoom=11] { 
      text-fill: #000;
      text-face-name: @serif_bd;
      text-size: 18;
      text-wrap-width: 140;
      text-character-spacing: 0;
      text-halo-radius: 2;
    }
   [zoom>=12] { 
      text-fill: #000;
      text-face-name: @serif_bd;
      text-size: 22;
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
    [zoom>=14] { text-size: 14; }
    [zoom>=16] { text-size: 18; }
  }
  [type='hamlet'],
  [type='suburb'],
  [type='neighbourhood'] {
    text-fill: #666;
    text-face-name:	@sans_it;
    text-transform: uppercase;
    text-character-spacing: 1;
    text-halo-radius: 2;
    text-halo-fill: fadeout(#fff,50);
    text-avoid-edges: true;
    text-wrap-width: 140;
    text-size: 10;
    text-allow-overlap: false;
    [zoom=13] {
      text-size: 11;
      text-halo-radius: 2;
      text-fill: #000;
      text-face-name:	@sans_it_md;
      text-line-spacing: -4;
      }
    [zoom=14] { 
      text-size: 14; 
      text-halo-radius: 2; 
      text-fill: #000;
      text-line-spacing: -4;
      text-face-name: @sans_it_md;
      text-wrap-width: 180;
    }
    [zoom>=15] { 
      text-size: 18; 
      text-wrap-width: 180; 
      text-character-spacing: 1; 
      text-halo-radius: 2.5;
      text-fill: #000;
      text-line-spacing: -5;
      text-halo-fill: fadeout(#fff,30);
      text-face-name: @sans_it_md;
    }
    [zoom>=16] { 
      text-size: 18; 
      text-character-spacing: 2; 
      text-halo-radius: 2; 
      text-fill: #000;
    }
  }
}

/**/
// ---------------------------------------------------------------------
// Points of interest
#poi_label[maki=''] { opacity:1; } // hack for mapnik#1952

#poi_label[maki='park'][scalerank<=2],
#poi_label[maki='airport'][scalerank<=2],
#poi_label[maki='airfield'][scalerank<=2],
#poi_label[maki='rail'][scalerank<=2],
#poi_label[maki='school'][scalerank<=2],
#poi_label[scalerank='hospital'][scalerank<=2] { 
    text-name: @name;
    text-face-name: @serif_bd;
    text-size: 9;
    text-fill: #333;
    text-halo-fill: fadeout(#fff, 30%);
    text-halo-radius: 1;
    text-halo-rasterizer: fast;
    text-min-distance: 50;
    text-wrap-width: 60;
    text-line-spacing:	-2;
    text-allow-overlap: false;
    // POI labels with an icon need to be offset:
    [maki!=null] { text-dy: 8; }
    [zoom>=13] {
      text-size: 10;
      text-line-spacing: -2;
      }
    [zoom=15] {
      text-size: 12;
      text-line-spacing: -2;
      text-fill: #444;
      }
    [zoom>=16] {
      text-size: 14;
      text-line-spacing: -2;
      }
    [zoom>=17] {
      text-size: 16;
      text-line-spacing: -2;
  }
}

// ---------------------------------------------------------------------
// Roads

// highway shield
#road_label::shield-pt[class='motorway'][zoom>=7][zoom<=10][localrank=1][reflen<=6],
#road_label::shield-pt[class='motorway'][zoom>=9][zoom<=10][localrank=1][reflen<=6],
#road_label::shield-ln[zoom>=11][reflen<=6] {
  shield-name: "[ref].replace('·', '\n')";
  shield-size: 9;
  shield-line-spacing: -4;
  shield-file: url('img/shield/[shield]-[reflen].svg');
  shield-face-name: @sans_md;
  shield-fill: #333;
  shield-character-spacing: -1;
  [zoom>=14] {
    shield-transform: scale(1.25,1.25);
    shield-size: 10.5;
  }
}
#road_label::shield-pt[class='motorway'][zoom>=7][zoom<=10][localrank=1][reflen<=6],
#road_label::shield-pt[class='motorway'][zoom>=9][zoom<=10][localrank=1][reflen<=6] {
  shield-placement: point;
  shield-avoid-edges: false;
}
#road_label::shield-ln[zoom>=11][reflen<=6] {
  shield-placement: line;
  shield-spacing: 400;
  shield-min-distance: 40;
  shield-avoid-edges: true;
  [zoom>=14] {
    shield-min-distance: 100;
  }
}

#road_label {
  [class='main'][zoom>=14] {
    text-name: @name;
    text-face-name: @sans_bd;
    text-placement: line;  // text follows line path
    text-halo-fill: #666;
    text-size: 10;
    text-character-spacing: 1;
    text-avoid-edges: true;  // prevents clipped labels at tile edges
    text-halo-radius: 1;
    text-halo-rasterizer: fast;
    text-transform: uppercase;
    text-min-distance: 100;
    //text-allow-overlap: false;
    text-fill: #333;
    text-min-padding: 5;
    [zoom=14] { 
      text-size: 10;
      text-halo-radius: 1.5;
      text-fill: #fff;
      text-halo-fill: #444;
      }
    [zoom=15] { 
      text-size: 12;
      text-halo-radius: 1;
      text-fill: #fff;
      text-halo-fill: #444;
      }
    [zoom=16] { 
      text-size: 13;      
      text-halo-radius: 1.5;
      text-halo-fill: #333;
      text-fill: #fff;
      }
     [zoom>=17] { 
      text-size: 13;      
      text-halo-radius: 1;
      text-halo-fill: #333;
      text-fill: #fff;
      }
    }
  [class='street'][zoom>=15], [class='street_limited'][zoom>=15] {
  text-name: @name;
  text-placement: line;
  text-face-name: @sans_bd;
  text-transform: uppercase;
  text-fill: #444;
  text-halo-fill: #eee;
  text-halo-radius: 0.75;
  text-halo-rasterizer: fast;
  text-size: 8;
  text-character-spacing: 1.2;
  text-avoid-edges: true;
  text-min-distance: 70;
  text-allow-overlap: false;
  [zoom>=15] { 
      text-size: 10; 
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