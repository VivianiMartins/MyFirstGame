inicio:
	//SOM
	//fonte: https://opengameart.org/content/old-music
	//Copyright/Attribution Notice: Alexandr Zhelanov, https://soundcloud.com/alexandr-zhelanov
	LoadMusic(1, "oldMusic.mp3")
	PlayMusic(1)
	//_________________________________________________________________________________________________________________________________//
	//IMAGENS
	//fundo fonte: https://opengameart.org/content/simple-sky-background
	fundo = LoadImage("sky.png")
	CreateSprite(1,fundo)
	SetSpriteSize(1,1430,920)
	SetSpritePosition(1,-250,-100)

	//Logo
	logo = LoadImage("conecte4.png")
	CreateSprite( 5,logo )
	SetSpriteSize(5,435,150)
	SetSpritePosition(5,250,40)

	//Botão para começar
	comecar = LoadImage("botaoVermelho.png")
	CreateSprite( 6,comecar )
	SetSpriteSize(6,215,50)
	SetSpritePosition(6,360,460)

	jogar = LoadImage("botaoAmarelo.png")
	CreateSprite( 7,jogar )
	SetSpritePosition(7,-360,-460)

	//_________________________________________________________________________________________________________________________________//
	//VARIAVEIS
	//matriz do tabuleiro:
	type tabuleiroMatriz
		ID as integer
		X as float
		Y as float
		preenchido as integer
		cor as string
	endtype

	matriz as tabuleiroMatriz[6,7]

	//preenchendo o tabuleiro
	contador as integer = 0
	contadorX as float = 130.673233
	contadorY as float = 186.280853
	
	for i = 0 to 5
		for j = 0 to 6
			matriz[i,j].ID = contador
			matriz[i,j].preenchido = 0
			matriz[i,j].cor = "N"
			matriz[i,j].X = contadorX
			matriz[i,j].Y = contadorY
			
			contadorX = contadorX + 96.5
			contador = contador + 1 
		next j
				
		contadorX = 130.673233
		contadorY = contadorY + 91.75
	next i


	//_________________________________________________________________________________________________________________________________//
	//TEXTOS INICIAIS
	CreateText(1,"Bem vindx!")
	SetTextAlignment(1,0)
	SetTextSize (1,35)
	SetTextPosition(1, 270,210)
	SetTextColor ( 1, 0, 0, 0,255 )
		
	CreateText(2,"Neste jogo centenário você terá que conectar 4 peças seguidas, em qualquer")
	SetTextAlignment(2,0)
	SetTextSize (2,35)
	SetTextPosition(2, 5, 290)
	SetTextColor ( 2, 0, 0, 0,255 )

	CreateText(3," direção. Se é iniciante, tente jogar de baixo para cima!")
	SetTextAlignment(3,0)
	SetTextSize (3,35)
	SetTextPosition(3, 150, 330)
	SetTextColor ( 3, 0, 0, 0,255 )

	CreateText(4,"É mais desafiador que o jogo da velha!")
	SetTextAlignment(4,0)
	SetTextSize (4,35)
	SetTextPosition(4, 250, 370)
	SetTextColor ( 4, 0, 0, 0,255 )
return

//botão de comaeçar - para a tela incial
Function botaoComecar(comecar as integer)
	result = 0
	// Check if the pointer has been pressed
	if GetPointerPressed()
		// Check if the pointer has hit the blinkbutton with ID buttonID that was passed into the function when called and set the return value to 1 if there's a hit
		if GetSpriteHit(getpointerx(), getpointery()) = 6 then result = 1
	endif
endfunction result

//botao de jogar - para o jogo principal
Function botaoJogar(comecar as integer)
	result = 0
	// Check if the pointer has been pressed
	if GetPointerPressed()
		// Check if the pointer has hit the blinkbutton with ID buttonID that was passed into the function when called and set the return value to 1 if there's a hit
		if GetSpriteHit(getpointerx(), getpointery()) = 7 then result = 1
	endif
endfunction result

//tela Inicial
function telaInicial( )
	DeleteSprite(6)
	DeleteText(1)
	DeleteText(2)
	DeleteText(3)
	DeleteText(4)
	
	//Nome 1
	CreateText(1,"Insira o nome do primeiro jogador:")
	SetTextAlignment(1,0)
	SetTextSize (1,35)
	SetTextPosition(1, 260, 210)
	SetTextColor ( 1, 0, 0, 0,255 )
	
	CreateEditBox(1)
	SetEditBoxPosition(1,260,250)
	SetEditBoxSize(1,450,40)
	SetEditBoxTextSize(1,35)
	SetEditBoxMaxChars(1,15)
	SetEditBoxTextColor(1,192,28,28)
	
	//Nome 2
	CreateText(2,"Insira o nome do segundo jogador:")
	SetTextAlignment(2,0)
	SetTextSize (2,35)
	SetTextPosition(2, 260, 310)
	SetTextColor ( 2, 0, 0, 0,255 )

	CreateEditBox(2)
	SetEditBoxPosition(2,260,350)
	SetEditBoxSize(2,450,40)
	SetEditBoxTextSize(2,35)
	SetEditBoxMaxChars(2,15)
	SetEditBoxTextColor(2,1248,209,7)
	
	//Botão para começar
	SetSpriteSize(7,215,50)
	SetSpritePosition(7,360,460)
	
