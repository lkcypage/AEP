programa {
  inclua biblioteca Tipos --> tp
  cadeia acoes[15][9]
  inteiro linha = 0

  funcao inicio() {
    inteiro op, i = 0, j = 0
    faca {
      escreva("\n===== MENU =====\n1 - Cadastrar\n2 - Buscar\n3 - Atualizar Situação\n4 - Gerar Relatório\n5 - Sair\nR: ")
      leia(op)
      
      escolha(op) {
        caso 1:
          cadastro()
          pare
        caso 2:
          buscaTodos(i, j)
          buscaPesquisa(i, j)
          pare
        caso 3:
          buscaTodos(i, j)
          atualizar()
          pare
        caso 4:
          gerarRelatorio(i, j)
          pare
        caso 5:
          escreva("Encerrando Programa...")
          pare
        caso contrario:
          escreva("Opção Inválida!!!\n")
          pare
      }
    } enquanto(op != 5)
  }

  funcao cadastro() {
    inteiro opcao
    se (linha < 15) {
      escreva("\n===== CADASTRO =====\n")
      escreva("Informe o Código: ")
      leia(acoes[linha][0])
      escreva("Informe a Escola: ")
      leia(acoes[linha][1])
      escreva("Informe o Tema: ")
      leia(acoes[linha][2])
      escreva("Informe a Data Prevista: ")
      leia(acoes[linha][3])
      escreva("Informe o Público alvo: ")
      leia(acoes[linha][4])
      escreva("Informe o Responsável: ")
      leia(acoes[linha][5])
      escreva("Informe a Quantidade prevista de participantes: ")
      leia(acoes[linha][6])
      escreva("Informe a Situação da Ação:\n1 - Planejada\n2 - Realizada\n3 - Cancelada\nR:")
      leia(opcao)
      escolha (opcao){
        caso 1:
          acoes[linha][7] = "Planejada"
          pare
        caso 2:
          acoes[linha][7] = "Realizada"
          pare
          
        caso 3:
          acoes[linha][7] = "Cancelada"
          pare
        caso contrario:
          escreva("Opção inválida! Para atualizar a situação atual da ação, vá em 'ATUALIZAR SITUAÇÃO'!")
          pare
      }
      linha++
    } senao {
      escreva("\nErro: Limite de cadastros atingido (máximo 15).\n")
    }
  }

  funcao buscaTodos(inteiro i, inteiro j) {
      para(i = 0; i < linha; i++) {
        escreva("\n")
        para(j = 0; j < 9; j++) {
          escreva(acoes[i][j], " - ")
        }
      }
  }
  funcao buscaPesquisa(inteiro i, inteiro j){
    cadeia entrada, base = "\nRESULTADO DA PESQUISA:\n", mensagem = base
    escreva("\nEscreva a Palavra Chave!\nR: ")
    leia(entrada)
    para(i = 0; i < linha; i++){
      para(j = 0; j < 9; j++){
        se(entrada == acoes[i][j]){
          para(inteiro h = i; h == i; h++ ){
            escreva("\n")
            para(inteiro g = 0; g < 9; g++){
              mensagem += acoes[h][g] + " - "
            }
          }
        }
      }
    }
    se(mensagem != base){
      escreva(mensagem)
    }senao{
      escreva("Nenhum Resultado Para Sua Busca!!!")
    }
  }
  funcao atualizar(){
    inteiro id, opcao
    escreva("\nInforme o Código da ação que você deseja Atualizar a Situação: ")
    leia(id)
    escreva("\nInforme a Nova Situação da Ação! Caso não queira editar o valor selecionada, apenas repita o valor atual!\nAtual: ", acoes[id -1][7], "\n")
    escreva("\nInforme a Situação da Ação:\n1 - Planejada\n2 - Realizada\n3 - Cancelada\nR:")
    leia(opcao)
    inteiro registro = id - 1
    

  }
  funcao gerarRelatorio(inteiro i, inteiro j) {
    inteiro planejada = 0, realizada = 0, cancelada = 0
    inteiro totalPrevisto = 0, totalRealizado = 0
    real porcentagem = 0.0

    para(i = 0; i < linha; i++) {
      se(acoes[i][7] == "Planejada"){
          planejada += 1
      } 
      senao se(acoes[i][7] == "Realizada"){
          realizada += 1
          totalPrevisto += tp.cadeia_para_inteiro(acoes[i][6], 10)
          totalRealizado += tp.cadeia_para_inteiro(acoes[i][8], 10)

      }
      senao se(acoes[i][7] == "Cancelada"){
          cancelada += 1
      }
    }

    se (totalPrevisto > 0) {
        porcentagem = totalRealizado * 100 / totalPrevisto
    }

    escreva("\n===== RELATÓRIO GERAL =====")
    escreva("\nAções Planejadas: ", planejada)
    escreva("\nAções Realizadas: ", realizada)
    escreva("\nAções Canceladas: ", cancelada)
    escreva("\nDentro das Realizadas:")
    escreva("\nTotal de Participantes Previstos: ", totalPrevisto)
    escreva("\nTotal de Participantes Reais: ", totalRealizado)
    escreva("\nPorcentagem da Participação: ", porcentagem, "%\n")
  }
}