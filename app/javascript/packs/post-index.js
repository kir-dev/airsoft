const navbar = document.querySelector("#mainNav")
const dropdowns = document.querySelectorAll("#mainNavDropdown")

if (typeof navbar != "undefined" && navbar != null) {
  navbar.classList.add("absolute-nav")
  navbar.classList.add("navbar-dark")
  navbar.classList.remove("navbar-light")
}

if (typeof dropdowns != "undefined" && dropdowns != []) {
  dropdowns.forEach(d => d.classList.add("dropdown-menu-dark"))
}
