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
  "/picture/:id/zan":
    post:->
      (req, res, next) ->
        console.log('进入了:zan')
        result =
          success:1
        func_pictures.addZan req.params.id,(error,data)->
          if error
            result.info = error.message
            result.success = 0
          else
            result.message = "点赞成功"
            result.zan_count = data.zan_count
          res.send result
