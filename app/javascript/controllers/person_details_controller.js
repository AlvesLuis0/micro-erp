import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="person-details"
export default class extends Controller {
  static targets = ["personType", "individualForm", "companyForm"]

  connect() {
    this.onChangePersonType()
  }

  getPersonType() {
    return this.personTypeTarget.value
  }

  changeFormByPersonType(personType) {
    let elementToHide, elementToShow
    if(personType == "individual") {
      elementToHide = this.companyFormTarget
      elementToShow = this.individualFormTarget
    }
    else if(personType == "company") {
      elementToHide = this.individualFormTarget
      elementToShow = this.companyFormTarget
    }
    elementToHide.hidden = true
    elementToShow.hidden = false
  }

  onChangePersonType() {
    const personType = this.getPersonType()
    this.changeFormByPersonType(personType)
  }
}
