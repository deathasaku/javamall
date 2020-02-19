package com.deathasaku.shiro;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.pam.ModularRealmAuthenticator;
import org.apache.shiro.realm.Realm;
//依照LOGINTYPE 選擇使用哪種REALM 不用再改
public class CustomModularRealmAuthenticator extends ModularRealmAuthenticator {
	@Override
	protected AuthenticationInfo doAuthenticate(AuthenticationToken authenticationToken)
			throws AuthenticationException {

		System.out.println("UserModularRealmAuthenticator:method doAuthenticate() execute ");
		// 判斷getRealms()是否返回為空
		assertRealmsConfigured();
		// 強制轉換回自定義的CustomizedToken
		CustomToken userToken = (CustomToken) authenticationToken;
		// 登錄類型
		String loginType = userToken.getLoginType();
		// 所有Realm
		Collection<Realm> realms = getRealms();
		// 登錄類型對應的所有Realm
		List<Realm> typeRealms = new ArrayList<>();

		for (Realm realm : realms) {
			if (realm.getName().contains(loginType)) {
				System.out.println("realm->" + realm.getName());
				typeRealms.add(realm);
			}
		}

		// 判斷是單Realm還是多Realm
		if (typeRealms.size() == 1) {
			System.out.println("doSingleRealmAuthentication() execute ");
			return doSingleRealmAuthentication(typeRealms.get(0), userToken);
		} else {
			System.out.println("doMultiRealmAuthentication() execute ");
			return doMultiRealmAuthentication(typeRealms, userToken);
		}
	}

}
