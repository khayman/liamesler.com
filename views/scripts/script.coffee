# jQuery plugins & extensions
jQuery.extend jQuery.easing, easeOutBack: (x, t, b, c, d, s) -> c * ((t = t / d - 1) * t * (((s = 0.88125) + 1) * t + s) + 1) + b

# iPhone Screen orientation fix
`/*! A fix for the iOS orientationchange zoom bug. Script by @scottjehl, rebound by @wilto.MIT License.*/(function(m){if(!(/iPhone|iPad|iPod/.test(navigator.platform)&&navigator.userAgent.indexOf("AppleWebKit")>-1)){return}var l=m.document;if(!l.querySelector){return}var n=l.querySelector("meta[name=viewport]"),a=n&&n.getAttribute("content"),k=a+",maximum-scale=1",d=a+",maximum-scale=10",g=true,j,i,h,c;if(!n){return}function f(){n.setAttribute("content",d);g=true}function b(){n.setAttribute("content",k);g=false}function e(o){c=o.accelerationIncludingGravity;j=Math.abs(c.x);i=Math.abs(c.y);h=Math.abs(c.z);if(!m.orientation&&(j>7||((h>6&&i<8||h<8&&i>6)&&j>5))){if(g){b()}}else{if(!g){f()}}}m.addEventListener("orientationchange",f,false);m.addEventListener("devicemotion",e,false)})(this);`

# Global SITE var wrapper
window.SITE = ( ->
  window.log = ->
    log.history = log.history or []
    log.history.push arguments
    console.log Array::slice.call(arguments) if @console

  initialize: ->
    SITE.init.outsideClick()
    SITE.init.dropdownMenu()

  init:
    dropdownMenu: ->
      menu = $('.main-header nav ul')

      reposition = (dropdown) ->
        posX = Math.floor dropdown.parent().width() / ( if window.innerWidth < 480 then 2 else 3.5 )
        dropdown.css 'left', "-#{posX}px"

      menu.on 'click', '.dropdown > a', (e) ->
        e.preventDefault()
        menuItem = $(@)
        dropdown = menuItem.siblings '.dropdown-wrapper'

        reposition dropdown

        if dropdown.is ':visible'
          SITE.util.dropdownHide dropdown
        else
          SITE.util.dropdownShow dropdown

    outsideClick: ->
      $('html').click (e)->
        item     = e.target
        dropdown = $('.dropdown-wrapper.open')

        if not dropdown.is ':animated' and dropdown.has(item).length is 0
          SITE.util.dropdownHide dropdown

  util:
    dropdownHide: (dropdown) ->
      dropdown.stop(true, true).fadeOut(100, -> dropdown.removeClass 'open')
    dropdownShow: (dropdown) ->
      dropdown.stop(true, true).slideDown(375, 'easeOutBack', -> dropdown.addClass 'open')
)()

# Init function
$ -> SITE.initialize()
