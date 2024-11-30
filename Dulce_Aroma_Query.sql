create database Dulce_Aroma;
use Dulce_Aroma;

create table Usuario(
    Id_Usu int primary key,
    Nombre_Usu varchar(30) not null,
    Apellido_Usu varchar(30) not null,
    Rol_Usu varchar(20) not null,
    Contraseña_Usu varchar(20) unique
);
insert into Usuario (Id_Usu, Nombre_Usu, Apellido_Usu, Rol_Usu, Contraseña_Usu)
values 
(500, 'Carlos', 'Gonzalez', 'Admin', 'password@123'),
(501, 'Ana', 'Perez', 'Vendedor', 'passw0rd@321'),
(502, 'Luis', 'Martinez', 'Cliente', 'usuario@!22'),
(503, 'Maria', 'Lopez', 'Admin', 'admin@!123'),
(504, 'Juan', 'Sanchez', 'Vendedor', '1234@pass'),
(505, 'Laura', 'Gomez', 'Cliente', 'clave@!567'),
(506, 'Ricardo', 'Ramirez', 'Admin', 'admin!@321'),
(507, 'Elena', 'Diaz', 'Cliente', 'contraseña@!33'),
(508, 'Pedro', 'Torres', 'Vendedor', 'clave123@!'),
(509, 'Julia', 'Vega', 'Admin', 'admin@4567'),
(510, 'David', 'Hernandez', 'Cliente', 'user@!234'),
(511, 'Claudia', 'Fernandez', 'Vendedor', 'passw0rd!@123'),
(512, 'Alfredo', 'Castro', 'Cliente', 'secret@!321'),
(513, 'Carla', 'Morales', 'Admin', 'admin@pass!123'),
(514, 'Raul', 'Suarez', 'Vendedor', 'pass@1234'),
(515, 'Rosa', 'Serrano', 'Cliente', 'mi@contraseña'),
(516, 'Juan', 'Martinez', 'Admin', 'admin!567'),
(517, 'Patricia', 'Salazar', 'Cliente', 'clave@pass!'),
(518, 'Mario', 'Ruiz', 'Vendedor', 'admin@123!'),
(519, 'Marta', 'Gonzalez', 'Cliente', 'user@!pass'),
(520, 'Isaias', 'Rojas', 'Cliente', 'nombre!lol');

create table Pedido(
    Nro_Pedido int primary key,
    Fecha_Pedido datetime not null,
    Metodo_Pago varchar(20) not null default 'Efectivo',
    Total_Pedido float not null,
    Estado_Pedido varchar(15) default 'En Camino',
    Id_Usu int,
    constraint FK_Id_Usu foreign key (Id_Usu) references Usuario(Id_Usu)
);
insert into Pedido (Nro_Pedido, Fecha_Pedido, Metodo_Pago, Total_Pedido, Estado_Pedido, Id_Usu)
values 
(1500, '2024-11-01 10:30:00', 'Efectivo', 150.00, 'En Camino', 500),
(1501, '2024-11-01 11:00:00', 'Tarjeta', 250.50, 'Entregado', 501),
(1502, '2024-11-01 12:30:00', 'Efectivo', 100.00, 'Cancelado', 502),
(1503, '2024-11-01 14:00:00', 'Transferencia', 320.00, 'En Camino', 503),
(1504, '2024-11-02 09:00:00', 'Efectivo', 180.75, 'Entregado', 504),
(1505, '2024-11-02 10:30:00', 'Tarjeta', 230.00, 'En Camino', 505),
(1506, '2024-11-02 11:00:00', 'Efectivo', 125.00, 'Entregado', 506),
(1507, '2024-11-02 13:30:00', 'Transferencia', 200.00, 'Cancelado', 507),
(1508, '2024-11-03 09:00:00', 'Efectivo', 300.00, 'En Camino', 508),
(1509, '2024-11-03 10:00:00', 'Tarjeta', 450.00, 'Entregado', 509),
(1510, '2024-11-03 12:00:00', 'Transferencia', 180.50, 'En Camino', 510),
(1511, '2024-11-03 15:30:00', 'Efectivo', 120.00, 'Entregado', 511),
(1512, '2024-11-04 10:00:00', 'Efectivo', 550.00, 'Cancelado', 512),
(1513, '2024-11-04 12:00:00', 'Tarjeta', 310.00, 'En Camino', 513),
(1514, '2024-11-04 13:00:00', 'Transferencia', 400.00, 'Entregado', 514),
(1515, '2024-11-04 14:30:00', 'Efectivo', 220.00, 'En Camino', 515),
(1516, '2024-11-05 09:30:00', 'Tarjeta', 350.00, 'Entregado', 516),
(1517, '2024-11-05 10:30:00', 'Efectivo', 160.00, 'Cancelado', 517),
(1518, '2024-11-05 11:00:00', 'Transferencia', 270.00, 'En Camino', 518),
(1519, '2024-11-05 12:30:00', 'Efectivo', 190.00, 'Entregado', 519);
go

