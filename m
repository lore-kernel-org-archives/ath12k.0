Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DE8CC6B38
	for <ath12k@archiver.kernel.org>; Thu, 15 Oct 2026 09:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KNk1SaOvuSYhDSZZfpXurMl+B7lfSorI/vOzw7u0IwY=; b=Q0415BBmgESklqSzFrYcuOC0BS
	OIIbATd1eLa9dFDKVuh/BEqLyIIOsmcMCjHZtISFD8MXXdf/7ldniHA5yUxC3JwpI+CfqDgb+x5xa
	1UAXPcvXwe7NG6nS0cXfB/zW2pian7cq0VdictfwGlmLGCf5kloNJ4l8UuXUmwoNXUQR2zhtf+W9M
	DeGdUXaR7grw5yLNwlnkM3uyLvUmI+lxFErI2rzY33s7EIdzSXXW8daxbC+CepF4sYq3RrUNXrttI
	W5GG8O3JaMAddNgPEss0u3Vh9esMERKvADJaF3OEHQ7ptOOA9a1pAnJM8Er2886c/TEHYwTw9c8qL
	NIm5J5BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHxM-0000000HIU2-1oA7;
	Thu, 15 Oct 2026 09:41:00 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHxK-0000000HIS7-0aqw
	for ath12k@lists.infradead.org;
	Thu, 15 Oct 2026 09:40:59 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-48de72fc832so152783f8f.1
        for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 02:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792057255; x=1792662055; darn=lists.infradead.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KNk1SaOvuSYhDSZZfpXurMl+B7lfSorI/vOzw7u0IwY=;
        b=ALsdyFqgwG8seafbvxtBTloz7AQ55+SU5sjE+TjKF9g4ScDnmi8USPrdHxD9wa3lEH
         QVF/wjB2seC3h19glp58hKmbk5grf5G9knwII6kS3aRclHvnhpNejKu6lQDMqZm1TWyT
         MUW2paZP3+m++E7FJG7+KL7jYl496+obvZMQNOedv3kR29RlgAXjWoeS78EGRP5vkaPv
         0H0EKgTRCXrIOf+fZIbDh8DECn7PN68sOaunXJkxOP6TqOG8KTXczCp8J6sVXcZIkO8h
         a7tgcgwSzREa+xnI1awTiXEwOI9wRbuiUcfjxb9WSXrZzMWj2jbpLqYn0mfA/wja5M4E
         0w7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057255; x=1792662055;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KNk1SaOvuSYhDSZZfpXurMl+B7lfSorI/vOzw7u0IwY=;
        b=Fqhdx+zznSiJvpKQUH78iAPrrL6IhcmpG1ryL6/Ig5C3Dyjz6e+Iq+3kChD7/OaDyP
         dobjGKwhRXiKl/grmnK1GkQmFAW8Jw2X5r6JvTboklo4F6ctDY0hZb8Bfwx9yzkh8Ivg
         30qWt/2gNlEdTzPuRN4gJPvQjXEPUVcqTcf1JDICR2cenTJ+0Xq0DoOu+2IPjjtZoiow
         cI9VF09cdmvXB3sS4CtldmaXOn3/CWnqAcymuu86zCGQJm64ABKTq33syjIdA+/AxrzI
         Ot2Anm2ur9WX29E+Z6lQAXf2mASjshUZg08EiWxnwNynj/ijGDW2+ksb+9zKDw+DZZMA
         GYSQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4eQHdyKY/ZLNZu7/NHrTZVsdqfYMBYN+syRaZJS+xaVAjXSjFDiDBQ3Gix3plj1RUd7y5evo=@lists.infradead.org
X-Gm-Message-State: AFq9FYLsBrvn50IsJn+K8L3KAaXz5DJKPPViKEvpMsCi9yBornQb1vLf
	L3QexTGJIf59z/y8M22FBJCHHskuNWGN1/4u/Aqtw6fVD4fbJHWcI6UJ
