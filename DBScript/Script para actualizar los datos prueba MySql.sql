call Usp_Transacciones('4','2015-07-01','2015-08-02');
call Usp_Estadocuenta;
call Usp_PaseCuentasMaestras('2015-08-02')

select * from entradacontable;

update entradacontable
set idestado =3
where identradacontable=9

SELECT *FROM entradacontable;
SELECT *FROM cuentascontables;

update cuentascontables
set balance = 10000