CREATE TABLE Categoría (
    ID_Categoria INT PRIMARY KEY, 
    Nombre_cate TEXT NOT NULL
);
INSERT INTO Categoría (ID_Categoria, Nombre_cate)
VALUES 
(5001, 'Café en grano'),
(5002, 'Café molido'),
(5003, 'Máquinas de café'),
(5004, 'Accesorios para café'),
(5005, 'Tazas y vasos'),
(5006, 'Café instantáneo'),
(5007, 'Café orgánico'),
(5008, 'Café gourmet'),
(5009, 'Café descafeinado'),
(5010, 'Café aromatizado');

CREATE TABLE Producto (
    Cod_Barras INT PRIMARY KEY,
    Nombre_produ VARCHAR(255) UNIQUE NOT NULL,
    Descripcion_produ TEXT,
    Precio_uni DECIMAL(10, 2) CHECK (Precio_uni > 0), 
    Categoría_ID INT,
    Disponibilidad_produ TEXT NOT NULL,
    CONSTRAINT FK_Categoría
        FOREIGN KEY (Categoría_ID) REFERENCES Categoría(ID_Categoria) 
);
INSERT INTO Producto (Cod_Barras, Nombre_produ, Descripcion_produ, Precio_uni, Categoría_ID, Disponibilidad_produ)
VALUES
(15001, 'Café en grano Premium', 'Café en grano de alta calidad, originario de Colombia', 15.50, 5001, 'Disponible'),
(15002, 'Café molido Fino', 'Café molido ideal para espresso, sabor suave', 12.00, 5002, 'Disponible'),
(15003, 'Máquina de café espresso', 'Máquina automática para preparar café espresso profesional', 120.00, 5003, 'Disponible'),
(15004, 'Prensa francesa', 'Prensa francesa de vidrio para preparar café filtrado', 18.00, 5004, 'Disponible'),
(15005, 'Taza de cerámica', 'Taza de cerámica para café, capacidad 300ml', 8.00, 5005, 'Disponible'),
(15006, 'Café instantáneo', 'Café instantáneo de la marca Barista, sabor suave y cremoso', 5.50, 5006, 'Disponible'),
(15007, 'Café orgánico', 'Café orgánico certificado, sin químicos ni pesticidas', 20.00, 5007, 'Disponible'),
(15008, 'Café gourmet', 'Café gourmet de origen brasileño, tostado artesanalmente', 25.00, 5008, 'Disponible'),
(15009, 'Café descafeinado', 'Café sin cafeína, sabor robusto y suave', 10.00, 5009, 'Disponible'),
(15010, 'Café de vainilla', 'Café aromatizado con vainilla, para un toque dulce', 12.50, 5010, 'Disponible'),
(15011, 'Molino de café manual', 'Molino manual para café, ideal para café en grano', 22.00, 5001, 'Disponible'),
(15012, 'Cafetera italiana', 'Cafetera italiana para preparar café de forma tradicional', 30.00, 5003, 'Disponible'),
(15013, 'Funda para cafetera', 'Funda protectora para cafetera de acero inoxidable', 7.00, 5004, 'No Disponible'),
(15014, 'Taza de viaje', 'Taza de acero inoxidable para llevar café, con aislamiento térmico', 15.00, 5005, 'Disponible'),
(15015, 'Café molido expreso', 'Café molido para preparar expreso, 100% arábica', 14.00, 5002, ' No Disponible'),
(15016, 'Café molido fuerte', 'Café molido de tueste oscuro, para un sabor intenso', 13.00, 5002, 'Disponible'),
(15017, 'Café orgánico tostado', 'Café orgánico tostado a mano, de origen africano', 21.00, 5007, 'Disponible'),
(15018, 'Café gourmet especial', 'Café gourmet con un toque de chocolate amargo', 26.50, 5008, 'Disponible'),
(15019, 'Café descafeinado suave', 'Café descafeinado, suave y perfecto para la noche', 11.00, 5009, 'No Disponible'),
(15020, 'Café molido aromatizado', 'Café molido con aroma a nuez y especias', 13.50, 5010, 'Disponible');

