# Open AI in Flutter

Open AI
    sebuah library yang dapat digunakan untuk memanfaatkan teknologi AI yang disediakan oleh OpenAI.
    Library ini nantinya dapat diintegrasikan dengan berbagai aplikasi seperti API, web, dan mobile

> Keuntungan dari OpenAI
    1. Gratis
    2. Mudah Dipasang
    3. Dapat digunakan di berbagai perangkat
    4. Jumlah parameter 175 Miliar

> Project Example
    1. MEndapatkan API Key dari Open AI. Mengisi nama API key
    2. MElakukan instalasii package
    3. Melakukan konfigurasi file .env
    4. File Konfigurasi
        import 'package:envied/envied.dart';

        part 'env.g.dart';

            @Envied(path: '.env')
            abstract class Env {
            @EnviedField(varName: 'OPENAI_API_KEY')
            static String apiKey = _Env.apiKey;
        }
    
    5. Melakukan generate code melalui flutetr pub run build_runner build

    6. Membuat variable menyimpan API Key

            
        import 'package:open_ai/env/env.dart';

        String apiKey = Env.apiKey;

    7. 