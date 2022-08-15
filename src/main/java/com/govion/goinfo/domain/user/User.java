package com.govion.goinfo.domain.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author mingddlv
 * @Date 2022/8/15 10:45 AM
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {

    private Integer id;

    private String jobNumber;

    private String password;

    /**
     * 权限
     */
    private String route;

    private String name;

    private String department;
}
