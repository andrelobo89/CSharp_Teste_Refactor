USE [Teste]
GO
/****** Object:  StoredProcedure [dbo].[P_NOTA_FISCAL]    Script Date: 24/08/2017 18:00:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[P_NOTA_FISCAL] 
(
	@pId int OUTPUT,
	@pNumeroNotaFiscal int,
	@pSerie int,
	@pNomeCliente varchar(50),
	@pEstadoDestino varchar(50),
	@pEstadoOrigem varchar(50)
)
AS
BEGIN
	IF (@pId = 0)
	BEGIN 
		INSERT INTO [dbo].[NotaFiscal]
           ([NumeroNotaFiscal]
           ,[Serie]
           ,[NomeCliente]
           ,[EstadoDestino]
           ,[EstadoOrigem])
		VALUES
           (@pNumeroNotaFiscal
           ,@pSerie
           ,@pNomeCliente
           ,@pEstadoDestino
           ,@pEstadoOrigem)

		SET @pId = @@IDENTITY
	END
	ELSE
	BEGIN
		UPDATE [dbo].[NotaFiscal]
		SET [NumeroNotaFiscal] = @pNumeroNotaFiscal
		  ,[Serie] = @pSerie
		  ,[NomeCliente] = @pNomeCliente
		  ,[EstadoDestino] = @pEstadoDestino
		  ,[EstadoOrigem] = @pEstadoOrigem
		WHERE Id = @pId
	END	    
END
