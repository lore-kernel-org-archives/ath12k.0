Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B099C282D1
	for <ath12k@archiver.kernel.org>; Thu,  6 Mar 2025 07:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=twm03Oy4r5nPGPtZkmiVjVc9lS2x2ybjNxtocoftd9Y=; b=U5wcZy3AYeFW/iZLGlUGQ184QM
	hpnTQYEkvdRlBqJ0nsbgz8CJfw8cz5YV5nWc7beGAGOXI4D8zl16BF4CTtRtcD3voaH5KKg0PncKm
	m7Ckm9Bmrg61IJnGHRrPatJMk8as90PRfh8ui5oTGgnDriCM9zCFKOR6nbPQCIL09rOYdpC8Yep20
	3LnwelQFV3Rcw9IklKg6DrJFG/xDt8LXaLcIgZcVDB8ecqV3edEbrI4oTTadOCHJD/wALiJpS3nyG
	6ZS0WpI4oy/WCpuxd8TKgYTcI7zK3It34OUlhUH4Y4QpFJTkAZ2vnOHmyE62AD/jBmTC4w5LGPzro
	dEga0WsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq5yN-0000000AFdW-30vr
	for ath12k@archiver.kernel.org;
	Thu, 06 Mar 2025 07:48:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq4no-0000000A8EK-3A3r
	for ath12k@bombadil.infradead.org;
	Thu, 06 Mar 2025 06:33:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=twm03Oy4r5nPGPtZkmiVjVc9lS2x2ybjNxtocoftd9Y=; b=EQEqJUuplpVP80a7taxmtNzZrq
	Bik4+XkJcWlyqQjCtrCvPTuWfeMuOBVIFeed3mwOL5NGMPtBo6T375byjP/Eu6J1MIK58xvFcPKrf
	o1rqiL6kEvDxHVLn6Y3W5Wxrgv2zbom8Co9HDkCLabhcRy9j7KP8myxyo5lv0q5ns1c693bSp8Ix4
	OUnAjGhRdfTmy2Q/fhcowtqNsNwQtOBi/bT9uyNoUegq+hRIZqOsGrV1RUZNKUtbEpWkXXfzLLigN
	Lfm8VXeuhQCew9Xf0hGvKMjM5Z9rDd9GvR+z7NHjz2hi1svBxCTOx/hFNUoVEsSVvFdx2UMZmlPUb
	aaBNS6tQ==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq4nl-00000006vMS-2JLa
	for ath12k@lists.infradead.org;
	Thu, 06 Mar 2025 06:33:51 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43bdc607c3fso1241615e9.3
        for <ath12k@lists.infradead.org>; Wed, 05 Mar 2025 22:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741242824; x=1741847624; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=twm03Oy4r5nPGPtZkmiVjVc9lS2x2ybjNxtocoftd9Y=;
        b=a6SWjaWThoaic9YKxnsGBOmUrPFtWlHALqeJ8dzOjBS2zhKxuN544DSm/c0WfmgYvN
         Pp8TRkSnpIbCHfORfj+6yQD8pUoay8cmqj50wT0LAyzzi3C9YKvm8jHpsizz95NY1dK5
         BX8MPhbCRJkdadR7zHIm5RwbawX84zjVZONHDltltyZ/9l34+rBXC4QSTjb0m178dbvY
         tySlcDs02K4d7ykqBCA4w6HPK3U9gTte9fFgRMdbkIlEzpMZCzlMeE3q3y7JownxNnWc
         H/GlFlZl19AgslYuViS8xpLUsjQSqhkJ507HxAIUfQ09OPKFUIXzTI+xVd1a3WpDe8Hw
         O4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741242824; x=1741847624;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=twm03Oy4r5nPGPtZkmiVjVc9lS2x2ybjNxtocoftd9Y=;
        b=VBWYFPtJSs+TOoR/NwVUeLpEAGCA6WMf5F4pP7KaJttqRPNqt7SmPLmT80QJ6G8v+c
         ZRF5RzGdmZ6xc4IEA92C156aHIFlnfPIp0mU9U9EZqL7ojk6RP0WRKckLa79REH5VSnj
         9wL2RAeWvEGdRJzxxgsIkLNfANNQzOPCu69YwmSOD9FnepfBUCLCqncgLFFaRGW4VzZ9
         R5CNJ70kK3yAZ1nMrYYRYy+Ex6Zg69SGaSJaFUKwH5+w+uQDomV8W3Ud/4ZnWJ2KczPS
         aWBf0lHlqVSjJYnDRnhFh8bOmCdsHgwxmOFrNpfw7g4mDi2X06RypNFOQ9jlAm7W5pa+
         kV3g==
X-Forwarded-Encrypted: i=1; AJvYcCXBN0pHkEEv6PsJg9tfn8ToR+BirQSlKmXe5VONAqWyvtHr9PGiOsteaBG9WpLwtjEyQElPCdc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy70s54BLJTMwZylc4esH09I1Zv2YsQEXMFEjEN/2Auy+pdYpaG
	UI4o4EhLT+daEirEGH5KD6HrH8UvVED8rxk7PwTWY9gyz8zB4MDJ6dtYvgM4jOQ=
