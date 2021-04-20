package edu.vinaenter.controller.admin;

import java.util.List;
import java.util.Locale;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.vinaenter.constant.GlobalConstant;
import edu.vinaenter.constant.URLConstant;
import edu.vinaenter.constant.ViewNameConstant;
import edu.vinaenter.model.Category;
import edu.vinaenter.model.Land;
import edu.vinaenter.service.CategoryService;
import edu.vinaenter.service.LandService;
import edu.vinaenter.util.FileUtil;
import edu.vinaenter.util.PageUtil;

@Controller
@RequestMapping(URLConstant.URL_ADMIN_LAND)
public class AdminLandController {

	@Autowired
	private MessageSource messageSource;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private LandService landService;

	@GetMapping({ URLConstant.URL_EMPTY, URLConstant.URL_EMPTY + "/{page}" })
	public String index(@PathVariable(required = false) String page,
			@RequestParam(required = false) String searchContent, Model model, RedirectAttributes ra) {
		int currentPage = 1;
		if (page != null) {
			try {
				currentPage = Integer.parseInt(page);
				if (currentPage < 1) {
					throw new Exception();
				}
			} catch (Exception e) {
				ra.addFlashAttribute("landError", messageSource.getMessage("pageError", null, Locale.getDefault()));
				return "redirect:/" + URLConstant.URL_ADMIN_LAND;
			}
		}
		int offset = PageUtil.getOffset(currentPage);
		int totalRow = landService.totalRow();
		int totalPage = PageUtil.getTotalPage(totalRow);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage", totalPage);
		List<Land> landList = landService.getList(offset, GlobalConstant.TOTAL_ROW);
		if (searchContent != null) {
			model.addAttribute("searchContent", searchContent);
			landList = landService.search(searchContent);
		}
		model.addAttribute("landList", landList);
		return ViewNameConstant.VIEW_ADMIN_LAND;
	}

	@GetMapping(URLConstant.URL_ADMIN_ADD)
	public String add(Model model) {
		List<Category> catList = categoryService.getAll();
		model.addAttribute("catList", catList);
		return ViewNameConstant.VIEW_ADMIN_LAND_ADD;
	}

	@PostMapping(URLConstant.URL_ADMIN_ADD)
	public String add(@Valid @ModelAttribute("landError") Land land, BindingResult rs,
			@RequestParam("image") MultipartFile multipartFile, RedirectAttributes ra, Model model) {
		List<Category> catList = categoryService.getAll();
		model.addAttribute("catList", catList);
		model.addAttribute("objLand", land);
		if (rs.hasErrors()) {
			return ViewNameConstant.VIEW_ADMIN_LAND_ADD;
		}
		String fileName = FileUtil.uploadFile(multipartFile);
		if (fileName.equals(GlobalConstant.EMPTY)) {
			model.addAttribute("lError", messageSource.getMessage("uploadImageError", null, Locale.getDefault()));
			return ViewNameConstant.VIEW_ADMIN_LAND_ADD;
		}
		land.setPicture(fileName);
		if (landService.save(land) > 0) {
			ra.addFlashAttribute("success", messageSource.getMessage("addSuccess", null, Locale.getDefault()));
		} else {
			if (FileUtil.deleteFile(fileName)) {
				System.out.println();
			}
			ra.addFlashAttribute("landError", messageSource.getMessage("error", null, Locale.getDefault()));
		}
		return "redirect:/" + URLConstant.URL_ADMIN_LAND;
	}

	@GetMapping(URLConstant.URL_ADMIN_EDIT + "/{id}")
	public String edit(@PathVariable int id, Model model) {
		List<Category> catList = categoryService.getAll();
		model.addAttribute("catList", catList);
		Land land = landService.findById(id);
		model.addAttribute("objLand", land);
		return ViewNameConstant.VIEW_ADMIN_LAND_EDIT;
	}

	@PostMapping(URLConstant.URL_ADMIN_EDIT)
	public String edit(@Valid @ModelAttribute("landError") Land land, BindingResult rs,
			@RequestParam("image") MultipartFile multipartFile, RedirectAttributes ra, Model model) {
		List<Category> catList = categoryService.getAll();
		model.addAttribute("catList", catList);

		Land objLand = landService.findById(land.getLid());
		land.setPicture(objLand.getPicture());
		model.addAttribute("objLand", land);
		if (rs.hasErrors()) {
			return ViewNameConstant.VIEW_ADMIN_LAND_EDIT;
		}
		String fileName = FileUtil.uploadFile(multipartFile);
		if (!fileName.equals(GlobalConstant.EMPTY)) {
			land.setPicture(fileName);
			if (FileUtil.deleteFile(objLand.getPicture())) {
				System.out.println();
			}
		}
		if (landService.update(land) > 0) {
			ra.addFlashAttribute("success", messageSource.getMessage("editSuccess", null, Locale.getDefault()));
		} else {
			if (FileUtil.deleteFile(fileName)) {
				System.out.println();
			}
			ra.addFlashAttribute("landError", messageSource.getMessage("error", null, Locale.getDefault()));
		}
		return "redirect:/" + URLConstant.URL_ADMIN_LAND;
	}

	@GetMapping(URLConstant.URL_ADMIN_DELETE + "/{id}")
	public String delete(@PathVariable int id, Model model, RedirectAttributes ra) {
		Land objLand = landService.findById(id);
		if (landService.del(id) > 0) {
			if (FileUtil.deleteFile(objLand.getPicture())) {
				System.out.println();
			}
			ra.addFlashAttribute("success", messageSource.getMessage("deleteSuccess", null, Locale.getDefault()));
		} else {
			ra.addFlashAttribute("landError", messageSource.getMessage("error", null, Locale.getDefault()));
		}
		return "redirect:/" + URLConstant.URL_ADMIN_LAND;
	}

}
