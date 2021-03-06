<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/nav.jsp"%>

<div class="container">

	<div class="card">
		<div class="card-header">
			<h4 class="card-title">${post.title}</h4>
		</div>
		<div class="card-body">
			<p class="card-text">${post.content}</p>
		</div>
		<div class="card-footer">
			<a id="post--update--submit" href="/post/update/${post.id}" class="btn btn-warning">수정</a>
			<button id="post--delete--submit" value="${post.id}" class="btn btn-danger">삭제</button>
			<a href="/" class="btn btn-primary">목록</a>
		</div>
	</div>
	<br />
	<div class="card">
		<div class="form-group">
			<div class="card-body">
				<input type="hidden" id="postId" value="${post.id}" /> <input type="hidden" id="userId" value="${sessionScope.principal.id}" />
				<textarea rows="2" class="form-control" id="content"></textarea>
			</div>
			<div class="card-footer">
				<button id="conmment--save--submit" class="btn my__bg__pink">등록</button>
			</div>
		</div>
	</div>
	<br />
	<div class="card">
		<div class="form-group">
			<div class="card-header">
				<h4 class="card-title">댓글 리스트</h4>
			</div>

			<div id="comment--items" class=" card-body">
				<c:forEach var="comment" items="${comments}">
					<div id="comment--item--${comment.id}">

						<div class="d-flex">
							<h6 class="comment--username">
								<strong>${comment.username}</strong>
							</h6>
							<c:if test="${comment.userId eq sessionScope.principal.id }">
								<button onclick="commentDelete(${comment.id})" class="btn btn-danger ml-auto">삭제</button>
							</c:if>
						</div>
						<div class="comment--content">${comment.content}</div>
						<hr>
						
					</div>
				</c:forEach>
			</div>


		</div>
	</div>
</div>
<script src="/js/detail.js"></script>

<%@include file="../include/footer.jsp"%>