Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1EBE7717D
	for <ath12k@archiver.kernel.org>; Mon,  9 Dec 2024 15:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6uNubuvyVsEvv8G1gC/7oIBEwYbFhsnN2FUti4kTes=; b=AM2afTFlmjh/lItwnNCqBCXJpa
	L9IpfZBesqs/2wlUOYD4wYu7kcuuWqkx3ydrpMYHpo3XYHV5vTb8iqb9SjqHf88oO41DjGypSGglG
	6se6FMKySMmQFcbwKWg/Vx3tv32wriFuHiNj1BSVUpJxTrmHhOpi1HDxt4sZ/30OvZWOUItYcvslX
	VvzGQZuPSXIi/AtZxEv5LlXxGQeaAdJ9ISMls4X6q8qZT5nliCcY3SDsT4J7lJW5lV5cu9ez34NMg
	7Xfcw0AspmnkVjd744qkXLhdBiTix3P8QXfZGsq8+izu38z33O8C67IgmsITkJj4hCY9uhfEJW4nl
	yDj0uMbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKfxE-00000008Qcj-2XXF
	for ath12k@archiver.kernel.org;
	Mon, 09 Dec 2024 15:45:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKfxB-00000008Qba-3Bmq
	for ath12k@lists.infradead.org;
	Mon, 09 Dec 2024 15:45:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 80F61A4177C;
	Mon,  9 Dec 2024 15:43:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07374C4CED1;
	Mon,  9 Dec 2024 15:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733759144;
	bh=BEtGeaVHypoezdbTPZ5vIhGMqwRUde0JQlPRxfPmkTg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=W3pvPSK2vuLBIv5KGIc/OL0H/u6mRwibECnmQGwYhfVDHNcsakXhg2S3dio6fdbst
	 EbLH7v34IMFQSHFdBINSW390AomZj2oSB+Yd0VHpVar5ZosblOMjCalCYBbaVchBlB
	 yQByBCBv62lNYLausBOdawWPEm4kw4iN4o3l3w5AB/PaQoYDi+9bVEiZfaAdybHbKc
	 /mCYdA90ylCt69H2p9Jbba0DLzTXcNB+bLBEjQcEd88cLzn3yAmzyuGomvYFh3rn/g
	 Hb2EepfNSeczp0T6Wol0uZRAIkTKX0f9bQYLjsjUI1NXUUgdp9Zo3ftDBkZy8KgkR3
	 z9AllRYGZ36tg==
From: Kalle Valo <kvalo@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sriram R <quic_srirrama@quicinc.com>,  Jeff Johnson
 <jjohnson@kernel.org>,  Rameshkumar Sundaram <quic_ramess@quicinc.com>,
  linux-wireless@vger.kernel.org,  ath12k@lists.infradead.org,
  linux-kernel@vger.kernel.org,  kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] wifi: ath12k: Off by one in
 ath12k_wmi_process_csa_switch_count_event()
References: <755becb1-819b-484d-8fac-9a2db53ced1b@stanley.mountain>
Date: Mon, 09 Dec 2024 17:45:41 +0200
In-Reply-To: <755becb1-819b-484d-8fac-9a2db53ced1b@stanley.mountain> (Dan
	Carpenter's message of "Fri, 6 Dec 2024 15:52:29 +0300")
Message-ID: <87ed2gsvve.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_074545_861780_9CCAAACA 
X-CRM114-Status: UNSURE (   7.26  )
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

> The ahvif->vif->link_conf[] array has IEEE80211_MLD_MAX_NUM_LINKS elements
> so this should be >= instead of > to avoid an out of bounds access.
>
> Fixes: 3952657848c0 ("wifi: ath12k: Use mac80211 vif's link_conf instead of bss_conf")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

