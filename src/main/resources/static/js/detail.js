/**
 * 
 */
$('#post--delete--submit').on('click', function() {

	var data = {
		id : $('#post--delete--submit').val()
	};

	$.ajax({
		type : 'DELETE',
		url : '/post/delete',
		data : JSON.stringify(data),
		contentType : 'application/json; charset=utf-8',
		dataType : 'json'
	}).done(function(r) {
		if (r.statusCode == 200) {
			alert('글 삭제 성공');
			location.href = '/';
		} else {
			alert('글 삭제 실패');
		}
	}).fail(function(r) {
		alert('글 삭제 실패');
	});

});
$('#conmment--save--submit').on('click', function() {

	var data = {
		content : $('#content').val(),
		userId : $('#userId').val(),
		postId : $('#postId').val()
	};

	$.ajax({
		type : 'POST',
		url : '/comment/write',
		data : JSON.stringify(data),
		contentType : 'application/json; charset=utf-8',
		dataType : 'json'
	}).done(function(r) {
		if (r.status.statusCode == 200) {
			alert('댓글 등록 성공');
			makeCommentItem(r);

		} else {
			alert('댓글 등록 실패');
		}
	}).fail(function(r) {
		alert('댓글 등록 실패');
	});
});

function makeCommentItem(r) {
	var comment_item = `<div id="comment--item--${r.id}">`;
	comment_item += `<span class="comment--username">작성자:${r.username} </span> `;
	comment_item += `<span class="comment--content">${r.content} </span> `;
	comment_item += `<button onclick="commentDelete(${r.id})" class="btn btn-danger">삭제</button>`;
	comment_item += `</div>`;
	$('#comment--items').prepend(comment_item);
};
function commentDelete(commentId){

	$.ajax({
		type : 'DELETE',
		url : '/comment/delete/'+commentId,
	
	}).done(function(r) {
		if (r.statusCode == 200) {
			alert('댓글 삭제 성공');
			$('#comment--item--'+commentId).remove();
		} else {
			alert('댓글 삭제 실패');
		}
	}).fail(function(r) {
		alert('댓글 삭제 실패');
	});
};