-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		brayan rosales perez
-- Create date: 15-06-24
-- Description:	
-- =============================================
CREATE PROCEDURE  sp_selectMethodSend
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
		SELECT [id_MethodSend]
			,[nameMethod]
			,[id_Supplier]
		FROM [dbo].[methodSend] where id_MethodSend = @id
END
GO