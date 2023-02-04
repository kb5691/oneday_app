import Rails from '@rails/ujs';
import Turbolinks from 'turbolinks';
import * as ActiveStorage from '@rails/activestorage';
import 'channels';
import Chart from 'chart.js/auto';
import 'bootstrap/dist/js/bootstrap';
import '@fortawesome/fontawesome-free/js/all';

Rails.start();
Turbolinks.start();
ActiveStorage.start();

// chart.js
global.Chart = Chart;
require('./graph');