X-Gm-Gg: AYBFou1xWUwT7WDOFnNRIb6w+CF32Xss+wQiRCNIs/ti932DGVLGbR0GXJkEu5JtOrK
	9SZRh8P2ci/ZWN8gOwu+TF2FWd+x5Me6zxDEa/R12YttP6b1NpYrykA4oDF+NB6FtSIIr/uibaA
	IGZ6EdrKFkUqqnrOv1CmzPG8FqyW2mPK9vNuomJJedtBCgxao9uDIop6urO327pVxDfsJmjJqkJ
	KYat8hcJZAQ27TJsPzcTAdNj7w6rvCvkQ8xCRl3qu/+F3HoHeIfgwbOWRpl/36M54yy6JXp5q/3
	2i1vz4sERSQwHcblzQs9jBdm8s1ieTk2bsL87vZrVPKg2gcZp1lJ/QFuZYwlxyLyihQC7mGUIDB
	81TdBY92vXzGmL1asb7o817JXYq6gr++pjma/nOqvvVvr6RiBrKfnLINSL2ZXLCJ6ZBJPImwKCR
	GaCqd5keZhBtomtx3ZhyYiBGLCH+lH5XMoJ1yp/MxG/xNN5wqmEeo+qwGiEyrWISIspNo=
X-Received: by 2002:a5d:6402:0:b0:48c:7f18:c85e with SMTP id ffacd0b85a97d-48dbace9c60mr26369312f8f.45.1792057254369;
        Thu, 15 Oct 2026 02:40:54 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac5265sm18513411f8f.41.2026.10.15.02.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:40:53 -0700 (PDT)
Date: Thu, 15 Oct 2026 12:40:49 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Johannes Berg <johannes.berg@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org
Subject: [ath:ath-next 6/34] net/wireless/nl80211.c:20114 nl80211_pre_doit()
 error: 'wdev' dereferencing possible ERR_PTR()
