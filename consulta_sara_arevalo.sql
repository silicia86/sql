select a.nombre_modelo as Modelo , b.nombre_marca as marca , c.nombre_grupo as grupo , d.fecha_compra as fecha_de_compra, d.matricula, e.color, d.kilometros, f.empresa as aseguradora, d.num_poliza 
from sara_arevalo.modelos a 
inner join sara_arevalo.marcas b on a.idmarca = b.idmarca
inner join sara_arevalo.grupos c on b.idgrupo = c.idgrupo 
inner join sara_arevalo.vehiculos d on d.idmodelo = a.idmodelo 
inner join sara_arevalo.colores e on d.idcolor = e.idcolor 
inner join sara_arevalo.aseguradoras f on d.idaseguradora = f.idaseguradora 


