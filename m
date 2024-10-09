Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAC6CF045B
	for <ath12k@archiver.kernel.org>; Wed,  9 Oct 2024 11:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zo4Qcw3djWHD4Z1aaSZ/XNj7I2Fhmna3RsP+3TSIirw=; b=XcTJAkESX3frJW3FychywIQfmr
	bV28tuH5qnOSnrDFffGY3ShTUz7Yo57c5nbq/nc4DOaVuKG5InxUVIeFQJkR1TW4Avfzsx0DC0IEF
	P5k/aFPMAqeoBvzxztK3V12Ti1i0t0KRKjZ1Pe0vrLDIp0fck2Dnk6m/Ocd9EgFQmXgI87md22uDl
	LaSEjfJ9T79XIm6tLtK9sGf8UUjxHCzw4X0snR5JjdhIod3zrM3/dX7kt7x57XkAFQEKPS4Mo+6MU
	KpmOBoAsaU+JbqTIa5Ix/AcQo93V5sSDRDf7/ECGw7ZyjqmLjwcfoEd9pv8ki6E/b9Aw3AK0SCVcS
	mpQHYIfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syUmZ-000000092p7-2TBg
	for ath12k@archiver.kernel.org;
	Wed, 09 Oct 2024 11:23:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syUgS-000000091QZ-22ht
	for ath12k@bombadil.infradead.org;
	Wed, 09 Oct 2024 11:16:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Zo4Qcw3djWHD4Z1aaSZ/XNj7I2Fhmna3RsP+3TSIirw=; b=c0c3vo7pLkKs+b9dVg/zE6WCja
	RBNGDaCf89uevLPktEIeHavrs7wny6EhF9dGy/p8EK/p9SN24CsCfq49RBSWIIr2tbCIf+0gMaS1Q
	YDGoGY1G/R3sFJpdkUxLlFCn0yJp3izBXm60zLVBaVOmTe8Ur8/epVqexZRMye+tqV7coR4gamBlo
	m5o8zqdol2e2BYZ7VN2ntK0Gx/zu71VboZBQO+Pd5KwPBE3jOYkPCTOaQYb4JXgx2tv6Pi8f2HCvL
	aq0usupS/BrGDIsyALmlnIYmbCaLzjMS8FlYLJDxDRE4nwUaH09MZ7mp8H4fYw4DgJesxrb1Agzs8
	Rv46xntA==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syUgP-00000004vBK-0qfW
	for ath12k@lists.infradead.org;
	Wed, 09 Oct 2024 11:16:47 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-42f6bec84b5so69014715e9.1
        for <ath12k@lists.infradead.org>; Wed, 09 Oct 2024 04:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728472602; x=1729077402; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zo4Qcw3djWHD4Z1aaSZ/XNj7I2Fhmna3RsP+3TSIirw=;
        b=r0oHq5+RKPDVTr/Zmh9xArMxxVsLvSm/3sKKEKxlbtUeXQloxKWbpHpKrQp8RgFdNc
         v1cOwH8li1fX1ijOJC30Il+NmaMdhy3swKtuYQglsTzGq33cpMiTbmK32hpBPrzUGxcC
         QxLO3OD/DmapzYKFfbxCCdn7LzgvrPCO0EfF+1YZ42g8E6DAurx0CDIBzuoCRQJbSePe
         Lz1L3RNuprfhiGvbHOgCsmmi6aSnROXBNW1562EciXWS3pKPTkQRrA9c/VexDNp7gJw9
         o2MU6zL361nCj0VP0fDAQXnC3KejNhbq2e8VP811rqn0kswx7CLSfVgX19HcoH9gyE40
         k9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728472602; x=1729077402;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zo4Qcw3djWHD4Z1aaSZ/XNj7I2Fhmna3RsP+3TSIirw=;
        b=CDktUVJUqp/qSiUVyMDMvNfiS84ChTLMtUXx65IBTMnoyeIJKamw0LIzaDmdkGMOVX
         z0e7ujnDmz0GsCja0r757JB+APz2OMZtwdtNX9/5E95eWSe9xGRZwDd3fErxXXpopkYQ
         7U/fDc1BkwDE7GXZm47QV/W33pe1pYhGyBUgmmJ0yDRi20DvpwLuBWaRvkRotHzCHzTN
         1ctGCUtYDFrXkzG1c0uOCtDF4AtkgENRJN4XHElyjwh7MpUO3NTrPwjbb3lVB3xEikS7
         tYvUP9OFIwyVepmoxgIe0IGCzZ1befIKcsmoFPgJ6mI/OSveqJB5dkxKbj306vp7dRru
         LcDw==
