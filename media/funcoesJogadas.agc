#include "funcoesIniciais.agc"
rodada as integer = 100
contadorPecas as integer = 12
conta as integer = 0

//jogadas totais
jogadasPlayer1 as integer = 20
jogadas1 as string = ""
jogadasPLayer2 as integer = 20
jogadas2 as string = ""

//pegar posições na tela
posicaoX as float = 0
posicaoY as float= 0

//jogadores
player1 as String = "v"
player2 as String = "a"	
player as String = "e"
total = 0

//A parte principal, quando os jogares clicam
jogada_principal:
	if rodada >= 0 and rodada<41	
		conta = Mod(rodada, 2)
		
		
		if (rodada = 1)
			DeleteText(3) 
		endif
		if (rodada = 2)
			DeleteText(4) 
		endif
		Gosub total_de_jogadas
		
		if conta =0
			if (GetPointerPressed ( ) = 0) 
				x# = GetPointerX ( )
				y# = GetPointerY ( )
				SetSpritePosition(8, x#, y#)
			endif
					
			if (GetPointerPressed ( ) = 1) 
				x# = GetPointerX ( )
				y# = GetPointerY ( )
				posicaoX = x#
				posicaoY = y#
				
				//SetSpritePosition(contadorPecas,posicaoX,posicaoY)
				//SetSpriteVisible(contadorPecas, 2)
				
				player = player1
				
				Gosub preenchendo_matriz
				Gosub contador_vencedor_horizontalmente
				Gosub contador_vencedor_verticalmente
				Gosub contador_vencedor_diagonal_DE
				Gosub contador_vencedor_diagonal_ED
				
				rodada = rodada + 1
				contadorPecas = contadorPecas + 1
				jogadasPlayer1 = jogadasPlayer1 - 1
			endif	

		endif
			
		if conta = 1
			if (GetPointerPressed ( ) = 0) 
				x# = GetPointerX ( )
				y# = GetPointerY ( )
				SetSpritePosition(10, x#, y#)
			endif
						
			if (GetPointerPressed ( ) = 1) 
				x# = GetPointerX ( )
				y# = GetPointerY ( )
				posicaoX = x#
				posicaoY = y#
					
				//SetSpritePosition(contadorPecas,posicaoX,posicaoY)
				//SetSpriteVisible(contadorPecas, 2)
				
				player = player2
				
				Gosub preenchendo_matriz
				Gosub contador_vencedor_horizontalmente
				Gosub contador_vencedor_verticalmente
				Gosub contador_vencedor_diagonal_DE
				Gosub contador_vencedor_diagonal_ED

				rodada = rodada + 1
				contadorPecas = contadorPecas + 1
				jogadasPlayer2 = jogadasPlayer2 - 1
			endif
		endif
	endif
			
	if rodada = 41
		DeleteSprite(2)
		
		for m = 8 to 52
			DeleteSprite(m)
		next m
		
		DeleteEditBox(1)
		DeleteEditBox(2)
		
		DeleteText(1)
		DeleteText(2)
		DeleteText(Texto1)
		DeleteText(Texto2)
	
		gameover = CreateText("Game Over")
		SetTextAlignment(gameover,0)
		SetTextSize (gameover,100)
		SetTextPosition(gameover, 270,300)
		SetTextColor (gameover,0, 0, 0,255 )
	endif
	
	
return


preenchendo_matriz:
	//Variávais para verificar a matriz
	aproximacao as float = 0.000000
	valorMaiorX as float = 0.0
	valorMaiorY as float = 0.0
	valorMenorX as float = 0.0
	valorMenorY as float = 0.0
	
	for i = 0 to 5
			for j = 0 to 6
				aproximacao = 0.0000000
				
				for k = 0 to 499999
					valorMaiorY = posicaoY + aproximacao
					valorMenorY = posicaoY - aproximacao
					
					if (matriz[i,j].Y) = valorMaiorY or (matriz[i,j].Y) = valorMenorY
						
						for l = i to 5
								for c = 0 to 6
									aproximacao = 0.0000000
									
									for t = 0 to 499999
										valorMaiorX = posicaoX + aproximacao
										valorMenorX = posicaoX - aproximacao
										
										if (matriz[i,j].X) = valorMaiorX or (matriz[i,j].X) = valorMenorX
											matriz[i,j].preenchido = 1
											matriz[i,j].cor = player 
											PlaySound(2)
											
											if player = "v"
												SetSpritePosition(contadorPecas,matriz[i,j].X,matriz[i,j].Y)
												SetSpriteVisible(contadorPecas, 2)
											endif
											
											if player = "a"
												SetSpritePosition(contadorPecas,matriz[i,j].X,matriz[i,j].Y)
												SetSpriteVisible(contadorPecas, 2)
											endif
											
											se1 = 2
											i = 5
											j = 6
											k=499999
											
											l=5
											c=6
											t=499999
											
										endif
										
									aproximacao = aproximacao + 0.00001
								next t
							next c
						next l

					endif
					
				aproximacao = aproximacao + 0.00001
			next k
		next j
	next i
		
return

total_de_jogadas:
	if (total = 0 ) or (rodada<>41)
		if player = "v"
			if (jogadasPlayer1 <> 20 or jogadasPlayer1 =-1)
				DeleteText(Texto1)
			endif
				
			jogadas1 = Str(jogadasPlayer1)
				
			Texto1 = CreateText(jogadas1)
			SetTextAlignment(Texto1,0)
			SetTextSize (Texto1,35)
			SetTextPosition(Texto1, 320,10)
			SetTextColor (Texto1,0, 0, 0,255 )
			
		endif
		
		if player = "a"
			if (jogadasPlayer1 <> 20 or jogadasPlayer1 = -1)
				DeleteText(Texto2)
			endif
				
			jogadas2 = Str(jogadasPlayer2)
				
			Texto2 = CreateText(jogadas2)
			SetTextAlignment(Texto2,0)
			SetTextSize (Texto2,35)
			SetTextPosition(Texto2, 845,10)
			SetTextColor (Texto2,0, 0, 0,255 )	
		endif
	endif
	
return

contador_vencedor_horizontalmente:
	for i = 0 to 5
		for j = 0 to 3
			
			if player = "v"
				if matriz[i,j].cor = "v" and matriz[i,j+1].cor = "v" and matriz[i,j+2].cor = "v" and matriz[i,j+3].cor = "v"
						total = 4
				endif
			endif
			
			if player = "a"
				if matriz[i,j].cor = "a" and matriz[i,j+1].cor = "a" and matriz[i,j+2].cor = "a" and matriz[i,j+3].cor = "a"
						total = 4
				endif
			endif
		next j
	next i
	
	Gosub final_ganhador
return

contador_vencedor_verticalmente:
	for i = 0 to 2
		for j = 0 to 6
			
			if player = "v"
				if matriz[i,j].cor = "v" and matriz[i+1,j].cor = "v" and matriz[i+2,j].cor = "v" and matriz[i+3,j].cor = "v"
						total = 4
				endif
			endif
			
			if player = "a"
				if matriz[i,j].cor = "a" and matriz[i+1,j].cor = "a" and matriz[i+2,j].cor = "a" and matriz[i+3,j].cor = "a"
						total = 4
				endif
			endif
		next j
	next i
	
	Gosub final_ganhador
return

contador_vencedor_diagonal_DE:
	 k = 0
	 l = 6
	while k < 4
        while l > 2
			if player = "v"
				if matriz[k,l].cor = "v" and matriz[k+1,l-1].cor = "v" and matriz[k+2,l-2].cor = "v" and matriz[k+3,l-3].cor = "v"
						total = 4
				endif
			endif
			
			if player = "a"
				if matriz[k,l].cor = "a" and matriz[k+1,l-1].cor = "a" and matriz[k+2,l-2].cor = "a" and matriz[k+3,l-3].cor = "a"
						total = 4
				endif
			endif
			
			l = l-1
		endwhile
		
		k = k+1
		l = 6
	endwhile
	
	Gosub final_ganhador
return

contador_vencedor_diagonal_ED:
	m = 0
	n = 0
	while m < 3
        while n < 5
			if player = "v"
				if matriz[m,n].cor = "v" and matriz[m+1,n+1].cor = "v" and matriz[m+2,n+2].cor = "v" and matriz[m+3,n+3].cor = "v"
						total = 4
				endif
			endif
			
			if player = "a"
				if matriz[m,n].cor = "a" and matriz[m+1,n+1].cor = "a" and matriz[m+2,n+2].cor = "a" and matriz[m+3,n+3].cor = "a"
						total = 4
				endif
			endif
			
			n = n+1
		endwhile
		
		m = m+1
		n = 0
	endwhile
	
	Gosub final_ganhador
return

final_ganhador:
	if total = 4
		y = 120
		
		DeleteMusic(1)
		DeleteMusic(2)
		DeleteSprite(2)
		DeleteSprite(8)
		DeleteSprite(10)
		
		for m = 12 to 52
			DeleteSprite(m)
		next m
		
			
		vencedor = CreateText("Temos um vencedor!!!")
		SetTextAlignment(vencedor,0)
		SetTextSize (vencedor,100)
		SetTextPosition(vencedor, 90,300)
		SetTextColor (vencedor,0, 0, 0,255 )
		
		if player = "v"
			SetEditBoxSize(1,250,80)
			SetEditBoxPosition(1,350,400)
			SetEditBoxTextSize(1,150)
			SetEditBoxTextColor(1,14,22,48)
			SetEditBoxBackgroundColor(1,192,205,248,0)
			SetEditBoxBorderColor(1,192,205,248,0)
			
			for i = 12 to 52
				pecaVermelha = LoadImage("EllipseVermelha.png")
				CreateSprite(i, pecaVermelha)
				SetSpriteSize(i,82,80)
				SetSpritePosition(i,Random(0,840),y+(Random(1,500)))
				SetSpriteVisible(i,1)
			next i
			
		endif
		
		if player = "a"
			SetEditBoxSize(2,250,80)
			SetEditBoxPosition(2,350,400)
			SetEditBoxTextSize(2,150)
			SetEditBoxTextColor(2,14,22,48)
			SetEditBoxBackgroundColor(2,192,205,248,0)
			SetEditBoxBorderColor(2,192,205,248,0)
			
			for j = 12 to 52
				pecaAmarela = LoadImage("EllipseAmarela.png")
				CreateSprite(j, pecaAmarela)
				SetSpriteSize(j,82,80)
				SetSpritePosition(j,Random(1,840),y+(Random(1,500)))
				SetSpriteVisible(j,1)
			next j
			
		endif
	endif
	
	
return

