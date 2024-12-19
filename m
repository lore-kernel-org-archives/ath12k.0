Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDDDE77184
	for <ath12k@archiver.kernel.org>; Thu, 19 Dec 2024 13:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FjU/cc0oaK2MlJpjFmrm1AvCpvqSP0dx5+w8ExGblQ8=; b=4jtsWZ8qLI0taeQQP9d9vTEqgP
	zmAc47bzeBOlBMpb04ViT48nzYyQh1scQmyqdUTW4gr6NinciZGjAw63XHQyl7Jf93AbboANmiW9r
	KKwIReqQM+vIWNafkkA6Ecynv9kA54R6ulmwAWexF7rqWusJVDGyJeL1zw+TCBaJ2d74K+M3Idq4O
	3R2kKxjUKTjWwRC8rK+u7aBlMvtvcDXyKrY+upimMwW0Q/LOE/sDBpgQoUtmUY3pjTSsViMkIk6lj
	VItowcs8b6KSi20Z9xVv30C/xeTm/nGTpo3WGihF1QmyjtN0als5ZN2wR5hVhjxP7TUb9arjAL4KK
	rPAnOASQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGW5-00000001vjc-1ewB
	for ath12k@archiver.kernel.org;
	Thu, 19 Dec 2024 13:24:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOGW3-00000001vjG-12NA
	for ath12k@lists.infradead.org;
	Thu, 19 Dec 2024 13:24:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9337B5C0116;
	Thu, 19 Dec 2024 13:23:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91C65C4CECE;
	Thu, 19 Dec 2024 13:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734614674;
	bh=695XyT9HylzgQMl6LI188n8hrO1dbwChaw9J5Kqj0O0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=AlmTkVIGJZETCPhFWfBn+VwQ0mb7Sc0/7p3cJH1rL8OJS7NDzMuV9pRtUmaSvqS8G
	 621Nnttui8+7IR6PD6uOZDCcMNLHDQ/NYZtwVRAIRS6GRROQcIcOvSOcntbRwnVwqY
	 PnZASxL7tnv2cQvONI2kEMCFbHzhldT11m6QEL1Ho5r3zsEuspExpNArQF17dWLOKI
	 Lo6x7MPSpX1kIUTBPAKuxls5v8CI0mHj5JdZbh6VMb4WFDulrSDy167LNer8ftoFyu
	 syhF2gGR7k4IyBRgutAt2Ku8UveQOnaE7r81uBnli62Hx9l8PAFCnJDgDuzKkbmc69
	 8zIW406jbnyOw==
From: Kalle Valo <kvalo@kernel.org>
To: Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v5 1/2] wifi: ath12k: Support AST Entry Stats
References: <20241218035711.2573584-1-quic_rdevanat@quicinc.com>
	<20241218035711.2573584-2-quic_rdevanat@quicinc.com>
Date: Thu, 19 Dec 2024 15:24:31 +0200
In-Reply-To: <20241218035711.2573584-2-quic_rdevanat@quicinc.com> (Roopni
	Devanathan's message of "Wed, 18 Dec 2024 09:27:10 +0530")
Message-ID: <87msgrhkkw.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_052435_324956_74D66C8E 
X-CRM114-Status: UNSURE (   6.83  )
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

Roopni Devanathan <quic_rdevanat@quicinc.com> writes:

> Add support to request Address Search Table(AST) entries stats
> from firmware through HTT stats type 41. These stats give AST entries
> related information such as software peer id, MAC address, pdev id,
> vdev, id, next hop, etc.
>
> Sample output:
> -------------
> echo 41 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> HTT_AST_ENTRY_TLV:
> ast_index = 10
> mac_addr = 00:00:00:01:00:00
> sw_peer_id = 0
> pdev_id = 3
> vdev_id = 255
> next_hop = 0
> mcast = 0
> monitor_direct = 0
> mesh_sta = 0
> mec = 0
> intra_bss = 0
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

