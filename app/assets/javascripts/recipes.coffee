$(document).ready ->
  recipeBox()

recipeBox = ->
  $("a").attr("data-turbolinks", "false")
  if $("p.notice").text() == "" then $("p.notice").hide()
  if $("p.alert").text() == "" then $("p.alert").hide()
  #$(".recipe-description").hide()
  descriptions = $(".recipe-description")
  animation_speed = 300
  #limit the length of the description of each box to 75 characters
  limitLengthAll(descriptions, 100)

  $(".thumbnail").on("mouseenter", ->
    #slide description up unless text is empty
    unless $(this).find('.recipe-description').text() == ""
      $(this).find(".recipe-description").addClass("slide", animation_speed)
      $(this).find(".title").addClass("slide", animation_speed)
      $(this).find(".caption").addClass("slide", animation_speed)
      #$(this).find(".recipe-description").slideDown(250)
    )
  $(".thumbnail").on("mouseleave", ->
    #slide description down unless text is empty
    unless $(this).find('.recipe-description').text() == ""
      $(this).find(".recipe-description").removeClass("slide", animation_speed)
      $(this).find(".title").removeClass("slide", animation_speed)
      $(this).find(".caption").removeClass("slide", animation_speed)
      #$(this).find(".recipe-description").slideUp(250)
    )

limitStrLength = (str, stop) ->
  length = str.length
  slicedStr = str.slice(0, stop)
  if length > stop
    slicedStr + " ..."
  else
    slicedStr

limitLengthAll = (arr, length) ->
  for description in arr
    do (description) ->
      unless description.textContent == ""
        description.textContent = limitStrLength(description.textContent, length)