Message-ID: <202610140243.w1Zrwq4k-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_024058_267633_02495ECB 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
head:   cd026e68fdbf88b9cc522b76c7a9d92c9a41f709
commit: 13c20e8be3278e54f4758941998a3ee746644d8d [6/34] wifi: nl80211: prepare for unlocked wdev-only ops
config: sparc-randconfig-r2200-20261013 (https://download.01.org/0day-ci/archive/20261014/202610140243.w1Zrwq4k-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610140243.w1Zrwq4k-lkp@intel.com/

New smatch warnings:
net/wireless/nl80211.c:20114 nl80211_pre_doit() error: 'wdev' dereferencing possible ERR_PTR()

vim +/wdev +20114 net/wireless/nl80211.c

20b0b53aca436a Jakub Kicinski       2022-11-04  19962  static int nl80211_pre_doit(const struct genl_split_ops *ops,
20b0b53aca436a Jakub Kicinski       2022-11-04  19963  			    struct sk_buff *skb,
4c476991062a0a Johannes Berg        2010-10-04  19964  			    struct genl_info *info)
4c476991062a0a Johannes Berg        2010-10-04  19965  {
a05829a7222e9d Johannes Berg        2021-01-22  19966  	struct cfg80211_registered_device *rdev = NULL;
8e3d9039d280c6 Johannes Berg        2026-10-06  19967  	struct net *netns = genl_info_net(info);
7b0a0e3c3a8826 Johannes Berg        2022-04-14  19968  	struct wireless_dev *wdev = NULL;
7b0a0e3c3a8826 Johannes Berg        2022-04-14  19969  	struct net_device *dev = NULL;
13c20e8be3278e Johannes Berg        2026-10-09  19970  	bool need_rtnl, wdev_ref, locked = false;
8e3d9039d280c6 Johannes Berg        2026-10-06  19971  	u32 internal_flags, wdev_id = 0;
7b0a0e3c3a8826 Johannes Berg        2022-04-14  19972  	int err;
2182db91e0016c Johannes Berg        2022-04-14  19973  
2182db91e0016c Johannes Berg        2022-04-14  19974  	if (WARN_ON(ops->internal_flags >= ARRAY_SIZE(nl80211_internal_flags)))
2182db91e0016c Johannes Berg        2022-04-14  19975  		return -EINVAL;
2182db91e0016c Johannes Berg        2022-04-14  19976  
2182db91e0016c Johannes Berg        2022-04-14  19977  	internal_flags = nl80211_internal_flags[ops->internal_flags];
8e3d9039d280c6 Johannes Berg        2026-10-06  19978  	need_rtnl = internal_flags & NL80211_FLAG_NEED_RTNL;
13c20e8be3278e Johannes Berg        2026-10-09  19979  	wdev_ref = nl80211_need_wdev_ref(internal_flags);
4c476991062a0a Johannes Berg        2010-10-04  19980  
8e3d9039d280c6 Johannes Berg        2026-10-06  19981  	if (need_rtnl)
4c476991062a0a Johannes Berg        2010-10-04  19982  		rtnl_lock();
8e3d9039d280c6 Johannes Berg        2026-10-06  19983  	else
8e3d9039d280c6 Johannes Berg        2026-10-06  19984  		rcu_read_lock();
8e3d9039d280c6 Johannes Berg        2026-10-06  19985  
2182db91e0016c Johannes Berg        2022-04-14  19986  	if (internal_flags & NL80211_FLAG_NEED_WIPHY) {
8e3d9039d280c6 Johannes Berg        2026-10-06  19987  		rdev = cfg80211_get_dev_from_info(netns, info);
4c476991062a0a Johannes Berg        2010-10-04  19988  		if (IS_ERR(rdev)) {
7b0a0e3c3a8826 Johannes Berg        2022-04-14  19989  			err = PTR_ERR(rdev);
8e3d9039d280c6 Johannes Berg        2026-10-06  19990  			goto out_lookup;
4c476991062a0a Johannes Berg        2010-10-04  19991  		}
2182db91e0016c Johannes Berg        2022-04-14  19992  	} else if (internal_flags & NL80211_FLAG_NEED_NETDEV ||
2182db91e0016c Johannes Berg        2022-04-14  19993  		   internal_flags & NL80211_FLAG_NEED_WDEV) {
8e3d9039d280c6 Johannes Berg        2026-10-06  19994  		wdev = __cfg80211_wdev_from_attrs(NULL, netns, info->attrs);
89a54e48b9cbb4 Johannes Berg        2012-06-15  19995  		if (IS_ERR(wdev)) {
7b0a0e3c3a8826 Johannes Berg        2022-04-14  19996  			err = PTR_ERR(wdev);
8e3d9039d280c6 Johannes Berg        2026-10-06  19997  			goto out_lookup;
4c476991062a0a Johannes Berg        2010-10-04  19998  		}
89a54e48b9cbb4 Johannes Berg        2012-06-15  19999  
1bf614ef794643 Johannes Berg        2012-06-15  20000  		dev = wdev->netdev;
13c20e8be3278e Johannes Berg        2026-10-09  20001  		/*
13c20e8be3278e Johannes Berg        2026-10-09  20002  		 * Take the wdev ref only if we need it (wdev_ref is true when
13c20e8be3278e Johannes Berg        2026-10-09  20003  		 * the op is unlocked), we must not try to acquire this with
13c20e8be3278e Johannes Berg        2026-10-09  20004  		 * a wdev pointer protected by locking, it'd deadlock against
13c20e8be3278e Johannes Berg        2026-10-09  20005  		 * unregistration.
13c20e8be3278e Johannes Berg        2026-10-09  20006  		 */
13c20e8be3278e Johannes Berg        2026-10-09  20007  		if (wdev_ref)
13c20e8be3278e Johannes Berg        2026-10-09  20008  			wdev_hold(wdev);
13c20e8be3278e Johannes Berg        2026-10-09  20009  		else
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20010  			dev_hold(dev);
f26cbf401be935 Zhao, Gang           2014-04-21  20011  		rdev = wiphy_to_rdev(wdev->wiphy);
8e3d9039d280c6 Johannes Berg        2026-10-06  20012  	}
8e3d9039d280c6 Johannes Berg        2026-10-06  20013  
8e3d9039d280c6 Johannes Berg        2026-10-06  20014  	if (!need_rtnl) {
8e3d9039d280c6 Johannes Berg        2026-10-06  20015  		if (rdev)
8e3d9039d280c6 Johannes Berg        2026-10-06  20016  			get_device(&rdev->wiphy.dev);
8e3d9039d280c6 Johannes Berg        2026-10-06  20017  		if (wdev)
8e3d9039d280c6 Johannes Berg        2026-10-06  20018  			wdev_id = wdev->identifier;
8e3d9039d280c6 Johannes Berg        2026-10-06  20019  		rcu_read_unlock();
8e3d9039d280c6 Johannes Berg        2026-10-06  20020  
8e3d9039d280c6 Johannes Berg        2026-10-06  20021  		/* RTM_NEWLINK is sent before NETDEV_UP, wait for dev_open() */
8e3d9039d280c6 Johannes Berg        2026-10-06  20022  		if (internal_flags & NL80211_FLAG_CHECK_NETDEV_UP && dev &&
8e3d9039d280c6 Johannes Berg        2026-10-06  20023  		    !READ_ONCE(wdev->is_running) && netif_running(dev)) {
8e3d9039d280c6 Johannes Berg        2026-10-06  20024  			rtnl_lock();
8e3d9039d280c6 Johannes Berg        2026-10-06  20025  			rtnl_unlock();
8e3d9039d280c6 Johannes Berg        2026-10-06  20026  		}
8e3d9039d280c6 Johannes Berg        2026-10-06  20027  	}
1bf614ef794643 Johannes Berg        2012-06-15  20028  
8e3d9039d280c6 Johannes Berg        2026-10-06  20029  	if (rdev && !(internal_flags & NL80211_FLAG_NO_WIPHY_MTX)) {
8e3d9039d280c6 Johannes Berg        2026-10-06  20030  		if (need_rtnl) {
8e3d9039d280c6 Johannes Berg        2026-10-06  20031  			wiphy_lock(&rdev->wiphy);
8e3d9039d280c6 Johannes Berg        2026-10-06  20032  		} else {
8e3d9039d280c6 Johannes Berg        2026-10-06  20033  			/* without rtnl, things may have changed since lookup */
8e3d9039d280c6 Johannes Berg        2026-10-06  20034  			wdev = nl80211_lock_and_recheck(rdev, netns, wdev_id);
8e3d9039d280c6 Johannes Berg        2026-10-06  20035  			if (IS_ERR(wdev)) {
8e3d9039d280c6 Johannes Berg        2026-10-06  20036  				err = PTR_ERR(wdev);
8e3d9039d280c6 Johannes Berg        2026-10-06  20037  				goto out;

Smatch is worried about this goto.

8e3d9039d280c6 Johannes Berg        2026-10-06  20038  			}
8e3d9039d280c6 Johannes Berg        2026-10-06  20039  		}
8e3d9039d280c6 Johannes Berg        2026-10-06  20040  		locked = true;
8e3d9039d280c6 Johannes Berg        2026-10-06  20041  	} else if (rdev && !need_rtnl) {
8e3d9039d280c6 Johannes Berg        2026-10-06  20042  		/*
13c20e8be3278e Johannes Berg        2026-10-09  20043  		 * Without any mutex need a wdev reference to keep it alive,
13c20e8be3278e Johannes Berg        2026-10-09  20044  		 * see also the note about selectors - the WARN can't happen
8e3d9039d280c6 Johannes Berg        2026-10-06  20045  		 * without wrong selectors and those don't exist.
8e3d9039d280c6 Johannes Berg        2026-10-06  20046  		 */
8e3d9039d280c6 Johannes Berg        2026-10-06  20047  		put_device(&rdev->wiphy.dev);
13c20e8be3278e Johannes Berg        2026-10-09  20048  		if (WARN_ON(!wdev)) {
8e3d9039d280c6 Johannes Berg        2026-10-06  20049  			err = -EINVAL;
8e3d9039d280c6 Johannes Berg        2026-10-06  20050  			goto out;
8e3d9039d280c6 Johannes Berg        2026-10-06  20051  		}
8e3d9039d280c6 Johannes Berg        2026-10-06  20052  	}
8e3d9039d280c6 Johannes Berg        2026-10-06  20053  
8e3d9039d280c6 Johannes Berg        2026-10-06  20054  	if (wdev) {
2182db91e0016c Johannes Berg        2022-04-14  20055  		if (internal_flags & NL80211_FLAG_NEED_NETDEV) {
1bf614ef794643 Johannes Berg        2012-06-15  20056  			if (!dev) {
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20057  				err = -EINVAL;
8e3d9039d280c6 Johannes Berg        2026-10-06  20058  				goto out;
89a54e48b9cbb4 Johannes Berg        2012-06-15  20059  			}
89a54e48b9cbb4 Johannes Berg        2012-06-15  20060  
1bf614ef794643 Johannes Berg        2012-06-15  20061  			info->user_ptr[1] = dev;
1bf614ef794643 Johannes Berg        2012-06-15  20062  		} else {
1bf614ef794643 Johannes Berg        2012-06-15  20063  			info->user_ptr[1] = wdev;
4c476991062a0a Johannes Berg        2010-10-04  20064  		}
89a54e48b9cbb4 Johannes Berg        2012-06-15  20065  
2182db91e0016c Johannes Berg        2022-04-14  20066  		if (internal_flags & NL80211_FLAG_CHECK_NETDEV_UP &&
73c7da3dae1e7c Arend Van Spriel     2016-10-20  20067  		    !wdev_running(wdev)) {
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20068  			err = -ENETDOWN;
8e3d9039d280c6 Johannes Berg        2026-10-06  20069  			goto out;
41265714810e20 Johannes Berg        2010-10-04  20070  		}
4c476991062a0a Johannes Berg        2010-10-04  20071  	}
4c476991062a0a Johannes Berg        2010-10-04  20072  
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20073  	if (internal_flags & NL80211_FLAG_MLO_VALID_LINK_ID) {
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20074  		struct nlattr *link_id = info->attrs[NL80211_ATTR_MLO_LINK_ID];
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20075  
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20076  		if (!wdev) {
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20077  			err = -EINVAL;
8e3d9039d280c6 Johannes Berg        2026-10-06  20078  			goto out;
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20079  		}
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20080  
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20081  		/* MLO -> require valid link ID */
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20082  		if (wdev->valid_links &&
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20083  		    (!link_id ||
ff3821bc355275 Veerendranath Jakkam 2022-07-11  20084  		     !(wdev->valid_links & BIT(nla_get_u8(link_id))))) {
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20085  			err = -EINVAL;
8e3d9039d280c6 Johannes Berg        2026-10-06  20086  			goto out;
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20087  		}
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20088  
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20089  		/* non-MLO -> no link ID attribute accepted */
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20090  		if (!wdev->valid_links && link_id) {
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20091  			err = -EINVAL;
8e3d9039d280c6 Johannes Berg        2026-10-06  20092  			goto out;
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20093  		}
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20094  	}
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20095  
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20096  	if (internal_flags & NL80211_FLAG_MLO_UNSUPPORTED) {
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20097  		if (info->attrs[NL80211_ATTR_MLO_LINK_ID] ||
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20098  		    (wdev && wdev->valid_links)) {
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20099  			err = -EINVAL;
8e3d9039d280c6 Johannes Berg        2026-10-06  20100  			goto out;
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20101  		}
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20102  	}
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20103  
8e3d9039d280c6 Johannes Berg        2026-10-06  20104  	info->user_ptr[0] = rdev;
a05829a7222e9d Johannes Berg        2021-01-22  20105  	/* we keep the mutex locked until post_doit */
8e3d9039d280c6 Johannes Berg        2026-10-06  20106  	if (locked)
a05829a7222e9d Johannes Berg        2021-01-22  20107  		__release(&rdev->wiphy.mtx);
a05829a7222e9d Johannes Berg        2021-01-22  20108  
4c476991062a0a Johannes Berg        2010-10-04  20109  	return 0;
8e3d9039d280c6 Johannes Berg        2026-10-06  20110  out:
8e3d9039d280c6 Johannes Berg        2026-10-06  20111  	if (locked)
8e3d9039d280c6 Johannes Berg        2026-10-06  20112  		wiphy_unlock(&rdev->wiphy);
13c20e8be3278e Johannes Berg        2026-10-09  20113  	if (wdev_ref && wdev)
13c20e8be3278e Johannes Berg        2026-10-09 @20114  		wdev_put(wdev);
                                                                         ^^^^

13c20e8be3278e Johannes Berg        2026-10-09  20115  	else
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20116  		dev_put(dev);
8e3d9039d280c6 Johannes Berg        2026-10-06  20117  	if (need_rtnl)
8e3d9039d280c6 Johannes Berg        2026-10-06  20118  		rtnl_unlock();
8e3d9039d280c6 Johannes Berg        2026-10-06  20119  	return err;
8e3d9039d280c6 Johannes Berg        2026-10-06  20120  out_lookup:
8e3d9039d280c6 Johannes Berg        2026-10-06  20121  	if (need_rtnl)
8e3d9039d280c6 Johannes Berg        2026-10-06  20122  		rtnl_unlock();
8e3d9039d280c6 Johannes Berg        2026-10-06  20123  	else
8e3d9039d280c6 Johannes Berg        2026-10-06  20124  		rcu_read_unlock();
7b0a0e3c3a8826 Johannes Berg        2022-04-14  20125  	return err;
4c476991062a0a Johannes Berg        2010-10-04  20126  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


