const funcionarios = [
    "Agatha", "Geovana", "Guillia", "Laura", "Letícia", "Sarah",
    "Julio Aparecido", "Matheus Bassi", "Julio Cesar", "Lucca", "Vinicius", "Andrew",
    "Steven Gabriel", "Camilla", "Karen", "Alikeyla", "Maria Eduarda", "Manuela",
    "Maria Victoria", "Isabella Holanda", "Matheus Alves", "Maria Eduarda Santos",
    "Vitoria", "Flavia Libonátti", "Delfa"
];

const select = document.getElementById("funcionario");
const tabela = document.getElementById("tabela");

// carregar funcionários
funcionarios.forEach(nome => {
    let option = document.createElement("option");
    option.value = nome;
    option.textContent = nome;
    select.appendChild(option);
});

// carregar dados salvos
let registros = JSON.parse(localStorage.getItem("registros")) || [];

function salvar() {
    localStorage.setItem("registros", JSON.stringify(registros));
}

// registrar ponto
function registrar(tipo) {
    let nome = select.value;
    if (!nome) return alert("Selecione um funcionário!");

    let agora = new Date();
    let data = agora.toISOString().split("T")[0];
    let hora = agora.toLocaleTimeString();

    let registro = {
        nome,
        tipo,
        data,
        hora,
        horas: "-"
    };

    // calcular horas se for saída
    if (tipo === "saida") {
        let entrada = registros.reverse().find(r => r.nome === nome && r.tipo === "entrada");
        registros.reverse();

        if (entrada) {
            let inicio = new Date(`${entrada.data} ${entrada.hora}`);
            let fim = new Date(`${data} ${hora}`);
            let diff = (fim - inicio) / 1000 / 60 / 60;
            registro.horas = diff.toFixed(2) + "h";
        }
    }

    registros.push(registro);
    salvar();
    render();
}

// renderizar tabela
function render(lista = registros) {
    tabela.innerHTML = "";

    lista.forEach((r, index) => {
        let linha = document.createElement("tr");

        linha.innerHTML = `
            <td>${r.nome}</td>
            <td>${r.tipo.toUpperCase()}</td>
            <td>${r.data}</td>
            <td>${r.hora}</td>
            <td>${r.horas}</td>
            <td><button onclick="excluir(${index})">🗑️</button></td>
        `;

        tabela.appendChild(linha);
    });
}

// excluir
function excluir(index) {
    registros.splice(index, 1);
    salvar();
    render();
}

// filtro por data
function filtrar() {
    let data = document.getElementById("filtroData").value;
    if (!data) return render();

    let filtrados = registros.filter(r => r.data === data);
    render(filtrados);
}

// iniciar
render();