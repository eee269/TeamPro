<!--   <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet"> -->
<!--   <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<!--   <link href="css/summernote.min.css" rel="stylesheet"> -->
<!--   <script src="js/summernote.min.js"></script> -->
  <script src="js/summernote-lite.js"></script>
  <script src="js/summernote-ko-KR.js"></script>	
  <link href="css/summernote-lite.css" rel="stylesheet">
	<!-- WriteEditor -->
	<script>
	    $(document).ready(function() {
	        $('#summernote').summernote({
	        	 toolbar: [
	 			    // [groupName, [list of button]]
// 	 			    ['fontname', ['fontname']],
// 	 			    ['fontsize', ['fontsize']],
	 			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
	 			    ['color', ['forecolor','color']],
	 			    ['table', ['table']],
	 			    ['para', ['paragraph']],
	 			    ['height', ['height']],
	 			    ['insert',['picture','link','video']],
// 	 			    ['view', ['fullscreen', 'help']]
	 			  ],
// 	 			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
// 	 			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
	        	focus: true,
	        	disableResizeEditor: true,
	        	height: 600,
	        	lang: "ko-KR",
	        	onImageUpload: function(files, editor, welEditable) { sendFile(files[0], editor, welEditable); }
	        });
	        $('.note-statusbar').hide();
	    });
	</script>

	<!-- WriteEditor -->
