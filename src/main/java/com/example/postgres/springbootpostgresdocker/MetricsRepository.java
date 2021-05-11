package com.example.postgres.springbootpostgresdocker;

import com.example.postgres.springbootpostgresdocker.model.Metrics;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MetricsRepository extends JpaRepository<Metrics,Integer> {

}
