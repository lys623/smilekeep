    $('body').on('click', '.zan', function () {
        if($(this).hasClass('alreadyZan')){
            messageTip.show("你已经赞过了，谢谢！")
            return;
        }
        var self = this;
        var id = $(this).parents('li').data('id');
        var url = '/picture/' + id + '/zan'
        $.ajax({
            type: "POST",
            url: url,
            data: {}
        }).done(function(data) {
            $(self).addClass('alreadyZan');
            messageTip.show(data.message);
            $(self).text(' '+data.zan_count);
        });

    })
