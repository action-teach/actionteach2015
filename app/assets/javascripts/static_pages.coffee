# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# for scrolling

# for carousel 
myCarousel = -> 
  m = $('#main-carousel')
  m.carousel {
    interval: false
  }
  c = $('#definition-carousel')
  c.carousel {
    interval: false
  }

  $('.btn-definition-carousel-toggle').click (e) -> 
    e.preventDefault()
    dir = $(this).data('dir')
    c.carousel(dir)

# for fading in statements
myStatements = -> 
  $(".nav-statements a").unbind('click').bind 'click', (e) -> 
    download = $(this).attr('class')
    console.log download
    unless (download is 'download-mission') 
      e.preventDefault()
    n = $('.nav-statements li.active')
    n.removeClass('active')
    $(this).parent().addClass 'active'

    statement = $(this).data 'statement'
    # don't fade in if the current statement is already there
    $('.active-statement').stop().fadeOut 400, -> 
      $(statement).fadeIn()
      $(statement).addClass 'active-statement'

# for scrolling on the navbar
navBarScroll = -> 
  $('.navbar-nav a, .scroll-down').click (e) ->
    e.preventDefault()
    target = $(this).data('scroll')
    $('html, body').stop().animate {
      # adjust for navbar length
      scrollTop: $(target).offset().top - 51
    }, 1000

$(document).on "page:change", -> 
  myCarousel()
  myStatements()
  navBarScroll()

$(document).ready -> 
  myCarousel()
  myStatements()
  navBarScroll()
