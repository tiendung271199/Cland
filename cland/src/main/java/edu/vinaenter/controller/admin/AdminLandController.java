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

	@GetMapping({ URLConstant.URL_EMPTY, URLConstant.URL_EMPTY + "/{page}", URLConstant.URL_EMPTY + "/{search}/{page}" })
	public String index(@PathVariable(required = false) String page, @PathVariable(required = false) String search,
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
		if (search != null) {
			searchContent = search;
		}
		int offset = PageUtil.getOffset(currentPage);
		int totalRow = landService.totalRow();
		int totalPage = PageUtil.getTotalPage(totalRow);
		List<Land> landList = landService.getList(offset, GlobalConstant.TOTAL_ROW);
		if (searchContent != null) {
			model.addAttribute("searchContent", searchContent);
			totalRow = landService.totalRowSearch(searchContent);
			totalPage = PageUtil.getTotalPage(totalRow);
			landList = landService.search(searchContent, offset, GlobalConstant.TOTAL_ROW);
		}
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage", totalPage);
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

	@GetMapping(URLConstant.URL_ADMIN_EDIT_LAND)
	public String edit(@PathVariable String lid, Model model, RedirectAttributes ra) {
		List<Category> catList = categoryService.getAll();
		model.addAttribute("catList", catList);
		int landId = 0;
		try {
			landId = Integer.parseInt(lid);
			if (landId < 1) {
				throw new Exception();
			}
		} catch (Exception e) {
			ra.addFlashAttribute("landError", messageSource.getMessage("pageError", null, Locale.getDefault()));
			return "redirect:/" + URLConstant.URL_ADMIN_LAND;
		}
		Land land = landService.findById(landId);
		model.addAttribute("objLand", land);
		return ViewNameConstant.VIEW_ADMIN_LAND_EDIT;
	}

	@PostMapping(URLConstant.URL_ADMIN_EDIT_LAND)
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

	@GetMapping(URLConstant.URL_ADMIN_DELETE)
	public String delete(@PathVariable String id, Model model, RedirectAttributes ra) {
		int landId = 0;
		try {
			landId = Integer.parseInt(id);
			if (landId < 1) {
				throw new Exception();
			}
		} catch (Exception e) {
			ra.addFlashAttribute("landError", messageSource.getMessage("pageError", null, Locale.getDefault()));
			return "redirect:/" + URLConstant.URL_ADMIN_LAND;
		}
		Land objLand = landService.findById(landId);
		if (landService.del(landId) > 0) {
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
