# Bootsy

*Bootsy* is a WYSIWYG solution for Rails based on [Bootstrap-wysihtml5](https://github.com/jhollingworth/bootstrap-wysihtml5) which includes image uploads via [CarrierWave](https://github.com/carrierwaveuploader/carrierwave).

## What's improved in this fork?
* Works with 'bootstrap-sass', '~> 3.1.1'
* Nivo Lightbox support, out of box
* Alignment options for the editor


## Installation
1. Follow instructions from the [official Github page](https://github.com/volmer/bootsy/)

2. Install [Nivo Lighbox](http://dev7studios.com/plugins/nivo-lightbox/) to your project

3. Add this to your application.css.scss
```css
@import "bootsy";
```

3. Add this to your main javascript file
```javascript
var ready = function() {
  $('a.nivo-image').nivoLightbox();
};

$(document).ready(ready);
$(document).on('page:load', ready);
```

## License

MIT License. Copyright 2012-2014 Volmer Soares
