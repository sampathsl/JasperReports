package io.github.sampathsl.jasperreports.jasperreports.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReportController {

    @RequestMapping("/report-one")
    public String initialReport(Model model) {
        return "initialReport";
    }

}