create table DETALLE_PEDIDO(
	detalle_pedido_ID int primary key,
	cantidad int not null,
	precio_total decimal not null,
	Nro_Pedido int,
    constraint FK_Nro_Pedido foreign key (Nro_Pedido) references Pedido(Nro_Pedido),
	Producto_ID int,
	constraint FK_Producto_ID foreign key(Producto_ID) references Producto(Cod_Barras)
);
insert into DETALLE_PEDIDO(detalle_pedido_ID,cantidad,precio_total)
values  (010, 2, 500.00),
		(020, 1, 200.00),
		(030, 5, 1500.00),
		(040, 3, 750.00),
		(050, 4, 1000.00),
		(060, 2, 400.00),
		(070, 6, 1800.00),
		(080, 1, 300.00),
		(090, 7, 2100.00),
		(0100, 3, 900.00),
		(0110, 4, 1200.00),
		(0120, 2, 600.00),
		(0130, 5, 1300.00),
		(0140, 1, 250.00),
		(0150, 3, 800.00),
		(0160, 6, 1700.00),
		(0170, 2, 450.00),
		(0180, 5, 1250.00),
		(0190, 3, 850.00),
		(0200, 4, 1100.00);
go
create table CLIENTE(
	cliente_id int primary key,
	nombre_cliente varchar(30)not null,
	telefono int not null,
	correo varchar(30) unique,
	ciudad varchar(30)not null,
	);
	
