// array with all images for the token
let shapes = [
  { 
     img: 'Tokens/human/archers/119798-M_Human_Archer.png',
     height: 1,
     width: 1
  },
  { 
     img: 'Tokens/human/archers/Human_M_Armored_Archer_hi.png',
     height: 2,
     width: 2
  },
  {
    img: 'Tokens/human/archers/Human_Male_Archer3_02_hi.png',
    height: 2,
    width: 1
  },
  // you can add more shapes here, following the pattern above.
];
 
let index = 0;
let tok = canvas.tokens.controlled[0];
 
// check which is the current image
shapes.some(shape => {
  if (tok.data.img == shape.img) {
    return true;
  }  
  index++;
  return false;
});
 
// defines what will be the next image in the array
if (index >= shapes.length - 1) {
  index = 0;
} else {
  index++;
}
 
// updates the token
tok.update({img: shapes[index].img, height: shapes[index].height, width: shapes[index].width});


setTimeout(function(){
document.dispatchEvent(new Event('touchstart'));
},2000);
