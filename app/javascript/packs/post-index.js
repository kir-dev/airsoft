const navbar = document.querySelector("#mainNav")
const dropdown = document.querySelector("#mainNavDropdown")

if (typeof navbar != "undefined" && navbar != null) {
  navbar.classList.add("absolute-nav")
  navbar.classList.add("navbar-dark")
  navbar.classList.remove("navbar-light")
}

if (typeof dropdown != "undefined" && dropdown != null) {
  dropdown.classList.add("dropdown-menu-dark")
}
