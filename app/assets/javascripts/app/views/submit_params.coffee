class PocApp.Views.SubmitParamsView extends Backbone.View

  el: "#offers-request"

  events:
    "change #no-of-params": "checkParams"
    "submit #offers-form" : "handleSubmit"

  initialize: ->
    #console.log "initialized"

  checkParams: ->
    noOfParams = $("#no-of-params").val()
    t = @buildTemplate(noOfParams)
    $(".user-params").html(t)

  buildTemplate: (noOfParams) ->
    template = ''
    for idx in [0..noOfParams - 1]
      template = template + @getTempl(idx)
    template

  getTempl: (i) ->
    '<input type="text" name="pub' + i + '" placeholder="User Param"/>'

  handleSubmit: (e) ->
    e.preventDefault()
    $(e.currentTarget).ajaxSubmit(success: @handleResponse, error: @handleError)

  handleResponse: (response, status, xhr, form) =>
    console.log response

  handleError: (response) =>
    console.log response