	<!-- WriteEditor -->
	
	<script src="community/summernote-lite.js"></script>
	<script src="community/summernote-ko-KR.js"></script>
	<script src="community/summernote-ko-KR.min.js"></script>
	<script>
	    $(document).ready(function() {
	        $('#summernote').summernote({
	        	focus: true,
	        	disableResizeEditor: true,
	        	height: 600,
	        	lang: 'ko-KR',
	        	onImageUpload: function(files, editor, welEditable) { sendFile(files[0], editor, welEditable); }
	        });
	        $('.note-statusbar').hide();
	    });
	</script>
	<!-- WriteEditor -->