X-Gm-Gg: ASbGncuA0Wrf+nZDeYf60+imDLbPj91mmn6xwZMp3ww+qMsNZh40VUl7PK+vK/KQ4ic
	txyigg21r0FIAxOVtScdhXFW/tqOdyjmRAy/U7I8ZxgTnB0jofPchFdrrc5qQRE9g6Ul2/hV71r
	R8Ibei/aAJlEXObkPFna73MvaWxi8SE0o+4zCf/1iaY8Cp5kBWnSZv9LtmsOuohJgGjy3ESTKm1
	udRTRfnQ0uw95Q3WmJY5TQhtLMUsVxM7RPqyAuRXGqV2Ty6k2IeX0jN6JaKQ90WgcKrQZDqYQBN
	c46mWI6rqh5WMCnbuG1MfMEQo8AwV1vQB8uhLe7W+BFOy0C26w==
X-Google-Smtp-Source: AGHT+IGeNal1Sgc/E3DzZp24+r0BXPhvab8A8uCChGmpF5qLmcYIveJqXWJIACmg+4dgEdduPWpeBg==
X-Received: by 2002:a5d:6489:0:b0:391:13ef:1b27 with SMTP id ffacd0b85a97d-3911f7ce4b6mr5435387f8f.51.1741242824406;
        Wed, 05 Mar 2025 22:33:44 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912c102db1sm940772f8f.95.2025.03.05.22.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 22:33:43 -0800 (PST)
Date: Thu, 6 Mar 2025 09:33:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Muna Sinada <muna.sinada@oss.qualcomm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	ath12k@lists.infradead.org,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [ath:ath12k-split-phy 81/139] net/mac80211/link.c:96
 ieee80211_link_init() warn: can 'master' even be NULL?
