
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/11/2015 15:51:07
-- Generated from EDMX file: C:\Users\ADRY\Source\Repos\AppaLite\AppaLiteModel\AppaLiteModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [AppaLiteModel];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_EmpleadoMovimiento]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Movimientos] DROP CONSTRAINT [FK_EmpleadoMovimiento];
GO
IF OBJECT_ID(N'[dbo].[FK_ArticuloPrestamo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Prestamos] DROP CONSTRAINT [FK_ArticuloPrestamo];
GO
IF OBJECT_ID(N'[dbo].[FK_PrestamoLocal]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Prestamos] DROP CONSTRAINT [FK_PrestamoLocal];
GO
IF OBJECT_ID(N'[dbo].[FK_ArticuloMarca]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Articulos] DROP CONSTRAINT [FK_ArticuloMarca];
GO
IF OBJECT_ID(N'[dbo].[FK_MovimientoLocal]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Movimientos] DROP CONSTRAINT [FK_MovimientoLocal];
GO
IF OBJECT_ID(N'[dbo].[FK_PrestamoMovimiento]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Movimientos] DROP CONSTRAINT [FK_PrestamoMovimiento];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Articulos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Articulos];
GO
IF OBJECT_ID(N'[dbo].[Prestamos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Prestamos];
GO
IF OBJECT_ID(N'[dbo].[Locales]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Locales];
GO
IF OBJECT_ID(N'[dbo].[Marcas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Marcas];
GO
IF OBJECT_ID(N'[dbo].[Empleados]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Empleados];
GO
IF OBJECT_ID(N'[dbo].[Movimientos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Movimientos];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Articulos'
CREATE TABLE [dbo].[Articulos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Referencia] nvarchar(max)  NOT NULL,
    [Descripcion] nvarchar(max)  NOT NULL,
    [Talla] nvarchar(max)  NOT NULL,
    [Marca_Id] int  NOT NULL
);
GO

-- Creating table 'Prestamos'
CREATE TABLE [dbo].[Prestamos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Articulo_Id] int  NOT NULL,
    [Origen_Id] int  NOT NULL
);
GO

-- Creating table 'Locales'
CREATE TABLE [dbo].[Locales] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Icono] nvarchar(max)  NOT NULL,
    [Telefono] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Marcas'
CREATE TABLE [dbo].[Marcas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Icono] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Empleados'
CREATE TABLE [dbo].[Empleados] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Cedula] nvarchar(max)  NOT NULL,
    [Telefono] nvarchar(max)  NOT NULL,
    [Foto] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Movimientos'
CREATE TABLE [dbo].[Movimientos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Estado] nvarchar(max)  NOT NULL,
    [Fecha] nvarchar(max)  NOT NULL,
    [Hora] nvarchar(max)  NOT NULL,
    [PrestamoId] int  NOT NULL,
    [EmpleadoMovimiento_Movimiento_Id] int  NOT NULL,
    [Destino_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Articulos'
ALTER TABLE [dbo].[Articulos]
ADD CONSTRAINT [PK_Articulos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Prestamos'
ALTER TABLE [dbo].[Prestamos]
ADD CONSTRAINT [PK_Prestamos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Locales'
ALTER TABLE [dbo].[Locales]
ADD CONSTRAINT [PK_Locales]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Marcas'
ALTER TABLE [dbo].[Marcas]
ADD CONSTRAINT [PK_Marcas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Empleados'
ALTER TABLE [dbo].[Empleados]
ADD CONSTRAINT [PK_Empleados]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Movimientos'
ALTER TABLE [dbo].[Movimientos]
ADD CONSTRAINT [PK_Movimientos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [EmpleadoMovimiento_Movimiento_Id] in table 'Movimientos'
ALTER TABLE [dbo].[Movimientos]
ADD CONSTRAINT [FK_EmpleadoMovimiento]
    FOREIGN KEY ([EmpleadoMovimiento_Movimiento_Id])
    REFERENCES [dbo].[Empleados]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmpleadoMovimiento'
CREATE INDEX [IX_FK_EmpleadoMovimiento]
ON [dbo].[Movimientos]
    ([EmpleadoMovimiento_Movimiento_Id]);
GO

-- Creating foreign key on [Articulo_Id] in table 'Prestamos'
ALTER TABLE [dbo].[Prestamos]
ADD CONSTRAINT [FK_ArticuloPrestamo]
    FOREIGN KEY ([Articulo_Id])
    REFERENCES [dbo].[Articulos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ArticuloPrestamo'
CREATE INDEX [IX_FK_ArticuloPrestamo]
ON [dbo].[Prestamos]
    ([Articulo_Id]);
GO

-- Creating foreign key on [Origen_Id] in table 'Prestamos'
ALTER TABLE [dbo].[Prestamos]
ADD CONSTRAINT [FK_PrestamoLocal]
    FOREIGN KEY ([Origen_Id])
    REFERENCES [dbo].[Locales]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PrestamoLocal'
CREATE INDEX [IX_FK_PrestamoLocal]
ON [dbo].[Prestamos]
    ([Origen_Id]);
GO

-- Creating foreign key on [Marca_Id] in table 'Articulos'
ALTER TABLE [dbo].[Articulos]
ADD CONSTRAINT [FK_ArticuloMarca]
    FOREIGN KEY ([Marca_Id])
    REFERENCES [dbo].[Marcas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ArticuloMarca'
CREATE INDEX [IX_FK_ArticuloMarca]
ON [dbo].[Articulos]
    ([Marca_Id]);
GO

-- Creating foreign key on [Destino_Id] in table 'Movimientos'
ALTER TABLE [dbo].[Movimientos]
ADD CONSTRAINT [FK_MovimientoLocal]
    FOREIGN KEY ([Destino_Id])
    REFERENCES [dbo].[Locales]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MovimientoLocal'
CREATE INDEX [IX_FK_MovimientoLocal]
ON [dbo].[Movimientos]
    ([Destino_Id]);
GO

-- Creating foreign key on [PrestamoId] in table 'Movimientos'
ALTER TABLE [dbo].[Movimientos]
ADD CONSTRAINT [FK_PrestamoMovimiento]
    FOREIGN KEY ([PrestamoId])
    REFERENCES [dbo].[Prestamos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PrestamoMovimiento'
CREATE INDEX [IX_FK_PrestamoMovimiento]
ON [dbo].[Movimientos]
    ([PrestamoId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------