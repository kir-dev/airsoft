
$("#pop").on("click", function() {
    $('#imagepreview').attr('src', $('#imageresource').attr('src')); // here asign the image to the modal when the user click the enlarge link
    $('#imagemodal').modal('show'); // imagemodal is the id attribute assigned to the bootstrap modal, then i use the show function
 });
 
 //https://stackoverflow.com/questions/25023199/in-bootstrap-open-enlarge-image-in-modal