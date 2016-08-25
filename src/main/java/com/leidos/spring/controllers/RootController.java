package com.leidos.spring.controllers;

import javax.mail.MessagingException;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.leidos.spring.dto.ForgotPasswordForm;
import com.leidos.spring.dto.ResetPasswordForm;
import com.leidos.spring.dto.SignupForm;
import com.leidos.spring.mail.MailSender;
import com.leidos.spring.services.UserService;
import com.leidos.spring.util.MyUtil;
import com.leidos.spring.validators.ForgotPasswordFormValidator;
import com.leidos.spring.validators.ResetPasswordFormValidator;
import com.leidos.spring.validators.SignupFormValidator;

@Controller
public class RootController {

    private static final Logger logger = LoggerFactory.getLogger(RootController.class);

    private MailSender mailSender;
    private UserService userService;
    private SignupFormValidator signupFormValidator;
    private ForgotPasswordFormValidator forgotPasswordFormValidator;
    private ResetPasswordFormValidator resetPasswordFormValidator;

    @Value("${fhir.server.base}")
    private String fhirServerBase;

    @Autowired
    public RootController(MailSender mailSender, UserService userService,
                          SignupFormValidator signupFormValidator,
                          ForgotPasswordFormValidator forgotPasswordFormValidator,
                          ResetPasswordFormValidator resetPasswordFormValidator) {
        this.mailSender = mailSender;
        this.userService = userService;
        this.signupFormValidator = signupFormValidator;
        this.forgotPasswordFormValidator = forgotPasswordFormValidator;
        this.resetPasswordFormValidator = resetPasswordFormValidator;

    }

    @InitBinder("signupForm")
    protected void initSignupBinder(WebDataBinder binder) {
        binder.setValidator(signupFormValidator);
    }

    @InitBinder("forgotPasswordForm")
    protected void initForgotPasswordBinder(WebDataBinder binder) {
        binder.setValidator(forgotPasswordFormValidator);
    }

    @InitBinder("resetPasswordForm")
    protected void initResetPasswordBinder(WebDataBinder binder) {
        binder.setValidator(resetPasswordFormValidator);
    }


	@RequestMapping("/")
	public String home(Model model) throws MessagingException {
        model.addAttribute("fhirServerBase", this.fhirServerBase);

		//mailSender.send("abc@example.com", "Hello, World", "Mail from spring");
		return "home";

	}

    @RequestMapping("/public")
    public String resources(){

        //mailSender.send("abc@example.com", "Hello, World", "Mail from spring");
        return "redirect:/resources/static/oub";

    }


    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public String signup(Model model) {

        model.addAttribute(new SignupForm());
        model.addAttribute("skip", "false");

        return "signup";

    }

    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public String signup(@ModelAttribute("signupForm") @Valid SignupForm signupForm,
                         BindingResult result, RedirectAttributes redirectAttributes, @ModelAttribute("skip") String skipString) {

        boolean skip = skipString.equals("true");

        if (result.hasErrors())
            return "signup";

        System.out.println("test");

        userService.signup(signupForm, skip);

        if( ! skip) {
            MyUtil.flash(redirectAttributes, "success", "signupSuccess");
        }

        return "redirect:/";

    }

    @RequestMapping(value = "/forgot-password", method = RequestMethod.GET)
    public String forgotPassword(Model model) {

        model.addAttribute(new ForgotPasswordForm());

        return "forgot-password";

    }


    /**
     * Forgot password
     */
    @RequestMapping(value = "/forgot-password", method = RequestMethod.POST)
    public String forgotPassword(
            @ModelAttribute("forgotPasswordForm") @Valid ForgotPasswordForm forgotPasswordForm,
            BindingResult result, RedirectAttributes redirectAttributes) {

        if (result.hasErrors())
            return "forgot-password";

        userService.forgotPassword(forgotPasswordForm);
        MyUtil.flash(redirectAttributes, "info", "checkMailResetPassword");

        return "redirect:/";
    }

    /**
     * Reset password
     */
    @RequestMapping(value = "/reset-password/{forgotPasswordCode}")
    public String resetPassword(@PathVariable("forgotPasswordCode") String forgotPasswordCode, Model model) {

        model.addAttribute(new ResetPasswordForm());
        return "reset-password";

    }

    @RequestMapping(value = "/reset-password/{forgotPasswordCode}",
            method = RequestMethod.POST)
    public String resetPassword(
            @PathVariable("forgotPasswordCode") String forgotPasswordCode,
            @ModelAttribute("resetPasswordForm")
            @Valid ResetPasswordForm resetPasswordForm,
            BindingResult result,
            RedirectAttributes redirectAttributes) {

        userService.resetPassword(forgotPasswordCode, resetPasswordForm, result);

        if (result.hasErrors())
            return "reset-password";

        MyUtil.flash(redirectAttributes, "success", "passwordChanged");

        return "redirect:/login";
    }


}
