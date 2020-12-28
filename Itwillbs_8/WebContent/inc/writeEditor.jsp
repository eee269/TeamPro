  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  <script src="../community/summernote-ko-KR.js"></script>	
	<!-- WriteEditor -->
	<script>
	    $(document).ready(function() {
	        $('#summernote').summernote({
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
