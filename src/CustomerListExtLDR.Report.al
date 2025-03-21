report 50100 "Customer_List_Ext_LDR"
{
    // Este reporte extiende la funcionalidad estándar para listar clientes.
    // Incluye opciones para mostrar u ocultar el balance de los clientes.
    // El diseño del reporte está definido en un archivo RDLC externo llamado 'CustomerListExt_LDR.rdl'.
    ApplicationArea = All; // Define que este reporte está disponible en todas las áreas de la aplicación.
    Caption = 'Customer List Extended'; // Título del reporte.
    RDLCLayout = 'CustomerListExt_LDR.rdl'; // Archivo de diseño del reporte en formato RDLC.
    UsageCategory = ReportsAndAnalysis; // Clasificación del reporte para que esté disponible en "Reportes y Análisis".
    Permissions = tabledata Customer = R; // Permisos necesarios: acceso de solo lectura a la tabla Customer.

    dataset
    {
        // DataItem principal que obtiene datos de la tabla Customer.
        dataitem(Customer; Customer)
        {
            // Campos que se pueden filtrar desde la página de solicitud del reporte.
            RequestFilterFields = "No.", Name, "Customer Posting Group";

            // Columnas que se incluirán en el conjunto de datos del reporte.
            column(Address_LDR; Address)
            {
                // Campo "Address" de la tabla Customer.
            }
            column(Balance_LDR; Balance)
            {
                // Campo "Balance" de la tabla Customer. 
                // Este campo puede ser opcional dependiendo de la configuración del usuario.
            }
            column(City_LDR; City)
            {
                // Campo "City" de la tabla Customer.
            }
            column(Name_LDR; Name)
            {
                // Campo "Name" de la tabla Customer.
            }
            column(No__LDR; "No.")
            {
                // Campo "No." (Número) de la tabla Customer.
            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options'; // Título del grupo de opciones en la página de solicitud.

                    field(ShowBalanceField; ShowBalance)
                    {
                        ApplicationArea = All; // Disponible en todas las áreas de la aplicación.
                        Caption = 'Show Balance'; // Etiqueta para el campo en la página de solicitud.
                        ToolTip = 'Specifies if the customer balance should be shown in the report.';
                        // Tooltip que explica al usuario qué hace este campo.
                    }
                }
            }
        }
    }

    trigger OnPreReport()
    begin
        // Evento que se ejecuta antes de generar el reporte.
        if not ShowBalance then
            Customer.SetFilter(Balance, '=%1', 0);
        // Si el usuario selecciona no mostrar el balance (ShowBalance = false),
        // se aplica un filtro para que solo se incluyan clientes con balance igual a 0.
    end;

    var
        ShowBalance: Boolean;
    // Variable global utilizada para almacenar si el usuario desea mostrar o no el balance.
}

/* 
Explicación Detallada
Encabezado del Reporte:
Define las propiedades básicas del reporte, como su ID (50100), nombre (Customer_List_Ext_LDR), y diseño (CustomerListExt_LDR.rdl).
Es accesible desde todas las áreas (ApplicationArea = All) y está clasificado como un reporte analítico.

Dataset:
Es el conjunto de datos que alimenta el reporte. En este caso, se basa en los datos de la tabla Customer.
Define columnas específicas como Address, Balance, City, Name, y No. para incluirlas en el diseño del reporte.

Página de Solicitud (requestpage):
Permite al usuario configurar opciones antes de generar el reporte, como si desea mostrar u ocultar el balance con el campo ShowBalance.

Trigger OnPreReport:
Se ejecuta antes de generar el reporte y aplica lógica personalizada según las opciones seleccionadas por el usuario.
Por ejemplo, si ShowBalance es falso, filtra los registros para incluir solo aquellos clientes con balance igual a 0.

Variable Global:
La variable ShowBalance almacena si el usuario desea mostrar o no los balances.

Resumen
Este código implementa un reporte extendido para listar clientes, con flexibilidad para incluir o excluir información sensible como 
balances. Es útil para analizar datos específicos según las necesidades del usuario y sigue las mejores prácticas al permitir 
configuraciones personalizadas sin modificar directamente los datos base.
*/
