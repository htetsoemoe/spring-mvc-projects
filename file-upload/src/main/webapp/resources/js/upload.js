// JavaScript for File Upload

document.addEventListener('DOMContentLoaded', () => {
	// If user clicked the upload button, clicked the file input element.
	document.getElementById('btnUpload').addEventListener('click', () => {
		document.getElementById('uploadInput').click();
	});

	// If user uploaded the file, submit the form which has file input existed.
	document.getElementById('uploadInput').addEventListener('change', () => {
		document.getElementById('uploadForm').submit();
	});
	
	// If user file upload is successful, show the modal
	var uploadModal = document.getElementById('uploadMessageModal');
	
	if(uploadModal) {
		var modal = new bootstrap.Modal(uploadModal);
		modal.show();
	}
})