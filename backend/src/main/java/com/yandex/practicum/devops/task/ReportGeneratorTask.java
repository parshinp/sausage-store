package com.yandex.practicum.devops.task;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

@EnableScheduling
@Configuration
public class ReportGeneratorTask {
    Logger reporter = LoggerFactory.getLogger("ReportGenerator");
    Logger logger = LoggerFactory.getLogger(ReportGeneratorTask.class);

    @Scheduled(fixedDelay = 60000)
    public void generate() {
        logger.info("Generate report");
        reporter.info("VERY IMPORTANT REPORT START");
        reporter.info("___________________________");
        reporter.info(">>>>>>>>>>> 42 <<<<<<<<<<<<");
        reporter.info("___________________________");
        reporter.info("VERY IMPORTANT REPORT END");
    }
}