endfunction

//tela do Jogo
function telaJogo( )
	DeleteMusic(1)
	DeleteSprite(5)
	DeleteSprite(7)
	DeleteText(1)
	DeleteText(2)
	
	//SONS
	//fonte: https://opengameart.org/content/concentration
	LoadMusic(1, "concentration.mp3")
	PlayMusic(1,1)
	
	//fonte: https://opengameart.org/content/toom-click
	//Copyright/Attribution Notice: Link to mobeyee.com
	LoadSound(2, "ToomClick.wav")
	
	//IMAGENS
	//tabuleiro: fonte = https://www.seekpng.com/png/full/377-3777584_connectbg-size-connect-4-board-transparent.png
	tabuleiro = LoadImage("board1.png")
	CreateSprite( 2, tabuleiro )
	SetSpriteSize(2, 680,552)
	SetSpritePosition(2,120,180)
	
	//borda para jogador 1
	bordaVermelha = LoadImage("bordaVermelha.png")
	CreateSprite(8, bordaVermelha)
	SetSpriteSize(8,82,80)
	SetSpritePosition(8,-1000,-1000)
	
	//Peças
	//peças jogador 1
	pecaVermelha = LoadImage("EllipseVermelha.png")
	CreateSprite(9, pecaVermelha)
	SetSpriteSize(9,82,80)
	SetSpritePosition(9,0,20)
	
	//borda para jogador 1
	bordaAmarela = LoadImage("bordaAmarela.png")
	CreateSprite(10, bordaAmarela)
	SetSpriteSize(10,82,80)
	SetSpritePosition(10,-1000,-1000)

	//peças jogador 2
	pecaAmarela = LoadImage("EllipseAmarela.png")
	CreateSprite(11, pecaAmarela)
	SetSpriteSize(11,82, 80)
	SetSpritePosition(11,525,20)

	
	//TEXTOS CABECALHO
	CreateText(1, "Jogadas restantes: ")
	SetTextAlignment(1,0)
	SetTextSize (1,35)
	SetTextPosition(1, 90,10)
	SetTextColor (1, 0, 0, 0,255)
	
	CreateText(3, "20")
	SetTextAlignment(3,0)
	SetTextSize (3,35)
	SetTextPosition(3, 320,10)
	SetTextColor (3,0, 0, 0,255)
	
	SetEditBoxPosition(1,90,70)
	SetEditBoxSize(1,250,40)
	SetEditBoxActive(1,0)
	SetEditBoxBackgroundColor(1,133,158,241,255)
	SetEditBoxBorderColor(1,133,158,241,255)
	
	CreateText(2, "Jogadas restantes: ")
	SetTextAlignment(2,0)
	SetTextSize (2,35)
	SetTextPosition(2,615,10 )
	SetTextColor ( 2,0, 0, 0,255 )
	
	CreateText(4, "20")
	SetTextAlignment(4,0)
	SetTextSize (4,35)
	SetTextPosition(4, 845,10)
	SetTextColor (4,0, 0, 0,255 )
	
	SetEditBoxPosition(2,615,70)
	SetEditBoxSize(2,250,40)
	SetEditBoxActive(2,0)
	SetEditBoxBackgroundColor(2,133,158,241,255)
	SetEditBoxBorderColor(2,133,158,241,255)
	
	
	//Criando as peças
	for i = 0 to 39
		CreateSprite(12+i, pecaVermelha)
		SetSpriteSize(12+i,82,80)
		SetSpritePosition(12+i,Random(200,600),Random(200,600))
		SetSpriteVisible(12+i,0)
	
		i = i+1
		
		CreateSprite(12+i, pecaAmarela)
		SetSpriteSize(12+i,82,80)
		SetSpritePosition(12+i,Random(100,500),Random(100,500))
		SetSpriteVisible(12+i,0)
	
		sync()
	next i

endfunction
	
//_________________________________________________________________________________________________________________________________//
//visualizando a matriz, tem que ativar p ver todos os componentes iniciais
function imprimirTabuleiro(matriz as tabuleiroMatriz[][])
        for i = 0 to 5
			for j = 0 to 6
				PrintC("li")
				PrintC(i)
				PrintC("col")
				PrintC(j)
				printC(matriz[i, j].ID)
				printC("-")
				printC(matriz[i, j].preenchido )
				printC("-")
				printC( matriz[i, j].cor)
				printC("-")
				printC(matriz[i, j].X)
				printC("-")
				printC( matriz[i, j].Y)
				printC(" // ")
			next j
			print (" ")
        next i
endfunction
