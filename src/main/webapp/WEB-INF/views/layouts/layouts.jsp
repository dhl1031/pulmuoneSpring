<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
	<tiles:insertAttribute name="head" />
<body>

<div class="wrapper">
	<!-- header -->
	<tiles:insertAttribute name="header" />
	<!-- main -->
  	<tiles:insertAttribute name="main" />
  	<!-- footer -->
  	<tiles:insertAttribute name="footer" />
  	<tiles:insertAttribute name="footermodal" />  	
</div>
<!-- modal -->
<tiles:insertAttribute name="alertModal" />
<tiles:insertAttribute name="confirmModal" />
<tiles:insertAttribute name="confirmDesignModal" />
</body>
</html>