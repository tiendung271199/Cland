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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.vinaenter.constant.GlobalConstant;
import edu.vinaenter.constant.URLConstant;
import edu.vinaenter.constant.ViewNameConstant;
import edu.vinaenter.model.Category;
import edu.vinaenter.service.CategoryService;
import edu.vinaenter.util.PageUtil;

@Controller
@RequestMapping(URLConstant.URL_ADMIN_CAT)
public class AdminCatController {

	@Autowired
	private MessageSource messageSource;

	@Autowired
	private CategoryService categoryService;

	@GetMapping({ URLConstant.URL_EMPTY, URLConstant.URL_EMPTY + "/{page}" })
	public String index(@PathVariable(required = false) String page, Model model, RedirectAttributes ra) {
		int currentPage = 1;
		if (page != null) {
			try {
				currentPage = Integer.parseInt(page);
				if (currentPage < 1) {
					throw new Exception();
				}
			} catch (Exception e) {
				ra.addFlashAttribute("catError", messageSource.getMessage("pageError", null, Locale.getDefault()));
				return "redirect:/" + URLConstant.URL_ADMIN_CAT;
			}
		}
		int offset = PageUtil.getOffset(currentPage);
		int totalRow = categoryService.totalRow();
		int totalPage = PageUtil.getTotalPage(totalRow);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage", totalPage);
		List<Category> catList = categoryService.getList(offset, GlobalConstant.TOTAL_ROW);
		model.addAttribute("catList", catList);
		return ViewNameConstant.VIEW_ADMIN_CAT;
	}

	@GetMapping(URLConstant.URL_ADMIN_ADD)
	public String add() {
		return ViewNameConstant.VIEW_ADMIN_CAT_ADD;
	}

	@PostMapping(URLConstant.URL_ADMIN_ADD)
	public String add(@Valid @ModelAttribute("category") Category category, BindingResult rs, RedirectAttributes ra,
			Model model) {
		if (rs.hasErrors()) {
			return ViewNameConstant.VIEW_ADMIN_CAT_ADD;
		}
		if (categoryService.checkCatName(category.getCname()) != null) {
			model.addAttribute("cError", messageSource.getMessage("loopCatError", null, Locale.getDefault()));
			return ViewNameConstant.VIEW_ADMIN_CAT_ADD;
		}
		if (categoryService.save(category) > 0) {
			ra.addFlashAttribute("success", messageSource.getMessage("addSuccess", null, Locale.getDefault()));
		} else {
			ra.addFlashAttribute("catError", messageSource.getMessage("error", null, Locale.getDefault()));
		}
		return "redirect:/" + URLConstant.URL_ADMIN_CAT;
	}

	@GetMapping(URLConstant.URL_ADMIN_EDIT + "/{cid}")
	public String edit(@PathVariable int cid, Model model) {
		Category objCat = categoryService.findById(cid);
		model.addAttribute("objCat", objCat);
		return ViewNameConstant.VIEW_ADMIN_CAT_EDIT;
	}

	@PostMapping(URLConstant.URL_ADMIN_EDIT)
	public String edit(@Valid @ModelAttribute("cat") Category category, BindingResult rs, Model model,
			RedirectAttributes ra) {
		if (rs.hasErrors()) {
			model.addAttribute("objCat", category);
			return ViewNameConstant.VIEW_ADMIN_CAT_EDIT;
		}
		if (categoryService.update(category) > 0) {
			ra.addFlashAttribute("success", messageSource.getMessage("editSuccess", null, Locale.getDefault()));
		} else {
			ra.addFlashAttribute("catError", messageSource.getMessage("error", null, Locale.getDefault()));
		}
		return "redirect:/" + URLConstant.URL_ADMIN_CAT;
	}

	@GetMapping(URLConstant.URL_ADMIN_DELETE + "/{cid}")
	public String delete(@PathVariable int cid, Model model, RedirectAttributes ra) {
		if (categoryService.del(cid) > 0) {
			ra.addFlashAttribute("success", messageSource.getMessage("deleteSuccess", null, Locale.getDefault()));
		} else {
			ra.addFlashAttribute("catError", messageSource.getMessage("error", null, Locale.getDefault()));
		}
		return "redirect:/" + URLConstant.URL_ADMIN_CAT;
	}

}