X-Forwarded-Encrypted: i=1; AJvYcCWDjysQL4qyJq8ohrusLzqEt1y0REWqX3UXZ80Q4GywYj7J149ozM65QUSIXK7eGRjRSSmcRDY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4jKK2+BvnDUoWw6bILM7zZz7izZmpuKRUwJx7uImSZKYOp9rC
	S+eQsQ7Qu1+ID+zTChcGJvdeDJD0CwJe7Php56fNjjIvpI+wZ8MKp7hE84uHT98=
X-Google-Smtp-Source: AGHT+IHvWT1NZaDAYpOFE6XOARp8UJFehWVLhiaZckCgbM41Wn4hRYyoWn/Wn6AnhRYH7Mi8oneIZg==
X-Received: by 2002:a05:600c:4ec7:b0:42c:d74b:eb26 with SMTP id 5b1f17b1804b1-430ccf48471mr15939835e9.21.1728472601971;
        Wed, 09 Oct 2024 04:16:41 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430ccf4f8desm16759585e9.13.2024.10.09.04.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 04:16:41 -0700 (PDT)
Date: Wed, 9 Oct 2024 14:16:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Sriram R <quic_srirrama@quicinc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	ath12k@lists.infradead.org, Kalle Valo <quic_kvalo@quicinc.com>,
	Rameshkumar Sundaram <quic_ramess@quicinc.com>
Subject: [ath:ath12k-mlo-qcn9274 65/81]
 drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error:
 buffer overflow 'sta->link' 15 <= 15
Message-ID: <8f50a85a-b09a-421b-ab02-55b4f3b6aa18@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_121645_378721_0AC50485 
X-CRM114-Status: UNSURE (   5.49  )
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
commit: d50d85ea8574956b273faf4cb2493a98c6548b04 [65/81] wifi: ath12k: Use mac80211 sta's link_sta instead of deflink
config: csky-randconfig-r072-20241008 (https://download.01.org/0day-ci/archive/20241009/202410091157.eMoYClhc-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410091157.eMoYClhc-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error: buffer overflow 'sta->link' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error: buffer overflow 'sta->link' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error: buffer overflow 'sta->link' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error: buffer overflow 'sta->link' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error: buffer overflow 'sta->link' 15 <= 15

vim +534 drivers/net/wireless/ath/ath12k/mac.c

d50d85ea857495 Sriram R 2024-08-16  522  static struct
d50d85ea857495 Sriram R 2024-08-16  523  ieee80211_link_sta *ath12k_get_link_sta(struct ath12k_link_sta *arsta)
d50d85ea857495 Sriram R 2024-08-16  524  {
d50d85ea857495 Sriram R 2024-08-16  525  	struct ath12k_sta *ahsta = arsta->ahsta;
d50d85ea857495 Sriram R 2024-08-16  526  	struct ieee80211_sta *sta = ath12k_ahsta_to_sta(ahsta);
d50d85ea857495 Sriram R 2024-08-16  527  	struct ieee80211_link_sta *link_sta;
d50d85ea857495 Sriram R 2024-08-16  528  	/* ieee80211_sta->link[]'s are rcu objects which requires rcu_read_lock()
d50d85ea857495 Sriram R 2024-08-16  529  	 * to be held for safe access.
d50d85ea857495 Sriram R 2024-08-16  530  	 */
d50d85ea857495 Sriram R 2024-08-16  531  	if (arsta->link_id > IEEE80211_MLD_MAX_NUM_LINKS)

Was >= intended?

d50d85ea857495 Sriram R 2024-08-16  532  		return NULL;
d50d85ea857495 Sriram R 2024-08-16  533  	rcu_read_lock();
d50d85ea857495 Sriram R 2024-08-16 @534  	link_sta = rcu_dereference(sta->link[arsta->link_id]);
d50d85ea857495 Sriram R 2024-08-16  535  	rcu_read_unlock();
d50d85ea857495 Sriram R 2024-08-16  536  	return link_sta;
d50d85ea857495 Sriram R 2024-08-16  537  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


