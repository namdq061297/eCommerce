#!/usr/bin/env node

const fs = require('fs');
const path = require('path');

const [,, widgetName, folderPath = 'lib'] = process.argv;

if (!widgetName) {
  console.log('❌ Usage: flutter create-widget <WidgetName> [folderPath]');
  process.exit(1);
}

function toSnakeCase(str) {
  return str.replace(/([a-z])([A-Z])/g, '$1_$2').toLowerCase();
}

const snakeName = toSnakeCase(widgetName);
const fullPath = path.join(folderPath, `${snakeName}.dart`);
const content = `import 'package:flutter/material.dart';

class ${widgetName} extends StatelessWidget {
  const ${widgetName}({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('${widgetName}')),
    );
  }
}
`;

fs.mkdirSync(path.dirname(fullPath), { recursive: true });
fs.writeFileSync(fullPath, content);
console.log(`✅ Widget '${widgetName}' created at ${fullPath}`);
