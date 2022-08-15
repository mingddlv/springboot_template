package com.govion.goinfo.controller.user;

import com.govion.goinfo.controller.user.vo.LoginVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

/**
 * @Author mingddlv
 * @Date 2022/8/15 10:28 AM
 */
@RestController
@CrossOrigin
@Slf4j
@RequestMapping("/user")
public class UserLoginController {

    @PostMapping("/login")
    public void userLogin(@RequestBody LoginVO loginVO){
        log.error(loginVO.toString());
    }
}
