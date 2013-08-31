window.PocApp =
  Views: {}

  init: ->
    mapping =
      "#main-view": PocApp.Views.MainView

    initialized = {}
    
    for selector, view of mapping
      if $("body").has(selector).length isnt 0
        view = new view() unless initialized[view.toString()]
        initialized[view.toString()] = true

$ ->
  $(document).foundation()
  PocApp.init()
