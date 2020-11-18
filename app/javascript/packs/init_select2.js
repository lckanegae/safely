import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2({ width: "80%" });
};

export { initSelect2 };