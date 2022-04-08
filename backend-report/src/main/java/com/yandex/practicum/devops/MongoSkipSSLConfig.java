package com.yandex.practicum.devops;

import com.mongodb.ConnectionString;
import com.mongodb.MongoClientSettings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.X509Certificate;

@Configuration
public class MongoSkipSSLConfig {
    final
    Environment environment;

    public MongoSkipSSLConfig(Environment environment) {
        this.environment = environment;
    }

    @Bean
    public MongoClientSettings mongoClientSettingsDev() throws NoSuchAlgorithmException {
        TrustManager[] trustAllCerts = new TrustManager[]{new X509TrustManager() {
            @Override
            public java.security.cert.X509Certificate[] getAcceptedIssuers() {
                return null;
            }

            @Override
            public void checkClientTrusted(X509Certificate[] certs,
                                           String authType) {
            }

            @Override
            public void checkServerTrusted(X509Certificate[] certs,
                                           String authType) {
            }
        }};

        SSLContext sc = null;
        try {
            sc = SSLContext.getInstance("SSL");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }

        try {
            sc.init(null, trustAllCerts, new java.security.SecureRandom());
        } catch (KeyManagementException e) {
            e.printStackTrace();
        }
        HttpsURLConnection
                .setDefaultSSLSocketFactory(sc.getSocketFactory());

        SSLContext finalSc = sc;
        MongoClientSettings settings = MongoClientSettings.builder()
                .applyToSslSettings(b -> {
                    b.enabled(true);
                    b.context(finalSc);
                })
                .applyConnectionString(new ConnectionString(environment.getProperty("spring.data.mongodb.uri")))
                .build();
        return settings;
    }
}
