# Catálogo de widgets Flutter

Aplicación didáctica con ejemplos interactivos de widgets de Flutter y
componentes reutilizables para una interfaz de rutas.

## Requisitos

- Flutter instalado y disponible en el `PATH` (`flutter --version`).
- Un emulador/dispositivo iniciado o un destino de escritorio/web compatible.

## Ejecutar

Desde la raíz del proyecto:

```bash
flutter pub get
flutter run
```

Para elegir un destino concreto, consulta primero `flutter devices` y ejecuta,
por ejemplo, `flutter run -d chrome` o `flutter run -d windows`.

## Comprobar

Ejecuta el análisis estático y todas las pruebas:

```bash
flutter analyze
flutter test
```

Actualmente, `flutter analyze` informa tres diagnósticos en
`lib/ui/catalogo/ui/contenedores_1_ejemplos_pantalla.dart` y
`test/pubspec.yaml`; por eso puede terminar con código distinto de cero. Las
pruebas de widgets se ejecutan con `flutter test`.

Las pruebas verifican la navegación inicial al ejemplo de texto, las variantes
y estilos de los componentes, las interacciones de botones, el comportamiento
de los iconos y las respuestas de carga de imágenes.

## Lista de mejoras incluidas

- [x] Catálogo con ejemplos de Text, Image, Icon, botones, Placeholder,
  Scaffold/AppBar y Container.
- [x] `EtiquetaCatalogo` con variantes normal, destacada y aviso.
- [x] `TextoJerarquico` con niveles de título, subtítulo y cuerpo.
- [x] `TextoResumen` con límite de líneas, centrado opcional y puntos
  suspensivos; rechaza un número de líneas no positivo.
- [x] `ImagenRuta` para recursos locales con descripción accesible y formato
  normal o panorámico.
- [x] `ImagenRemota` con ajuste configurable, indicador de carga, alternativa
  ante errores y semántica para imágenes informativas o decorativas.
- [x] `IconoEstado` para rutas pendientes, completadas o con error, y
  `IconoFavorito` marcado o sin marcar, con etiquetas semánticas.
- [x] `BotonAccion` normal, destacado o desactivado; `BotonConIcono` principal
  o secundario; y `BotonAviso` con mensaje y duración configurables.
- [x] `PantallaDemostracion` para comparar el estilo del AppBar y la posición
  del título.
- [x] Pruebas de widgets para estilos, propiedades, accesibilidad, acciones,
  mensajes y errores de carga.

## Dos componentes y sus pruebas

### `EtiquetaCatalogo`

`texto` es obligatorio porque es el contenido que se muestra. `variante` es
opcional y por defecto es `normal`, el caso más habitual; se usa un enum en vez
de un booleano para nombrar cada estilo y poder ampliar las opciones sin
acumular parámetros sí/no. Sus variantes son `normal`, `destacada` y `aviso`.

La prueba de `etiqueta_catalogo_test.dart` comprueba que las tres variantes
conservan el texto y aplican estilos distintos, incluidos el tamaño y el peso
de fuente esperados.

### `ImagenRemota`

`url` es obligatorio porque identifica el recurso. `ajuste` es opcional y usa
`BoxFit.cover` como valor inicial para llenar el espacio reservado; también
permite `BoxFit.contain` para mostrar la imagen completa. `decorativa` vale
`false` por defecto y separa imágenes informativas —que necesitan `descripcion`
para accesibilidad— de las puramente decorativas, que no requieren etiqueta.
En ambos casos se conserva un estado de carga y un mensaje alternativo si falla
la descarga.

Las pruebas de `imagen_remota_test.dart` comprueban, entre otros casos, que una
respuesta HTTP fallida muestra «No se pudo cargar la imagen» en lugar de dejar
el componente sin explicación.
