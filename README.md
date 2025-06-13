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
- **[flutter_dotenv](https://pub.dev/packages/flutter_dotenv)**: Carrega variáveis de ambiente de um arquivo `.env`.

---

## 📱 Funcionalidades

- Detecta automaticamente a localização do usuário (latitude e longitude).
- Converte coordenadas para nome da cidade.
- Realiza requisição à API [weatherapi.com](https://www.weatherapi.com/) com base na localização atual.
- Exibe informações como:
  - Temperatura atual
  - Condição do tempo (ícone e descrição)
  - Nome da cidade

---

## ⚙️ Configuração

1. **Clonar o projeto:**

```bash
git clone https://github.com/Lauzzener/weather_app.git
cd weather_app
```

2. **Criar o arquivo .env com sua chave da API:**
O projeto depende de uma chave da Weather API para funcionar.
Há um arquivo .env_example incluso no projeto. Você pode usá-lo como base:

```bash
WEATHER_API_KEY=coloque_sua_chave_aqui
```
