Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED417D1BDED
	for <ath12k@archiver.kernel.org>; Mon,  4 Nov 2024 20:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Topanic0riNYjJE9fuxFJh1AUQmD2jvcwHo7dbEJzXc=; b=bj3p2FPh0qeGBAg/sd2IlwPAFR
	ujbw6EHEk0OFfy9BzbAxNrAMkhpl9O8eL02KkR2fG6y0x74d8GBO7RwxbO1kk+DRCThzZ7Uye2jQK
	IsjqduN/p2Jfr2MkkFZxXEVQY7OB7AGqnmrlA5m10joMXjP6QMo/Bd4y0KG6qzhB6W/uDJ3izTaux
	KMndZHClBVfsteJSTHUlHtVrU5IkQQ++z4XDDlUwsQu6ZkxTkysVwmHSEccEHYHCnO98EK+ok3p+f
	sLRFD6Z2GSF0EyitKPGEa2X/vcOYYu8SaB42pPEP74rzpuPBfMLLAYqDj+SPsmgS21WM6qT3j2f1s
	tbvU28WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t83a9-0000000F0nh-2nYv
	for ath12k@archiver.kernel.org;
	Mon, 04 Nov 2024 20:21:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t83ZX-0000000F0h5-2VdR
	for ath12k@lists.infradead.org;
	Mon, 04 Nov 2024 20:21:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AC3075C2759;
	Mon,  4 Nov 2024 20:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B616C4CECE;
	Mon,  4 Nov 2024 20:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730751670;
	bh=wHPYPok304nfjlgeLG33lDiyI9NNxI3M4LCUZVxfMWU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=fm1Tf503RH7s32mchBl5TKcZvTg/X1AaIcf1qU85GSABFRCksOkYm4wB3xCBXoPcc
	 FU6mLNLlhqJQ+o4XjRRZdgRX8+OCizWWzsGRmLskfIiz1eU7mbYNiSdX6JO3BbIjEt
	 tg3Y298Pp6siesu2jptOknaJjMIsylmwHsNW/Gyul2ucJb+kqwihLEGSvkELE6vimg
	 TzhLDT7Fj9C8yX+f8yqwyUwZORe7TcmH/zJ99PRZQ0qlnBpChkcOQSv/cGBCcEL1EM
	 00nfn2FIkYxbLq/QCUyEfaxG7pYkHcCJnrhjllS6c1ad20ujZR5ysNxAv10ko0eT65
	 Fce0kp4DDrLKQ==
From: Kalle Valo <kvalo@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev,  Sriram R <quic_srirrama@quicinc.com>,
  lkp@intel.com,  oe-kbuild-all@lists.linux.dev,  Jeff Johnson
 <jjohnson@kernel.org>,  ath12k@lists.infradead.org,  Rameshkumar Sundaram
 <quic_ramess@quicinc.com>
Subject: Re: [ath:ath12k-mlo-qcn9274 65/81]
 drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error:
 buffer overflow 'sta->link' 15 <= 15
References: <8f50a85a-b09a-421b-ab02-55b4f3b6aa18@stanley.mountain>
Date: Mon, 04 Nov 2024 22:21:06 +0200
In-Reply-To: <8f50a85a-b09a-421b-ab02-55b4f3b6aa18@stanley.mountain> (Dan
	Carpenter's message of "Wed, 9 Oct 2024 14:16:36 +0300")
Message-ID: <871pzq7nt9.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_122111_756134_C567250D 
X-CRM114-Status: UNSURE (   9.47  )
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

Dan Carpenter <dan.carpenter@linaro.org> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo-qcn9274
> head:   7435d14d41d5d479a5e6a8a2cd4efdac9d928823
> commit: d50d85ea8574956b273faf4cb2493a98c6548b04 [65/81] wifi: ath12k:
> Use mac80211 sta's link_sta instead of deflink
> config: csky-randconfig-r072-20241008
> (https://download.01.org/0day-ci/archive/20241009/202410091157.eMoYClhc-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 14.1.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202410091157.eMoYClhc-lkp@intel.com/
>
> New smatch warnings:
> drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error: buffer overflow 'sta->link' 15 <= 15
> drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error: buffer overflow 'sta->link' 15 <= 15
> drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error: buffer overflow 'sta->link' 15 <= 15
> drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error: buffer overflow 'sta->link' 15 <= 15
> drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error: buffer overflow 'sta->link' 15 <= 15
>
> vim +534 drivers/net/wireless/ath/ath12k/mac.c
>
> d50d85ea857495 Sriram R 2024-08-16  522  static struct
> d50d85ea857495 Sriram R 2024-08-16  523  ieee80211_link_sta *ath12k_get_link_sta(struct ath12k_link_sta *arsta)
> d50d85ea857495 Sriram R 2024-08-16  524  {
> d50d85ea857495 Sriram R 2024-08-16  525  	struct ath12k_sta *ahsta = arsta->ahsta;
> d50d85ea857495 Sriram R 2024-08-16  526  	struct ieee80211_sta *sta = ath12k_ahsta_to_sta(ahsta);
> d50d85ea857495 Sriram R 2024-08-16  527  	struct ieee80211_link_sta *link_sta;
> d50d85ea857495 Sriram R 2024-08-16 528 /* ieee80211_sta->link[]'s are
> rcu objects which requires rcu_read_lock()
> d50d85ea857495 Sriram R 2024-08-16  529  	 * to be held for safe access.
> d50d85ea857495 Sriram R 2024-08-16  530  	 */
> d50d85ea857495 Sriram R 2024-08-16  531  	if (arsta->link_id > IEEE80211_MLD_MAX_NUM_LINKS)
>
> Was >= intended?

Yes, fixed version here:

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=ath12k-mlo&id=722120a853986de95db37e92ecbf731deffe86fa

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

