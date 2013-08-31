class PocApp.Views.MainView extends Backbone.View

  events:
    "change #no-of-params": "checkParams"
    "submit #offers-form" : "handleSubmit"

  initialize: ->
    $(".loading").hide()

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
    '<input type="text" name="pub' + i + '" placeholder="User Param" required/>'

  handleSubmit: (e) ->
    e.preventDefault()
    $(".loading").show()
    $(e.currentTarget).ajaxSubmit(success: @handleSuccess, error: @handleError)

  handleSuccess: (response, status, xhr, form) =>
    $(".response").html response
    $(".loading").hide()

  handleError: (response) =>
    console.log response
    $(".response").html("<p>Error!!</p>")