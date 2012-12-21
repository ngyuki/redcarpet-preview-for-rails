(function(undefined) {
    
    var url = "markdown/raw";
    var timer;
    
    var refresh = function(){
        
        var source = $('#source').val();
        
        if (source.length == 0)
        {
            $('#preview').html(source);
        }
        else
        {
            $.ajax({
                type: "POST",
                url: url,
                data: source,
                contentType: 'text/plain',
                processData: false,
                dataType: 'text',
                success: function (data) {
                    $('#preview').html(data);
                }
            })
        }
    }
    
    $(function () {
        
        refresh();
        
        $(document).keyup(function(){
            
            if (timer)
            {
                clearTimeout(timer);
            }
            
            timer = setTimeout(function(){
                timer = undefined;
                refresh();
            }, 200)
        });
    })
})()
