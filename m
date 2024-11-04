Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E2BD1BDED
	for <ath12k@archiver.kernel.org>; Mon,  4 Nov 2024 20:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VwnsrpiUQDnyhTz8u+jDhmhcmV6Kh/QX2BvBa76vNgo=; b=bozn6/Z9qQl7f0koha1YWBsBIE
	B5O9yE6+NIj0AWTCyU2XpFpeKWlBmhj2HBV/J6aiihn5hcC4NWaOI5hbO7quDwGHHU37D1M8CnX2/
	NeX0EkhqQMT4YQtJ3gyZFejwdVYQQ9tRYldz8f/RxhVULy0ieE92ACiVbQsXQu2aawcPSiZ6Cy6/g
	QZYk/KK8BCkoEMFzMT0ww9z4vIjM6KgbE4dE2UiDNqQ3hMeg9i2e3K3gwTD+DOQUgUAPaDocx4idh
	EL3s9GVX+3EbdvLJiJWItXu5NLRR4kMSQZ9ewdNXtpt8ZaUZeyUnHzRDyBOv0eZWrAmAi56HmT4HP
	eW+aNbaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t83Y6-0000000F0Q3-0vvN
	for ath12k@archiver.kernel.org;
	Mon, 04 Nov 2024 20:19:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t83Y3-0000000F0PR-2Wm8
	for ath12k@lists.infradead.org;
	Mon, 04 Nov 2024 20:19:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BDBEFA404F9;
	Mon,  4 Nov 2024 20:17:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5FDDC4CED0;
	Mon,  4 Nov 2024 20:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730751578;
	bh=t+81eTbXcftmLidkjGEqYw6lTVf3GM8d0pl0hGy7AD4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=GKT1NOdZudd9ZNLX0aNtcbGIoxGo+/2XUQsJHMqOWhyMJ8Z3TvcA+0w9Ldd1wVszQ
	 ULCTeCpkdpJ23cgtrKjW36Cge5jj/5Itv04WIWEhUIU/qTlgrfZh2bdda1kr5NhArc
	 B+OfwwcJDuVC3YLWndi0YwGgcSvazZxeWuKDerImOnkquxHw3sd31RU5u5Xtvt1tqR
	 jGZPRXqNs5Wt8EAQJgYzrqSfLh0R4VZZMgAOAj+BUJ63smlaUDrc4swhZ4f9+ngjit
	 uc07gz4CnvKJrvYoliONagCEr1Rp9qpigRtvTY5tPS2ZwgWhyC5UJyXLzYlQf5bFJG
	 req8yuCDckiFw==
From: Kalle Valo <kvalo@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev,  Sriram R <quic_srirrama@quicinc.com>,
  lkp@intel.com,  oe-kbuild-all@lists.linux.dev,  Jeff Johnson
 <jjohnson@kernel.org>,  ath12k@lists.infradead.org,  Rameshkumar Sundaram
 <quic_ramess@quicinc.com>
Subject: Re: [ath:ath12k-mlo-qcn9274 64/81]
 drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf()
 error: buffer overflow 'vif->link_conf' 15 <= 15
References: <207e7634-4390-47ac-bc62-c888f9dc34b4@stanley.mountain>
Date: Mon, 04 Nov 2024 22:19:34 +0200
In-Reply-To: <207e7634-4390-47ac-bc62-c888f9dc34b4@stanley.mountain> (Dan
	Carpenter's message of "Wed, 9 Oct 2024 14:14:29 +0300")
Message-ID: <875xp27nvt.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_121939_788090_FA3ED162 
X-CRM114-Status: GOOD (  10.38  )
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
> commit: 8e3d460d4c16e52a70ebfa7e1dd0bd20bf739888 [64/81] wifi: ath12k:
> Use mac80211 vif's link conf instead of bss_conf
> config: csky-randconfig-r072-20241008
> (https://download.01.org/0day-ci/archive/20241009/202410090633.yjfmlMkr-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 14.1.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202410090633.yjfmlMkr-lkp@intel.com/
>
> New smatch warnings:
> drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf()
> error: buffer overflow 'vif->link_conf' 15 <= 15
> drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf()
> error: buffer overflow 'vif->link_conf' 15 <= 15
> drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf()
> error: buffer overflow 'vif->link_conf' 15 <= 15
> drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf()
> error: buffer overflow 'vif->link_conf' 15 <= 15
> drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf()
> error: buffer overflow 'vif->link_conf' 15 <= 15
>
> vim +517 drivers/net/wireless/ath/ath12k/mac.c
>
> 8e3d460d4c16e5 Sriram R 2024-08-16 507 struct ieee80211_bss_conf
> *ath12k_get_link_bss_conf(struct ath12k_link_vif *arvif)
> 8e3d460d4c16e5 Sriram R   2024-08-16  508  {
> 8e3d460d4c16e5 Sriram R   2024-08-16  509  	struct ieee80211_vif *vif = arvif->ahvif->vif;
> 8e3d460d4c16e5 Sriram R   2024-08-16  510  	struct ieee80211_bss_conf *link_conf;
> 8e3d460d4c16e5 Sriram R 2024-08-16 511 /* ieee80211_vif->link_conf[]s
> are rcu objects which requires rcu_read_lock()
> 8e3d460d4c16e5 Sriram R   2024-08-16  512  	 * to be held for safe access.
> 8e3d460d4c16e5 Sriram R   2024-08-16  513  	 */
> 8e3d460d4c16e5 Sriram R   2024-08-16  514  	if (arvif->link_id > IEEE80211_MLD_MAX_NUM_LINKS)
>
> Seems like this is an off by one.

Yup, fixed version of the patch (not yet submitted for review):

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=ath12k-mlo&id=51a7ce0fc98b4fc70200cc113ec77a8159c40ca4

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

