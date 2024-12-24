# TestIA

**TestIA** es una aplicación de iOS construida con SwiftUI, que muestra información meteorológica en tiempo real utilizando la API de OpenWeather. Además, la app permite visualizar un mapa con las ubicaciones asociadas al clima y guardar un historial de datos locales de clima.

## Características

- **Interfaz de usuario**: Basada en `TabView` con tres secciones:
  1. **Inicio**: Muestra información del clima, incluyendo temperatura, descripción y humedad.
  2. **Mapa**: Visualiza un mapa con las coordenadas asociadas al clima de las ciudades.
  3. **Otros**: Pantalla adicional para expandir las funcionalidades en el futuro.

- **Consumo de API**: Se conecta a la API de OpenWeather para obtener datos meteorológicos de una ciudad en específico.

- **Persistencia de datos**: Utiliza `UserDefaults` para guardar un historial local de datos climáticos obtenidos.

## Requisitos

- **Xcode 15.0** o superior.
- **iOS 16.0** o superior.

## Instalación

1. Clona este repositorio:

   ```bash
   git clone https://github.com/usuario/testia.git
