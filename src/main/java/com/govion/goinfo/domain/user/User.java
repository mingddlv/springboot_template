package com.govion.goinfo.domain.user;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.context.annotation.Primary;

/**
 * @Author mingddlv
 * @Date 2022/8/15 10:45 AM
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("user")
public class User {

    @TableId
    private String jobNumber;

    private String password;

    /**
     * 权限
     */
    private String route;

    private String name;

    private String department;
}
