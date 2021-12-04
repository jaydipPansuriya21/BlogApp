const { hide } = require("@popperjs/core");

console.log("Main.js file");
let btn = document.getElementById('comment_btn');

if (btn) {
    btn.addEventListener('click', (e) => {
        e.preventDefault();
        let div = document.getElementById('add_comment');
        if (div.classList.contains('hide') == true) {
            div.classList.remove('hide');
        } else {
            div.classList.add('hide');
        }
    });

}
let publish_btn = document.getElementById('publish_comment');

function getCommentDetails() {
    let comment_text = document.getElementById('comment_text').value;

    // let data = {
    //     "body": comment_text,
    //     "commenter": document.getElementById('current_user_id').value,
    //     "article_id": document.getElementById('article_id').value
    // }

    // return data;
    let body = comment_text;
    let commenter = document.getElementById('current_user_id').value;
    let article_id = document.getElementById('article_id').value;
    return `body=${body}&commenter=${commenter}&article_id=${article_id}`
}

if (publish_btn) {
    publish_btn.addEventListener('click', (e) => {
        // console.log("button clicked");
        // var xhr = new XMLHttpRequest();
        // xhr.open("POST", window.location.href + '/comments', true);
        // xhr.setRequestHeader("Content-Type", "application/json");
        // xhr.onreadystatechange = function() {
        //     if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
        //         console.log("request send");
        //     } else {
        //         console.log("request failed");
        //     }
        //     location.reload();

        // }
        // xhr.send(getCommentDetails());
        // alert(getCommentDetails());
        jQuery.ajax({
            url: window.location.href + '/comments',
            type: 'post',
            data: getCommentDetails(),
            dataType: 'script',
            // contentType: "application/json",
            success: function(text) {
                document.getElementById('comment_text').value = "";
            }

        });
    });

    console.log(getCommentDetails());
}
jQuery(document).ready(function() {
    console.log("Hello world jquery is ready");
});