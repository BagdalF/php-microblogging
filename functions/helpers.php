<?php
function escape($string) {
    return htmlspecialchars($string, ENT_QUOTES, 'UTF-8');
}

function toUpperCase($string) {
    return strtoupper($string);
}

function toLowerCase($string) {
    return strtolower($string);
}

function capitalize($string) {
    return ucwords(strtolower($string));
}
?>