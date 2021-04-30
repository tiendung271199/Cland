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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.vinaenter.constant.GlobalConstant;
import edu.vinaenter.constant.URLConstant;
import edu.vinaenter.constant.ViewNameConstant;
import edu.vinaenter.model.Category;
import edu.vinaenter.service.CategoryService;
import edu.vinaenter.util.PageUtil;
import edu.vinaenter.validate.CategoryValidator;

@Controller
@RequestMapping(URLConstant.URL_ADMIN_CAT)
public class AdminCatController {

	@Autowired
	private MessageSource messageSource;

	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private CategoryValidator categoryValidator;

	@GetMapping({ URLConstant.URL_EMPTY, URLConstant.URL_EMPTY + "/{page}",  URLConstant.URL_EMPTY + "/{search}/{page}" })
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
				ra.addFlashAttribute("catError", messageSource.getMessage("urlError", null, Locale.getDefault()));
				return "redirect:/" + URLConstant.URL_ADMIN_CAT;
			}
		}
		int offset = PageUtil.getOffset(currentPage);
		int totalRow = categoryService.totalRow();
		int totalPage = PageUtil.getTotalPage(totalRow);
		List<Category> catList = categoryService.getList(offset, GlobalConstant.TOTAL_ROW);
		if (searchContent != null) {
			if (searchContent.equals("")) {
				ra.addFlashAttribute("catError", messageSource.getMessage("searchError", null, Locale.getDefault()));
				return "redirect:/" + URLConstant.URL_ADMIN_CAT;
			}
			model.addAttribute("searchContent", searchContent);
			totalRow = categoryService.totalRowSearch(searchContent);
			totalPage = PageUtil.getTotalPage(totalRow);
			catList = categoryService.search(searchContent, offset, GlobalConstant.TOTAL_ROW);
		}
		model.addAttribute("catList", catList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage", totalPage);
		return ViewNameConstant.VIEW_ADMIN_CAT;
	}

	@GetMapping(URLConstant.URL_ADMIN_ADD)
	public String add() {
		return ViewNameConstant.VIEW_ADMIN_CAT_ADD;
	}

	@PostMapping(URLConstant.URL_ADMIN_ADD)
	public String add(@Valid @ModelAttribute("catError") Category category, BindingResult rs, RedirectAttributes ra,
			Model model) {
		model.addAttribute("objCat", category);
		categoryValidator.validateAddCat(category, rs);
		if (rs.hasErrors()) {
			return ViewNameConstant.VIEW_ADMIN_CAT_ADD;
		}
		if (categoryService.save(category) > 0) {
			ra.addFlashAttribute("success", messageSource.getMessage("addSuccess", null, Locale.getDefault()));
		} else {
			ra.addFlashAttribute("catError", messageSource.getMessage("error", null, Locale.getDefault()));
		}
		return "redirect:/" + URLConstant.URL_ADMIN_CAT;
	}

	@GetMapping(URLConstant.URL_ADMIN_EDIT_CAT)
	public String edit(@PathVariable String cid, Model model, RedirectAttributes ra) {
		int catId = 0;
		try {
			catId = Integer.parseInt(cid);
			if (catId < 1) {
				throw new Exception();
			}
		} catch (Exception e) {
			ra.addFlashAttribute("catError", messageSource.getMessage("urlError", null, Locale.getDefault()));
			return "redirect:/" + URLConstant.URL_ADMIN_CAT;
		}
		Category objCat = categoryService.findById(catId);
		model.addAttribute("objCat", objCat);
		return ViewNameConstant.VIEW_ADMIN_CAT_EDIT;
	}

	@PostMapping(URLConstant.URL_ADMIN_EDIT_CAT)
	public String edit(@Valid @ModelAttribute("catError") Category category, BindingResult rs, Model model,
			RedirectAttributes ra) {
		model.addAttribute("objCat", category);
		categoryValidator.validateEditCat(category, rs);
		if (rs.hasErrors()) {
			return ViewNameConstant.VIEW_ADMIN_CAT_EDIT;
		}
		if (categoryService.update(category) > 0) {
			ra.addFlashAttribute("success", messageSource.getMessage("editSuccess", null, Locale.getDefault()));
		} else {
			ra.addFlashAttribute("catError", messageSource.getMessage("error", null, Locale.getDefault()));
		}
		return "redirect:/" + URLConstant.URL_ADMIN_CAT;
	}

	@GetMapping(URLConstant.URL_ADMIN_DELETE)
	public String delete(@PathVariable String id, Model model, RedirectAttributes ra) {
		int catId = 0;
		try {
			catId = Integer.parseInt(id);
			if (catId < 1) {
				throw new Exception();
			}
		} catch (Exception e) {
			ra.addFlashAttribute("catError", messageSource.getMessage("urlError", null, Locale.getDefault()));
			return "redirect:/" + URLConstant.URL_ADMIN_CAT;
		}
		if (categoryService.del(catId) > 0) {
			ra.addFlashAttribute("success", messageSource.getMessage("deleteSuccess", null, Locale.getDefault()));
		} else {
			ra.addFlashAttribute("catError", messageSource.getMessage("error", null, Locale.getDefault()));
		}
		return "redirect:/" + URLConstant.URL_ADMIN_CAT;
	}

}
