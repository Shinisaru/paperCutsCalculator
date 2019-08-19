### File naming

* Please don't start your file names with lower case, i.e. `calculationsModel`, this is not common for swift/objc projects.
* Name of the file should represent main class/struct/extension it contains, i.e `calculationsModel` should be `ViewController+Calculations.swift` something.

### Code style
* Prefer spaces over tabs.
* Use linter to control and fix your code style.
* Gigantic spaces between functions, for instance, is an absolute no.
* Use logical separation of properties and methods, i.e. group IBOutlets together apart from other properties.
* In case of long method calls place each parameter on a new line.


### Layers & Hierarchy

* It is a bad idea to introduce public extensions on generic class like `ViewController` that are not commonly used across the application. If you need to extend a custom type (protocol) with some functionality that is not going to be used an$
* `Model` is considered to be an entity that takes specific responsibility on modifying, storing and providing data. Extending a view controller with additional methods and properties do not substitute a model. Make it a sepatate class.
* Every property and method that is not used outside owning class should be declared private.

### Comments and documentation

* Every method and property belonging to public API has to be documented usign standard syntax, describing inputs and outputs.
* Private api and implementation detauls should be documented in case of unclear decisions, complicated algorythms, etc.
* To cover exceptional situations use assert().
* Comments stating an obvious facts should be avoided, you are not helping anyone by "this is a general method" comment.

