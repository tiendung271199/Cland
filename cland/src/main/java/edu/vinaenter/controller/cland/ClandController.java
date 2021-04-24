package edu.vinaenter.controller.cland;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.vinaenter.constant.GlobalConstant;
import edu.vinaenter.constant.URLConstant;
import edu.vinaenter.constant.ViewNameConstant;
import edu.vinaenter.model.Category;
import edu.vinaenter.model.Contact;
import edu.vinaenter.model.Land;
import edu.vinaenter.service.CategoryService;
import edu.vinaenter.service.ContactService;
import edu.vinaenter.service.LandService;
import edu.vinaenter.util.LandUtil;
import edu.vinaenter.util.PageUtil;

@Controller
public class ClandController {

	@Autowired
	private MessageSource messageSource;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private LandService landService;

	@Autowired
	private ContactService contactService;

	@GetMapping({ URLConstant.URL_CLAND, URLConstant.URL_CLAND + "/{page}" })
	public String index(@PathVariable(required = false) String page, Model model, RedirectAttributes ra) {
		List<Category> catList = categoryService.getAll2();
		List<Land> landListByView = landService.getLandListByView();
		model.addAttribute("catList", catList);
		model.addAttribute("landListByView", landListByView);
		int currentPage = 1;
		if (page != null) {
			try {
				currentPage = Integer.parseInt(page);
				if (currentPage < 1) {
					throw new Exception();
				}
			} catch (Exception e) {
				ra.addFlashAttribute("pageError", messageSource.getMessage("pageError", null, Locale.getDefault()));
				return "redirect:/" + URLConstant.URL_CLAND + "?error=url";
			}
		}
		int offset = PageUtil.getOffset(currentPage);
		int totalRow = landService.totalRow();
		int totalPage = PageUtil.getTotalPage(totalRow);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage", totalPage);
		List<Land> landList = landService.getList(offset, GlobalConstant.TOTAL_ROW);
		model.addAttribute("landList", landList);
		return ViewNameConstant.VIEW_CLAND;
	}

	@GetMapping({ URLConstant.URL_CLAND_CAT, URLConstant.URL_CLAND_CAT + "/{page}" })
	public String cat(@PathVariable(required = false) String page, @PathVariable String cid, Model model,
			RedirectAttributes ra) {
		List<Category> catList = categoryService.getAll2();
		List<Land> landListByView = landService.getLandListByView();
		model.addAttribute("catList", catList);
		model.addAttribute("landListByView", landListByView);

		Category objCat = null;
		int catID = 0, currentPage = 1;
		try {
			catID = Integer.parseInt(cid);
			objCat = categoryService.findById(catID);
			if (objCat == null) {
				throw new Exception();
			}

			if (page != null) {
				currentPage = Integer.parseInt(page);
				if (currentPage < 1) {
					throw new Exception();
				}
			}
		} catch (Exception e) {
			ra.addFlashAttribute("pageError", messageSource.getMessage("pageError", null, Locale.getDefault()));
			return "redirect:/" + URLConstant.URL_CLAND + "?error=url";
		}

		int offset = PageUtil.getOffset(currentPage);
		int totalRow = landService.totalRowByCat(catID);
		int totalPage = PageUtil.getTotalPage(totalRow);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage", totalPage);

		List<Land> landListByCatId = landService.getListByCat(catID, offset, GlobalConstant.TOTAL_ROW);
		model.addAttribute("landListByCatId", landListByCatId);
		model.addAttribute("objCat", objCat);
		return ViewNameConstant.VIEW_CLAND_CAT;
	}

	@GetMapping(URLConstant.URL_CLAND_CONTACT)
	public String contact(Model model) {
		List<Category> catList = categoryService.getAll2();
		List<Land> landListByView = landService.getLandListByView();
		model.addAttribute("catList", catList);
		model.addAttribute("landListByView", landListByView);
		return ViewNameConstant.VIEW_CLAND_CONTACT;
	}

