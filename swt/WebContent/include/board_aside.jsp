<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.aside {
    width: 260px;
    float: left;
    margin-right: 40px;
    position: absolute;
}
.aside .title_wrap {
    width: 260px;
    height: auto;
    display: table;
    text-align: center;
}
.aside .title_wrap .title {
    display: table-cell;
    vertical-align: top;
    font-size: 22px;
    color: black;
    text-align: left;
    padding-bottom: 30px;
    border-bottom: 1px solid #dcdcdc;
    padding-left: 15px;
    font-weight: bold;
}

.aside ul li {
    border-bottom: 1px solid #e8e8e8;
}

.aside ul li a {
    line-height: 45px;
    display: block;
    padding-left: 20px;
}
</style>
</head>
<body>
	<div class="aside">
		<div class="title_wrap">
			<p class="title">
			CUSTOMER<br>SERVICE
			</p>
		</div>
		<ul>
			<li>
				<a href="#">NOTICE</a>
			</li>
			<li>
				<a href="#">FAQ</a>
			</li>
			<li>
				<a href="#">QnA</a>
			</li>
		</ul>
	</div>
</body>
</html>