const buildHTML = (XHR) => {
  const item = XHR.response.list;
  const html = `
  de-ta
`;
  return html
}


function moreWorks() {
  const more = document.getElementById('moreindex');

  more.addEventListener('click',() => {
    const XHR = new XMLHttpRequest();
    XHR.open("GET", "/works", true);
    XHR.responseType = "json";
    XHR.send()
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
    const index = document.getElementById('more-lists');
    index.insertAdjacentHTML("beforebegin", buildHTML(XHR));
    };
  });
};

window.addEventListener('load',moreWorks);