Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA80BD58D69
	for <ath12k@archiver.kernel.org>; Mon, 25 Nov 2024 17:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1O89KSXCH/uZa+Bwp61d8Z5jbBjToKlepvbF4OV0Y2I=; b=QEaTiCFkI1K1dm4zPpMNAVCRHB
	AZ2JLx0J5fWwbwWILWwpj2Y+o6gGDgGZ4KM4C/BbwDW0lWnmRRbcQMHX7yjF0XGtQGykJLOagkLWI
	KX0O9CKU+QwS1UqV56jGWVMa/zVcPYiWt+e04ygo2Lg3WWUep58jwxsn0tAAcSlUBF63wuwqUbjXR
	3kBYnq6M/Bnbbym9ZQsYT1YtSqJRpD5jgW3AvesuWqS89/YU7nbShwy34C53FH8jITJZ6ADV3+fQa
	m32QsW81+2mJvIslaUYVpOOkHHgJAFooFYaucjSfPKl0eaXWvNYnPZ2FCOUDWm7XBbw1xbdX31oTw
	NSxHd/nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFcUs-00000008hNM-2Dbr
	for ath12k@archiver.kernel.org;
	Mon, 25 Nov 2024 17:03:38 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFcUn-00000008hMU-3YbT
	for ath12k@lists.infradead.org;
	Mon, 25 Nov 2024 17:03:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2CAC3A4151A
	for <ath12k@lists.infradead.org>; Mon, 25 Nov 2024 17:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EBAEC4CECE;
	Mon, 25 Nov 2024 17:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732554212;
	bh=qsoPHVJ1FKxqyZ/a4Rvp+6vkLWUialj+oE6B0JEmo3w=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=SfF2vjL/Q4TDl/AWWXaItVc1cKxnOI2swiiN/+A1UdnArlhH2k/2y0UUY7qZzP4ku
	 v/9NL/x+vJFvMp5kNP0l9cRPgI8MciBkyohc7n9o4Kcu5LFj/s6i853AUlX3vRNI7l
	 IHAG+TLsHVATIcdlL8shOTJv+ClKd1t+4I0dtahKJiMpNjA+Y+9q3Vfc2jHxYN+dtT
	 SheEtRcwLQYIV56JewCv20rvIz3n5h6/oz9tCTC9hmTTENhbt1Phi9UYtRuCaEDGX0
	 kFsAeZfp8IGULQj7LZcK3aD6C2No5oDN8+/xD5zo6G525tkXLBEpUi7NJZ/m5ucVQ4
	 4jN+GQpE6rIVQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/8] wifi: ath12k: Add MLO station state change handling
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20241121155806.1862733-2-kvalo@kernel.org>
References: <20241121155806.1862733-2-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <173255421040.2180217.10732984199396676191.kvalo@kernel.org>
Date: Mon, 25 Nov 2024 17:03:31 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_090333_956675_C68F65E6 
X-CRM114-Status: UNSURE (   6.48  )
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

Kalle Valo <kvalo@kernel.org> wrote:

> Add changes to handle multi-link station state change with proper
> link handling and add code changes for ML peer creation, peer deletion.
> 
> In ath12k_mac_assign_link_sta() initialise all arsta fields first and only then
> call rcu_assign_pointer(). This is to make sure that readers don't have access
> to arsta which is still modified.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

8 patches applied to ath-next branch of ath.git, thanks.

8e6f8bc28603 wifi: ath12k: Add MLO station state change handling
a27fa6148dac wifi: ath12k: support change_sta_links() mac80211 op
ea4192553850 wifi: ath12k: add primary link for data path operations
061097e5732d wifi: ath12k: use arsta instead of sta
a0300e6bcfd4 wifi: ath12k: add reo queue lookup table for ML peers
aaac8850a07f wifi: ath12k: modify chanctx iterators for MLO
3952657848c0 wifi: ath12k: Use mac80211 vif's link_conf instead of bss_conf
63fdb90642ee wifi: ath12k: Use mac80211 sta's link_sta instead of deflink

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20241121155806.1862733-2-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
https://docs.kernel.org/process/submitting-patches.html


