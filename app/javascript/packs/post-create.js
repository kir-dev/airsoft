const imageField = document.querySelector("#imagefield")
const clearButton = document.querySelector("#clearbtn")

const clearField = () => {
  if (typeof imageField != "undefined" && imageField != null) {
    imageField.value = ""
  }
}
clearButton.addEventListener("click", clearField)
