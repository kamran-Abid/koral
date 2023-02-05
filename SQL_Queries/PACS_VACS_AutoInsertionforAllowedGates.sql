

INSERT INTO [dbo].[tbl_VACSGate]
           ([VehicleID]
           ,[GateID]
           ,[VehicleRegNumber]
           ,[GateName]
           ,[created_by]
           ,[created_date])
           (SELECT VACS_ID, mg.Gate_ID, mv.VehicleNo, mg.Gate_Name,'AutoQuery', SYSDATETIME()
		   from mctx_VACS mv, mctx_Gates mg where mg.Gate_Name = 'Y-Cross' or mg.Gate_Name = 'Barrier-2')
GO

INSERT INTO [dbo].[tbl_PACSGate]
           ([EmpID]
           ,[GateID]
           ,[EmployeeName]
           ,[GateName]
           ,[created_by]
           ,[created_date])
           (SELECT EID, mg.Gate_ID, isNull(emp.FirstName,'') +' '+ isnull(emp.LastName,'') as EmpName, mg.Gate_Name,'AutoQuery', SYSDATETIME()
		   from Employee emp, mctx_Gates mg where mg.Gate_Name = 'Y-Cross' or mg.Gate_Name = 'Barrier-2')
GO


