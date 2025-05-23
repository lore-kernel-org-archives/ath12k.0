Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C7EC54F32
	for <ath12k@archiver.kernel.org>; Fri, 23 May 2025 08:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0hzu/331svahbTes/8aRYkVNN0812xz1z5KDadrw01g=; b=n1oh1DyiTcWlATzhSY5lqHHVfW
	k1kxtuQrwUqeayCU+PVIEavRi27aBsb9o0gO65hODwW3ww6JBgdWOkz9qUrRAnmu/p7UzWmrJiYSf
	xGSsfLuoTz3qL0ESxuBFmHwzhkMJQi9j3EJZgqJOOOaw2g4cK6rwJlLq8s01FqRGHzEGrBDelAQ/Z
	Oyp84P+/hitDZQ/xlAIR1Qw/pnASYQtE9Gq1k4Ebbf2It3L3dyolcz/RoUZFVQOmFB1VdUyPWcMHj
	NcCaSCrYG0XTGS3h9idhDLR++Zjcf0RQG46ZyWlFURDH0PblKKsr8/T3XievLpTbJss0yH8kxt8GD
	AcSV9CxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIO1c-00000003Kmp-2Hdb;
	Fri, 23 May 2025 08:45:08 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uINn6-00000003J9l-2VGu
	for ath12k@lists.infradead.org;
	Fri, 23 May 2025 08:30:09 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-442f9043f56so52000895e9.0
        for <ath12k@lists.infradead.org>; Fri, 23 May 2025 01:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747989006; x=1748593806; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0hzu/331svahbTes/8aRYkVNN0812xz1z5KDadrw01g=;
        b=e3SuCGvuYVRdbIAvWV6v4mcyR3j/RTnaQwp4WUqUbcKl9PciDzDeyCS+EzomAZ7PA3
         XmQmJNU7MHbUqRiPM62KPQgVab6udaYtF64FgLnKWjrWATWH1+gsZ9zfU9+Dvyz723TY
         kJYz5ihI9ALrsV4aSjeXW31Kl2PEeGFep90Rg47fOEVkA6ev1ZlUbJS6nFiBRj/IC/WT
         rSYPVu3pFxwHJV0fQb9AF5fQ8OA1kZOMD6zJb9epIL2TR4KDQv4LSXQqviqh3hUu32Wz
         iZbAYTqc0RIWrJy0KpXlu+1r29Y4EJuNunHCSHrKiBSX4kNgD4vG7YEmqnVRo0xdiwXF
         6ekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747989006; x=1748593806;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0hzu/331svahbTes/8aRYkVNN0812xz1z5KDadrw01g=;
        b=jPG4t9+Qv0aoJlR1fnMC3hQla7aeoyHdhh2LtK4O5YS8EYYS7qO9TkX1iJgw3SkfnN
         TIZWMHRniJYLmymazM7t6jTUYuUsJkbcYs+EVQc2DOVmerZ2us7utWPcjjcPe0913SKS
         tC0n1zaA16ODj0ZhehlLzkWePJcIUZA0zQHeOrwMKaf7X9Z3COYnTNboqwFD+BdMtbnG
         x4Lj5evnJDRb51hTiyS90zU/ymxPTqN/ayIlsHpBWXyRMXns58xJr53uBIGLB3K8YYX6
         jVyBCRRK+15B0cM+gAEIGc4M2UCMuojkPN79OZkuaPNCBoeXTNbEqyyFl8P+qBZEoNJ2
         5+BA==
X-Forwarded-Encrypted: i=1; AJvYcCUDf0cuC0D27MsppcAn7HqGog/dM1SSqbTjvHtNGICfOpM7RYUyUc5N6deCaanoM6DkKQIJuvo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwY7uEN2oDEb1V+WK3OhS6V4lguLvsrbfR3wk7rw5NH+OqtfR14
	oBe/gSEMpnaj7jE+Nf07331qscq3Y1UPehL5SaErc/DaKSpUrzBJCn5E13IaaLuZn/A=
