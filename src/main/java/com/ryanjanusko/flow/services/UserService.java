package com.ryanjanusko.flow.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.ryanjanusko.flow.models.Consumption;
import com.ryanjanusko.flow.models.LoginUser;
import com.ryanjanusko.flow.models.User;
import com.ryanjanusko.flow.repositories.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepo;
	
	public UserService(UserRepository userRepo) {
		this.userRepo = userRepo;
	}
	
	// REGISTERS A USER
	public User register(User newUser, BindingResult result) {
		Optional<User> optionalUser = userRepo.findByEmail(newUser.getEmail());
		if (optionalUser.isPresent()) {
			result.rejectValue("email", "Matches", "An account with this email already exists");
		}
		if (!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("email", "Matches", "The confirmation must match the password");
		}
		if (result.hasErrors()) {
			return null;
		}
		String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hashed);
		return userRepo.save(newUser);
	}
	
	
	// VALIDATES LOGIN
	public User login(LoginUser newLogin, BindingResult result) {
		Optional<User> optionalUser = userRepo.findByEmail(newLogin.getEmail());
		if (!optionalUser.isPresent()) {
			result.rejectValue("email", "Matches", "User not found");
			return null;
		}
		User user = optionalUser.get();

		if (!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
			result.rejectValue("password", "Matches", "Invalid Password!");
		}
		if (result.hasErrors()) {
			return null;
		}
		return user;
	}
	
	
	// FINDS ALL USERS
	public List<User> allUsers() {
		return userRepo.findAll();
	}
	
	
	// FINDS ONE USER
	public User findUser(Long id) {
		Optional<User> optionalUser = userRepo.findById(id);
		if (optionalUser.isPresent()) {
			return optionalUser.get();
		} else {
			return null;
		}
	}
	
	
	// CREATES A USER
	public User createUser(User user) {
		return userRepo.save(user);
	}

	
	// UPDATES A USER
	public User updateUser(User user) {
		return userRepo.save(user);
	}

	
	// DELETES A USER
	public void deleteUser(Long id) {
		userRepo.deleteById(id);
	}
	
	
	// ONE USER CONSUMPTION
	public ArrayList<Integer> totalWater(Long id) {
    	Optional<User> optionalUser = userRepo.findById(id);
    	User user = optionalUser.get();
    	List<Consumption> consumptions = user.getUserConsumptions();
    	ArrayList<Integer> totalArray = new ArrayList<Integer>();
    	for (Consumption eachConsumption: consumptions) {
    		Integer total = 0;
    		if (eachConsumption.getShower() > 0) {
    			total += 76;
    		}
    		if (eachConsumption.getBath() > 0) {
    			total += 114;
    		}
    		if (eachConsumption.getToilet() > 0) {
    			total += 6;
    		}
    		if (eachConsumption.getHandWash() > 0) {
    			total += 15;
    		}
    		if (eachConsumption.getBrushTeeth() > 0) {
    			total += 15;
    		}
    		if (eachConsumption.getWashingMachine() > 0) {
    			total += 72;
    		}
    		if (eachConsumption.getDishwasher() > 0) {
    			total += 45;
    		}
    		if (eachConsumption.getDishesByHand() > 0) {
    			total += 76;
    		}
    		totalArray.add(total);
    	}
    	return totalArray; 
    }
	

}
