package com.alwan.customer.service;

import com.alwan.customer.model.Customer;
import com.alwan.customer.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CustomerService {

    @Autowired
    CustomerRepository customerRepository;

    public List<Customer> getAllCustomer() {
        List<Customer> customerList = new ArrayList<>();
        customerList.addAll(customerRepository.findAll());

        return customerList;
    }

    public Customer getCustomerById(Long id) {
        return customerRepository.findById(id).get();
    }

    public boolean saveOrUpdateCustomer(Customer customer) {
        Customer updatedCustomer = customerRepository.save(customer);

        if (customerRepository.findById(updatedCustomer.getId()).isPresent()) {
            return true;
        }

        return false;
    }

    public boolean deleteCustomer(Long id) {
        customerRepository.deleteById(id);

        if (customerRepository.findById(id) != null) {
            return true;
        }

        return false;
    }

}
