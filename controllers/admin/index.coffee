config = __C
fs = require 'fs'
UPYun=require(__C.base_path+"/rabbit/lib/upyun.js").UPYun
md5 = (string)->
  crypto = require('crypto')
  md5sum = crypto.createHash('md5')
  md5sum.update(string, 'utf8')
  return md5sum.digest('hex')
func_pictures = loadService('pictrues');

module.exports =
  "/":
    get: (req,res,next)->
      @useFilters ["checkLogin"]
      (req, res, next) ->
        res.render "admin/index.jade"
  "/upload":
    post:(req,res,next)->
      @useFilters ["checkLogin"]
      @useFilters ["checkAdmin"]
      (req,res,next)->
        result =
          success:0
          info:""
        console.log(req.body)
        console.log('-------------------------------')
        console.log(req.files.file)
        pack = req.files['pic']||req.files.file
        reqbodydata=req.body

        reqbodydata.uuid = uuid.v4()
        if pack && (pack.mimetype  == 'image/jpeg'||pack.mimetype  == "image/jpg"||pack.mimetype =="image/png"||pack.mimetype =="image/gif")
          sourcePath = pack.path
          pack_name = pack.name
          targetPath = config.upload_path+pack_name
          fs.rename sourcePath, targetPath, (err) ->
            if err
              result.info = err.message
              res.send result
              return
            upyun = new UPYun(config.upyun_bucketname, config.upyun_username, config.upyun_password)
            fileContent = fs.readFileSync(targetPath)
            # fileContent = fs.readFileSync(sourcePath)
            md5Str = md5(fileContent)
            upyun.setContentMD5(md5Str)
            upyun.setFileSecret('bac')
            console.log(pack_name)
            upyun.writeFile '/uploads/'+pack_name, fileContent, false,(error, data)->
              if error
                result.info = error.message
                res.send result
                return
              else
                result.success = 1
                result.data =
                  filename:"http://smilekeep-image.b0.upaiyun.com/uploads/"+pack_name
                func_pictures.add {"name":pack_name,"desc":reqbodydata.desc,"uuid":reqbodydata.uuid},(error,picture)->
                  if error
                    result.info = error.message
                    res.send result
                    return
              res.send result
        else
          result.info = "错误的图片文件"
          res.send result