insert into CLIENTE (cliente_id, nombre_cliente, telefono, correo, ciudad)
values  (1, 'Juan Perez', 301234567 , 'juan.perez@example.com', 'Bogotá'),
		(2, 'Maria Lopez', 307654321 , 'maria.lopez@example.com', 'Medellín'),
		(3, 'Carlos Sanchez', 301122334 , 'carlos.sanchez@example.com', 'Cali'),
		(4, 'Ana Gomez', 304433221 , 'ana.gomez@example.com', 'Barranquilla'),
		(5, 'Luis Rodriguez', 305566778 , 'luis.rodriguez@example.com', 'Cartagena'),
		(6, 'Laura Martinez', 309988776 , 'laura.martinez@example.com', 'Bucaramanga'),
		(7, 'Diego Ramirez', 308877665 , 'diego.ramirez@example.com', 'Pereira'),
		(8, 'Sofia Torres', 307766554 , 'sofia.torres@example.com', 'Manizales'),
		(9, 'Jose Alvarez', 306655443 , 'jose.alvarez@example.com', 'Santa Marta'),
		(10, 'Paula Fernandez', 305544332 , 'paula.fernandez@example.com', 'Neiva'),
		(11, 'Andrea Martinez', 303344556 , 'andrea.martinez@example.com', 'Bogotá'),
		(12, 'Ricardo Gomez', 302233445 , 'ricardo.gomez@example.com', 'Medellín'),
		(13, 'Monica Diaz', 304455667 , 'monica.diaz@example.com', 'Cali'),
		(14, 'David Ortiz', 305566772 , 'david.ortiz@example.com', 'Barranquilla'),
		(15, 'Elena Morales', 306677889 , 'elena.morales@example.com', 'Cartagena'),
		(16, 'Miguel Torres', 307788991 , 'miguel.torres@example.com', 'Bucaramanga'),
		(17, 'Patricia Ruiz', 308899002 , 'patricia.ruiz@example.com', 'Pereira'),
		(18, 'Fernando Vargas', 309900113 , 'fernando.vargas@example.com', 'Manizales'),
		(19, 'Clara Jimenez', 301011122 , 'clara.jimenez@example.com', 'Santa Marta'),
		(20, 'Jorge Herrera', 301122333 , 'jorge.herrera@example.com', 'Neiva');

go
--Consultas
select * from Usuario where Rol_Usu = 'Cliente';
select Nombre_Usu, Apellido_Usu, Rol_Usu from Usuario where Id_Usu=513 OR Id_Usu=504;

select SUM(precio_total) AS totalvendido
from DETALLE_PEDIDO;

select SUM(cantidad) AS TotalCantidad,
       SUM(precio_total) AS TotalPrecio
from DETALLE_PEDIDO;

select AVG(precio_total) AS PromedioPrecio
from DETALLE_PEDIDO;

select SUM(Precio_uni) AS Valor_Menú
from Producto;
go
--Consultas con condicionales
select cliente_id, nombre_cliente, telefono, correo, ciudad
from CLIENTE
where ciudad = 'Medellín';

select cliente_id, nombre_cliente, telefono, correo, ciudad
from CLIENTE
where nombre_cliente LIKE '%Luis%';

select *
from Producto
where Precio_uni >= 30.00;
go
-- Trigger para validar que la contraseña tenga al menos un caracter especial
create trigger Validacion_Simbolo
on Usuario
after insert, update
as
begin
    if exists(
        select 1
        from inserted
        where Contraseña_Usu not like '%[.%-@!:%]%'
    )
    begin
        raiserror ('Debe contener al menos un caracter especial (. , @ , - , ! , : )', 16, 1);
        rollback transaction;
    end
end;
go
--Joins
select concat(Usuario.Nombre_Usu,' ',Usuario.Apellido_Usu)as Nombre_Usuario,
Pedido.Nro_Pedido
from Usuario
inner join Pedido
on Usuario.Id_Usu=Pedido.Id_Usu;

select Usuario.Nombre_Usu, (select count(*) from Pedido where Pedido.Id_Usu = Usuario.Id_Usu) as NumeroDePedidos
from Usuario;

select Id_Usu, Total_Pedido
from Pedido
where Total_Pedido > (select avg(Total_Pedido) from Pedido where Pedido.Id_Usu = Pedido.Id_Usu);

select C.cliente_id, C.nombre_cliente, DP.detalle_pedido_ID, DP.cantidad, DP.precio_total
from CLIENTE C
inner join DETALLE_PEDIDO DP on C.cliente_id = DP.detalle_pedido_ID;

select C.cliente_id, C.nombre_cliente, DP.detalle_pedido_ID, DP.cantidad, DP.precio_total
from CLIENTE C
right join DETALLE_PEDIDO DP on C.cliente_id = DP.detalle_pedido_ID;

go
--Sentencias en bloque
declare
	@Pedido decimal = 90.00
