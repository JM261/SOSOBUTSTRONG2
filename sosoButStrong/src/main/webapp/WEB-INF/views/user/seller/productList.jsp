<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 상품/조회 수정 화면</title>
<link rel="stylesheet" href="resources/css/user/seller/productList.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/seller/sellerMyMenu.jsp"/>
    <div class="outer">
        <br><br>
        <h2 style="font-weight: bolder; margin-left: 330px;" >&nbsp;&nbsp;상품조회/수정</h2>
        <table align="center" class="list-area">
            <thead>
                <tr style="background-color: lightgray;">
                    <th width="70">수정</th>
                    <th width="70">삭제</th>
                    <th width="100">상품번호</th>
                    <th width="250">상품명</th>
                    <th width="80">판매상태</th>
                    <th width="65">판매가</th>
                    <th width="120">상품등록일</th>
                    <th width="120">최종수정일</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="p" items="${ list }">
	                	<tr>
		                    <td><button>수정</button></td>
		                    <td><button>삭제</button></td>
		                    <td>${ p.productNo }</td>
		                    <td>${ p.productName }</td>
		                    <td>${ p.sellStatus }</td>
		                    <td>${ p.price }</td>
		                    <td>${ p.createDate }</td>
		                    <td>${ p.modifyDate }</td>
	               	 	</tr>
                 </c:forEach>
            </tbody>
        </table>
    </div>
        <!-- 페이징 영역-->
        <div id="pagingArea">
            <ul class="pagination">
                <c:choose>
                <c:when test="${ pi.currentPage eq 1 }">
                    <li class="page-item" style="display: none;"><a class="page-link" href="#">이전</a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="sellerProductList.se?pPage=${ pi.currentPage - 1 }">이전</a></li>
                </c:otherwise>
                </c:choose>
                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                        <li class="page-item"><a class="page-link" href="sellerProductList.se?pPage=${ p }">${ p }</a></li>
                </c:forEach>
                <c:choose>
                    <c:when test="${ pi.currentPage eq pi.endPage }">
                <li class="page-item" style="display: none;"><a class="page-link" href="#">다음</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item"><a class="page-link" href="sellerProductList.se?pPage=${ pi.currentPage + 1 }">다음</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>

    <jsp:include page="/WEB-INF/views/user/common/footer.jsp"/>	
</body>
</html>