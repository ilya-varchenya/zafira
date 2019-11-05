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
package com.qaprosoft.zafira.web;

import com.qaprosoft.zafira.models.db.Project;
import com.qaprosoft.zafira.models.dto.ProjectType;
import com.qaprosoft.zafira.service.ProjectService;
import com.qaprosoft.zafira.service.exception.ResourceNotFoundException;
import com.qaprosoft.zafira.web.util.swagger.ApiResponseStatuses;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.dozer.Mapper;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.List;
import java.util.stream.Collectors;

import static com.qaprosoft.zafira.service.exception.ResourceNotFoundException.ResourceNotFoundErrorDetail.PROJECT_NOT_FOUND;

@Api("Projects API")
@CrossOrigin
@RequestMapping(path = "api/projects", produces = MediaType.APPLICATION_JSON_VALUE)
@RestController
public class ProjectController extends AbstractController {

    private final Mapper mapper;

    private final ProjectService projectService;

    public ProjectController(Mapper mapper, ProjectService projectService) {
        this.mapper = mapper;
        this.projectService = projectService;
    }

    @ApiResponseStatuses
    @ApiOperation(value = "Create project", nickname = "createProject", httpMethod = "POST", response = ProjectType.class)
    @ApiImplicitParams({ @ApiImplicitParam(name = "Authorization", paramType = "header") })
    @PreAuthorize("hasPermission('MODIFY_PROJECTS')")
    @PostMapping()
    public ProjectType createProject(@RequestBody @Valid ProjectType project) {
        Project newProject = projectService.createProject(mapper.map(project, Project.class));
        return mapper.map(newProject, ProjectType.class);
    }

    @ApiResponseStatuses
    @ApiOperation(value = "Delete project", nickname = "deleteProject", httpMethod = "DELETE")
    @ApiImplicitParams({ @ApiImplicitParam(name = "Authorization", paramType = "header") })
    @PreAuthorize("hasPermission('MODIFY_PROJECTS')")
    @DeleteMapping("/{id}")
    public void deleteProject(@PathVariable("id") long id) {
        projectService.deleteProjectById(id);
    }

    @ApiResponseStatuses
    @ApiOperation(value = "Update project", nickname = "updateProject", httpMethod = "PUT", response = ProjectType.class)
    @ApiImplicitParams({ @ApiImplicitParam(name = "Authorization", paramType = "header") })
    @PreAuthorize("hasPermission('MODIFY_PROJECTS')")
    @PutMapping()
    public ProjectType updateProject(@RequestBody @Valid ProjectType project) {
        Project updatedProject = projectService.updateProject(mapper.map(project, Project.class));
        return mapper.map(updatedProject, ProjectType.class);
    }

    @ApiResponseStatuses
    @ApiOperation(value = "Get all projects", nickname = "getAllProjects", httpMethod = "GET", response = List.class)
    @ApiImplicitParams({ @ApiImplicitParam(name = "Authorization", paramType = "header") })
    @GetMapping()
    public List<ProjectType> getAllProjects() {
        List<Project> projects = projectService.getAllProjects();
        return projects.stream()
                       .map(project -> mapper.map(project, ProjectType.class))
                       .collect(Collectors.toList());
    }

    @ApiResponseStatuses
    @ApiOperation(value = "Get project by name", nickname = "getProjectByName", httpMethod = "GET", response = ProjectType.class)
    @ApiImplicitParams({ @ApiImplicitParam(name = "Authorization", paramType = "header") })
    @GetMapping("/{name}")
    public ProjectType getProjectByName(@PathVariable("name") String name) {
        return mapper.map(projectService.getNotNullProjectByName(name), ProjectType.class);
    }

}
