# Flutter UI Catalog

Catálogo interactivo de componentes reutilizables para Flutter. La aplicación permite explorar 66 componentes Material, Cupertino y adaptativos, probar sus estados, modificar propiedades, consultar código Dart y guardar preferencias locales.

El proyecto funciona en Android e iOS, utiliza Material 3 y adapta su navegación a teléfonos, tablets y orientación horizontal.

## Características

- 66 componentes funcionales organizados por categorías, incluyendo diseño, estructura y multimedia.
- Vistas previas interactivas y variantes.
- Playground dinámico para `FilledButton` y `TextField`.
- Código Dart con resaltado de sintaxis, expansión y copia al portapapeles.
- Búsqueda por nombre, categoría, descripción y etiquetas.
- Filtros por plataforma y nivel.
- Favoritos, búsquedas y componentes recientes persistentes.
- Temas claro, oscuro y del sistema.
- Densidad visual configurable.
- Navegación con `NavigationBar` en teléfonos y `NavigationRail` en tablets.
- Componentes adaptativos para Android e iOS.
- Soporte para tamaños de texto y orientación del sistema.
- Pruebas unitarias, de widgets y golden.

## Capturas de pantalla

Las siguientes posiciones están reservadas para capturas de la versión publicada:

| Inicio | Catálogo | Detalle |
| --- | --- | --- |
| _Captura pendiente_ | _Captura pendiente_ | _Captura pendiente_ |

| Búsqueda | Tema oscuro | Tablet |
| --- | --- | --- |
| _Captura pendiente_ | _Captura pendiente_ | _Captura pendiente_ |

## Requisitos

- Flutter 3.44.5 estable o posterior compatible.
- Dart 3.12.2 o posterior compatible.
- Android Studio con Android SDK 24 o superior.
- Para iOS: macOS, Xcode y CocoaPods.
- iOS 13.0 o superior.

Comprueba el entorno con:

```bash
flutter doctor -v
```

## Instalación

```bash
git clone <URL_DEL_REPOSITORIO>
cd flutter_ui_catalog
flutter pub get
```

Ejecuta la aplicación en un dispositivo o simulador disponible:

```bash
flutter devices
flutter run
```

## Ejecución en Android

Inicia un emulador o conecta un dispositivo con depuración USB y ejecuta:

```bash
flutter run -d android
```

El identificador de aplicación es `com.santos.flutteruicatalog` y el SDK mínimo es Android 24.

## Ejecución en iOS

Instala las dependencias nativas si es necesario:

```bash
cd ios
pod install
cd ..
flutter run -d ios
```

El bundle identifier es `com.santos.flutteruicatalog` y el deployment target es iOS 13.0.

## Comandos de calidad

```bash
dart format --output=none --set-exit-if-changed lib test
flutter analyze
flutter test
```

Para ejecutar únicamente los goldens:

```bash
flutter test test/golden_test.dart
```

Si un cambio visual es intencional, regenera y revisa los PNG antes de confirmarlos:

```bash
flutter test test/golden_test.dart --update-goldens
```

Los archivos de referencia están en `test/goldens/`.

## Builds

Android APK:

```bash
flutter build apk
```

Android App Bundle:

```bash
flutter build appbundle
```

iOS:

```bash
flutter build ios
```

El build de iOS requiere configurar un equipo de firma en Xcode para distribución.

## Arquitectura

El código se organiza por características. Los modelos no almacenan widgets; un registro de presentación resuelve cada demo mediante su identificador.

```text
lib/
├── main.dart
├── app/
│   ├── app.dart
│   ├── router/
│   └── theme/
├── core/
│   ├── constants/
│   ├── helpers/
│   ├── persistence/
│   └── widgets/
├── features/
│   ├── catalog/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   ├── favorites/
│   ├── home/
│   ├── navigation/
│   ├── recent/
│   ├── search/
│   ├── settings/
│   └── splash/
├── components/
│   ├── animations/
│   ├── buttons/
│   ├── cards/
│   ├── cupertino/
│   ├── data_display/
│   ├── dialogs/
│   ├── feedback/
│   ├── inputs/
│   ├── lists/
│   └── navigation/
└── shared/
    ├── code_viewer/
    ├── component_preview/
    └── platform_adaptive/
```

## Estado y persistencia

Riverpod administra tema, preferencias, filtros, favoritos, historial, recientes y configuraciones de demos.

`SharedPreferencesAsync` guarda únicamente estas claves:

- `settings.theme`
- `settings.use_material_3`
- `settings.density`
- `settings.show_cupertino`
- `settings.show_code`
- `catalog.favorites`
- `search.history`
- `catalog.recent`

El restablecimiento de configuración usa una lista permitida y no elimina datos de otros plugins o código nativo.

## Dependencias

| Paquete | Uso |
| --- | --- |
| `flutter_riverpod` | Estado global e inyección de dependencias |
| `go_router` | Navegación declarativa y rutas anidadas |
| `google_fonts` | Tipografía Inter |
| `shared_preferences` | Persistencia local asíncrona |
| `flutter_highlight` | Resaltado de código Dart |
| `cupertino_icons` | Iconos con estilo iOS |
| `flutter_launcher_icons` | Generación reproducible de iconos |
| `flutter_native_splash` | Generación del splash nativo |

No se utiliza un paquete responsive adicional; los breakpoints se implementan con `MediaQuery` y `LayoutBuilder`.

## Agregar un componente

1. Crea una demo independiente dentro de la categoría correspondiente en `lib/components/`.
2. Agrega un `CatalogComponent` a `catalog_registry.dart` con ID único, descripción, categoría, etiquetas, plataforma y nivel.
3. Registra el widget en `component_demo_preview.dart` usando el ID del modelo.
4. Añade su código a `basic_component_source_codes.dart` o `advanced_component_source_codes.dart`. Si requiere código dinámico, extiende `DemoSourceCode`.
5. Si necesita controles configurables, amplía `DemoConfiguration` y `ComponentPropertiesPanel`.
6. Añade pruebas de renderizado e interacción.
7. Ejecuta formato, análisis y toda la suite antes de confirmar cambios.

## Icono y splash

El recurso temporal está en `assets/branding/app_icon.png`. Para reemplazarlo:

1. Sustituye el PNG por una imagen cuadrada de al menos 1024×1024.
2. Ajusta `flutter_launcher_icons.yaml` y `flutter_native_splash.yaml` si cambian los colores.
3. Regenera los recursos:

```bash
dart run flutter_launcher_icons -f flutter_launcher_icons.yaml
dart run flutter_native_splash:create --path=flutter_native_splash.yaml
```

Los generadores actualizan los recursos nativos de Android e iOS. Revisa visualmente ambos antes de publicar.

## Permisos

- Android declara acceso a Internet para la carga de Google Fonts.
- iOS no solicita permisos sensibles.
- Los ejemplos actuales no solicitan cámara, fotos, ubicación, micrófono ni almacenamiento.

Los futuros ejemplos multimedia que requieran permisos deben mantenerse separados y documentar claramente su propósito.