begin
	if exists(select Nro_Pedido, Total_Pedido from Pedido where(Total_Pedido<=@Pedido))
	(select Nro_Pedido, Total_Pedido from Pedido where Total_Pedido<= @Pedido)
else
	print'No hay pedidos de menos de 140.00'
end;
go
declare
	@Estado varchar(50)= 'Entregado'
begin
	if exists(select Id_Usu, Estado_Pedido from Pedido where(Estado_Pedido=@Estado))
	(select Id_Usu, Estado_Pedido from Pedido where(Estado_Pedido=@Estado))
else
	print 'Aún no se han entregado ningún pedido'
end
go

declare
     @cantidad int = 5;
begin 
		if exists( select * from DETALLE_PEDIDO where cantidad = @cantidad)
			begin( select * from DETALLE_PEDIDO where cantidad >= @cantidad)
		end
		else
			begin
	
		select 'pedidos al detal'
		end
end;
go
declare
	@producto decimal=15.00
begin
if exists(select Nombre_produ, Precio_uni from Producto where(Precio_uni < @producto))
			(select Nombre_produ, Precio_uni from Producto where(Precio_uni < @producto))
else
	print 'No hay productos que cuesten menos de 15.00'
end;

declare
	@disponibilidad varchar(30)='Disponible'
begin
if exists(select Nombre_produ, Disponibilidad_produ from Producto where(Disponibilidad_produ = @disponibilidad))
			(select Nombre_produ, Disponibilidad_produ from Producto where(Disponibilidad_produ = @disponibilidad))
else
	print 'No hay disponibilidad del producto'
end;

go
-- Procedimientos almacenados

create or alter proc P_Pedidos15
    @pedidos int=15
as
begin
    if exists (select 1 from Pedido
               group by Fecha_Pedido
               having count(*) > @pedidos)
    begin
        select Fecha_Pedido, count(*) as Total_Pedidos
        from Pedido
        group by Fecha_Pedido
        having count(*) > @pedidos
    end
    else 
    begin
        select 'No hay fechas con más de 15 pedidos' as Alerta;
    end
end;
go

create or alter proc P_PromedioPedidos
    @usuario varchar(50)='%',
    @suma int output,
    @promedio numeric(10,2) output
as
begin
    select * from Pedido where Id_Usu like @usuario;
    select @suma = sum(Nro_Pedido), @promedio = avg(Nro_Pedido)
    from Pedido
    where Id_Usu like @usuario;
end;
go

declare 
    @sum int, 
    @resultado numeric(10,2);

exec P_PromedioPedidos 'Usuario', @sum output, @resultado output
if @sum = 0
begin
    select 'No se encontraron pedidos' as 'Pedidos Totales',
           'No se pudo calcular el promedio' as 'Promedio Pedidos';
end
else
begin
    select @sum as 'Pedidos Totales', @resultado as 'Promedio Pedidos';
end;
go
create procedure p_pedidos
	as
	select * from DETALLE_PEDIDO where cantidad <=4;

go

create procedure p_verificar_pedidos
as
begin
    declare @cantidad int = 4;

    if exists (select * from DETALLE_PEDIDO where cantidad = @cantidad)
    begin
        select * from DETALLE_PEDIDO where cantidad <= @cantidad;
    end
    else
    begin
        select 'este pedido esta catalogado como al por mayor' AS Mensaje;
    end
end;
go
CREATE or alter proc p_ProductosPorCantidad
@cantidad INT = 5 
as
select * from Categoría;
begin
	if exists ( select 1 from Categoría
	group by ID_Categoria
	having count(*) > 
 @cantidad)

begin
SELECT Nombre_cate COUNT(*)
AS Total_Productos
FROM  Producto
GROUP BY Nombre_cate
HAVING COUNT(*) > @cantidad;
END
ELSE
BEGIN
SELECT 'No hay categorías con más de ' + CAST(@cantidad AS VARCHAR) + ' productos' AS Alerta;
END
END;
go

 CREATE OR ALTER PROCEDURE P_ProductosPorPrecio
