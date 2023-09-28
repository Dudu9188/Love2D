local retangulo1 = { x = 100, y = 100, largura = 50, altura = 50 }
local retangulo2 = { x = 200, y = 200, largura = 50, altura = 50 }

function love.draw()
   --
   love.graphics.rectangle("fill", retangulo1.x, retangulo1.y, retangulo1.largura, retangulo1.altura)
   love.graphics.rectangle("fill", retangulo2.x, retangulo2.y, retangulo2.largura, retangulo2.altura)
end

function love.update(dt)
   local movimentoX = 0
   local movimentoY = 0

   -- Verifica a colisão
   if retangulo1.x <= retangulo2.x + retangulo2.largura and
       retangulo1.x + retangulo1.largura >= retangulo2.x -1 and
       retangulo1.y <= retangulo2.y + retangulo2.altura and
       retangulo1.y + retangulo1.altura >= retangulo2.y -1 then
      print("se ta batendo seu tronxo!!!")
           -- retangulo1.x = retangulo2.x - retangulo1.altura - 2
      v = 1
   else
      v = 2
   end

   -- Movimentação
   if love.keyboard.isDown('w') then
      retangulo1.y = retangulo1.y - v
   elseif love.keyboard.isDown('s') then
      retangulo1.y = retangulo1.y + v
   end

   if love.keyboard.isDown('a') then
      retangulo1.x = retangulo1.x - v
   elseif love.keyboard.isDown('d') then
      retangulo1.x = retangulo1.x + v
   end

   -- Movimentação na diagonal
   -- sqrt é usada para calcular a raiz quadrada de um número
   local comprimento = math.sqrt(movimentoX^2 + movimentoY^2)
    if comprimento > 0 then
        movimentoX = movimentoX / comprimento
        movimentoY = movimentoY / comprimento
    end
end
