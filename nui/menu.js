StartPage = 'pesquisar'
Atualpage = 'pesquisar'

$(document).ready(function () {

    window.addEventListener("message", function (event) {
        switch (event.data.action) {
            case "openSystem":
                $("body").fadeIn(300);
                break;

            case "closeSystem":
                $("body").fadeOut(300);
                break;
        };
    });

    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post("http://tabletpolicial_v2/closeSystem");
        };
    };
});

$(document).on("click", ".pesquisar", () => {
    Atualpage = 'pesquisar'

    $('.pesquisar').addClass('open')
    $('.prender').removeClass('open')
    $('.relatorio').removeClass('open')
    $('.multar').removeClass('open')

    $('#search').fadeIn(500)
    $('#prender').hide()
    $('#relatorio').hide()
    $('#multar').hide()
})

$(document).on("click", ".prender", () => {
    Atualpage = 'prender'

    $('.pesquisar').removeClass('open')
    $('.prender').addClass('open')
    $('.multar').removeClass('open')
    $('.relatorio').removeClass('open')

    $('#search').hide()
    $('#multar').hide()
    $('#relatorio').hide()
    $('#prender').fadeIn(500)
})

$(document).on("click", ".multar", () => {
    Atualpage = 'multar'

    $('.pesquisar').removeClass('open')
    $('.prender').removeClass('open')
    $('.multar').addClass('open')
    $('.relatorio').removeClass('open')

    $('#search').hide()
    $('#prender').hide()
    $('#relatorio').hide()
    $('#multar').fadeIn(500)
})

$(document).on("click", ".relatorio", () => {
    Atualpage = 'relatorio'

    $('.pesquisar').removeClass('open')
    $('.prender').removeClass('open')
    $('.relatorio').addClass('open')
    $('.multar').removeClass('open')

    $('#search').hide()
    $('#prender').hide()
    $('#multar').hide()
    $('#relatorio').fadeIn(500)
    VerificarRelatorio()
})

window.addEventListener("message", function (event) {
    $('.fake-input h2').html(`${event.data.horario}`)
});