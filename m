Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFD3CEF16C
	for <ath12k@archiver.kernel.org>; Tue,  8 Oct 2024 13:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ReMHXzy/xLyFkDD6JkM3P5c6crcWMdhbVuAZ58vbNl4=; b=D0ur6RWU6vSi6j1Z8cNBD4l1xp
	LFv4EBT3Q59WbdSrci2PBeYjAmHCu1lxinP4Ft1jiwkmHy84SExg7Gs0IhjGp287rYx6Y/r/Tk1Bh
	8J7Bpa6tn4wJnXx/oaiMfDl33ai9UXeZuxy5FTy4FngyDNMGm/tOx16dTbh6p5tSyYb7xZklrd1TL
	DbuwtGXtjCYeLs5K1jrHsnvi+UoFYcH6qGMaXrUKhDZUehAiQZYIti6tiemyfW6pY1XL/4xRcoS/d
	rZxEsend54wjJwtCptUmTV6f2A6qxD7sJX+uh2aCPi4VHCc9geQlahxAUkf+COZQYuZY/Dt9wvaFg
	X4ccaLjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy9u4-00000005usO-2MRm
	for ath12k@archiver.kernel.org;
	Tue, 08 Oct 2024 13:05:28 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy9nX-00000005tUM-0It9
	for ath12k@lists.infradead.org;
	Tue, 08 Oct 2024 12:58:44 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-37cdac05af9so5283388f8f.0
        for <ath12k@lists.infradead.org>; Tue, 08 Oct 2024 05:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728392320; x=1728997120; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ReMHXzy/xLyFkDD6JkM3P5c6crcWMdhbVuAZ58vbNl4=;
        b=A207gmoc6WY/+b2fDlfyZtwBm2VOg7vOsTIHR/4OLqQB88lxjCIC7hgS6OATp+2ZgJ
         ZyvSt8li0FgYpV5C6BCFGxRrA6AZJwodavkT0yMBsBAXnAs0GdjD6MN07QLJzoa/UjV4
         76GW5Kn99h8pJz4vZpOpYPtfcEGDi0XUK8dc1zc+GcyM0uGSXOLpBtywL4ciSQ8ZWC4Z
         MuPE765gsOMNyRA76EXx67ZVPNojqh7ZumJrgSJbdmsKGAAr9eJuW4WjPqqGD7uU0tLY
         IVLZEHyds6HXrF/cteTQKs9TK4vEoeZvgVg5PaRAzdqVoaaqHPsuJUOsIeECdPpRs2j0
         AbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728392320; x=1728997120;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ReMHXzy/xLyFkDD6JkM3P5c6crcWMdhbVuAZ58vbNl4=;
        b=Bk/W33m/t3HPp9UdBF4e4T7QMyxM3zylTYECTfDqOwCW7q8K9E/9lN9L8wjvxg4Mr+
         13MYw2aQSiYtdx6x0jkqCaL79CsbDsrQcgxgC8rUHqrVJelGlx/5BBkBoQ9/7xP44eTE
         9s/f78VQZ70Y7eOWOTTRnTX1GVtIBlKWyM8jjbHgwgh+zOXWAwdBSAOqEJEEfolnENU0
         0W67CKAaPzvOpVQ1rmG5ekS9Q55/Kl5c5A5wArZzruiG39H2YGePkSFif1vSnSpzH9rA
         HREobqz/BGbY6YRMLzTpefqEjcUw0cgw+QPw07G3lsORPKHd+2CetJGxj82x5MqrI8ku
         bIjg==
X-Forwarded-Encrypted: i=1; AJvYcCUNM5mM6AlHCjX9FZa8HCgfK0d+mefwnrekTV0qxGTMEkkk5mILI9Z7ChQNYxiRHmFbX1HxW/0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwMjNwMmsN8NaH8LfstLWhCmsYl2NtBwE2CZcWl7c7aXiPIv1Lr
	TIkpP6SrUrBoKIVfDdEDmq8zHtZydR7KWMCejp/eKI0+wbousMj7sWrQ14cBHSo=
