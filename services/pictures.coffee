

Picture=new BaseModel('pictures')
module.exports=
  getAll:(cb,page,count)->
    page=page||1;
    count=count||20;
    Picture.findAll().fields(['id','name','desc','zan_count','visit_count']).done (error,data)->
      data.forEach (item)->
        console.log(item.id)
      cb&&cb error,data
  add:(t,cb)->
    Picture.add(t).done (error,pictrue)->
      cb&&cb error,pictrue
