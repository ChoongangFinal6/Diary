<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="i" value="0"/>
{["placeAll" : 
<c:forEach var="item" items="${obj }">
		{"pcode" : ${item.pCode }, "ptype" : "${item.pType }", "pname" : "${item.pName }", "pimg" : "${item.pImg }", "pmapx" : "${item.pMapX }", "pmapy" : "${item.pMapY }"},
	
</c:forEach>
]}

