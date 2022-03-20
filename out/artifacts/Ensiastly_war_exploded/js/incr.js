function incrementValue()
{
    var value = parseInt(document.getElementById('number').value);
    value = isNaN(value) ? 0 : value;
    value++;
    document.getElementById('number').value = value;
}
function decrementValue()
{
    var value = parseInt(document.getElementById('number1').value);
    value = isNaN(value) ? 0 : value;
    value--;
    document.getElementById('number').value = value;
}