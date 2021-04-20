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
				ra.addFlashAttribute("contactError", messageSource.getMessage("pageError", null, Locale.getDefault()));
				return "redirect:/" + URLConstant.URL_ADMIN_CONTACT;
			}
		}
		int offset = PageUtil.getOffset(currentPage);
		int totalRow = contactService.totalRow();
		int totalPage = PageUtil.getTotalPage(totalRow);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage", totalPage);
		List<Contact> contactList = contactService.getList(offset, GlobalConstant.TOTAL_ROW);
		if (searchContent != null) {
			model.addAttribute("searchContent", searchContent);
			contactList = contactService.search(searchContent);
		}
		model.addAttribute("contactList", contactList);
		return ViewNameConstant.VIEW_ADMIN_CONTACT;
	}

	@GetMapping(URLConstant.URL_ADMIN_DELETE + "/{id}")
	public String delete(@PathVariable int id, Model model, RedirectAttributes ra) {
		if (contactService.del(id) > 0) {
			ra.addFlashAttribute("success", messageSource.getMessage("deleteSuccess", null, Locale.getDefault()));
		} else {
			ra.addFlashAttribute("contactError", messageSource.getMessage("error", null, Locale.getDefault()));
		}
		return "redirect:/" + URLConstant.URL_ADMIN_CONTACT;
	}

}
