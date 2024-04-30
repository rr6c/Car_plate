$(function () {
    function display(bool) {
        if (bool) {
            $(".container").show();
        } else {
            $(".container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "H_pl_nui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })

    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('https://H_pl/exit', JSON.stringify({}));
            return
        }
    };


    $("#Send22").click(function () {
        var textToSend = document.getElementById("Text_pl").value;
        $.post('https://H_pl/Send22', JSON.stringify({ text: textToSend }));
        console.log("Sent text to Lua");
        return;
    });
    
    $("#Hide").click(function () {
        $.post('https://H_pl/Hide', JSON.stringify({}));
        return;
    });
    
    
    $("#close").click(function () {
        $.post('https://H_pl/exit', JSON.stringify({}));
        $(".container").hide();
        return;
    });

    // Add event listeners for other buttons if needed
});
