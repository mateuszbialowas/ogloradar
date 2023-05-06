import {Controller} from "@hotwired/stimulus";

export default class extends Controller {
    connect() {
        this.element.classList.add('animate__animated', 'animate__fadeInRight', 'animate__faster');
    }

    close() {
        this.element.classList.remove('animate__fadeInRight');
        this.element.classList.add('animate__fadeOutRight');

        this.element.addEventListener('animationend', () => {
            this.element.remove();
        });
    }

    disconnect() {
        this.element.remove();
    }
}
