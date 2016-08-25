package com.leidos.spring.controllers;

import com.leidos.spring.dto.UserEditForm;
import com.leidos.spring.services.ValueSetService;
import com.leidos.spring.util.FhirUtil;
//import org.hl7.fhir.instance.model.ValueSet;
import ca.uhn.fhir.model.dstu2.resource.ValueSet;
import com.leidos.spring.util.MyUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.hl7.fhir.instance.model.Bundle;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/resource")
@SessionAttributes("valueset")
public class ResourceController {

	private static final Logger logger = LoggerFactory.getLogger(ResourceController.class);

    private ValueSetService valueSetService;

    @Autowired
    public void setValueSetService(ValueSetService valueSetService) {
        this.valueSetService = valueSetService;
    }

	@RequestMapping(value = "/valueset/view", method = RequestMethod.GET)
	public String valuesetView(Model model) {

       List<ValueSet> valueSetList = valueSetService.findAllValueSets();

        logger.info("found: [" + valueSetList.size() + "] valuesets");

//        List<String> ids = new ArrayList<>();
//
//        for(ValueSet valueSet : valueSetList) {
//            ids.add(valueSet.getId().toString());
//        }

        model.addAttribute("vsList", valueSetList);

        return "valuesets";
	}

    @RequestMapping(value = "/valueset", method = RequestMethod.GET)
    public String valuesetDefault(Model model) {
        return "redirect:/resource/valueset/view";
    }

    @RequestMapping(value = "/valueset/search", method = RequestMethod.GET)
    public String valuesetCodeLookup(@RequestParam("text") String searchText, Model model) {

        List<ValueSet> valueSetList = valueSetService.findAllValueSetsBySearchString(searchText);

        logger.info("found: [" + valueSetList.size() + "] valuesets");

//        List<String> ids = new ArrayList<>();
//
//        for(ValueSet valueSet : valueSetList) {
//            ids.add(valueSet.getId().toString());
//        }

        model.addAttribute("vsList", valueSetList);


//        ValueSet valueset = FhirUtil.findValueSetByCode(searchCode);

//        logger.info("found: valueset by id: " + searchCode);
//
////        List<String> ids = new ArrayList<>();
////
////        for(ValueSet valueSet : valueSetList) {
////            ids.add(valueSet.getId().toString());
////        }
//
//        model.addAttribute("valueset", valueset);
//        model.addAttribute("searchCode", searchCode);

        return "valuesets";
    }

    @RequestMapping(value = "/valueset/{valuesetId}/view", method = RequestMethod.GET)
    public String valuesetViewCodes(@PathVariable("valuesetId") String valuesetId, Model model) {

        ValueSet valueset = valueSetService.findValueSetById(valuesetId);

        List<Integer> versions = valueSetService.findVersionsByValueSetId(valuesetId);

        int version = versions.size();

        logger.info("found: valueset by id: " + valuesetId);

        logger.info("total # of versions: " + versions.size());

//        List<String> ids = new ArrayList<>();
//
//        for(ValueSet valueSet : valueSetList) {
//            ids.add(valueSet.getId().toString());
//        }

        model.addAttribute("valueset", valueset);
        model.addAttribute("versions", versions);
        model.addAttribute("current_version", version);

        return "valueset-view";
    }

    @RequestMapping(value = "/valueset/{valuesetId}/view/{version}", method = RequestMethod.GET)
    public String valuesetViewCodesByVersion(@PathVariable("valuesetId") String valuesetId, @PathVariable("version") int version, Model model) {

        ValueSet valueset = valueSetService.findValueSetByIdAndVersion(valuesetId, version);

        List<Integer> versions = valueSetService.findVersionsByValueSetId(valuesetId);

        logger.info("found: valueset by id: " + valuesetId);

//        List<String> ids = new ArrayList<>();
//
//        for(ValueSet valueSet : valueSetList) {
//            ids.add(valueSet.getId().toString());
//        }

        model.addAttribute("valueset", valueset);
        model.addAttribute("versions", versions);
        model.addAttribute("current_version", version);

        return "valueset-view";
    }

    @RequestMapping(value = "/valueset/{valuesetId}/code/{codeCode}/view", method = RequestMethod.GET)
    public String valuesetViewCodeDetails(@PathVariable("valuesetId") String valuesetId, @PathVariable("codeCode") String codeCode, Model model) {

        ValueSet valueset = valueSetService.findValueSetById(valuesetId);

        logger.info("found: valueset by id: " + valuesetId);

//        List<String> ids = new ArrayList<>();
//
//        for(ValueSet valueSet : valueSetList) {
//            ids.add(valueSet.getId().toString());
//        }

        model.addAttribute("valueset", valueset);
        model.addAttribute("code", codeCode);

        return "valueset-details";
    }

    @RequestMapping(value = "/valueset/create", method = RequestMethod.GET)
    public String valuesetCreate() {
        return "valueset-create";
    }

    @RequestMapping(value = "/valueset/delete", method = RequestMethod.GET)
    public String valuesetDelete() {
        return "valueset-delete";
    }

    @RequestMapping(value = "/valueset/update", method = RequestMethod.GET)
    public String valuesetUpdate() {
        return "valueset-delete";
    }



    @RequestMapping(value = "/valueset/{valuesetId}/edit", method = RequestMethod.GET)
    public String valueSetEdit(@PathVariable("valuesetId") String valuesetId, Model model) {

        ValueSet valueset = valueSetService.findValueSetByValueSetId(valuesetId);

        List<Integer> versions = valueSetService.findVersionsByValueSetId(valuesetId);

        int version = versions.size();


        model.addAttribute("valueset", valueset);
        model.addAttribute("current_version", version);

        return "valueset-edit";
    }

    @RequestMapping(value = "/valuesets/edit", method = RequestMethod.GET)
    public String valueSetEdit(Model model) {

        List<ValueSet> valueSetList = valueSetService.findAllValueSets();

        logger.info("found: [" + valueSetList.size() + "] valuesets");

//        List<String> ids = new ArrayList<>();
//
//        for(ValueSet valueSet : valueSetList) {
//            ids.add(valueSet.getId().toString());
//        }

        model.addAttribute("vsList", valueSetList);

        return "valuesets-edit";
    }


    @RequestMapping(value = "/valueset/{valuesetId}/edit", method = RequestMethod.POST)
    public String valueSetEditSave(@PathVariable("valuesetId") String valuesetId,
                       @ModelAttribute("valueset") ValueSet valueSet,
                       BindingResult result, RedirectAttributes redirectAttributes,
                       HttpServletRequest request, @RequestParam("vsCodeDisplay") String vsCodeDisplay) throws ServletException {

        if (result.hasErrors())
            return "valueset-edit";

        System.out.println("valueset name");
        System.out.println(valueSet.getName());

        System.out.println(valueSet.getCodeSystem().getSystem());

        System.out.println(valueSet.getId());
        System.out.println(valueSet.getCodeSystem().getConcept().size());

        valueSetService.updateValueSet(valuesetId, vsCodeDisplay, valueSet);
        MyUtil.flash(redirectAttributes, "success", "valuesetEditSuccessful");
//        request.logout();

        return "redirect:/resource/valueset/{valuesetId}/view";
    }
}
