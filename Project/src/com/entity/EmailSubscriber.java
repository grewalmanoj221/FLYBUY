package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "EmailSubscriber")
public class EmailSubscriber {
	@Id
	@Column(name = "subscriber_no")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "email_seq")
	@SequenceGenerator(name = "email_seq", allocationSize = 1, sequenceName = "email_seq")
	private int subscriber_no;

	@Column(length = 30, name = "first_name")
	private String firstName;

	@Column(length = 30, name = "last_name")
	private String lastName;

	@Column(length = 50, name = "subscriber_email")
	private String email;

	public EmailSubscriber() {

	}

	public EmailSubscriber(String firstName, String lastName, String email) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
	}

	public int getSubscriber_no() {
		return subscriber_no;
	}

	public void setSubscriber_no(int subscriber_no) {
		this.subscriber_no = subscriber_no;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
