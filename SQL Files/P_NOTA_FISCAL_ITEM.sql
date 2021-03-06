USE [Teste]
GO
/****** Object:  StoredProcedure [dbo].[P_NOTA_FISCAL_ITEM]    Script Date: 24/08/2017 18:10:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[P_NOTA_FISCAL_ITEM]
(
	@pId int,
    @pIdNotaFiscal int,
    @pCfop varchar(5),
    @pTipoIcms varchar(20),
    @pBaseIcms decimal(18,5),
    @pAliquotaIcms decimal(18,5),
    @pValorIcms decimal(18,5),
	@pBaseIpi decimal(18,5),
    @pAliquotaIpi decimal(18,5),
    @pValorIpi decimal(18,5),
    @pNomeProduto varchar(50),
    @pCodigoProduto varchar(20),
	@pDesconto decimal(18,5)
)
AS
BEGIN
	IF (@pId = 0)
	BEGIN 		
		INSERT INTO [dbo].[NotaFiscalItem]
           ([IdNotaFiscal]
           ,[Cfop]
           ,[TipoIcms]
           ,[BaseIcms]
           ,[AliquotaIcms]
           ,[ValorIcms]
		   ,[BaseIpi]
           ,[AliquotaIpi]
           ,[ValorIpi]
           ,[NomeProduto]
           ,[CodigoProduto]
		   ,[Desconto])
		VALUES
           (@pIdNotaFiscal,
			@pCfop,
			@pTipoIcms,
			@pBaseIcms,
			@pAliquotaIcms,
			@pValorIcms,
			@pBaseIpi,
			@pAliquotaIpi,
			@pValorIpi,
			@pNomeProduto,
			@pCodigoProduto,
			@pDesconto)

		SET @pId = @@IDENTITY
	END
	ELSE
	BEGIN
		UPDATE [dbo].[NotaFiscalItem]
		SET [IdNotaFiscal] = @pIdNotaFiscal
			,[Cfop] = @pCfop
			,[TipoIcms] = @pTipoIcms
			,[BaseIcms] = @pBaseIcms
			,[AliquotaIcms] = @pAliquotaIcms
			,[ValorIcms] = @pValorIcms
			,[BaseIpi] = @pBaseIpi
			,[AliquotaIpi] = @pAliquotaIpi
			,[ValorIpi] = @pValorIpi
			,[NomeProduto] = @pNomeProduto
			,[CodigoProduto] = @pCodigoProduto
			,[Desconto] = @pDesconto
		 WHERE Id = @pId
	END	    
END
