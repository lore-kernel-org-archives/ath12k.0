Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E3CCF0453
	for <ath12k@archiver.kernel.org>; Wed,  9 Oct 2024 11:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XHLwSCLcZXg/gdhfM+vK/9uemK5Mgu0oDNtBVH1UslU=; b=mK/1rot+F9bXS22t0ew5DfNSp1
	rHvsOkUIcbHLUh3OYQbambseojlZWjyI+zGW3cvRXlGamdgiqR44iq1gMzcaBNt1H4Gi/Jh6QN7G5
	9IHyE9EXHBYt7yrcOM4C7IpZvEy7qnFU020DaSI3uPXIMV/KreoFqmEtw19iwzBpI5d2qzeswp4ml
	VnT+fMq8H3NAhJLOAzNbbLA8RLwSNCazwtyKaWxo4UP5aRhYiKDIKX4BuOhgLDntM5O7JT8fYHPLR
	Sw0US50i/WqdfNY1b+hCljVctQgpi9oU1GgDpv0WgkfBott3EL3Myk+BVVhkILzfF37sN/l/B/6Wd
	vGGJVTRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syUeM-000000090uI-3a8F
	for ath12k@archiver.kernel.org;
	Wed, 09 Oct 2024 11:14:38 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syUeJ-000000090tc-47FQ
	for ath12k@lists.infradead.org;
	Wed, 09 Oct 2024 11:14:37 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-430ee5c9570so7340805e9.3
        for <ath12k@lists.infradead.org>; Wed, 09 Oct 2024 04:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728472474; x=1729077274; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XHLwSCLcZXg/gdhfM+vK/9uemK5Mgu0oDNtBVH1UslU=;
        b=rDLDz/CBU28mjZCybIqwIcx1tpH/usbuYU3pZYKYGBi+jWToTJ3cgFoiNJCdvBX4+q
         x//+u2sXSeigP9WlJXBVgdoiIwjHRvvL/B4/6bv4j71nKSEc0h+1FgZ/FtsqHeD5OrZ0
         HqhtDTzn2BYY9MttfX8WESqsqD4u9qkSa4oNnTJlKIdlfzqka0EPxQjt74L1hnuk5XCM
         x+LY9Cm7BsC3JwxEcFjLkxN0ahfQmx2/YCO7hRnMwR5W3HjYV2qrvjfdulsmw8/OLieh
         6nSjD9kniZ1Ll63tWJQg/hfnZ/AT9wD1LdxJGyK9VrRXCZsp4W2VoGzbH+U1z5JxjJof
         gPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728472474; x=1729077274;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHLwSCLcZXg/gdhfM+vK/9uemK5Mgu0oDNtBVH1UslU=;
        b=a09NFrGYW2RvFz0zp9boHzlc8DjAt8PW9wZQfQOwivTXehwKsCU4BdfcTjBfsXc9Ph
         8EmP5eJ5B+qm13cwCMzfuLytrJZeZ3uWtrGcVXCt2QRpQMljp6CDMbirOshYg4e/5jlm
         Az+BNNlTVSmbtRk+v9eTgUPyO0sOJXcfxJxzGd43+8F1twrsNyuAq7i7CudjM9SDctIm
         0v3oj3OYIvvn00pBncgbmrer5nLVoV3hxSD1mTmIKj3l00jL+swEY+prAO4aIeSQ4sRx
         Raz38L8DOnRNjVtxnA2QmBQd0fGgCt+VHRReb2KNrbODnFwJWkaTcDbRSd5xvbN4smR+
         RO4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHtincksEzoN2fI8WlgqTlJ1+IBF2QulQljNXQYRxF7fJZht8ox0OQgwE3qOPoLtYfCuhRZu4=@lists.infradead.org
X-Gm-Message-State: AOJu0YykP741A9h/1GlNi083XLfs4K7/vw3O4GPJH2eP0hW50Tr5lUb5
	yEo3x72Td+i9mukCKAz7ZbxAlR3Zr4j4gxUmALIEdywNnTGY7htDQMaK8CB4GnU=
X-Google-Smtp-Source: AGHT+IGIEbqnkdGIESJVOB3X7Tf9Mb14gCY489tPwNixMt2aKA2pzW3NrKHU/JAEfwRyXZstXJkfKQ==
X-Received: by 2002:a05:600c:384c:b0:426:59fe:ac27 with SMTP id 5b1f17b1804b1-430d70b3c4dmr19803405e9.26.1728472474129;
        Wed, 09 Oct 2024 04:14:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1690fc53sm10193150f8f.4.2024.10.09.04.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 04:14:33 -0700 (PDT)
Date: Wed, 9 Oct 2024 14:14:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Sriram R <quic_srirrama@quicinc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	ath12k@lists.infradead.org, Kalle Valo <quic_kvalo@quicinc.com>,
	Rameshkumar Sundaram <quic_ramess@quicinc.com>
Subject: [ath:ath12k-mlo-qcn9274 64/81]
 drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf() error:
 buffer overflow 'vif->link_conf' 15 <= 15
Message-ID: <207e7634-4390-47ac-bc62-c888f9dc34b4@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_041436_053108_8CED0FE4 
X-CRM114-Status: UNSURE (   5.96  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo-qcn9274
head:   7435d14d41d5d479a5e6a8a2cd4efdac9d928823
commit: 8e3d460d4c16e52a70ebfa7e1dd0bd20bf739888 [64/81] wifi: ath12k: Use mac80211 vif's link conf instead of bss_conf
config: csky-randconfig-r072-20241008 (https://download.01.org/0day-ci/archive/20241009/202410090633.yjfmlMkr-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410090633.yjfmlMkr-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf() error: buffer overflow 'vif->link_conf' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf() error: buffer overflow 'vif->link_conf' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf() error: buffer overflow 'vif->link_conf' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf() error: buffer overflow 'vif->link_conf' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf() error: buffer overflow 'vif->link_conf' 15 <= 15

vim +517 drivers/net/wireless/ath/ath12k/mac.c

8e3d460d4c16e5 Sriram R   2024-08-16  507  struct ieee80211_bss_conf *ath12k_get_link_bss_conf(struct ath12k_link_vif *arvif)
8e3d460d4c16e5 Sriram R   2024-08-16  508  {
8e3d460d4c16e5 Sriram R   2024-08-16  509  	struct ieee80211_vif *vif = arvif->ahvif->vif;
8e3d460d4c16e5 Sriram R   2024-08-16  510  	struct ieee80211_bss_conf *link_conf;
8e3d460d4c16e5 Sriram R   2024-08-16  511  	/* ieee80211_vif->link_conf[]s are rcu objects which requires rcu_read_lock()
8e3d460d4c16e5 Sriram R   2024-08-16  512  	 * to be held for safe access.
8e3d460d4c16e5 Sriram R   2024-08-16  513  	 */
8e3d460d4c16e5 Sriram R   2024-08-16  514  	if (arvif->link_id > IEEE80211_MLD_MAX_NUM_LINKS)

Seems like this is an off by one.

8e3d460d4c16e5 Sriram R   2024-08-16  515  		return NULL;
8e3d460d4c16e5 Sriram R   2024-08-16  516  	rcu_read_lock();
8e3d460d4c16e5 Sriram R   2024-08-16 @517  	link_conf = rcu_dereference(vif->link_conf[arvif->link_id]);
8e3d460d4c16e5 Sriram R   2024-08-16  518  	rcu_read_unlock();
8e3d460d4c16e5 Sriram R   2024-08-16  519  	return link_conf;
8e3d460d4c16e5 Sriram R   2024-08-16  520  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