X-Gm-Gg: ASbGncu5gq/7gf/IR9wf0ksUfUWSGXv8U8IPuwsJ0P4xwuffwpO0jimGNSeP34IQdH8
	GzDY+jldUmSc7hktwnhwPWecGIzKCG7VG/dHUmEdvY7/4bAVoOb1PzH4wbFxLIYUIDCx6k9Q7fe
	/qPNKOD2AvtWRZV+ADFKOUIxduKlcWgvZHuRh+lAlUovPuQQgOXiI3gnXxEpKsqmYYrzB35RZfH
	mszXTDeg4E/G9mGmdhGxVjGl+txJT7kZU6G2YV9/HC70XqScMrYre0rE8Bsq/AYGCm3U2NLkEyp
	/4TMI5DQd++qXUcYLipUbN1W+Q8kAEtTCja8vgbPL3Zbixp88e9PxVn2
X-Google-Smtp-Source: AGHT+IE06BDQgHT8K2b8PLVbznX7v0nJNrz2nHMEuKTcFYYfVpza79W+ry5W8H8nR5LU1oDBKpzmDw==
X-Received: by 2002:a5d:64c4:0:b0:3a0:b565:f1ea with SMTP id ffacd0b85a97d-3a4c1faad0dmr3219661f8f.5.1747989006250;
        Fri, 23 May 2025 01:30:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a35ca8874bsm26117801f8f.67.2025.05.23.01.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 01:30:05 -0700 (PDT)
Date: Fri, 23 May 2025 11:30:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Baochen Qiang <quic_bqiang@quicinc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	ath12k@lists.infradead.org,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Subject: [ath:pending-deferred 23/61]
 drivers/net/wireless/ath/ath12k/mac.c:9812 ath12k_mac_parse_tx_pwr_env()
 error: buffer overflow 'local_non_psd->power' 5 <= 15
Message-ID: <202505180703.Kr9OfQRP-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_013008_648949_C982B63E 
X-CRM114-Status: UNSURE (   6.74  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending-deferred
head:   52c1e49f8c69a630f3dbe7dd79c52979cdad19d2
commit: cccbb9d0dd6ab9e3353066217e9ab5b44bd761d3 [23/61] wifi: ath12k: add parse of transmit power envelope element
config: x86_64-randconfig-161-20250518 (https://download.01.org/0day-ci/archive/20250518/202505180703.Kr9OfQRP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505180703.Kr9OfQRP-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:9812 ath12k_mac_parse_tx_pwr_env() error: buffer overflow 'local_non_psd->power' 5 <= 15
drivers/net/wireless/ath/ath12k/mac.c:9812 ath12k_mac_parse_tx_pwr_env() error: buffer overflow 'local_non_psd->power' 5 <= 15
drivers/net/wireless/ath/ath12k/mac.c:9812 ath12k_mac_parse_tx_pwr_env() error: buffer overflow 'reg_non_psd->power' 5 <= 15
drivers/net/wireless/ath/ath12k/mac.c:9812 ath12k_mac_parse_tx_pwr_env() error: buffer overflow 'reg_non_psd->power' 5 <= 15

vim +9812 drivers/net/wireless/ath/ath12k/mac.c

cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9802  	} else {
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9803  		tpc_info->is_psd_power = false;
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9804  		tpc_info->eirp_power = 0;
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9805  
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9806  		tpc_info->num_pwr_levels = max(local_non_psd->count,
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9807  					       reg_non_psd->count);
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9808  		if (tpc_info->num_pwr_levels > ATH12K_NUM_PWR_LEVELS)
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9809  			tpc_info->num_pwr_levels = ATH12K_NUM_PWR_LEVELS;
                                                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
tpc_info->num_pwr_levels can be ATH12K_NUM_PWR_LEVELS (16).

cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9810  
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9811  		for (i = 0; i < tpc_info->num_pwr_levels; i++) {
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18 @9812  			tpc_info->tpe[i] = min(local_non_psd->power[i],
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9813  					       reg_non_psd->power[i]) / 2;
                                                                                       ^^^^^^^^^^^^^^^^^^^^^
So i can be 15 but there are only 5 elements in the array.

cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9814  			ath12k_dbg(ab, ATH12K_DBG_MAC,
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9815  				   "non PSD power[%d] : %d\n",
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9816  				   i, tpc_info->tpe[i]);
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9817  		}
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9818  	}
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9819  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


