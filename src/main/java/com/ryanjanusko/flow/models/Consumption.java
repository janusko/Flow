package com.ryanjanusko.flow.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="consumptions")
public class Consumption {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotNull(message="Shower field must not be empty")
	@Min(value=0, message="Please enter a valid number")
	private Integer shower = 0;
	
	@NotNull(message="Bath field must not be empty")
	@Min(value=0, message="Please enter a valid number")
	private Integer bath = 0;
	
	@NotNull(message="Toilet flush field must not be empty")
	@Min(value=0, message="Please enter a valid number")
	private Integer toilet = 0;
	
	@NotNull(message="Hand washing field must not be empty")
	@Min(value=0, message="Please enter a valid number")
	private Integer handWash = 0;
	
	@NotNull(message="Brushing teeth field must not be empty")
	@Min(value=0, message="Please enter a valid number")
	private Integer brushTeeth = 0;
	
	@NotNull(message="Washing machine field must not be empty")
	@Min(value=0, message="Please enter a valid number")
	private Integer washingMachine = 0;
	
	@NotNull(message="Dishwasher field must not be empty")
	@Min(value=0, message="Please enter a valid number")
	private Integer dishwasher = 0;
	
	@NotNull(message="Dishes by hand field must not be empty")
	@Min(value=0, message="Please enter a valid number")
	private Integer dishesByHand = 0;
	
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
    
    
    // RELATIONSHIPS
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="consumption_id")
    private User consumer;
    
    
    
    // CONSTRUCTOR
    public Consumption() {}
    
    
    
    // GETTERS AND SETTERS
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Integer getShower() {
		return shower;
	}
	public void setShower(Integer shower) {
		this.shower = shower;
	}
	public Integer getBath() {
		return bath;
	}
	public void setBath(Integer bath) {
		this.bath = bath;
	}
	public Integer getToilet() {
		return toilet;
	}
	public void setToilet(Integer toilet) {
		this.toilet = toilet;
	}
	public Integer getHandWash() {
		return handWash;
	}
	public void setHandWash(Integer handWash) {
		this.handWash = handWash;
	}
	public Integer getBrushTeeth() {
		return brushTeeth;
	}
	public void setBrushTeeth(Integer brushTeeth) {
		this.brushTeeth = brushTeeth;
	}
	public Integer getWashingMachine() {
		return washingMachine;
	}
	public void setWashingMachine(Integer washingMachine) {
		this.washingMachine = washingMachine;
	}
	public User getConsumer() {
		return consumer;
	}
	public void setConsumer(User consumer) {
		this.consumer = consumer;
	}
	public Integer getDishwasher() {
		return dishwasher;
	}
	public void setDishwasher(Integer dishwasher) {
		this.dishwasher = dishwasher;
	}
	public Integer getDishesByHand() {
		return dishesByHand;
	}
	public void setDishesByHand(Integer dishesByHand) {
		this.dishesByHand = dishesByHand;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

    	
}
