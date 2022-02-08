// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

function openBurger() {
  document.querySelector(".burger-fixed-container").classList.remove('closed')
}

function closeBurger() {
  document.querySelector(".burger-fixed-container").classList.add('closed')
}
document.querySelector(".navbar > ul > a").addEventListener('click', openBurger)
document.querySelector(".close-hamburger-btn").addEventListener('click', closeBurger)