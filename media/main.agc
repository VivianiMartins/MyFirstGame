
// show all errors
SetErrorMode(0)

// set window properties
SetWindowTitle( "Jogo Conecte 4" )
SetWindowSize( 640, 512, 0 )
SetWindowAllowResize( 1 ) // allow the user to resize the window

// set display properties
SetVirtualResolution( 920, 768 ) // doesn't have to match the window
SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 30, 0 ) // 30fps instead of 60 to save battery
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
UseNewDefaultFonts( 1 ) // since version 2.0.22 we can use nicer default fonts

//_________________________________________________________________________________________________________________________________//
//inserindo as funcoes do jogo
#include "funcoesIniciais.agc"
#include "funcoesJogadas.agc"

Gosub inicio

//looping principal
do
	//visualização da matriz
	//imprimirTabuleiro(matriz)
	
	//abrir inicial para inserir os nomes
	 if botaoComecar(comecar) 
        Sync()
		telaInicial()
	endif
	
	//abrir jogo
	if botaoJogar(jogar) 
		Sync()
		telaJogo( )
		rodada = 0	
	endif
	
	Gosub jogada_principal

	sync ( )
loop
