const basicComponentSourceCodes = <String, String>{
  'elevated-button': '''ElevatedButton.icon(
  onPressed: () {},
  icon: const Icon(Icons.upload),
  label: const Text('Subir archivo'),
)''',
  'outlined-button': '''OutlinedButton(
  onPressed: () {},
  child: const Text('Más información'),
)''',
  'text-button': '''TextButton(
  onPressed: () {},
  child: const Text('Cancelar'),
)''',
  'icon-button': '''IconButton.filledTonal(
  tooltip: 'Agregar a favoritos',
  onPressed: () {},
  icon: const Icon(Icons.favorite_outline),
)''',
  'floating-action-button': '''FloatingActionButton.extended(
  onPressed: () {},
  icon: const Icon(Icons.add),
  label: const Text('Crear'),
)''',
  'cupertino-button': '''CupertinoButton.filled(
  onPressed: () {},
  child: const Text('Continuar'),
)''',
  'adaptive-button': '''Platform.isIOS
    ? CupertinoButton.filled(
        onPressed: () {},
        child: const Text('Continuar'),
      )
    : FilledButton(
        onPressed: () {},
        child: const Text('Continuar'),
      )''',
  'text-form-field': '''TextFormField(
  decoration: const InputDecoration(
    labelText: 'Correo electrónico',
  ),
  validator: (value) => value != null && value.contains('@')
      ? null
      : 'Ingresa un correo válido',
)''',
  'dropdown-menu': '''DropdownMenu<String>(
  initialSelection: 'Flutter',
  onSelected: (value) {},
  dropdownMenuEntries: const [
    DropdownMenuEntry(value: 'Flutter', label: 'Flutter'),
    DropdownMenuEntry(value: 'Dart', label: 'Dart'),
  ],
)''',
  'checkbox': '''CheckboxListTile(
  title: const Text('Acepto los términos'),
  value: accepted,
  onChanged: (value) => setState(() => accepted = value ?? false),
)''',
  'radio': '''RadioGroup<String>(
  groupValue: selection,
  onChanged: (value) => setState(() => selection = value),
  child: const Column(
    children: [
      Radio<String>(value: 'personal'),
      Radio<String>(value: 'business'),
    ],
  ),
)''',
  'switch': '''SwitchListTile(
  title: const Text('Notificaciones'),
  value: enabled,
  onChanged: (value) => setState(() => enabled = value),
)''',
  'slider': '''Slider(
  value: volume,
  max: 100,
  divisions: 10,
  onChanged: (value) => setState(() => volume = value),
)''',
  'date-picker': '''final date = await showDatePicker(
  context: context,
  initialDate: DateTime.now(),
  firstDate: DateTime(2020),
  lastDate: DateTime(2035),
);''',
  'time-picker': '''final time = await showTimePicker(
  context: context,
  initialTime: TimeOfDay.now(),
);''',
  'cupertino-switch': '''CupertinoSwitch(
  value: enabled,
  onChanged: (value) => setState(() => enabled = value),
)''',
  'card': '''Card(
  child: InkWell(
    onTap: () {},
    child: const ListTile(
      leading: CircleAvatar(child: Icon(Icons.flutter_dash)),
      title: Text('Flutter UI'),
    ),
  ),
)''',
  'list-tile': '''ListTile(
  leading: const CircleAvatar(child: Icon(Icons.person_outline)),
  title: const Text('María Santos'),
  subtitle: const Text('Diseñadora de producto'),
  trailing: const Icon(Icons.chevron_right),
  onTap: () {},
)''',
  'expansion-tile': '''ExpansionTile(
  leading: const Icon(Icons.help_outline),
  title: const Text('¿Qué es Material 3?'),
  children: const [
    Padding(padding: EdgeInsets.all(16), child: Text('Respuesta')),
  ],
)''',
  'grid-view': '''GridView.builder(
  itemCount: 6,
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
  ),
  itemBuilder: (context, index) => Card(child: Center(child: Text('\$index'))),
)''',
  'page-view': '''PageView(
  onPageChanged: (page) {},
  children: const [
    Center(child: Text('Página 1')),
    Center(child: Text('Página 2')),
  ],
)''',
  'navigation-bar': '''NavigationBar(
  selectedIndex: index,
  onDestinationSelected: (value) => setState(() => index = value),
  destinations: const [
    NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Inicio'),
    NavigationDestination(icon: Icon(Icons.search), label: 'Buscar'),
  ],
)''',
  'navigation-rail': '''NavigationRail(
  selectedIndex: index,
  onDestinationSelected: (value) => setState(() => index = value),
  destinations: const [
    NavigationRailDestination(icon: Icon(Icons.home), label: Text('Inicio')),
    NavigationRailDestination(icon: Icon(Icons.widgets), label: Text('Catálogo')),
  ],
)''',
  'drawer': '''Drawer(
  child: ListView(
    children: const [
      DrawerHeader(child: FlutterLogo()),
      ListTile(leading: Icon(Icons.home), title: Text('Inicio')),
    ],
  ),
)''',
  'tab-bar': '''DefaultTabController(
  length: 3,
  child: Column(
    children: const [
      TabBar(tabs: [Tab(text: 'Resumen'), Tab(text: 'Actividad')]),
      Expanded(child: TabBarView(children: [Text('Resumen'), Text('Actividad')])),
    ],
  ),
)''',
  'stepper': '''Stepper(
  currentStep: currentStep,
  onStepContinue: () => setState(() => currentStep += 1),
  steps: const [
    Step(title: Text('Cuenta'), content: Text('Datos de acceso')),
    Step(title: Text('Perfil'), content: Text('Información personal')),
  ],
)''',
};
