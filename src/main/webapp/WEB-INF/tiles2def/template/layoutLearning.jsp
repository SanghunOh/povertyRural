<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!doctype html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=9">

<meta http-equiv="Cash-Control" content="no-cache">
<meta http-equiv="Pragma" content="no-cache">

<title>SK CBC</title>
<link href="<c:url value="/resources/usr/css/basc.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/usr/css/global.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/usr/css/layout_learning.css" />" rel="stylesheet" type="text/css" />
<link href="<spring:message code='css.name_learning,my' text=''/>" rel="stylesheet" type="text/css" />
<script src="<c:url value="/resources/inc/script.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/usr/js/jquery-1.6.1.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/js/jscommon.js" />" type="text/javascript"></script>
</head>

<body>
<header role="banner">
  <div class="topMenu">
	<div class="langSel">
		<a href="?lang=my" class="mal <spring:message code='label.lang,mal_langOn'/>  fontT">
			<spring:message code="label.lang,malaysia" text="" />
		</a>
		<a href="?lang=en" class="eng <spring:message code='label.lang,en_langOn'/> fontT">
			<spring:message code="label.lang,english" text="" />
		</a>
	</div>
	  <nav class="naviTop fontT"><a href="${pageContext.request.contextPath }"><spring:message code="menu.cbchome" text="" /></a>|<a href="${pageContext.request.contextPath }/usr/smartmain" class="smart"><spring:message code="menu.sitemap_smart" text="" /></a>|<a href="${pageContext.request.contextPath }/usr/englishvi" class="eng"><spring:message code="menu.sitemap_envill" text="" /></a></nav>
      <div class="rightBtn"><c:choose><c:when test="${username != null && username != 'anonymousUser'}"><a href="<c:url value="/j_spring_security_logout" />" class="logoutBtn"><spring:message code="label.log_out"/></a></c:when><c:otherwise><a href="<c:url value="/loginUser" />" class="logoutBtn"><spring:message code="label.log_in"/></a></c:otherwise></c:choose><a href="${pageContext.request.contextPath }/sitemap/" class="sitemapBtn"><spring:message code="label.sitemap"/></a>
      <div class="mypageFloat"><a href="${pageContext.request.contextPath }/usr/myPage/read?userID=${userID}" class="mypageBtn"><spring:message code='lbael.mypage'/></a></div>
      </div>
  </div>
</header>
<!-- body : str -->
				<tiles:insertAttribute name="body" />
<!-- body : end -->
</body>
</html>