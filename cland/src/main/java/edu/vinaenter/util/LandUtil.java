package edu.vinaenter.util;

import java.util.List;

import edu.vinaenter.model.Land;

public class LandUtil {

	public static Land getPNLand(List<Land> list, int lid, int check) {
		if (list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getLid() == lid) {
					// check = 1 => cũ hơn (kế tiếp), check = 0 => mới hơn (trước đó)
					if (check == 1) {
						if (i == list.size() - 1) {
							return list.get(i);
						}
						return list.get(i + 1);
					}
					if (i == 0) {
						return list.get(i);
					}
					return list.get(i - 1);
				}
			}
		}
		return null;
	}

}
