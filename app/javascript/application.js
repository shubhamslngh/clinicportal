// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@hotwired/turbo-rails"
import Chartkick from 'chartkick';
import Chart from 'chart.js';
Rails.start();


Chartkick.addAdapter(Chart);
window.Chartkick = Chartkick;