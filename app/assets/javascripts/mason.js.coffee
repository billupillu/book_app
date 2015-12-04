jQuery ->
  $('.books').imagesLoaded ->
    $('.books').masonry itemSelector: ".box"
