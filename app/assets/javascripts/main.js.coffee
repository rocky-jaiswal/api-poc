window.PocApp =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  Utils: {}

  init: ->
    mapping =
      "#offers-request": PocApp.Views.SubmitParamsView

    initialized = {}
    
    for selector, view of mapping
      if $("body").has(selector).length isnt 0
        view = new view() unless initialized[view.toString()]
        initialized[view.toString()] = true

$ ->
  $(document).foundation()
  PocApp.init()
