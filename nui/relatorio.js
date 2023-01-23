const send = document.querySelector("#publicar")
send.addEventListener("click",function() {
    let desc = $('.textareapublicar').val()
    if (desc) {
        $.post('http://tabletpolicial_v2/Relatorio', JSON.stringify({ desc }), (data) => {
            Notify('Relatório anexado.', 1500, 'check')
            $('.textareapublicar').val('')
            VerificarRelatorio()
        })
    } else {
        Notify('Você não anexou nada.', 1500, 'error')
    }
})

function VerificarRelatorio() {
    $.post('http://tabletpolicial_v2/VerificarRelatorios', (data) => {
        $('.relatorio-name').html(`
            <h1></h1>
            <div class="infosa">
                <div class="infosa-header">
                    <h2>Descrição</h2> 
                    <h2>Data</h2>
                </div>
                <div class="infosa-body">
                    ${data.relatorio.map(boletim => {
                        return `
                            <div class="infosa-body-item">  
                                <div>${boletim.descricao}</div>
                                <div>${boletim.data}</div>
                            </div>
                            `
                    }).join("")}
                </div>
            </div>
        `);
    })
}