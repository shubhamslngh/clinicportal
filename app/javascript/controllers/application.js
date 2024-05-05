import { Application } from "@hotwired/stimulus"
import Chartkick from 'chartkick';
import Chart from 'chart.js';
const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application
Chartkick.addAdapter(Chart);
window.Chartkick = Chartkick;
export { application }
