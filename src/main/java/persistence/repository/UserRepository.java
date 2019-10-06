package persistence.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import persistence.entity.User;

public interface UserRepository extends JpaRepository<User, Integer> {
    User findByUserName(String s);
}
