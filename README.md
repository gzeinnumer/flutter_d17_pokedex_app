# flutter_d17_pokedex_app

Spesial
```dart
final response = await Future.wait([
  _pokemonRepository.getPokemonInfo(value),
  _pokemonRepository.getPokemonSpeciesInfo(value)
]);
final pokemonInfo = response[0] as PokemonInfoResponse;
final pokemonSpeciesInfo = response[2] as PokemonSpeciesInfoResponse;
```

---

```
Copyright 2022 M. Fadli Zein
```