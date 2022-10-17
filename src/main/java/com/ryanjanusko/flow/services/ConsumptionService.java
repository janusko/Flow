package com.ryanjanusko.flow.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.ryanjanusko.flow.models.Consumption;
import com.ryanjanusko.flow.models.User;
import com.ryanjanusko.flow.repositories.ConsumptionRepository;

@Service
public class ConsumptionService {

	private final ConsumptionRepository consumptionRepo;
	
	public ConsumptionService(ConsumptionRepository consumptionRepo) {
		this.consumptionRepo = consumptionRepo;
	}
	
	// FIND ALL CONSUMPTIONS
	public List<Consumption> allConsumptions() {
		return consumptionRepo.findAll();
	}
	
	
	// FIND ONE CONSUMPTION
	public Consumption findById(Long id) {
		Optional<Consumption> optionalConsumption = consumptionRepo.findById(id);
		if (optionalConsumption.isPresent()) {
			return optionalConsumption.get();
		} else {
			return null;
		}
	}
	
	
	// CREATE CONSUMPTION
	public Consumption createConsumption(Consumption consumption) {
		return consumptionRepo.save(consumption);
	}
	
	
	// UPDATE CONSUMPTION	
	public Consumption updateConsumption(Consumption consumption, Long id) {
		User user = consumption.getConsumer();
		Long userConsumptionId = user.getId();
		if (userConsumptionId != id) {
			return null;
		}
		return consumptionRepo.save(consumption);
	}
	
	
	// DELETE CONSUMPTION
	public  void deleteDay(Long id, Long UserInSession, Consumption consumption) {
		User user = consumption.getConsumer();
		Long userConsumptionId = user.getId();
		if (userConsumptionId == UserInSession && UserInSession != null) {
			consumptionRepo.deleteById(id);
		}
	}
	
	
}
