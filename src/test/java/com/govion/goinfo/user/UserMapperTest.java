package com.govion.goinfo.user;

import com.govion.goinfo.domain.user.User;
import com.govion.goinfo.mapper.UserMapper;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author mingddlv
 * @Date 2022/8/15 10:48 AM
 */
@SpringBootTest
@Transactional
@Slf4j
public class UserMapperTest {

    @Resource
    UserMapper userMapper;

    @Test
    public void testMapper(){

        // 插入数据
        User user = new User();
        user.setJobNumber("LRH1");
        user.setDepartment("AI");
        user.setName("LRH");
        user.setPassword("as");
        user.setRoute("user");
        userMapper.insert(user);


        // 获取所有的符合列表
        List<User> userList = userMapper.selectList(null);
        for (User user1 : userList) {
           log.info(user1.toString());
        }

    }
}
