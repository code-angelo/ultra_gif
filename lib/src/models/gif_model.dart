class Gifs{

  List<Gif> items = List();

  Gifs();

  Gifs.fromJsonList(List<dynamic> jsonList){
    if (jsonList == null) return ;

    for (final item in jsonList){
      final gif = new Gif.fromJsonMap(item);
      items.add(gif);
    }
  }
}

class Gif {
  String type;
  String id;
  String url;
  String slug;
  String bitlyGifUrl;
  String bitlyUrl;
  String embedUrl;
  String username;
  String source;
  String title;
  String rating;
  String contentUrl;
  String sourceTld;
  String sourcePostUrl;
  String importDatetime;
  String trendingDatetime;
  Images images;

  Gif({
    this.type,
    this.id,
    this.url,
    this.slug,
    this.bitlyGifUrl,
    this.bitlyUrl,
    this.embedUrl,
    this.username,
    this.source,
    this.title,
    this.rating,
    this.contentUrl,
    this.sourceTld,
    this.sourcePostUrl,
    this.importDatetime,
    this.trendingDatetime,
    this.images,
  });

  Gif.fromJsonMap(Map<String, dynamic> json){
    type                      = json['type'];
    id                        = json['id'];
    url                       = json['url'];
    slug                      = json['slug'];
    bitlyGifUrl               = json['bitly_gif_url'];
    bitlyUrl                  = json['bitly_url'];
    embedUrl                  = json['embed_url'];
    username                  = json['username'];
    source                    = json['source'];
    title                     = json['title'];
    rating                    = json['rating'];
    contentUrl                = json['content_url'];
    sourceTld                 = json['source_tld'];
    sourcePostUrl             = json['source_post_url'];
    importDatetime            = json['import_datetime'];
    trendingDatetime          = json['trending_datetime'];
    images                    = Images.fromJsonMap(json['images']);
  }
}

class Images {
  Original original;
  FixedHeight fixedHeight;
  
  Images({
    this.original,
    this.fixedHeight
  });

  Images.fromJsonMap(Map<String, dynamic> json){
    original  = Original.fromJsonMap(json['original']);
    fixedHeight  = FixedHeight.fromJsonMap(json['fixed_height']);
  }
}
  
class Original {
  String imageUrl;
  String height;
  String width;

  Original({
    this.imageUrl,
    this.height,
    this.width
  });

  Original.fromJsonMap(Map<String, dynamic> json){
    imageUrl  = json['url'];
    height    = json['height'] ;
    width    = json['width'] ;
  }
}

class FixedHeight {
  String imageUrl;
  String height;
  String width;

  FixedHeight({
    this.imageUrl,
    this.height,
    this.width
  });

  FixedHeight.fromJsonMap(Map<String, dynamic> json){
    imageUrl  = json['url'];
    height    = json['height'] ;
    width    = json['width'] ;
  }
}
