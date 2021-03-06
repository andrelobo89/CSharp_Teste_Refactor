USE [Teste]
GO
/****** Object:  StoredProcedure [dbo].[P_GET_ITENS_PEDIDO_ICMS_IPI]    Script Date: 24/08/2017 17:59:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[P_GET_ITENS_PEDIDO_ICMS_IPI]
	
AS
BEGIN
	SELECT nfi.Cfop, 
	   SUM(nfi.BaseIcms) AS 'Valor Total da Base de ICMS', 
	   SUM(nfi.ValorIcms) AS 'Valor Total do ICMS', 
	   SUM(nfi.BaseIpi) AS ' Valor Total da Base de IPI', 
	   SUM(nfi.ValorIpi) AS 'Valor Total do IPI' 
	FROM dbo.NotaFiscalItem nfi 
	GROUP BY nfi.Cfop;
END
