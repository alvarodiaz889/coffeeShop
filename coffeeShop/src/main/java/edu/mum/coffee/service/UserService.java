package edu.mum.coffee.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import edu.mum.coffee.domain.User;
import edu.mum.coffee.repository.UserRepository;

@Service
@Transactional
public class UserService {

	@Autowired
	private UserRepository userRepository;

	public User saveUser(User user) {
		return userRepository.save(user);
	}

	public List<User> findByEmail(String email) {
		return userRepository.findByEmail(email);
	}

	public User findById(Integer id) {
		User p = userRepository.findOne(id);
		return p;
	}

	public void removeUser(User user) {
		userRepository.delete(user);
	}
	
	public List<User> getAll() {
		return userRepository.findAll();
	}

}
