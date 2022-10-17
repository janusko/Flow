package com.ryanjanusko.flow.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.client.RestTemplate;

import com.ryanjanusko.flow.models.Consumption;
import com.ryanjanusko.flow.models.LoginUser;
import com.ryanjanusko.flow.models.User;
import com.ryanjanusko.flow.services.ConsumptionService;
import com.ryanjanusko.flow.services.UserService;

@Controller
public class MainController {
	@Value("${api.key}")
	private String apiKey;
	
	@Autowired
	private UserService userService;
	@Autowired
	private ConsumptionService consumptionService;

	// LOGIN PAGE
	@GetMapping("/connect")
	public String index(HttpSession session,
			Model model) {
//		Long userInSessionId = (Long) session.getAttribute("userId");
//		if (session.getAttribute("userId") == userInSessionId ) {
//			return "redirect:/dashboard";
//		} 
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "connect.jsp";
	}
	
	// REGISTRATION
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model,
			HttpSession session) {
		User user = userService.register(newUser, result);
		if (result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "connect.jsp";
		}
		session.setAttribute("userId", user.getId());
		return "redirect:/dashboard";
	}
	
	// LOGIN
	@PostMapping("login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model,
			HttpSession session) {
		User user = userService.login(newLogin, result);
		if (result.hasErrors() || user == null) {
			model.addAttribute("newUser", new User());
			return "connect.jsp";
		}
		session.setAttribute("userId", user.getId());
		return "redirect:/dashboard";
	}
	
	// LOGOUT
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// INDEX
	@GetMapping("/")
	public String dashboard(Model model) {
//		String url = "https://live-world-data.p.rapidapi.com/category/Water/" + "?rapidapi-key=" + apiKey;
//		RestTemplate restTemplate = new RestTemplate();
//		Object[] waterRessources = restTemplate.getForObject(url, Object[].class);
//		model.addAttribute("waterRessources", waterRessources);
		return "index.jsp";
	}
	
	// DASHBOARD
	@GetMapping("/dashboard")
	public String newConsumption(
			@ModelAttribute("consumption") Consumption consumption,
			HttpSession session,
			Model model) {
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		Long userId = (Long) session.getAttribute("userId");
		User user = userService.findUser(userId);
		model.addAttribute("user", user);
		List<Consumption> consumptions = user.getUserConsumptions();
		model.addAttribute("consumptions", consumptions);
		model.addAttribute("totalWaterList", userService.totalWater(userId));
		return "dashboard.jsp";
	}
	
	@PostMapping("/dashboard")
	public String createConsumption(
			@Valid @ModelAttribute("consumption") Consumption consumption,
			BindingResult result,
			HttpSession session) {
		if (session.getAttribute("userId") ==null) {
			return "redirect:/logout";
		}
		if (result.hasErrors()) {
			return "dashboard.jsp";
		} else {
			consumptionService.createConsumption(consumption);
			return "redirect:/dashboard";
		}
	}
	
	
	// DELETE
	@DeleteMapping("/consumption/{consumptionId}")
	public String deleteConsumption(
			@PathVariable("consumptionId") Long id,
    		HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		Long userId = (Long) session.getAttribute("userId");
		Consumption consumption = consumptionService.findById(id);
		consumptionService.deleteDay(id, userId, consumption);
		return "redirect:/dashboard";
	}
	
	
	
	
}
