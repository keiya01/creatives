# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $("#user-show-page .user-post").infinitescroll
    loading: {
      img:     "/image/Preloader_2.gif"
      msgText: ""
      finishedMsg: ""
    }
    navSelector: "nav.pagination" # selector for the paged navigation (it will be hidden)
    nextSelector: "nav.pagination a[rel=next]" # selector for the NEXT link (to page 2)
    itemSelector: ".user-show-page div.user-post" # selector for all items you'll retrieve