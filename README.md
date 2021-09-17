# Lab1WebForms-AED
 Laboratorio 1 realizado en WebForms de ASP.NET para la clase de AED

## Resumen de cambios ##

    - Esta versión incluye la mayoría de las validaciones requeridas para evitar errores con lo que se ejecuta en el servidor (Backend).
    - Se han añadido paneles que simulan Toasts de notificación. Pueden informar el resultado de una acción ya sea correcta o incorrecta.
    - Se implementa de forma inestable el ingreso de imágenes en el registro de RegEmployee, así como su vista previa.
    - El código Backend de los formularios se ha actualizado para coincidir con los objetos validadores.
    - Se corrigieron y habilitaron los métodos de ordenación.
    - Se corrigió el método de aumento de salario en la clase SqLiteEmployees
    - Se han removido casi todas las referencias sin usar.
    - Arreglos menores de ortografía y coherencia.
    

## Problemas conocidos ##

**Urgente**

    - #2: Los estilos deshabilitados de los campos de RegEmployee no se muestran correctamente.

    - #3: Tras seleccionar una imagen sin haber validado los campos en RegEmployee no permitirá la introducción otra vez, aunque los campos se hayan corregido, tendrá que ser necesario recargar la página.

    - #4: Error al alternar del modo de edición al modo de registro.
        o A pesar de que el valor de Action puede cambiarse, el evento Load no tiene un validador adecuado para evitar conflictos con los campos.
        
        o Se ha implementado una solución temporal para poder alternar correctamente el modo, pero solo es posible desde el hipervínculo en el navbar.

    - #5: La recarga de la página siempre emite la última solicitud, por lo que si esta fue errónea, producirá resultados extraños.

**Problemas menores**

    - <style> .notify </style> en las interfaces de registro deberia ser trasladado al site.css

    - Se debería habilitar el cambio de foto de perfil.

    - Las etiquetas en interfaces homólogas pueden no coincidir.
        o Puede que produzcan pequeñas diferencias simétricas.

    - Pueden existir problemas de refactorización o símbolos nombrados incorrectamente.

    - La carpeta Local_App_Data se encuentra desorganizada

    - Los títulos de las columnas de las tablas están en inglés.

    - Las listas globales en Global.asax podrían ir en una clase diferente y destinada para ese propósito.
