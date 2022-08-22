package com.govion.goinfo.config;

import com.govion.goinfo.domain.user.User;
import com.govion.goinfo.mapper.UserMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.context.annotation.Configuration;

import javax.annotation.Resource;

/**
 * @Author mingddlv
 * @Date 2022/8/16 1:38 PM
 */
@Slf4j
@Configuration
public class DatabaseConfig implements ApplicationRunner {

    @Resource
    UserMapper userMapper;

    @Override
    public void run(ApplicationArguments args) throws Exception {
        if (userMapper.selectList(null).isEmpty()) {
            userMapper.insert(new User("admin","as","manage","mingddlv","db"));
        }else{
            log.info("数据库连接成功");
        }
    }
}
