package edu.vinaenter.controller.admin;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.vinaenter.constant.GlobalConstant;
import edu.vinaenter.constant.URLConstant;
import edu.vinaenter.constant.ViewNameConstant;
import edu.vinaenter.model.Contact;
import edu.vinaenter.service.ContactService;
import edu.vinaenter.util.PageUtil;

@Controller
@RequestMapping(URLConstant.URL_ADMIN_CONTACT)
public class AdminContactController {

	@Autowired
	private MessageSource messageSource;

	@Autowired
	private ContactService contactService;

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
				ra.addFlashAttribute("contactError", messageSource.getMessage("urlError", null, Locale.getDefault()));
				return "redirect:/" + URLConstant.URL_ADMIN_CONTACT;
			}
		}
		if (search != null) {
			searchContent = search;
		}
		int offset = PageUtil.getOffsetTest(currentPage);
		int totalRow = contactService.totalRow();
		int totalPage = PageUtil.getTotalPageTest(totalRow);
		List<Contact> contactList = contactService.getList(offset, GlobalConstant.TOTAL_ROW_TEST);
		if (searchContent != null) {
			if (searchContent.equals("")) {
				ra.addFlashAttribute("contactError", messageSource.getMessage("searchError", null, Locale.getDefault()));
				return "redirect:/" + URLConstant.URL_ADMIN_CONTACT;
			}
			model.addAttribute("searchContent", searchContent);
			totalRow = contactService.totalRowSearch(searchContent);
			totalPage = PageUtil.getTotalPageTest(totalRow);
			contactList = contactService.search(searchContent, offset, GlobalConstant.TOTAL_ROW_TEST);
		}
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("contactList", contactList);
		return ViewNameConstant.VIEW_ADMIN_CONTACT;
	}

	@GetMapping(URLConstant.URL_ADMIN_DELETE)
	public String delete(@PathVariable String id, Model model, RedirectAttributes ra) {
		int contactId = 0;
		try {
			contactId = Integer.parseInt(id);
			if (contactId < 1) {
				throw new Exception();
			}
		} catch (Exception e) {
			ra.addFlashAttribute("contactError", messageSource.getMessage("urlError", null, Locale.getDefault()));
			return "redirect:/" + URLConstant.URL_ADMIN_CONTACT;
		}
		if (contactService.del(contactId) > 0) {
			ra.addFlashAttribute("success", messageSource.getMessage("deleteSuccess", null, Locale.getDefault()));
		} else {
			ra.addFlashAttribute("contactError", messageSource.getMessage("error", null, Locale.getDefault()));
		}
		return "redirect:/" + URLConstant.URL_ADMIN_CONTACT;
	}

}
