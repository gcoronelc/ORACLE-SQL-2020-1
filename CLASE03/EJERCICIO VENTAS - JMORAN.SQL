select x.idcat, x.nombre, count(y.idprod) productos, sum(y.stock) stock
from ventas.CATEGORIA x
join ventas.PRODUCTO y on x.IDCAT = y.IDCAT 
group by x.idcat, x.nombre;