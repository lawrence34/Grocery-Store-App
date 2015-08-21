/**
 * Created by McBhee on 8/18/2015.
 */

$(function(){

    var main = function() {
        $('#login-box').submit(function (e) {
            //start ajax loader
            e.preventDefault();

            //sending anal jax request to the action specified
            $.ajax({
                type: 'POST',
                url: '/auth/login',
                data: $(this).serialize(),
                dataType: 'html',
                success: function (data) {
                    //if ajax request is successful
                    //stop ajax loader.
                    $('.feedback').html(data);
                    //relaod the page

                },
                fail: function(data){
                    //if the ajax request fails
                }
            })
        });


        $('#register-box').submit(function(e) {
            //start ajax loader
            e.preventDefault();

            //sending anal jax request to the action specified
            $.ajax({
                type: 'POST',
                url: '/auth/register',
                data: $(this).serialize(),
                dataType: 'html',
                success: function (data) {
                    //if ajax request is successful
                    //stop ajax loader.
                    console.log(data)
                    $('.feedback').html(data).fadeToggle(3000);
                    //relaod the page
                },
                fail: function(data){
                    //if the ajax request fails
                }
            })
        });

        $('.close-login').click(function(){
            location.reload(true)
        });

        $('.submitbutton').click(function() {
            var pos = $(this).parent().find('.item_id').val();
            $.ajax({
                url: "/cart",
                type: "POST",
                data: {item_id: pos},
                success: function(data) {
                    // Do stuff when the AJAX call returns
                }
            });
        });


    };
    $(document).ready(main);
});
