import 'package:fluent_ui/fluent_ui.dart';

import '../widgets/page.dart' as page;

class SnippetUsingScrollablePage extends page.ScrollablePage {
  @override
  Widget buildHeader(BuildContext context) {
    return const PageHeader(
      title: Text('Using Scrollable Pane'),
    );
  }

  bool selected = true;
  String? comboboxValue;

  Widget _generateComboBox(int index) {
    // brasil caralhooooo
    return SizedBox(
      width: 150,
      child: InfoLabel(
        label: 'ComboBox $index',
        child: Combobox<String>(
          value: comboboxValue,
          items: ['Item 1', 'Item 2']
              .map((e) => ComboboxItem(
                    child: Text(e),
                    value: e,
                  ))
              .toList(),
          isExpanded: true,
          onChanged: (v) => setState(() => comboboxValue = v),
        ),
      ),
    );
  }

  @override
  List<Widget> buildScrollable(BuildContext context) {
    assert(debugCheckHasFluentTheme(context));
    final theme = FluentTheme.of(context);
    return [
      Card(
        child: Wrap(alignment: WrapAlignment.center, spacing: 10.0, children: [
          ...List.generate(10, (index) => _generateComboBox(index)),
          //Test one
          InfoLabel(
            label: 'Test one (Horizontal ListView inside a ConstrainedBox)',
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 100),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return _generateComboBox(index);
                  }),
            ),
          ),
          InfoLabel(
            label: 'Test two (Test One with new ScrollController)',
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 100),
              child: ListView.builder(
                  controller: ScrollController(initialScrollOffset: 100),
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return _generateComboBox(index);
                  }),
            ),
          ),
          InfoLabel(
            label:
                'Test three (Test One with physics: const ClampingScrollPhysics())',
            child: SizedBox(
              height: 200.0,
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return _generateComboBox(index);
                },
              ),
            ),
          ),
        ]),
      ),
    ];
  }
}

class SnippetUsingSingleChildScrollView extends page.Page {
  @override
  Widget buildHeader(BuildContext context) {
    return const PageHeader(
      title: Text('Using Single Child Scroll View'),
    );
  }

  bool selected = true;
  String? comboboxValue;

  Widget _generateComboBox(int index) {
    return SizedBox(
      width: 200,
      child: InfoLabel(
        label: 'ComboBox $index',
        child: Combobox<String>(
          value: comboboxValue,
          items: ['Item 1', 'Item 2']
              .map((e) => ComboboxItem(
                    child: Text(e),
                    value: e,
                  ))
              .toList(),
          isExpanded: true,
          onChanged: (v) => setState(() => comboboxValue = v),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasFluentTheme(context));
    final theme = FluentTheme.of(context);
    return SingleChildScrollView(
        child: Card(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        ...List.generate(10, (index) => _generateComboBox(index)),
        //Test one
        InfoLabel(
          label: 'Test one (Horizontal ListView inside a ConstrainedBox)',
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 100),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return _generateComboBox(index);
                }),
          ),
        ),
        InfoLabel(
          label: 'Test two (Test One with new ScrollController)',
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 100),
            child: ListView.builder(
                controller: ScrollController(initialScrollOffset: 100),
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return _generateComboBox(index);
                }),
          ),
        ),
        InfoLabel(
          label:
              'Test three (Test One with physics: const ClampingScrollPhysics())',
          child: SizedBox(
            height: 200.0,
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 15,
              itemBuilder: (context, index) {
                return _generateComboBox(index);
              },
            ),
          ),
        ),
      ]),
    ));
  }
}