Message-ID: <f3cb8f15-e2a9-49ac-b138-6d1c8b04ca7c@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_063349_608409_37B46649 
X-CRM114-Status: UNSURE (   4.77  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-split-phy
head:   64723c7be2b959dde8f4a8c85401a57d8740af10
commit: 139c21bdb8c36a8ad201b71678b0d1168856d5d3 [81/139] wifi: mac80211: Create separate links for VLAN interfaces
config: x86_64-randconfig-161-20250306 (https://download.01.org/0day-ci/archive/20250306/202503060854.5cPgdKzO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503060854.5cPgdKzO-lkp@intel.com/

smatch warnings:
net/mac80211/link.c:96 ieee80211_link_init() warn: can 'master' even be NULL?

vim +/master +96 net/mac80211/link.c

e73b5e51a05d41 Johannes Berg      2022-09-02   77  void ieee80211_link_init(struct ieee80211_sub_if_data *sdata,
e73b5e51a05d41 Johannes Berg      2022-09-02   78  			 int link_id,
e73b5e51a05d41 Johannes Berg      2022-09-02   79  			 struct ieee80211_link_data *link,
e73b5e51a05d41 Johannes Berg      2022-09-02   80  			 struct ieee80211_bss_conf *link_conf)
e73b5e51a05d41 Johannes Berg      2022-09-02   81  {
e73b5e51a05d41 Johannes Berg      2022-09-02   82  	bool deflink = link_id < 0;
e73b5e51a05d41 Johannes Berg      2022-09-02   83  
e73b5e51a05d41 Johannes Berg      2022-09-02   84  	if (link_id < 0)
e73b5e51a05d41 Johannes Berg      2022-09-02   85  		link_id = 0;
e73b5e51a05d41 Johannes Berg      2022-09-02   86  
e73b5e51a05d41 Johannes Berg      2022-09-02   87  	rcu_assign_pointer(sdata->vif.link_conf[link_id], link_conf);
e73b5e51a05d41 Johannes Berg      2022-09-02   88  	rcu_assign_pointer(sdata->link[link_id], link);
e73b5e51a05d41 Johannes Berg      2022-09-02   89  
139c21bdb8c36a Muna Sinada        2024-10-17   90  	if (sdata->vif.type == NL80211_IFTYPE_AP_VLAN) {
139c21bdb8c36a Muna Sinada        2024-10-17   91  		struct ieee80211_sub_if_data *master;
139c21bdb8c36a Muna Sinada        2024-10-17   92  		struct ieee80211_bss_conf *master_conf;
139c21bdb8c36a Muna Sinada        2024-10-17   93  
139c21bdb8c36a Muna Sinada        2024-10-17   94  		master = container_of(sdata->bss,
139c21bdb8c36a Muna Sinada        2024-10-17   95  				      struct ieee80211_sub_if_data, u.ap);
139c21bdb8c36a Muna Sinada        2024-10-17  @96  		if (!master)

master can't be NULL.  container_of() takes "sdata->bss" and subtracts an
offset.

139c21bdb8c36a Muna Sinada        2024-10-17   97  			goto skip_vlan_conf;
139c21bdb8c36a Muna Sinada        2024-10-17   98  
139c21bdb8c36a Muna Sinada        2024-10-17   99  		master_conf = sdata_dereference(master->vif.link_conf[link_id],
139c21bdb8c36a Muna Sinada        2024-10-17  100  						master);
139c21bdb8c36a Muna Sinada        2024-10-17  101  
139c21bdb8c36a Muna Sinada        2024-10-17  102  		memcpy(link_conf, master_conf, sizeof(*link_conf));
139c21bdb8c36a Muna Sinada        2024-10-17  103  	}
139c21bdb8c36a Muna Sinada        2024-10-17  104  
139c21bdb8c36a Muna Sinada        2024-10-17  105  skip_vlan_conf:
e73b5e51a05d41 Johannes Berg      2022-09-02  106  	link->sdata = sdata;
e73b5e51a05d41 Johannes Berg      2022-09-02  107  	link->link_id = link_id;
e73b5e51a05d41 Johannes Berg      2022-09-02  108  	link->conf = link_conf;
e73b5e51a05d41 Johannes Berg      2022-09-02  109  	link_conf->link_id = link_id;
e1f113cc678703 Benjamin Berg      2023-03-01  110  	link_conf->vif = &sdata->vif;
c4382d5ca1af75 Emmanuel Grumbach  2024-10-07  111  	link->ap_power_level = IEEE80211_UNSET_POWER_LEVEL;
c4382d5ca1af75 Emmanuel Grumbach  2024-10-07  112  	link->user_power_level = sdata->local->user_power_level;
c4382d5ca1af75 Emmanuel Grumbach  2024-10-07  113  	link_conf->txpower = INT_MIN;
e73b5e51a05d41 Johannes Berg      2022-09-02  114  
344d18cec23142 Johannes Berg      2024-05-06  115  	wiphy_work_init(&link->csa.finalize_work,
e73b5e51a05d41 Johannes Berg      2022-09-02  116  			ieee80211_csa_finalize_work);
b38579aeb5b04f Johannes Berg      2023-08-28  117  	wiphy_work_init(&link->color_change_finalize_work,
e73b5e51a05d41 Johannes Berg      2022-09-02  118  			ieee80211_color_change_finalize_work);
4cc6f3e5e5765a Remi Pommarel      2024-09-24  119  	wiphy_delayed_work_init(&link->color_collision_detect_work,
9288188438d85e Lorenzo Bianconi   2023-01-25  120  				ieee80211_color_collision_detection_work);
e73b5e51a05d41 Johannes Berg      2022-09-02  121  	INIT_LIST_HEAD(&link->assigned_chanctx_list);
e73b5e51a05d41 Johannes Berg      2022-09-02  122  	INIT_LIST_HEAD(&link->reserved_chanctx_list);
6241d79f004329 Aditya Kumar Singh 2024-09-06  123  	wiphy_delayed_work_init(&link->dfs_cac_timer_work,
6241d79f004329 Aditya Kumar Singh 2024-09-06  124  				ieee80211_dfs_cac_timer_work);
e73b5e51a05d41 Johannes Berg      2022-09-02  125  
e73b5e51a05d41 Johannes Berg      2022-09-02  126  	if (!deflink) {
e73b5e51a05d41 Johannes Berg      2022-09-02  127  		switch (sdata->vif.type) {
e73b5e51a05d41 Johannes Berg      2022-09-02  128  		case NL80211_IFTYPE_AP:
139c21bdb8c36a Muna Sinada        2024-10-17  129  		case NL80211_IFTYPE_AP_VLAN:
e73b5e51a05d41 Johannes Berg      2022-09-02  130  			ether_addr_copy(link_conf->addr,
e73b5e51a05d41 Johannes Berg      2022-09-02  131  					sdata->wdev.links[link_id].addr);
e73b5e51a05d41 Johannes Berg      2022-09-02  132  			link_conf->bssid = link_conf->addr;
e73b5e51a05d41 Johannes Berg      2022-09-02  133  			WARN_ON(!(sdata->wdev.valid_links & BIT(link_id)));
e73b5e51a05d41 Johannes Berg      2022-09-02  134  			break;
e73b5e51a05d41 Johannes Berg      2022-09-02  135  		case NL80211_IFTYPE_STATION:
e73b5e51a05d41 Johannes Berg      2022-09-02  136  			/* station sets the bssid in ieee80211_mgd_setup_link */
e73b5e51a05d41 Johannes Berg      2022-09-02  137  			break;
e73b5e51a05d41 Johannes Berg      2022-09-02  138  		default:
e73b5e51a05d41 Johannes Berg      2022-09-02  139  			WARN_ON(1);
e73b5e51a05d41 Johannes Berg      2022-09-02  140  		}
170cd6a66d9a16 Benjamin Berg      2023-03-01  141  
170cd6a66d9a16 Benjamin Berg      2023-03-01  142  		ieee80211_link_debugfs_add(link);
e73b5e51a05d41 Johannes Berg      2022-09-02  143  	}
e73b5e51a05d41 Johannes Berg      2022-09-02  144  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


