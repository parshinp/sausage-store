package com.yandex.practicum.devops.task;

import com.yandex.practicum.devops.model.Report;
import com.yandex.practicum.devops.repository.ReportRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.client.RestTemplate;

@Configuration
@EnableScheduling
public class ReportSaverTask {
    Logger log = LoggerFactory.getLogger(ReportSaverTask.class);

    public final ReportRepository reportRepository;

    public final RestTemplate restTemplate = new RestTemplateBuilder().build();

    public ReportSaverTask(ReportRepository reportRepository) {
        this.reportRepository = reportRepository;
    }

    @Scheduled(fixedDelay = 300000)
    public void saveReport() {
        log.info("Saving report");
        Report report =
                restTemplate.getForObject("https://d5dg7f2abrq3u84p3vpr.apigw.yandexcloud.net/report", Report.class);
        if (report != null) {
            reportRepository.save(report);
        } else {
            log.error("Report is empty");
        }
    }
}
