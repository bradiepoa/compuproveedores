jQuery.extend(jQuery.validator.messages, {
  required: "Este campo es obligatorio.",
  remote: "Por favor, rellena este campo.",
  email: "Dirección de correo no válida",
  url: "URL no válida.",
  date: "Fecha válida.",
  dateISO: "Por favor, escribe una fecha (ISO) válida.",
  number: "Por favor, escribe un número entero válido.",
  digits: "Sólo números.",
  creditcard: "Por favor, escribe un número de tarjeta válido.",
  equalTo: "Por favor, escribe el mismo valor de nuevo.",
  accept: "Por favor, escribe un valor con una extensión aceptada.",
  maxlength: jQuery.validator.format("Máximo {0} caracteres."),
  minlength: jQuery.validator.format("Mínimo {0} caracteres."),
  rangelength: jQuery.validator.format("Escribe un valor entre {0} y {1} caracteres."),
  range: jQuery.validator.format("Escribe un valor entre {0} y {1}."),
  max: jQuery.validator.format("Valor menor o igual a {0}."),
  min: jQuery.validator.format("Valor mayor o igual a {0}.")
});
