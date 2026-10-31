let percentualPerda = 0.05; 
let percentualResidual = 0.005;

function financeiro() {
    let metano = Number(ipt_metano.value);
    let preco = Number(ipt_venda.value);
    let perdaMensalReal = metano * preco * percentualPerda;
    let perdaAnual = perdaMensalReal * 12;
    let perdaMetano = metano * percentualPerda;
    let dias = (percentualPerda * 365).toFixed(0);
    let economia = metano * (percentualPerda - percentualResidual) * preco * 12;

    if (isNaN(metano) || isNaN(preco) || metano === 0 || preco === 0) {
        resultadoCalculadora.innerHTML = `<span>R$</span> 0,00`;
        metanoMensal.innerHTML = `0,00 M³`;
        perdaMensal.innerHTML = `<span>R$</span> 0,00`;
        return;
    }

    resultadoCalculadora.innerHTML = `<span>R$</span> ${economia.toLocaleString('pt-BR', { minimumFractionDigits: 2, maximumFractionDigits: 2 })}`;
    
    metanoMensal.innerHTML = `${perdaMetano.toLocaleString('pt-BR', { minimumFractionDigits: 2, maximumFractionDigits: 2 })} M³`;
    
    perdaMensal.innerHTML = `<span>R$</span> ${perdaMensalReal.toLocaleString('pt-BR', { minimumFractionDigits: 2, maximumFractionDigits: 2 })}`;

    resultadoDetalhado.innerHTML = `Em 12 Meses, são ${perdaAnual.toLocaleString('pt-BR', {minimumFractionDigits:2, maximumFractionDigits:2})} em gás que sai pela atmosfera em vez de virar faturamento. É o mesmo que ficar ${dias} dias por ano sem vender nada. <br> 
    Em usinas com detecção contínua e reparo rápido, a perda medida cai para cerca de 0,5%. A diferença pode voltar para o seu caixa: R$ ${economia.toLocaleString('pt-BR', { minimumFractionDigits: 2, maximumFractionDigits: 2 })} por ano.`
}

ipt_metano.addEventListener('input', financeiro, );
ipt_venda.addEventListener('input', financeiro);

// Usei de diferente as funções de transformação de valores para o Reak, o toLocaleString('pt-BR', { minimumFractionDigits: 2, maximumFractionDigits: 2 }) e o addEventListener('input', financeiro) que atualiza o resultado enquanto a gente clica.