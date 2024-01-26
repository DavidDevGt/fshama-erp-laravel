# TO DO
1. Ver si se incluye lógica de Cajas para facturación con su propio dinero, etc.

### Distribuir el sistema de la siguiente manera:

1. **Gestión de Inventario**: Manejaría productos, marcas, unidades de medida, y control de stock. Incluiría tablas como `product`, `product_brand`, `measurement_unit`, `inventory_movement`, `inventory_entry`, `inventory_exit`, `inventory_adjustment`, `price_history`, `wholesale_unit`, `warehouse` y `product_location`.

2. **Gestión de Compras y Proveedores**: Este módulo gestionaría las relaciones con los proveedores, órdenes de compra y pagos. Utilizaría tablas como `supplier`, `purchase_order`, `purchase_order_detail`, `supplier_invoice`, `supplier_invoice_detail` y `supplier_payment`.

3. **Gestión de Ventas y Clientes**: Involucraría la administración de clientes, pedidos, facturación y métodos de envío. Se apoyaría en tablas como `client`, `branch`, `order`, `order_detail`, `invoice`, `invoice_detail`, `shipping_method`, `logistics_shipping` y `payment_method`.

4. **Finanzas**: Controlaría los aspectos financieros, como pagos, facturación y gestión de descuentos. Podría incluir tablas como `invoice`, `invoice_detail`, `supplier_payment`, `discount` y `payment_method`.

5. **Recursos Humanos (RRHH)**: Este módulo administraría la información de los empleados, roles y permisos. Usaría tablas como `employee`, `employee_role`, `permission` y `role_permission`.

6. **Gestión de Usuarios y Seguridad**: Se enfocaría en la administración de usuarios del sistema, sus roles y permisos. Utilizaría tablas como `user`, `employee_role`, `permission` y `role_permission`.

### Modulos Principales

- Inventario
- Compras
- Ventas
- Finanzas
- RRHH
- Autenticacion

### Modulos Secundarios

- Inventario:
    1. Gestion de Productos
    2. Movimientos del Inventario
    3. Ajustes Inventario
    4. Unidades de Medida
    5. Categorias
    6. Marcas
- Compras
- Ventas:
    1. Lista Pedidos (Muestra resumen completo y status de los pedidos, el modulo más pesado)
    2. Gestion de Clientes
    3. Pedidos (Aqui se arma desde cero y se termina el pedido y detalles)
    4. Facturas (Aqui se ve la factura despues de haber sido un pedido inicialmente y se firma FEL)
    5. Método de Envio (Aqui se maneja la tabla de logistics_shipping para agregar Guatex, FORZA, etc.)
    6. Métodos de Pago
- Finanzas:
    1. Controlaría los aspectos financieros, como pagos, facturación y gestión de descuentos. PENDIENTE
- RRHH:
    1. Usuarios y Roles (Relacionar no CRUD), desactivar usuarios por si fue despedido o renuncio.
- Autenticacion:
    1. Usuarios
    2. Permisos
    3. Roles (Full CRUD y Relaciones)