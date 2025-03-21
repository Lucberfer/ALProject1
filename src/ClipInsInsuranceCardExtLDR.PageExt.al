// Esta extensión de página amplía la funcionalidad de la página "Insurance Card" en Microsoft Dynamics 365 Business Central.
// Agrega un nuevo campo personalizado para gestionar información adicional relacionada con la correduría de seguros.

pageextension 50101 "ClipIns InsuranceCardExt_LDR" extends "Insurance Card"
{
    layout
    {
        addafter("Insurance Vendor No.")
        {
            /// <summary>
            /// Campo para especificar el número de correduría de seguro.
            /// </summary>
            /// <remarks>
            /// - Se agrega después del campo "Insurance Vendor No." en la página.
            /// - Utiliza el campo ClipInsBrokerageVendorNo_LDR definido en la extensión de tabla correspondiente.
            /// - ApplicationArea está configurada para FixedAssets, lo que significa que el campo será visible y editable
            ///   en áreas de la aplicación relacionadas con activos fijos.
            /// </remarks>
            field(ClipInsBrokerageVendorNo_LDR; Rec.ClipInsBrokerageVendorNo_LDR)
            {
                ApplicationArea = FixedAssets;
                Caption = 'Correduria de seguro';
                ToolTip = 'Especifica el número de correduría de seguro';
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        Message(Rec.ClipInsBrokerageVendorNo_LDR);
        Message(xRec.ClipInsBrokerageVendorNo_LDR);
    end;
}


// Notas adicionales:
// 1. Esta extensión de página complementa la extensión de tabla ClipIns InsuranceExt_LDR.
// 2. El ID de la extensión (50101) debe estar dentro del rango asignado para evitar conflictos.
// 3. La extensión respeta las mejores prácticas de Microsoft al extender objetos sin modificar el código base.
// 4. El campo se agrega específicamente en el área de aplicación de Activos Fijos (FixedAssets).


/* 
Esta extensión de página es como añadir una nueva característica a una página existente en Microsoft Dynamics 365 Business Central, 
específicamente a la página "Insurance Card" (Tarjeta de Seguro).

Imagina que tienes una ficha de seguro y quieres añadir un nuevo dato: el número de la correduría de seguros. 
Eso es exactamente lo que hace esta extensión.

Lo que hace esta extensión
Añade un nuevo campo llamado "Correduria de seguro" justo después del campo "Insurance Vendor No." (Número de Proveedor de Seguro) 
en la página.

Este nuevo campo permite a los usuarios introducir y ver el número de la correduría de seguros.

El campo solo aparecerá en las partes del programa relacionadas con los activos fijos (como maquinaria o equipos).

Cuando alguien abre o modifica esta página, el programa mostrará un mensaje con el valor actual y el valor anterior de este
nuevo campo.

Por qué es útil
Permite almacenar más información sobre los seguros sin tener que cambiar el programa original.

Hace más fácil para los usuarios gestionar información adicional sobre las corredurías de seguros.

Se integra perfectamente con la página existente, como si siempre hubiera estado allí.

En resumen, esta extensión añade una nueva pieza de información útil a una página existente, haciéndola más completa 
y útil para gestionar seguros en Business Central. 
*/
