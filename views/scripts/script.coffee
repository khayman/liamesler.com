jQuery.extend jQuery.easing,
  easeOutBack: (x, t, b, c, d, s) ->
    s = 1.70158 unless s?
    c * ((t = t / d - 1) * t * ((s + 1) * t + s) + 1) + b

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
        posX = Math.floor dropdown.parent().width() / 3.5
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
      dropdown.stop(true, true).fadeOut(150, -> dropdown.removeClass 'open')
    dropdownShow: (dropdown) ->
      dropdown.stop(true, true).slideDown(375, 'easeOutBack', -> dropdown.addClass 'open')
)()

$ -> SITE.initialize()
