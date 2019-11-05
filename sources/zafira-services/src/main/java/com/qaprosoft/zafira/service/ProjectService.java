/*******************************************************************************
 * Copyright 2013-2019 Qaprosoft (http://www.qaprosoft.com).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *******************************************************************************/
package com.qaprosoft.zafira.service;

import com.qaprosoft.zafira.dbaccess.dao.mysql.application.ProjectMapper;
import com.qaprosoft.zafira.models.db.Project;
import com.qaprosoft.zafira.service.exception.ResourceNotFoundException;
import org.apache.commons.lang.StringUtils;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static com.qaprosoft.zafira.service.exception.ResourceNotFoundException.ResourceNotFoundErrorDetail.PROJECT_NOT_FOUND;

@Service
public class ProjectService {

    private static final String ERR_MSG_PROJECT_CAN_NOT_BE_FOUND_BY_NAME = "Project with name %s can not be found";

    private final ProjectMapper projectMapper;

    public ProjectService(ProjectMapper projectMapper) {
        this.projectMapper = projectMapper;
    }

    @CachePut(value = "projects", key = "new com.qaprosoft.zafira.dbaccess.utils.TenancyContext().getTenantName() + ':' + #project.name", condition = "#project != null && #project.name != null")
    @Transactional(rollbackFor = Exception.class)
    public Project createProject(Project project) {
        projectMapper.createProject(project);
        return project;
    }

    @Transactional(readOnly = true)
    public List<Project> getAllProjects() {
        return projectMapper.getAllProjects();
    }

    @Cacheable(value = "projects", key = "new com.qaprosoft.zafira.dbaccess.utils.TenancyContext().getTenantName() + ':' + #name", condition = "#name != null")
    @Transactional(readOnly = true)
    public Project getProjectByName(String name) {
        return !StringUtils.isEmpty(name) ? projectMapper.getProjectByName(name) : null;
    }

    @Cacheable(value = "projects", key = "new com.qaprosoft.zafira.dbaccess.utils.TenancyContext().getTenantName() + ':' + #name", condition = "#name != null")
    @Transactional(readOnly = true)
    public Project getNotNullProjectByName(String name) {
        Project project = !StringUtils.isEmpty(name) ? projectMapper.getProjectByName(name) : null;
        if (project == null) {
            throw new ResourceNotFoundException(PROJECT_NOT_FOUND, ERR_MSG_PROJECT_CAN_NOT_BE_FOUND_BY_NAME, name);
        }
        return project;
    }

    @CachePut(value = "projects", key = "new com.qaprosoft.zafira.dbaccess.utils.TenancyContext().getTenantName() + ':' + #project.name", condition = "#project != null && #project.name != null")
    @Transactional(rollbackFor = Exception.class)
    public Project updateProject(Project project) {
        projectMapper.updateProject(project);
        return project;
    }

    @CacheEvict(value = "projects", allEntries = true)
    @Transactional(rollbackFor = Exception.class)
    public void deleteProjectById(Long id) {
        projectMapper.deleteProjectById(id);
    }
}
