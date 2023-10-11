CREATE DATABASE Pizzaria; -- Criação da Database da Pizzaria

	-- INICIO DA CRIAÇÃO DAS TABELAS E INSERÇÃO DE DADOS RESPECTIVOS
    
	create table Pizza(
	ID_PIZZA Integer primary key not null,
	SABOR varchar(80) not null,
	PRECO_PIZZA decimal(6,2) not null ,
	DESCRICAO varchar(300),
	TAMANHO_PIZZA Integer
	);
    
    INSERT INTO Pizza (ID_PIZZA,SABOR,PRECO_PIZZA,DESCRICAO,TAMANHO_PIZZA) VALUES (1,'Calabresa',29.90,'Pizza de Calabresa com Queijo',8);
	INSERT INTO Pizza (ID_PIZZA,SABOR,PRECO_PIZZA,DESCRICAO,TAMANHO_PIZZA) VALUES (2,'Mussarela',26.90,'Pizza de Mussarela com Tomate',8);
	INSERT INTO Pizza (ID_PIZZA,SABOR,PRECO_PIZZA,DESCRICAO,TAMANHO_PIZZA) VALUES (3,'Frango com Catupiry',28.90,'Pizza de Frango com Catupiry',8);
    INSERT INTO Pizza (ID_PIZZA,SABOR,PRECO_PIZZA,DESCRICAO,TAMANHO_PIZZA) VALUES (4,'Chocolate',32.90,'Pizza Doce de Massa e Chocolate',8);


    

	create table Embalagem(
	MATERIAL varchar(60) not null,
	TAMANHO_EMBALAGEM integer primary key not null,
	PRECO_EMBALAGEM decimal(5,2)
	);
    
    INSERT INTO Embalagem (MATERIAL,TAMANHO_EMBALAGEM,PRECO_EMBALAGEM) VALUES ('PAPELAO',8,2.50);
    INSERT INTO Embalagem (MATERIAL,TAMANHO_EMBALAGEM,PRECO_EMBALAGEM) VALUES ('PAPELAO',6,2.00);
    INSERT INTO Embalagem (MATERIAL,TAMANHO_EMBALAGEM,PRECO_EMBALAGEM) VALUES ('PAPELAO',4,1.50);

	
	create table Ingredientes(
	ID_INGREDIENTE integer not null primary key,
	NOME varchar(50)
	);
    
     INSERT INTO Ingredientes (ID_INGREDIENTE,NOME) VALUES (1,'Queijo');
     INSERT INTO Ingredientes (ID_INGREDIENTE,NOME) VALUES (2,'Cebola');
     INSERT INTO Ingredientes (ID_INGREDIENTE,NOME) VALUES (3,'Tomate');
     INSERT INTO Ingredientes (ID_INGREDIENTE,NOME) VALUES (4,'Calabresa');
     INSERT INTO Ingredientes (ID_INGREDIENTE,NOME) VALUES (5,'Frango');
     INSERT INTO Ingredientes (ID_INGREDIENTE,NOME) VALUES (6,'Catupiry');
     INSERT INTO Ingredientes (ID_INGREDIENTE,NOME) VALUES (7,'Chocolate');
     
     
	create table Receita (
	ID_RECEITA integer primary key not null,
	INSTRUCOES_RECEITA varchar(500) not null,
	AUTOR varchar(120),
	foreign key (ID_RECEITA) references Pizza(ID_PIZZA)
	);
    
    INSERT INTO Receita (ID_RECEITA,INSTRUCOES_RECEITA,AUTOR) VALUES (1,'Adicionar 30g de Calabresa, 20g de Queijo e 10g de Cebola e deixar no forno por 10 minutos', 'Diego');
    INSERT INTO Receita (ID_RECEITA,INSTRUCOES_RECEITA,AUTOR) VALUES (2,'Adicionar 30g de Queijo, 20g de Tomate e deixar no forno por 8 minutos', 'Diego');
    INSERT INTO Receita (ID_RECEITA,INSTRUCOES_RECEITA,AUTOR) VALUES (3,'Adicionar 30g de Frango, 10g de Queijo e 10g de Catupiry deixar no forno por 8 minutos', 'Diego');
    INSERT INTO Receita (ID_RECEITA,INSTRUCOES_RECEITA,AUTOR) VALUES (4,'Adicionar 30g de Cchocolate e deixar no forno por 5 minutos', 'Diego');
    

	create table Pizzaiolo (
	ID_PIZZAIOLO integer primary key not null,
	NOME varchar(100),
	SALARIO decimal (8,2)
	);
    
    INSERT INTO Pizzaiolo (ID_PIZZAIOLO,NOME,SALARIO) VALUES (1, 'Claudio', 1800.00);
    INSERT INTO Pizzaiolo (ID_PIZZAIOLO,NOME,SALARIO) VALUES (2, 'Cleber', 1800.00);
    INSERT INTO Pizzaiolo (ID_PIZZAIOLO,NOME,SALARIO) VALUES (3, 'Carlos', 1800.00);

    
    
    create table PizzaIngredientes(
	ID_PIZZA integer,
	ID_INGREDIENTE integer,
	foreign key (ID_PIZZA) references Pizza(ID_PIZZA),
	foreign key(ID_INGREDIENTE) references Ingredientes(ID_INGREDIENTE),
    primary key (ID_PIZZA,ID_INGREDIENTE)
	);
    
    INSERT INTO PizzaIngredientes (ID_PIZZA,ID_INGREDIENTE) VALUES (1,1);
    INSERT INTO PizzaIngredientes (ID_PIZZA,ID_INGREDIENTE) VALUES (1,2);
    INSERT INTO PizzaIngredientes (ID_PIZZA,ID_INGREDIENTE) VALUES (1,4);
    INSERT INTO PizzaIngredientes (ID_PIZZA,ID_INGREDIENTE) VALUES (2,1);
    INSERT INTO PizzaIngredientes (ID_PIZZA,ID_INGREDIENTE) VALUES (2,3);
    INSERT INTO PizzaIngredientes (ID_PIZZA,ID_INGREDIENTE) VALUES (3,1);
    INSERT INTO PizzaIngredientes (ID_PIZZA,ID_INGREDIENTE) VALUES (3,5);
    INSERT INTO PizzaIngredientes (ID_PIZZA,ID_INGREDIENTE) VALUES (3,6);
    INSERT INTO PizzaIngredientes (ID_PIZZA,ID_INGREDIENTE) VALUES (4,7);
    
    
    
	create table PizzaPizzaiolo(
	ID_PIZZA integer,
	ID_PIZZAIOLO integer,
	foreign key (ID_PIZZA) references Pizza(ID_PIZZA),
	foreign key (ID_PIZZAIOLO) references Pizzaiolo(ID_PIZZAIOLO),
	primary key (ID_PIZZA, ID_PIZZAIOLO)
	);
    
    INSERT INTO PizzaPizzaiolo(ID_PIZZA,ID_PIZZAIOLO) VALUES(1,1);
    INSERT INTO PizzaPizzaiolo(ID_PIZZA,ID_PIZZAIOLO) VALUES(1,2);
    INSERT INTO PizzaPizzaiolo(ID_PIZZA,ID_PIZZAIOLO) VALUES(2,2);
    INSERT INTO PizzaPizzaiolo(ID_PIZZA,ID_PIZZAIOLO) VALUES(2,3);
    INSERT INTO PizzaPizzaiolo(ID_PIZZA,ID_PIZZAIOLO) VALUES(3,1);
    INSERT INTO PizzaPizzaiolo(ID_PIZZA,ID_PIZZAIOLO) VALUES(3,3);
    INSERT INTO PizzaPizzaiolo(ID_PIZZA,ID_PIZZAIOLO) VALUES(4,1);
    
    
    
	create table PizzaEmbalagem(
	ID_PIZZA integer not null ,
	TAMANHO_EMBALAGEM integer not null,
	foreign key (ID_PIZZA) references Pizza(ID_PIZZA),
	foreign key (TAMANHO_EMBALAGEM) references Embalagem(TAMANHO_EMBALAGEM),
	primary key (ID_PIZZA,TAMANHO_EMBALAGEM)
	);
    
    INSERT INTO PizzaEmbalagem (ID_PIZZA, TAMANHO_EMBALAGEM) VALUES (1,8);
    INSERT INTO PizzaEmbalagem (ID_PIZZA, TAMANHO_EMBALAGEM) VALUES (2,8);
    INSERT INTO PizzaEmbalagem (ID_PIZZA, TAMANHO_EMBALAGEM) VALUES (3,8);
    INSERT INTO PizzaEmbalagem (ID_PIZZA, TAMANHO_EMBALAGEM) VALUES (4,8);
    
    -- FIM DA CRIAÇÃO DE TABELAS 
    
    
    -- Criação de relatório com todas as pizzas e os pizzaiolos aptos a produzi-las
	SELECT Pizza.ID_PIZZA, Pizza.SABOR, PizzaPizzaiolo.ID_PIZZAIOLO, Pizzaiolo.NOME as Nome_Pizzaiolo
    FROM Pizza 
    JOIN PizzaPizzaiolo ON Pizza.ID_PIZZA = PizzaPizzaiolo.ID_PIZZA
    JOIN Pizzaiolo ON PizzaPizzaiolo.ID_PIZZAIOLO = Pizzaiolo.ID_PIZZAIOLO;
    
    
    -- Criação de  relatório com todas as pizzas e seus ingredientes
    SELECT Pizza.ID_PIZZA, Pizza.SABOR, Ingredientes.NOME as Ingrediente
    FROM Pizza
    JOIN PizzaIngredientes ON Pizza.ID_PIZZA = PizzaIngredientes.ID_PIZZA
    JOIN Ingredientes on PizzaIngredientes.ID_INGREDIENTE = Ingredientes.ID_INGREDIENTE;
    
    
  -- Criação de relatório com todos os ingredientes e as pizzas onde são utilizados
    SELECT Ingredientes.ID_INGREDIENTE, Ingredientes.NOME, Pizza.SABOR as Pizza_Utilizada
	FROM Ingredientes
	JOIN PizzaIngredientes ON PizzaIngredientes.ID_INGREDIENTE = Ingredientes.ID_INGREDIENTE
	JOIN Pizza ON Pizza.ID_PIZZA = PizzaIngredientes.ID_PIZZA;
    
    
    -- Criação de relatório com os sabores de todas as pizzas, o nome dos pizzaiolos que as fazem e as instruções para produzi-las
    SELECT Pizza.SABOR as Sabor, Pizzaiolo.NOME as Pizzaiolo, Receita.INSTRUCOES_RECEITA as Instrucoes
    FROM Pizza 
    JOIN PizzaPizzaiolo ON Pizza.ID_PIZZA = PizzaPizzaiolo.ID_PIZZA
    JOIN Pizzaiolo ON PizzaPizzaiolo.ID_PIZZAIOLO = Pizzaiolo.ID_PIZZAIOLO
    JOIN Receita ON Pizza.ID_PIZZA = Receita.ID_RECEITA;
    



