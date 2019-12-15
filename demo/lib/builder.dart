import 'package:build/build.dart';
import 'package:demo/demo_collector.dart';
import 'package:demo/demo_combiner.dart';

Builder demoCollector(BuilderOptions ops) => DemoCollector(ops);
Builder demoCombiner(BuilderOptions ops) => DemoCombiner(ops);
