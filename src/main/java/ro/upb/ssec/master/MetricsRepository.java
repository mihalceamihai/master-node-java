package ro.upb.ssec.master;

import ro.upb.ssec.master.model.Metrics;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MetricsRepository extends JpaRepository<Metrics,Integer> {

}
