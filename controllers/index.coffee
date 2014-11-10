func_pictures = loadService('pictures');
module.exports =
  "/":
    get: ->
      @useFilters ["checkTeacher"]
      (req, res, next) ->
        func_pictures.getAll (err,data)->
          if(err)
            next(err)
          else
            res.locals.data=data;
            res.render "index.jade"
