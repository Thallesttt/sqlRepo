Create Table registroVendas(
    numVenda INT NOT NULL,
    datavenda DATE NOT NULL,
    valorTotal FLOAT )
    PARTITION BY RANGE (datavenda);
Create Table registroVendas2016 Partition Of registroVendas For Values From ('01/01/2016') To ('31/12/2016');
Create Table registroVendas2017 Partition Of registroVendas For Values From ('01/01/2017') To ('31/12/2017');
Create Table registroVendas2018 Partition Of registroVendas For Values From ('01/01/2018') To ('31/12/2018');

create table registrosFinanceiros (codReg INT NOT NULL, dataVenda DATE , qtdVendas INT, cidade VARCHAR(30))
PARTITION By List(cidade);
Create Table registrosFinanceiros1 
	Partition Of registrosFinanceiros 
		For Values in ('Recife','Caruaru');
Create Table registrosFinanceiros2 
	Partition Of registrosFinanceiros 
    	For Values in ('Vitória','Fortaleza');

