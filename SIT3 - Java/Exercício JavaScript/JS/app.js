// Adicionar um "escutador" no botao para rodar funcao ao ser clicado
var botao = document.getElementById("botao");

botao.addEventListener('click', function(){
	// Ao ser clicado, deve ler e guardar os dados das caixas
	var caixaOrigem = document.getElementById("caixaOrigem");  //pega objeto da caixa de texto
	var origem = caixaOrigem.value;

	var caixaDestino = document.getElementById("caixaDestino");  //pega objeto da caixa de texto
	var destino = caixaDestino.value;	

	// Roda funcao do google maps para calcular rota (implementar)
	//calculaRota(origem, destino);

	// Adiciona a busca no historico
	atualizaHistorico(origem, destino);
});




function atualizaHistorico(origem, destino){
	// Pega o objeto de historico de busca
	var listaHistorico = document.getElementById("historico");

	// Cria elemento de lista
	var item = document.createElement("li");

	// Coloca texto no elemento 
	item.textContent = "Origem: " + origem + " Destino: " + destino;

	// Adiciona o elemento criado a lista
	listaHistorico.appendChild(item);

	// Adicionar Tempo da rota de cada busca
}


//Configuracao do mapa do Google Maps
var map;
function initMap() {
  map = new google.maps.Map(document.getElementById('mapa'), {
    center: {lat: -34.397, lng: 150.644},
    zoom: 8
  });
}