@precio_min DECIMAL(10, 2) = 10.00
AS
BEGIN
 IF EXISTS ( SELECT 1 FROM Producto
group by Precio_uni > @precio_min)
BEGIN
 SELECT Nombre_produc
as  Producto,
            Precio_uni 
            Precio_min
FROM 
Producto
> @precio_min
    END
    ELSE
    BEGIN 
SELECT 'No hay productos con un precio superior a ' + CAST(@precio_min AS VARCHAR) AS Alerta;
    END
END;

go
-- Triggers
create table triggers_bd (
    nro_trigger int IDENTITY(1,1) primary key,
    evento_tipo varchar(10),
    tabla_cambio varchar(30),
    fecha_cambio datetime default getdate(),
    usuario_cambio varchar(50),
    datos_antiguos varchar(500),
    datos_nuevos varchar(500)
);
go

create trigger trg_insert
on Usuario
after insert
as
begin
    declare @xml_data varchar(500);

    select @xml_data = (select * from inserted for xml path('Usuario'), root('Usuarios'));

insert into triggers_bd(evento_tipo, tabla_cambio, usuario_cambio, datos_nuevos)
  values(
     'Insert',
     'Usuario',
      suser_name(),
      cast(@xml_data as varchar(max))
	  );
end;
go

create trigger trg_update
on Usuario
after update
as
begin
    declare @old_data varchar(500), @new_data varchar(500);

    select @old_data = (select * from deleted for xml path('Usuario'), root('Usuarios'));
    select @new_data = (select * from inserted for xml path('Usuario'), root('Usuarios'));

    insert into triggers_bd(evento_tipo, tabla_cambio, usuario_cambio, datos_antiguos, datos_nuevos)
    values
    (
        'Update',
        'Usuario',
        suser_name(),
        cast(@old_data as varchar(max)),
        cast(@new_data as varchar(max))
    );
end;
go
create trigger trg_delete
on Usuario
after delete
as
begin
    declare @old_data varchar(500);

    select @old_data = (select * from deleted for xml path('Usuario'), root('Usuarios'));

    insert into triggers_bd(evento_tipo, tabla_cambio, usuario_cambio, datos_antiguos)
    values
    (
        'Delete',
        'Usuario',
        suser_name(),
        cast(@old_data as varchar(max))
    );
end;

select * from triggers_bd;

select name from sys.triggers where name in ('trg_insert', 'trg_update', 'trg_delete');


insert into Usuario (Id_Usu, Nombre_usu, Apellido_usu, Rol_usu, Contraseña_usu)
values (600, 'carlos', 'martinez', 'cliente', 'pasTO@123');
insert into Usuario (Id_Usu, Nombre_usu, Apellido_usu, Rol_usu, Contraseña_usu)
values (607, 'marlos', 'carton', 'cliente', 'marlos@123');
insert into Usuario (Id_Usu, Nombre_usu, Apellido_usu, Rol_usu, Contraseña_usu)
values (1152185263, 'Jenny', 'Rivera', 'Cliente', 'Jenny12@');

insert into Usuario (Id_Usu, Nombre_usu, Apellido_usu, Rol_usu, Contraseña_usu)
values (603, 'mar', 'tonos', 'cliente', 'mar@123');

select * 
from triggers_bd 
where evento_tipo = 'insert' 
order by fecha_cambio desc;

update usuario 
set nombre_usu = 'carlos updated' 
where id_usu = 600;

select * 
from triggers_bd 
where evento_tipo = 'update' 
order by fecha_cambio desc;

delete from usuario 
where id_usu = 600;

select * 
from triggers_bd 
where evento_tipo = 'delete' 
order by fecha_cambio desc;

select * 
from triggers_bd
order by fecha_cambio desc;

select top 6 evento_tipo, datos_nuevos
from triggers_bd
order by fecha_cambio desc;