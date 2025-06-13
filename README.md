# 🌤️ Weather App em Flutter

Aplicativo de clima desenvolvido com Flutter que exibe as condições meteorológicas atuais com base na localização do usuário.

---

## 📦 Tecnologias e Pacotes Usados

- **Flutter**: SDK principal para desenvolvimento do app.
- **[Dio](https://pub.dev/packages/dio)**: Cliente HTTP usado para fazer requisições à API do tempo.
- **[Bloc](https://pub.dev/packages/flutter_bloc)**: Gerenciamento de estado reativo.
- **[GetIt](https://pub.dev/packages/get_it)**: Injeção de dependências.
- **[Geolocator](https://pub.dev/packages/geolocator)**: Obtém a localização atual do dispositivo.
- **[Geocoding](https://pub.dev/packages/geocoding)**: Converte coordenadas em nomes de cidades.

---

## 📱 Funcionalidades

- Detecta automaticamente a localização do usuário (latitude e longitude).
- Converte coordenadas para nome da cidade.
- Realiza requisição à API [weatherapi.com](https://www.weatherapi.com/) com base na localização atual.
- Exibe informações como:
  - Temperatura atual
  - Condição do tempo (ícone e descrição)
  - Nome da cidade
