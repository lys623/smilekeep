module.exports =
  id:
    type:"int"
    autoIncrement: true
    primaryKey: true
  user_id:"int"
  user_nick:"varchar(100)"
  user_headpic:"varchar(255)"
  title:"varchar(255)"
  name:"varchar(255)"
  md:
    type:"text"
    private:true
  visit_count:
    defaultValue:0
    type:"int"
  comment_count:
    defaultValue:0
    type:"int"
  zan_count:
    defaultValue:0
    type:"int"
  publish_time:"int"
  is_publish:
    defaultValue:0
    type:"tinyint"
    private:true
  sort:"int"
  is_top:"tinyint"
  type:
    type:"int"
    defaultValue:1
    private:true
  desc:"text"
  tagNames:
    type:"varchar(255)"
    private:true
  column_id:"int"
  uuid:"varchar(40)"
  score:
    defaultValue:0
    type:"double"
    private:true
  create_date:"datetime"

