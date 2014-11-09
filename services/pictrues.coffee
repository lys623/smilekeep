

Picture=new BaseModel('pictures')
module.exports=
  getAllPictures:(cb)->
    Picture.findAll().order({}).done (error,datas)->
      cb&&cb error,datas
  add:(t,cb)->
    Picture.add(t).done (error,pictrue)->
      cb&&cb error,pictrue
