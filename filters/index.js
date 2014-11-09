module.exports = {
    "/": {
        get: function() {
            this.useFilters(['checkTeacher']);
            return function(req, res, next) {
//                res.send("Hello Rabbit.js!");
                res.render('index.jade');
            }

        }
    }
}