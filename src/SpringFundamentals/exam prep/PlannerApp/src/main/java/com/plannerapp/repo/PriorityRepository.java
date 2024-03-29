package com.plannerapp.repo;

import com.plannerapp.model.entity.PriorityEntity;
import com.plannerapp.model.enums.PriorityNameEnum;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface PriorityRepository extends JpaRepository<PriorityEntity, Long> {


    PriorityEntity findByPriorityName(PriorityNameEnum priorityName);
}
