module.exports =
  "/":
    get: ->
      @useFilters ["checkTeacher"]
      (req, res, next) ->
        res.render "index.jade"
