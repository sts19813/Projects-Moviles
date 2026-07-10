const layoutMediaSourceCodes = <String, String>{
  'row': '''Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: const [Icon(Icons.home), Icon(Icons.search), Icon(Icons.person)],
)''',
  'column': '''Column(
  mainAxisSize: MainAxisSize.min,
  children: const [Icon(Icons.cloud), Text('Sincronización'), LinearProgressIndicator()],
)''',
  'stack': '''Stack(
  children: const [
    Positioned.fill(child: ColoredBox(color: Colors.purple)),
    Center(child: Icon(Icons.photo)),
    Positioned(top: 8, right: 8, child: Badge(label: Text('3'))),
  ],
)''',
  'wrap': '''Wrap(
  spacing: 8,
  runSpacing: 8,
  children: tags.map((tag) => Chip(label: Text(tag))).toList(),
)''',
  'expanded': '''Row(
  children: const [
    SizedBox(width: 70, child: Text('Fijo')),
    Expanded(child: ColoredBox(color: Colors.purple)),
  ],
)''',
  'flexible': '''Row(
  children: const [
    Icon(Icons.info_outline),
    Flexible(child: Text('Texto que se adapta al espacio disponible.')),
  ],
)''',
  'align': '''Align(
  alignment: Alignment.bottomRight,
  child: Chip(label: Text('Abajo · derecha')),
)''',
  'center': '''const Center(child: FlutterLogo(size: 72))''',
  'padding': '''const Padding(
  padding: EdgeInsets.all(32),
  child: Text('Contenido con espacio interior'),
)''',
  'container': '''Container(
  width: 240,
  height: 130,
  alignment: Alignment.center,
  decoration: BoxDecoration(
    gradient: LinearGradient(colors: [Colors.deepPurple, Colors.purpleAccent]),
    borderRadius: BorderRadius.circular(24),
  ),
  child: const Text('Container'),
)''',
  'sized-box': '''const SizedBox(width: 32)''',
  'aspect-ratio': '''const AspectRatio(
  aspectRatio: 16 / 9,
  child: ColoredBox(color: Colors.deepPurple),
)''',
  'layout-builder': '''LayoutBuilder(
  builder: (context, constraints) {
    return Text(constraints.maxWidth >= 500 ? 'Diseño amplio' : 'Diseño compacto');
  },
)''',
  'safe-area': '''const SafeArea(child: Text('Contenido seguro'))''',
  'custom-scroll-view': '''CustomScrollView(
  slivers: [
    const SliverAppBar(pinned: true, title: Text('Título')),
    SliverList.builder(itemCount: 20, itemBuilder: buildItem),
  ],
)''',
  'sliver-list': '''SliverList.separated(
  itemCount: items.length,
  itemBuilder: (context, index) => ListTile(title: Text(items[index])),
  separatorBuilder: (context, index) => const Divider(),
)''',
  'sliver-grid': '''SliverGrid.builder(
  itemCount: items.length,
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
  itemBuilder: (context, index) => Card(child: Text(items[index])),
)''',
  'local-image': '''Image.asset(
  'assets/branding/app_icon.png',
  width: 180,
  height: 180,
  fit: BoxFit.cover,
)''',
  'network-image': '''Image.network(
  'https://picsum.photos/640/360',
  loadingBuilder: buildProgress,
  errorBuilder: buildError,
)''',
  'image-placeholder': '''Container(
  width: 320,
  height: 180,
  color: Theme.of(context).colorScheme.surfaceContainerHighest,
  child: const Center(child: Icon(Icons.image_outlined)),
)''',
  'image-error': '''Image.network(
  imageUrl,
  errorBuilder: (context, error, stackTrace) => const Column(
    children: [Icon(Icons.broken_image_outlined), Text('Imagen no disponible')],
  ),
)''',
  'circular-image': '''const CircleAvatar(
  radius: 72,
  backgroundImage: AssetImage('assets/branding/app_icon.png'),
)''',
  'image-gallery': '''PageView.builder(
  itemCount: images.length,
  onPageChanged: (page) => setState(() => currentPage = page),
  itemBuilder: (context, index) => Image.asset(images[index]),
)''',
  'basic-video': '''Column(
  children: [
    AspectRatio(aspectRatio: 16 / 9, child: videoSurface),
    Slider(value: position, onChanged: updatePosition),
    IconButton(onPressed: togglePlayback, icon: Icon(playing ? Icons.pause : Icons.play_arrow)),
  ],
)''',
  'file-selector': '''OutlinedButton.icon(
  onPressed: selectFile,
  icon: const Icon(Icons.attach_file),
  label: const Text('Elegir archivo'),
)''',
  'image-selector': '''GridView.builder(
  itemCount: sampleImages.length,
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
  itemBuilder: (context, index) => Image.asset(sampleImages[index]),
)''',
};
