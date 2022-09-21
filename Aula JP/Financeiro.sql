Create 	Table registrosFinanceiros(
    codReg INT NOT NULL,
    dataVenda date,
    qtdVendas INT,
    cidade Varchar(30)
    
);
Create Table registrosFinanceiros1(
Check (cidade in ('Recife','Caruaru')))
INHERITS (registrosfinanceiros);

Create Table registrosFinanceiros2(
Check (cidade in ('Vitoria','Fortaleza')))
INHERITS (registrosfinanceiros);

create or replace Function fn_inserirfinanceiro()
returns Trigger as $$
Begin

	IF(NEW.cidade IN ('Recife','Caruaru'))
		THEN
			INSERT INTO registrosFinanceiros1 values(NEW.*);
	ELSEIF (NEW.cidade IN ('Vitoria','Fortaleza'))
		THEN
			INSERT INTO registrosFinanceiros1 values(NEW.*);
    ELSE 
    RAISE Exception 'Cidade Inválida';
    END IF;    
    RETURN NEW;
End;
$$
language plpgsql;

create Trigger runinseriFinanceiro
	Before Insert on registrosFinanceiros
		for each row 
			Execute FUNCTION fn_inserirfinanceiro();

