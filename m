Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BDEC47258
	for <ath12k@archiver.kernel.org>; Wed, 17 Jan 2024 13:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKCn1inwVwGfYWnXy6sKkcbdtjy9FFpnq2/d1g+JuFA=; b=qsNwqYE+z/F8rXQDDowwRXptG5
	Gcw+wTyR2aSlqVL1rcFVgGi3V6GYps2Qg8Jcj4mK0S7BVShHQVGKssum/fkS3TLT6HPVMgDuP78P6
	Oer4eqmL0Pgmydjea6poZUs+LekzC3RNeGUnFiDIzGMRDtMZKkLePoBC2sc83gFNx7/xr1aUN0FQs
	aOaO1Bcwoy8mOnSlrgyicP93cFIVJZ1pse87vFtF9kPoKaf7+9BuJw5LrTNqEAAViUB9BPisdJ9jU
	IzCDUTyVjdTArQcEh4m37vzPyYZZZtWzoaQVitvrUTSNaXAnWkh6ogwdFOGFXr9vIQGeCuR1RpYpN
	N1cGZhcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ6Ep-00Gg3i-06
	for ath12k@archiver.kernel.org;
	Wed, 17 Jan 2024 13:45:51 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ6Em-00Gg14-0t
	for ath12k@lists.infradead.org;
	Wed, 17 Jan 2024 13:45:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B5802B8116B;
	Wed, 17 Jan 2024 13:45:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5109BC433C7;
	Wed, 17 Jan 2024 13:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705499146;
	bh=Wea10r8QPdbUDSZNfU+aEEm35fedoPB+u5pgJIvgJFo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=XRM0Mq1zS2Z3HvmPAFJ2mi986a0gw5m1AcdSZ0bovGwc5LCR6d+EP5rTkAmu+HXcF
	 IbRmbF+relAX6NYNdh+SAelDfgDxQ+2RDnMFyCB83Z9+lrsnmxGommliuVpUn+zz9g
	 w7dZzf17AqjAx/G4Db4kKpw6E1pSI5qUE3QUQ+8ANoQhVRpVdJmbo7Fj/C18o6LHu6
	 AsvnC6vpsh35bQcRm0mo9mEU4m73dQKuEGlDc0p/sfJOv86M44wr5kwaHY6zooxA1f
	 tTqvkKnsXq3yuQO+ZALIiJzGOUwjIU/topOJzPAUMuWXXE6EVcrBkzBywVpttp6i/z
	 qBhI8BILGe/UQ==
From: Kalle Valo <kvalo@kernel.org>
To: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 0/3] wifi: ath12k: Remove unsupported and unused ring
 configurations
References: <20231122063932.10321-1-quic_tamizhr@quicinc.com>
Date: Wed, 17 Jan 2024 15:45:43 +0200
In-Reply-To: <20231122063932.10321-1-quic_tamizhr@quicinc.com> (Tamizh Chelvam
	Raja's message of "Wed, 22 Nov 2023 12:09:29 +0530")
Message-ID: <878r4o5b08.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_054548_453327_37147207 
X-CRM114-Status: UNSURE (   7.36  )
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

Tamizh Chelvam Raja <quic_tamizhr@quicinc.com> writes:

> Currently in driver doing memory allocation for tx_monitor, tcl_cmd_ring
> and tcl_status ring. Here driver support for tx_monitor mode is not
> there and memory for tcl_cmd and tcl_status rings are allocated by
> firmware and it uses that memory instead of host allocated. So avoid
> these unused ring setup configuration.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>
> Tamizh Chelvam Raja (3):
>   wifi: ath12k: fix calling correct function for rx monitor mode
>   wifi: ath12k: Remove unsupported tx monitor handling
>   wifi: ath12k: Remove unused tcl_*_ring configuration

I had several conflict, please double check:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=cfb7ae2dc5d32206d6978625bac055e1f431f450
https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=d9e193e606e87fc4da445c1aed12113d2ae72151
https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=23c88b95ce6a67eb422ab858e22c90312028b69d

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

