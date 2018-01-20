function isScrolledIntoView(el) {
  var elemTop = el.getBoundingClientRect().top;
  var elemBottom = el.getBoundingClientRect().bottom;

  // Only completely visible elements return true:
  //var isVisible = (elemTop >= 0) && (elemBottom <= window.innerHeight);
  //var isVisible = (elemTop >= window.innerHeight+50);
  // Partially visible elements return true:
  var isVisible = elemTop < window.innerHeight-100 && elemBottom >= 0;
 
  return isVisible;
  
}

function myScript(cl) {
  //var marquees = document.getElementsByClassName(cl);
  var elem = document.getElementsByTagName(cl);

  for (i = 0; i < elem.length; i++) {
    if (isScrolledIntoView(elem[i])) {
      elem[i].classList.add("visible");
    } else {
      //marquees[i].classList.remove("visible");
    }
  }
}

window.onscroll = function() {myScript("p")};