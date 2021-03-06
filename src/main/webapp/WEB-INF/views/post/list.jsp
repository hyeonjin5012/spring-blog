<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="../include/nav.jsp"%>

<div class="container">

	<table class="table table-bordered">
		<thead class="thead-light">
			<tr>
				<th>글 번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성 시간</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="post" items="${posts}">
				<tr>
					<td>${post.id}</td>
					<td><a class="my__nav__text" href="/post/${post.id}"> ${post.title}</a></td>
					<td>${post.username}</td>
					<td><fmt:formatDate value="${post.createDate}" pattern="yyyy-MM-dd hh:mm" /></td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
	<ul class="pagination justify-content-center">
		<c:if test="${paging.prev}">
			<li class="page-item"><a class="page-link" href="${paging.startPage-1}">Previous</a></li>
		</c:if>
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i">
			<c:choose>
				<c:when test="${paging.cri.page==i}">
					<li class="page-item active"><a class="page-link">${i}</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="${i}">${i}</a></li>

				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.next}">
			<li class="page-item"><a class="page-link" href="${paging.endPage+1 }">Next</a></li>
		</c:if>
	</ul>
</div>
<form id="jobForm">
	<input type="hidden" name="page" value="${paging.cri.page}"> <input type="hidden" name="perPageNum" value="${paging.cri.perPageNum}">
</form>
<script src="/js/list.js"></script>
<%@include file="../include/footer.jsp"%>