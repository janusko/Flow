package com.ryanjanusko.flow.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ryanjanusko.flow.models.Consumption;

@Repository
public interface ConsumptionRepository extends CrudRepository<Consumption, Long>{

	List<Consumption> findAll();
}
