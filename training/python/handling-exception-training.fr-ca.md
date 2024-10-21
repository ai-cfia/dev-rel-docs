# Python: Gérer et soulever des exceptions

|:wave: Pour en savoir plus (anglais seulement)|
|:--|
|[Python's raise: Effectively Raising Exceptions in Your Code](https://realpython.com/python-raise-exception/#chaining-exceptions-with-the-from-clause)|
| [Python Exceptions: An Introduction](https://realpython.com/python-exceptions/)|
|[How to Catch Multiple Exceptions in Python](https://realpython.com/python-catch-multiple-exceptions/)|
|[Ever Better Error Messages](https://realpython.com/python312-error-messages/)|
|[LBYL vs EAFP: Preventing or Handling Errors in Python](https://realpython.com/python-lbyl-vs-eafp/)|
|[Following Best Practices When Raising Exceptions](https://realpython.com/python-raise-exception/#following-best-practices-when-raising-exceptions)|
|[Take the test](https://realpython.com/quizzes/python-raise-exception/)|

## Sommaire

|Chapitres|
|--|
| [Qu'est-ce qu'une Exception](#quest-ce-quune-exception)|
|[Différentes façon de gérer une Exception](#différente-façon-de-gérer-une-exception)|
|[Différentes façon de lever une Exception](#différente-façon-de-lever-une-exception)|
|[Les bonnes pratiques lorsqu'on lève / gère des Exceptions](#les-bonnes-pratiques-lorsquon-lève--gère-des-exceptions)|
|[Annexe](#annexe-1)|

### Avant de commencer

- [English version](handling-exception-training.md) :small_orange_diamond:
- Cet entraînement est pour les développeur·euse·s backend, mais tous sont les
  bienvenus.

### Qu'est-ce qu'une Exception

Une exception en Python indique qu’il y a eu un problème dans votre code. Elle
peut prendre la forme d’une erreur (cas classique), d’un avertissement ou d’une
situation exceptionnelle.

> :grey_exclamation: Notez que toutes les exceptions en Python ne sont pas des erreurs.
Le meilleur exemple est l’objet [`StopIteration`](https://docs.python.org/3/library/exceptions.html#StopIteration),
qui est une sous-classe de `Exception`

Lorsqu'une `Exception` représente une erreur, il est courant d'ajouter le suffixe
`Error` à son nom. Exemple :

- `ValueError`, `DivisionByZeroError`, etc.

Lorsqu'une `Exception` représente un avertissement, Python propose la classe `Warning`
pour signaler des conditions qui ne nécessitent pas l'arrêt du programme.

Il existe deux types d'exceptions en Python :

- Exceptions intégrées : Ces exceptions sont intégrées dans le langage.
- Exceptions définies par l'utilisateur : Des exceptions personnalisées définies
par les développeur·euse·s. Elles se trouvent généralement dans un module spécifique
pour un projet donné.

> Vous pouvez trouver la hiérarchie des exceptions intégrées [ici](https://docs.python.org/3/library/exceptions.html#exception-hierarchy)

#### Création d'exception définie par l'utilisateur exemple

```python
# Toujours utiliser la classe Exception
# Ne pas utiliser la classe BaseException
class MyException(Exception):
    pass

# Pour des exemples, voir les liens des exceptions
class MyExceptionError(Exception):
    pass

# UserWarning est la classe pour générer des avertissements
# Warning est la classe de base pour tous les avertissements
class MyWarning(UserWarning):
    pass
```

> En Python, il est courant de créer une classe fictive pour les exceptions en utilisant
le mot-clé `pass`, car le nom de la classe est l’élément le plus important.

|:warning:|Un bon nom d’exception personnalisée communique le problème sous-jacent|
|--|:--|
|:x:| GenericException(Exception)|
|:white_check_mark:| SpecificToProjectException(Exception)|

Voici une liste des attributs principaux des exceptions :

|Attributs|Type|Actions|
|--|--|--|
|`args`|tuple or string|Contiens toutes les valeurs passées en argument à la classe|
|`__traceback__`|dunder attribute|Contiens l'object traceback de l'exception|
|`__cause__`|dunder attribute|Contiens l'expression passée au mot-clé `from`|
|`.with_traceback()`|methodes|Mets à jour l'objet traceback de l'exception|
|`.add_notes()`|methodes|Ajoute des notes à l'objet traceback (`__note__`)|

Quand vous instanciez une exception, vous pouvez lui donner un ou plusieurs attributs.

```python
# L'instanciation habituelle
raise Exception("an error occurred")

# Avec plusieurs arguments
raise Exception("an error occurred", "unexpected value", 42)
```

> Un objet [traceback](https://realpython.com/python-traceback/) est aussi appelé
 un Stack trace, un Stack traceback et un backtrace
> Les exceptions comptent plus de 60 attributs.

#### Lien vers la documentation des différents types d'exception

|:warning:|:boom:|:interrobang:|
|--|--|--|
|[Warning](https://docs.python.org/3/library/warnings.html#warning-categories)|[Error](https://docs.python.org/3/library/exceptions.html#concrete-exceptions)|[Exception](https://docs.python.org/3/library/exceptions.html#Exception)|

### Différente façon de gérer une Exception

#### 3 étapes pour gérer les exceptions

1. **Prédire quelles exceptions peuvent se produire**. Vous pouvez même provoquer
volontairement l'échec du programme pour découvrir quelles exceptions sont levées.
1. Si vous utilisez une **exception personnalisée**, utilisez le mot-clé `raise`.
1. **Déterminez où l'exception doit être gérée dans votre code**.

#### Gérer les exceptions exemple

Gestion générique des exceptions.

```python
couleurs = ["rouge", "bleu", "vert"]

try:
    couleurs[10]
except IndexError:
    print("votre liste ne possède pas cet index :-(")
```

Vous pouvez aussi gérer plusieurs erreurs dans la même déclaration.

```python
couleurs = ["rouge", "bleu", "vert"]

try:
  couleurs[10]
except (ValueError, IndexError) as erreur:
  if isinstance(ValueError, erreur):
    print("cette erreur est une erreur de valeur")

  if isinstance(IndexError, error):
    print("cette erreur est une erreur d'index")
```

Lors de la gestion d'exception, vous voudrez peut-être effectuer des actions supplémentaires
avant de lever l’erreur.

```python
>>> import logging
>>> try:
...     result = 42 / 0
... except Exception as erreur:
...     logging.error(erreur)
...     raise

ERROR:root:division by zero
Traceback (most recent call last):
  File "<stdin>", line 5, in <module> # will only appear if 'raise error' was called
  File "<stdin>", line 2, in <module>
ZeroDivisionError: division by zero
```

### Différente façon de lever une Exception

```python
# grades.py

# Créer son exception personnalisée
class GradeValueError(Exception):
  pass

def calculate_avergae_grade(grades):
  total = 0
  count = 0
  for grade in grades:
    if grade < 0 or grade > 100:
      # Lever l'exception personnalisée
      raise GradeValueError(
        "grade values must be between 0 and 100 inclusive"
      )
    total += grade
    count += 1
  return round(total / count, 2)
```

> Ici on aurait pu utiliser ValueError, mais GradeValueError est plus spécifique
et décrit mieux l'erreur qu'on veut lancer.

Vous devriez lever une exception lorsque :

- Vous signalez des erreurs ou une situation exceptionnelle
- Vous soulevez de nouveau une exception après avoir fait d'autres opérations (par
exemple: du logging)

> Python encourage l'approche **Easier to ask forgiveness than permission (EAFP)**
plutôt que l'approche **Look before you lead (LBYL)**.

|:bookmark_tabs:|C'est à la·e développeur·euse de décider du bon moment pour gérer une exception.|
|:--|:--|

#### Utilisation du mot clé `raise`

##### Seul

```python
def some_func(arg):
    try:
        do_something(arg)
    except Exception as error:
        logging.error(error)
        raise
    # Ici on le mot clé "raise" soulève de nouveau l'Exception qui a été soulevée
    # par do_something
```

##### Conditionnelle

```python
>>> from math import sqrt

>>> def is_prime(number):
...     if not isinstance(number, int):
...         raise TypeError(
...             f"s'attend a un integer, reçoit {type(number).__name__}"
...         )
...     if number < 2:
...         raise ValueError(f"s'attend à un integer au-dessus de 1, reçoit {number}")
...     for candidate in range(2, int(sqrt(number)) + 1):
...         if number % candidate == 0:
...             return False
...     return True
...
```

:white_check_mark: Lever des exceptions rapidement, avant d'effectuer des opérations
importantes constitue une bonne pratique.

##### Envelopper des exceptions ensemble

```python
>>> class MathLibraryError(Exception):
...     pass
...

>>> def divide(a, b):
...     try:
...         return a / b
...     except ZeroDivisionError as error:
...         raise MathLibraryError(error)
...

>>> divide(1, 0)
Traceback (most recent call last):
  File "<stdin>", line 3, in divide
ZeroDivisionError: division by zero

During the handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "<stdin>", line 5, in divide
MathLibraryError: division by zero
```

:exclamation: Même si l'exemple ci-dessus peut vraiment améliorer votre code, la
clause `from` offre de meilleures alternatives.

#### Utilisation de la clause `from`

La clause optionnelle `from` permets à la·e développeur·euse d'associer une
exception à celle qui est active.

Si l'argument passé en paramètre à la clause `from` est une instance d'exception,
celle-ci va s'attacher à l'attribut `__cause__`. S'il s'agit d'une classe d'exception,
Python va l'instancier avant de l'attacher à l'attribut `__cause__`.

Lorsque la clause `from` est utilisée, vous pouvez vous attendre à avoir le traceback
des deux exceptions à la console.

```python
>>> try:
...     result = 42 / 0
... except Exception as error:
...     raise ValueError("opération non alloué") from error
...
Traceback (most recent call last):
  File "<stdin>", line 2, in <module>
ZeroDivisionError: division by zero

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "<stdin>", line 4, in <module>
ValueError: operation not allowed
```

Dans cet exemple, Python indique la première erreur (`ZeroDivisionError`) est la
raison de la seconde erreur (`ValuError`). Il s'agit d'un outil très efficace pour
écrire du code qui peut soulever plusieurs types d'exceptions. Par exemple :

```python
>>> def divide(x, y):
...     for arg in (x, y):
...         if not isinstance(arg, int | float):
...             raise TypeError(
...                 f"s'attend à recevoir un nombre, reçoit {type(arg).__name__}"
...             )
...     if y == 0:
...         raise ValueError("le dénominateur ne peut pas être zéro")
...     return x / y
...
```

La division fonctionne puisqu'on lève différentes erreurs : `TypeError` et `ValueError`.
Voici comment la fonction se comporte avec la clause `from` avec `raise` :

```python
>>> try:
...     divide(42, 0)
... except Exception as error:
...     raise ValueError("argument invalide") from error
...
Traceback (most recent call last):
  File "<stdin>", line 2, in <module>
  File "<stdin>", line 6, in divide
ValueError: denominator can't be zero

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "<stdin>", line 4, in <module>
ValueError: invalid argument

>>> try:
...     divide("Un", 42)
... except Exception as error:
...     raise ValueError("argument invalide") from error
...
Traceback (most recent call last):
  File "<stdin>", line 2, in <module>
  File "<stdin>", line 4, in divide
TypeError: number expected, got str

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "<stdin>", line 4, in <module>
ValueError: invalid argument
```

> Sans la clause `from`, le traceback ne va pas indiquer de lien direct entre les
deux erreurs.

- Avec `from`:
  - The above exception was the direct cause of the following exception

- Sans `from`:
  - During handling of the above exception, another exception occurred

##### Avec None

Vous voulez utiliser l'argument `None` avec `from` quand vous ne voulez pas afficher
le traceback `built-in` d'une erreur personnalisée ou encore lorsque le traceback
original n'est pas nécessaire ou informatif. Un bon exemple, c'est un module qui
utilise un REST API externe sans vouloir exposer les exceptions de la librairie
`requests` (ou `urllib3`).

```python
>>> import requests

>>> class APIError(Exception):
...     pass
...

>>> def call_external_api(url):
...     try:
...         response = requests.get(url)
...         response.raise_for_status()
...         data = response.json()
...     except requests.RequestException as error:
...         raise APIError(f"{error}") from None
...     return data
...

>>> call_external_api("https://api.github.com/events")
[
    {
        'id': '29376567903',
        'type': 'PushEvent',
    ...
]

>>> # Aucune erreur ne s'est produite

>>> call_external_api("https://api.github.com/event")
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "<stdin>", line 7, in call_external_api
__main__.APIError: 404 Client Error: Not Found for url:
  https://api.github.com/event

>>> # Une erreur s'est produite
```

Avec cet exemple, on remarque que l'exception d'origine (`requests.RequestException`)
est absente du `traceback`.

### Les bonnes pratiques lorsqu'on lève / gère des Exceptions

|:warning:|Attraper une `Exception` générique est considéré comme une mauvaise pratique|
|--:|:--|
|:exclamation:|Ce comportement peut cacher des erreurs critiques.|

- **Favoriser les exceptions spécifiques avant les exceptions génériques**
- **Fournissez des messages d'erreur informatifs et évitez les exceptions sans message**
- **Privilégiez les exceptions intégrées aux exceptions personnalisées**
- **Évitez de lever l'exception `AssertionError`**
- **Levez l'exception dès que possible**
- **Expliquez les exceptions levées dans la documentation de votre code**

> Les `AssertionError` sont soulevés uniquement dans les tests, c'est pourquoi il
ne faut pas lever manuellement ce type d'erreur dans votre code.

#### Convention d'écriture des messages d'erreur

Suivre ces règles lorsque vous écrivez des messages d'erreurs :

- Les messages commencent par une lettre minuscule et se terminent sans point.
- Le message d'erreur doit décrire clairement et succinctement la cause de
  l'exception.
- N'oubliez pas que le message doit être suffisamment spécifique pour aider la·e
développeur·se dans le processus de débogage.

|:warning:|Message d'erreur|
|--|:--|
|:x:|"Âge invalide."|
|:white_check_mark:|"l'âge ne peut pas être négatif"|

#### Convention pour la création d'exception personnalisée

|:warning:| Convention à suivre lors de la création d'exception personnalisée|
|:--|--|
|:point_right:|Convention de nommage pour les classes ([CapWords convention](https://peps.python.org/pep-0008/#class-names))|
|:point_right:|Ajouter le suffixe `Error` quand vous représentez une erreur|
|:point_right:|Ne pas ajouter le suffixe lorsque l'exception n'est pas une erreur|
|:point_right:|Ajouter le suffixe `Warning` lorsque vous déclarez des avertissements|

#### Documenter

Il est considéré comme une bonne pratique de répertorier et de documenter toutes
les exceptions que votre code peut générer, avec une brève description et des
indications sur la manière dont les utilisateurs peuvent les gérer.

[Revenir en haut](#python-gérer-et-soulever-des-exceptions)

## Annexe 1

### ExceptionGroup

Une exception de group ou `ExceptionGroup` est une sous-classe d'`Exception` qui
utilise la syntaxe `except*`. L'objet traceback sera alors différent.

```python
>>> raise ExceptionGroup(
...  "several errors",
...  [
...    ValueError("invalid value"),
...    TypeError("invalid type"),
...    KeyError("missing key")
...  ]
... )
...
  + Exception Group Traceback (most recent call last):
  |   File "<stdin>", line 1, in <module>
  | ExceptionGroup: several errors (3 sub-exceptions)
  +-+---------------- 1 ----------------
    | ValueError: invalid value
    +---------------- 2 ----------------
    | TypeError: invalid type
    +---------------- 3 ----------------
    | KeyError: 'missing key'
    +------------------------------------
```

Lorsque vous attrapez des `ExceptionGroup`, vous pouvez utiliser la syntaxe `except*`...

```python
>>> try:
...     raise ExceptionGroup(
...         "several errors",
...         [
...             ValueError("invalid value"),
...             TypeError("invalid type"),
...             KeyError("missing key"),
...         ]
...     )
... except* ValueError:
...     print("Handling ValueError")
... except* TypeError:
...     print("Handling TypeError")
... except* KeyError:
...     print("Handling KeyError")
...
Handling ValueError
Handling TypeError
Handling KeyError
```

... ou l'attraper comme une autre exception.

```python
>>> try:
...     raise ExceptionGroup(
...         "several errors",
...         [
...             ValueError("invalid value"),
...             TypeError("invalid type"),
...             KeyError("missing key"),
...         ]
...     )
... except ExceptionGroup:
...     print("Got an exception group!")
...
Got an exception group!
```