X-Google-Smtp-Source: AGHT+IHQ2iBxXrIrseZ96mgtxzYQp8FfKJjmT9um9xPqnI+veUBTlMl3+aPZrS4hSFMmULIIpLA0lw==
X-Received: by 2002:adf:a447:0:b0:37c:cce6:997d with SMTP id ffacd0b85a97d-37d0e72f6damr12739368f8f.20.1728392320204;
        Tue, 08 Oct 2024 05:58:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d16920be2sm8085548f8f.60.2024.10.08.05.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 05:58:39 -0700 (PDT)
Date: Tue, 8 Oct 2024 15:58:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	ath12k@lists.infradead.org, Kalle Valo <quic_kvalo@quicinc.com>,
	Harshitha Prem <quic_hprem@quicinc.com>
Subject: [ath:ath12k-mlo-qcn9274 22/81]
 drivers/net/wireless/ath/ath12k/mac.c:9400 ath12k_mac_destroy() error: we
 previously assumed 'ab' could be null (see line 9389)
Message-ID: <d5ea9564-f66d-4d55-9c93-7d088c4a3ac4@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_055843_208028_756061E5 
X-CRM114-Status: UNSURE (   6.90  )
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
head:   4ad14f50820745f9c2f425ba07ca8431bf2409ed
commit: 6c252823bedb7f8f34d53dddadd65761f85bd3c4 [22/81] wifi: ath12k: move ath12k_hw from per device to group
config: csky-randconfig-r072-20241008 (https://download.01.org/0day-ci/archive/20241008/202410081858.ShABiCCT-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410081858.ShABiCCT-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:9400 ath12k_mac_destroy() error: we previously assumed 'ab' could be null (see line 9389)

vim +/ab +9400 drivers/net/wireless/ath/ath12k/mac.c

6c252823bedb7f Karthikeyan Periyasamy 2024-04-12  9380  void ath12k_mac_destroy(struct ath12k_hw_group *ag)
8a742a79f90e3d Karthikeyan Periyasamy 2024-01-14  9381  {
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9382  	struct ath12k_pdev *pdev;
6c252823bedb7f Karthikeyan Periyasamy 2024-04-12  9383  	struct ath12k_base *ab = ag->ab[0];
6c252823bedb7f Karthikeyan Periyasamy 2024-04-12  9384  	int i, j;
01f062770f9740 Karthikeyan Periyasamy 2024-04-12  9385  	struct ath12k_hw *ah;
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9386  
6c252823bedb7f Karthikeyan Periyasamy 2024-04-12  9387  	for (i = 0; i < ag->num_devices; i++) {
6c252823bedb7f Karthikeyan Periyasamy 2024-04-12  9388  		ab = ag->ab[i];
6c252823bedb7f Karthikeyan Periyasamy 2024-04-12 @9389  		if (!ab)
                                                                             ^^
ab can be NULL

6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9390  			continue;
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9391  
6c252823bedb7f Karthikeyan Periyasamy 2024-04-12  9392  		for (j = 0; j < ab->num_radios; j++) {
6c252823bedb7f Karthikeyan Periyasamy 2024-04-12  9393  			pdev = &ab->pdevs[j];
6c252823bedb7f Karthikeyan Periyasamy 2024-04-12  9394  			if (!pdev->ar)
6c252823bedb7f Karthikeyan Periyasamy 2024-04-12  9395  				continue;
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9396  			pdev->ar = NULL;
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9397  		}
6c252823bedb7f Karthikeyan Periyasamy 2024-04-12  9398  	}
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9399  
e46d266981a601 Karthikeyan Periyasamy 2024-04-12 @9400  	for (i = 0; i < ath12k_get_num_hw(ab); i++) {
                                                                                                  ^^
Dereferenced inside function

01f062770f9740 Karthikeyan Periyasamy 2024-04-12  9401  		ah = ath12k_ab_to_ah(ab, i);
01f062770f9740 Karthikeyan Periyasamy 2024-04-12  9402  		if (!ah)
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9403  			continue;
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9404  
01f062770f9740 Karthikeyan Periyasamy 2024-04-12  9405  		ath12k_mac_hw_destroy(ah);
01f062770f9740 Karthikeyan Periyasamy 2024-04-12  9406  		ath12k_ab_set_ah(ab, i, NULL);
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9407  	}
8a742a79f90e3d Karthikeyan Periyasamy 2024-01-14  9408  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


