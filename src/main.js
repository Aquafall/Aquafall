import './app.css'
import App from './App.svelte'

const app = new App({
  target: document.getElementById('app'),
})

export default app

function handleErrors(event) {
  event.preventDefault();
  let crasherr=event.reason
  // state="crash"
  console.log(event)
  document.body.innerHTML = "<div class=\"crashscreen\"><img src=\"./logo.svg\" alt=\"logo\" class=\"crashLogo\" /><h1> Aquafall crashed! </h1> <p> Error: "+crasherr+"</p></div>"

}

window.addEventListener("error", handleErrors, {passive: false})
window.addEventListener("unhandledrejection", handleErrors, {passive: false})