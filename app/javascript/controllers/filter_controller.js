import { Controller } from "stimulus";

export default class extends Controller {
 static targets = [ 'listings', 'formContainer' ];

  refresh() {
      const form = this.formContainerTarget.querySelector("form");
      // Rails.fire(form, 'submit');
      form.submit();
  }
}