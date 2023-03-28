package com.alwan.customer.model;

import com.alwan.customer.constant.EnumStatus;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;

import javax.persistence.*;
import java.util.Date;

@Entity
@Data
@Table(name = "customer")
@AllArgsConstructor
@NoArgsConstructor
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "nama",length = 200)
    private String nama;
    @Lob
    private String alamat;
    @Column(name = "kota",length = 50)
    private String kota;
    @Column(name = "provinsi",length = 50)
    private String provinsi;
    @Enumerated(EnumType.STRING)
    @Column(name="status")
    private EnumStatus status;
    @Temporal(TemporalType.TIMESTAMP)
    @CreatedDate
    private Date tgl_registrasi;
}
