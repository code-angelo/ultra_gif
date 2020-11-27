class Gifs{

  List<Gif> item = List();

  Gifs();

  Gifs.fromJsonList(List<dynamic> jsonList){
    if (jsonList == null) return ;

    for (final item in jsonList){
      final gif = new Gif.fromJsonMap(item);
      item.add(gif);
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
  int isSticker;
  String importDatetime;
  String trendingDatetime;
  Images images;
  User user;
  String analyticsResponsePayload;
  Analytics analytics;

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
    this.isSticker,
    this.importDatetime,
    this.trendingDatetime,
    this.images,
    this.user,
    this.analyticsResponsePayload,
    this.analytics,
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
    isSticker                 = json['is_sticker'].cast<int>();
    importDatetime            = json['import_datetime'];
    trendingDatetime          = json['trending_datetime'];
    images                    = json['images'];
    user                      = json['user'];
    analyticsResponsePayload  = json['analytics_response_payload'];
    analytics                 = json['analytics'];
  }
}

class Analytics {
  Onclick onload;
  Onclick onclick;
  Onclick onsent;

  Analytics({
    this.onload,
    this.onclick,
    this.onsent,
  });
}

class Onclick {
  String url;

  Onclick({
    this.url,
  });
}

class Images {
  Map<String, String> original;
  The480WStill downsized;
  The480WStill downsizedLarge;
  The480WStill downsizedMedium;
  DownsizedSmall downsizedSmall;
  The480WStill downsizedStill;
  Map<String, String> fixedHeight;
  Map<String, String> fixedHeightDownsampled;
  Map<String, String> fixedHeightSmall;
  The480WStill fixedHeightSmallStill;
  The480WStill fixedHeightStill;
  Map<String, String> fixedWidth;
  Map<String, String> fixedWidthDownsampled;
  Map<String, String> fixedWidthSmall;
  The480WStill fixedWidthSmallStill;
  The480WStill fixedWidthStill;
  Map<String, String> looping;
  The480WStill originalStill;
  DownsizedSmall originalMp4;
  DownsizedSmall preview;
  The480WStill previewGif;
  The480WStill previewWebp;
  DownsizedSmall hd;
  The480WStill the480WStill;

  Images({
    this.original,
    this.downsized,
    this.downsizedLarge,
    this.downsizedMedium,
    this.downsizedSmall,
    this.downsizedStill,
    this.fixedHeight,
    this.fixedHeightDownsampled,
    this.fixedHeightSmall,
    this.fixedHeightSmallStill,
    this.fixedHeightStill,
    this.fixedWidth,
    this.fixedWidthDownsampled,
    this.fixedWidthSmall,
    this.fixedWidthSmallStill,
    this.fixedWidthStill,
    this.looping,
    this.originalStill,
    this.originalMp4,
    this.preview,
    this.previewGif,
    this.previewWebp,
    this.hd,
    this.the480WStill,
  });
}

class The480WStill {
  String height;
  String width;
  String size;
  String url;

  The480WStill({
    this.height,
    this.width,
    this.size,
    this.url,
  });
}

class DownsizedSmall {
  String height;
  String width;
  String mp4Size;
  String mp4;

  DownsizedSmall({
    this.height,
    this.width,
    this.mp4Size,
    this.mp4,
  });
}

class User {
  String avatarUrl;
  String bannerImage;
  String bannerUrl;
  String profileUrl;
  String username;
  String displayName;
  String description;
  String instagramUrl;
  String websiteUrl;
  bool isVerified;

  User({
    this.avatarUrl,
    this.bannerImage,
    this.bannerUrl,
    this.profileUrl,
    this.username,
    this.displayName,
    this.description,
    this.instagramUrl,
    this.websiteUrl,
    this.isVerified,
  });
}

class Meta {
  int status;
  String msg;
  String responseId;

  Meta({
    this.status,
    this.msg,
    this.responseId,
  });
}

class Pagination {
  int totalCount;
  int count;
  int offset;

  Pagination({
    this.totalCount,
    this.count,
    this.offset,
  });
}
