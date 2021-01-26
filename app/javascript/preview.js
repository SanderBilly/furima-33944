if(document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  function preview(){
    const ImagePreview = document.getElementById('image-preview');

    function createImageHTML(blob){
      const imageElement = document.createElement('div');

      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('class', 'preview-image');
      
      imageElement.appendChild(blobImage);
      ImagePreview.appendChild(imageElement);
    };

    document.getElementById('image-field').addEventListener('change', (e) => {
      const imageContent = document.querySelector('.preview-image');
      if (imageContent){
        imageContent.remove();
      }
      
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  }
  window.addEventListener("load", preview);
}