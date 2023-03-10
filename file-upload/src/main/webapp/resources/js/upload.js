// JavaScript for File Upload

// If user clicked the upload button, clicked the file input element.
document.getElementById('btnUpload').addEventListener('click', () => {
	document.getElementById('uploadInput').click();
});

// If user uploaded the file, submit the form which has file input existed.
document.getElementById('uploadInput').addEventListener('change', () => {
	document.getElementById('uploadForm').submit();
});