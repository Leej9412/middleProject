<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 레이아웃 --><%@include file="/includes/1.header.jsp"%>
<title>PangPang Mall.</title>
<style type="text/css">
html, body {
	min-height: 100%;
}

body, div, form, input, select, p {
	padding: 0;
	margin: 0;
	outline: none;
	font-family: Roboto, Arial, sans-serif;
	font-size: 14px;
	color: #666;
	line-height: 22px;
}

h1 {
	margin: 15px 0;
	font-weight: 400;
}

form {
	width: 100%;
	padding: 20px;
	background: #fff;
	box-shadow: 0 2px 5px #ccc;
}

input, select, textarea {
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

input:hover, select:hover, textarea:hover {
	outline: none;
	border: 1px solid #095484;
}

input {
	width: calc(100% - 10px);
	padding: 5px;
}

select {
	width: 100%;
	padding: 7px 0;
	background: transparent;
}

textarea {
	width: calc(100% - 6px);
}

.item {
	position: relative;
	margin: 10px 0;
}

input[type='date']::-webkit-inner-spin-button {
	display: none;
}

.item i, input[type='date']::-webkit-calendar-picker-indicator {
	position: absolute;
	font-size: 20px;
	color: #a9a9a9;
}

.item i {
	right: 2%;
	top: 30px;
	z-index: 1;
}

[type='date']::-webkit-calendar-picker-indicator {
	right: 1%;
	z-index: 2;
	opacity: 0;
	cursor: pointer;
}

.btn-block {
	margin-top: 20px;
}

button {
	width: 150px;
	padding: 10px;
	border: none;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	background-color: #095484;
	font-size: 16px;
	color: #fff;
	cursor: pointer;
}

button:hover {
	background-color: #0666a3;
}

body {
	margin: 10px;
}

.where {
	display: block;
	margin: 25px 15px;
	font-size: 11px;
	color: #000;
	text-decoration: none;
	font-family: verdana;
	font-style: italic;
}

.filebox input[type='file'] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.filebox label {
	display: inline-block;
	padding: 0.5em 1em;
	margin-bottom: 10px;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: 0.25em;
}

/* named upload */
.filebox .upload-name {
	display: inline-block;
	padding: 0.5em 0.75em;
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: 0.25em;
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}

/* imaged preview */
.filebox .upload-display {
	margin-bottom: 5px;
}

@media ( min-width : 768px) {
	.filebox .upload-display {
		display: inline-block;
		margin-right: 5px;
		margin-bottom: 0;
	}
}

.filebox .upload-thumb-wrap {
	display: inline-block;
	width: 54px;
	padding: 2px;
	vertical-align: middle;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #fff;
}

.filebox .upload-display img {
	display: block;
	max-width: 100%;
	width: 100% \9;
	height: auto;
}

.filebox.bs3-primary label {
	color: #fff;
	background-color: #337ab7;
	border-color: #2e6da4;
}

.inputSize {
	width: 250px;
}

.selectSize {
	width: 264px;
}

.textareaSize {
	width: 500px;
	height: 100px;
	resize: none;
}

a {
	text-decoration: none;
	padding-left: 20px;
}
</style>
</head>
<body>
	<!-- 레이아웃 --><%@include file="/includes/2.navbar.jsp"%>
	<div class="page-heading bg-light">
		<div class="container">
			<div class="row align-items-end text-center">
				<div class="col-lg-7 mx-auto">
					<h1>Product</h1>
					<p class="mb-4">
						<a href="index.html">Home</a> / <strong>Upload Product</strong>
					</p>
				</div>
			</div>
		</div>
	</div>


	<div class="untree_co-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="custom-block" Formdata-aos="fade-up"
						data-aos-delay="100">
						<h2 class="section-title">Upload</h2>
						<form class="contact-form"
							action="<%=request.getContextPath()%>/productUpload.do"
							method="post" enctype="multipart/form-data">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label class="" for="fname">등록할 상품의 이름을 입력하시오</label> <input
											type="text" class="form-control" name="productName">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label class="" for="lname">판매 가격을 입력하시오</label> <input
											type="text" class="form-control" name="prodcutPrice"
											oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="" for="select">상품 카테고리를 선택하시오</label> <select
									name="categoryNo" class="custom-select">
									<option value="">카테고리</option>
									<option value="1">의류</option>
									<option value="2">화장품</option>
									<option value="3">가전</option>
									<option value="4">식품</option>
									<option value="5">의약</option>
								</select>
							</div>
							<div class="form-group">
								<label class="" for="select">상품의 사이즈를 선택하시오</label> <select
									name="productSize" class="custom-select">
									<option value="">사이즈 선택</option>
									<option value="S">S</option>
									<option value="M">M</option>
									<option value="L">L</option>
								</select> <small id="emailHelp" class="form-text text-muted">의류일
									경우만 입력하시오</small>
							</div>
							<div class="form-group">
								<label class="">등록할 상품 수량을 입력하시오</label> <input
									class="form-control" name="productQty"
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
								<small id="emailHelp" class="form-text text-muted">숫자로
									입력하시오</small>
							</div>
							<div class="form-group">
								<label class="">적용할 상품 마일리지를 입력하시오</label> <input
									class="form-control" name="productMileage"
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
								<small class="form-text text-muted">숫자로 입력하시오</small>
							</div>


							<div class="filebox bs3-primary preview-image">
								<input class="upload-name" value="파일선택" disabled="disabled"
									style="width: 200px" /> <label for="input_file">업로드</label> <input
									name="upFile" type="file" id="input_file" class="upload-hidden"/>
							</div>

							<div class="form-group">
								<label class="">등록할 상품의 상세 정보를 입력하시오</label>
								<textarea class="form-control" name="productInfo" cols="30"
									rows="5"></textarea>
							</div>
							<button type="submit" class="btn btn-black">Submit</button>
						</form>
					</div>
				</div>
				<!-- /.col-lg-6 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</div>
	<!-- /.untree_co-section -->
	<!-- END .custom-block -->
	<!-- 레이아웃 --><%@include file="/includes/5.footer.jsp"%>
	<script type="text/javascript">
		$(document).ready(function() {
			var fileTarget = $('.filebox .upload-hidden');

			fileTarget.on('change', function() {
				if (window.FileReader) {
					// 파일명 추출
					var filename = $(this)[0].files[0].name;
				} else {
					// Old IE 파일명 추출
					var filename = $(this).val().split('/')
							.pop().split('\\').pop();
				}
				$(this).siblings('.upload-name').val(filename);
			});

			//preview image
			var imgTarget = $('.preview-image .upload-hidden');

				imgTarget.on('change', function() {
				var parent = $(this).parent();
				parent.children('.upload-display').remove();

				if (window.FileReader) {
					//image 파일만
					if (!$(this)[0].files[0].type.match(/image\//))
						return;

					var reader = new FileReader();
					reader.onload = function(e) {
						var src = e.target.result;
						parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="' +
      														src +'" class="upload-thumb"></div></div>');
					};
					reader.readAsDataURL($(this)[0].files[0]);
				} else {
					$(this)[0].select();
					$(this)[0].blur();
					var imgSrc = document.selection.createRange().text;
					parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

					var img = $(this).siblings('.upload-display').find('img');
					img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+ imgSrc + '")';
				}
			});
		});
	</script>
</body>
</html>