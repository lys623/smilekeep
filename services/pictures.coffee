

Picture=new BaseModel('pictures')
module.exports=
  getAll:(cb,page,count)->
    page=page||1;
    count=count||20;
    Picture.findAll().fields(['name','desc','zan_count','visit_count']).done (error,datas)->
#    Picture.findAll().done (error,datas)->
      cb&&cb error,datas
  add:(t,cb)->
    Picture.add(t).done (error,pictrue)->
      cb&&cb error,pictrue
