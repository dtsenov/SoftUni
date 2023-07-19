package bg.softuni.jsonprocessing.service.impl;

import bg.softuni.jsonprocessing.model.dto.UserSeedDto;
import bg.softuni.jsonprocessing.model.entity.User;
import bg.softuni.jsonprocessing.repository.UserRepository;
import bg.softuni.jsonprocessing.service.UserService;
import bg.softuni.jsonprocessing.utils.ValidationUtil;
import com.google.gson.Gson;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

@Service
public class UserServiceImpl implements UserService {

    private static final String USERS_PATH_FILE = "src/main/resources/files/users.json";

    private  final UserRepository userRepository;
    private final Gson gson;
    private final ModelMapper modelMapper;
    private final ValidationUtil validationUtil;

    public UserServiceImpl(UserRepository userRepository, Gson gson, ModelMapper modelMapper, ValidationUtil validationUtil) {
        this.userRepository = userRepository;
        this.gson = gson;
        this.modelMapper = modelMapper;
        this.validationUtil = validationUtil;
    }

    @Override
    public void seedUsers() throws IOException {

        if (userRepository.count() > 0) {
            return;
        }

       String fileContent = Files
                .readString(Path.of(USERS_PATH_FILE));

        Arrays.stream(gson.fromJson(fileContent, UserSeedDto[].class))
                .filter(validationUtil::isValid)
                .map(userSeedDto -> modelMapper.map(userSeedDto, User.class))
                .forEach(userRepository::save);
    }

    @Override
    public User getRandomUser() {
        long randomId = ThreadLocalRandom
                .current().nextLong(1, userRepository.count()) + 1;

        return userRepository.findById(randomId).orElse(null);

    }


}
