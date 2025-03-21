// Esta extensión de tabla amplía la funcionalidad de la tabla 'Insurance' en Microsoft Dynamics 365 Business Central.
// Agrega campos personalizados para gestionar información adicional relacionada con seguros, como el proveedor de corretaje,
// alertas y períodos de notificación.

tableextension 50100 "ClipIns InsuranceExt_LDR" extends Insurance
{
    fields
    {
        /// <summary>
        /// Almacena el número del proveedor de corretaje relacionado con la póliza de seguro.
        /// </summary>
        /// <remarks>
        /// - Permite vincular seguros con proveedores específicos registrados en el sistema.
        /// - La relación con la tabla Vendor asegura que solo se puedan seleccionar proveedores válidos.
        /// - La validación de la relación de tabla mejora la integridad de los datos.
        /// </remarks>
        field(50100; ClipInsBrokerageVendorNo_LDR; Code[20])
        {
            Caption = 'Brokerage Vendor No.';
            DataClassification = CustomerContent;
            TableRelation = Vendor;
            ValidateTableRelation = true;
        }

        /// <summary>
        /// Indicador booleano para activar o desactivar alertas relacionadas con la póliza de seguro.
        /// </summary>
        /// <remarks>
        /// Puede usarse para notificar al usuario sobre eventos importantes relacionados con el seguro.
        /// </remarks>
        field(50101; ClipInsAlert_LDR; Boolean)
        {
            Caption = 'Alert';
            DataClassification = CustomerContent;
        }

        /// <summary>
        /// Almacena una fórmula de fecha que define un período de notificación relacionado con la póliza de seguro.
        /// </summary>
        /// <remarks>
        /// - Utiliza el tipo DateFormula (por ejemplo, "1M" para un mes, "10D" para diez días).
        /// - Puede utilizarse para calcular fechas importantes, como recordatorios o vencimientos.
        /// </remarks>
        field(50102; ClipInsNotice_LDR; DateFormula)
        {
            Caption = 'Notice';
            DataClassification = CustomerContent;
        }
    }
}

// Notas adicionales:
// 1. Los IDs de los campos (50100, 50101, 50102) deben estar dentro del rango asignado para evitar conflictos.
// 2. Todos los campos están clasificados como CustomerContent para cumplir con regulaciones de privacidad y seguridad.
// 3. Esta extensión respeta las mejores prácticas de Microsoft al extender objetos sin modificar el código base.
