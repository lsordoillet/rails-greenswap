// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports
import { initMapbox } from '../plugins/init_mapbox';

// Star Rating
import { initStarRating } from '../plugins/init_star_rating';


// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { initCustomCheck } from '../components/custom_check';
import { initChatroomCable } from '../channels/chatroom_channel';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initStarRating();
  initCustomCheck();
  if (document.querySelector('.show-map') != undefined){
    initMapbox();
  };
  initChatroomCable();
});


if (document.querySelector('.event-dispatcher') != undefined) {
  document.querySelector('.event-dispatcher').addEventListener('click', () => {
    document.dispatchEvent(new Event('initMap'));
  });

  document.addEventListener('initMap', () => {
    setTimeout(function(){
      initMapbox();
    }, 500);
  })
}

if ( document.getElementById("listing_listing_type_sell") != undefined) {
  document.getElementById("listing_listing_type_sell").addEventListener('click', () => {
  document.getElementById("listing_price").disabled = false;
});
}

if ( document.getElementById("listing_listing_type_giveaway") != undefined) {
  document.getElementById("listing_listing_type_giveaway").addEventListener('click', () => {
  document.getElementById("listing_price").disabled = true;
});
}

if ( document.getElementById("listing_listing_type_swap") != undefined) {
  document.getElementById("listing_listing_type_swap").addEventListener('click', () => {
  document.getElementById("listing_price").disabled = true;
});
}

import "controllers"
