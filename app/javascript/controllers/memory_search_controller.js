import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["list", "input"];

  filterVideo(e) {
    e.preventDefault();
    this.#filter("video");
  }

  filterPhoto(e) {
    e.preventDefault();
    this.#filter("photo");
  }

  filterAudio(e) {
    e.preventDefault();
    this.#filter("audio");
  }

  filterTextMemory(e) {
    e.preventDefault();
    this.#filter("text_memory");
  }

  search(e) {
    const url = new URL(window.location.href);
    url.searchParams.set("media", "all");
    url.searchParams.set("query", e.target.value);
    if (e.key === "Enter") {
      e.preventDefault();
    }
    fetch(url, {
      headers: { accept: "text/plain" },
    })
      .then((response) => response.text())
      .then((data) => {
        this.listTarget.innerHTML = data;
        console.log(url)
      });
  }

  #filter(mediaType, userInput = null) {
    const url = new URL(window.location.href);

    url.searchParams.set("media", mediaType);
    if (userInput) {
      url.searchParams.set("query", userInput);
    }

    fetch(url, {
      headers: { accept: "text/plain" },
    })
      .then((response) => response.text())
      .then((data) => {
        this.listTarget.innerHTML = data;
      });
  }
}
