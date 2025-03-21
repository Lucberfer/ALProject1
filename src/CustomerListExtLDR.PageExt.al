// Este archivo contiene una extensión de página para la lista de clientes en Microsoft Dynamics 365 Business Central.
// La extensión añade funcionalidad adicional a la página estándar "Customer List".

namespace DefaultPublisher.ALProject1;

using Microsoft.Sales.Customer;

/// <summary>
/// Extensión de página 50100 "CustomerListExt_LDR" que extiende la página "Customer List".
/// </summary>
/// <remarks>
/// Esta extensión demuestra cómo agregar comportamiento personalizado a una página existente.
/// En este caso, muestra un mensaje cuando se abre la página de lista de clientes.
/// </remarks>
pageextension 50100 CustomerListExt_LDR extends "Customer List"
{
    /// <summary>
    /// Trigger que se ejecuta cuando se abre la página de lista de clientes.
    /// </summary>
    /// <remarks>
    /// Este trigger muestra un mensaje de "Hello world" para confirmar que la aplicación se ha publicado correctamente.
    /// Es útil para verificar que la extensión se ha instalado y está funcionando.
    /// </remarks>
    trigger OnOpenPage()
    begin
        Message('App published: Hello world');
    end;
}

// Notas adicionales:
// 1. El ID de la extensión (50100) debe estar dentro del rango asignado para evitar conflictos con otros objetos.
// 2. Esta extensión utiliza el namespace 'DefaultPublisher.ALProject1', que debería ser único para este proyecto.
// 3. Se utiliza la declaración 'using' para importar el namespace Microsoft.Sales.Customer, lo que permite acceder a objetos relacionados con clientes.
// 4. El mensaje mostrado es un ejemplo básico y debería ser reemplazado con funcionalidad real en una aplicación en producción.
// 5. Para desarrollo futuro, considere agregar más funcionalidades útiles a la lista de clientes, como filtros personalizados o acciones adicionales.

/* 
Esta extensión de página para Business Central hace lo siguiente:

Extiende la página estándar "Customer List" (Lista de Clientes).
Añade un nuevo comportamiento cuando se abre la página:
Muestra un mensaje que dice "App published: Hello world".

El propósito principal es:
Demostrar cómo se puede añadir funcionalidad a una página existente.
Proporcionar una confirmación visual de que la extensión está instalada y funcionando.

El trigger 'OnOpenPage':
Se ejecuta automáticamente cada vez que un usuario abre la página de lista de clientes.
En este caso, solo muestra un mensaje simple, pero podría contener lógica más compleja en una aplicación real.

Esta extensión es muy básica y sirve principalmente como punto de partida o prueba:
En una aplicación real, se reemplazaría el mensaje con funcionalidades útiles para los usuarios.

Podrían añadirse nuevos campos, botones, o lógica de negocio más compleja.

En resumen, esta extensión añade un pequeño "saludo" a la página de lista de clientes, lo que permite verificar rápidamente 
que la extensión está funcionando correctamente. Es un ejemplo sencillo de cómo se pueden personalizar las páginas estándar 
en Business Central.
*/