// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("bootstrap/dist/js/bootstrap")

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

var jQuery = require("jquery");

global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;
require("bootstrap");

$(document).ready(function() {

	$(".product-name").keyup(function() {
		let search = $(".product-name").val()
		if (search.length < 2 ) return
	  	for (const li of $('#category-suggested-list>li')) {
	  		let text = li.getElementsByClassName('keyword')[0].innerText
	  		let category = li.getElementsByClassName('category')[0].innerText
	  	  	let result = document.getElementById('category-result')

	  	  	result.innerText = 'No suggested category'
	  		if (search.toUpperCase().includes(text.toUpperCase())) {
		  	  	result.innerText = 'Category suggested: ' + category
	  			break
	  		}
  		}

	});

});