	@PostMapping(URLConstant.URL_CLAND_CONTACT)
	public String contact(@Valid @ModelAttribute("ct") Contact contact, BindingResult rs, RedirectAttributes ra,
			Model model) {
		List<Category> catList = categoryService.getAll2();
		List<Land> landListByView = landService.getLandListByView();
		model.addAttribute("catList", catList);
		model.addAttribute("landListByView", landListByView);
		model.addAttribute("contact", contact);
		if (rs.hasErrors()) {
			return ViewNameConstant.VIEW_CLAND_CONTACT;
		}
		if (contactService.save(contact) > 0) {
			ra.addFlashAttribute("sendContactSuccess",
					messageSource.getMessage("sendContactSuccess", null, Locale.getDefault()));
			return "redirect:/" + URLConstant.URL_CLAND_CONTACT;
		}
		ra.addFlashAttribute("sendContactError",
				messageSource.getMessage("sendContactError", null, Locale.getDefault()));
		return ViewNameConstant.VIEW_CLAND_CONTACT;
	}

	@GetMapping({ URLConstant.URL_CLAND_DETAIL, URLConstant.URL_CLAND_DETAIL + "/{check}" })
	public String detail(@PathVariable(required = false) String check, @PathVariable String lid, Model model,
			RedirectAttributes ra) {
		List<Category> catList = categoryService.getAll2();
		List<Land> landListByView = landService.getLandListByView();
		model.addAttribute("catList", catList);
		model.addAttribute("landListByView", landListByView);

		int landId = 0;
		try {
			landId = Integer.parseInt(lid);
			if (landId < 1) {
				throw new Exception();
			}
		} catch (Exception e) {
			ra.addFlashAttribute("pageError", messageSource.getMessage("pageError", null, Locale.getDefault()));
			return "redirect:/" + URLConstant.URL_CLAND + "?error=url";
		}

		Land objLand = landService.findById(landId);
		if (objLand != null) {
			int checkPN = 0;
			if (check != null) {
				try {
					checkPN = Integer.parseInt(check);
					if (checkPN != 0 && checkPN != 1) {
						throw new Exception();
					}
					List<Land> listAllLand = landService.getAll();
					objLand = LandUtil.getPNLand(listAllLand, landId, checkPN);
				} catch (Exception e) {
					ra.addFlashAttribute("pageError", messageSource.getMessage("pageError", null, Locale.getDefault()));
					return "redirect:/" + URLConstant.URL_CLAND + "?error=url";
				}
			}

			int newCountView = objLand.getCountView() + 1;
			if (landService.updateCountView(newCountView, objLand.getLid()) > 0) {
				objLand.setCountView(newCountView);
			}
			model.addAttribute("objLand", objLand);

			List<Land> landListRelate = landService.getLandListRelate(objLand.getCat().getCid(), landId);
			model.addAttribute("landListRelate", landListRelate);
		}
		return ViewNameConstant.VIEW_CLAND_DETAIL;
	}

	@GetMapping({ URLConstant.URL_CLAND_SEARCH, URLConstant.URL_CLAND_SEARCH + "/{search}/{page}" })
	public String search(@RequestParam(required = false) String searchContent,
			@PathVariable(required = false) String page, @PathVariable(required = false) String search, Model model,
			RedirectAttributes ra) {
		if (searchContent != null) {
			if (searchContent.equals("")) {
				ra.addFlashAttribute("searchError", messageSource.getMessage("searchError", null, Locale.getDefault()));
				return "redirect:/" + URLConstant.URL_CLAND;
			}
		}
		List<Category> catList = categoryService.getAll2();
		List<Land> landListByView = landService.getLandListByView();
		model.addAttribute("catList", catList);
		model.addAttribute("landListByView", landListByView);

		if (search != null) {
			searchContent = search;
		}

		int currentPage = 1;
		if (page != null) {
			try {
				currentPage = Integer.parseInt(page);
				if (currentPage < 1) {
					throw new Exception();
				}
			} catch (Exception e) {
				ra.addFlashAttribute("pageError", messageSource.getMessage("pageError", null, Locale.getDefault()));
				return "redirect:/" + URLConstant.URL_CLAND + "?error=url";
			}
		}

		int offset = PageUtil.getOffset(currentPage);
		int totalRow = landService.totalRowSearch(searchContent);
		int totalPage = PageUtil.getTotalPage(totalRow);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage", totalPage);

		List<Land> searchLandList = landService.search(searchContent, offset, GlobalConstant.TOTAL_ROW);
		model.addAttribute("searchLandList", searchLandList);
		model.addAttribute("searchContent", searchContent);
		return ViewNameConstant.VIEW_CLAND_SEARCH;
	}

}
