Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE26EB64DC
	for <ath12k@archiver.kernel.org>; Thu, 15 Jun 2023 11:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W8JfNCfkrhuluGZdjQyTYn8RssF3AnO5IBy9kcRfZQY=; b=1npx1T6f3bdJCK
	6IL3EbgdrSUDUGFdpRzukSkbt/Nw/qfK+5lO/NtnP0jd7mO/gKtpEscwdEn2BAH0KkH2pxEVdYDk2
	yQgQduO629UjiPXSQZpMzMPfIwmZzmi4ikxImzpnoEpwdsl0Uz3Am7nTwdAqCYGFCDGAeGebu3tJd
	kCctdDWdz5nf1d/z6IKVbBahEhaNPmYuZSy9mX9EasIw0xf3JdEyrtBEIdTqEC+gb+EtbxHdsk6aL
	K0qEMjMCGqg0sBFES8/QVRrpIQsHyBFiHdxhzeVMpBz1dszJDeGOyP2//rRQBqT7eWlQ2m81XtDhI
	nTLchPF5TjrpIiABRxUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9lGd-00EiT0-2I
	for ath12k@archiver.kernel.org;
	Thu, 15 Jun 2023 11:35:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9lGa-00EiSY-2N
	for ath12k@lists.infradead.org;
	Thu, 15 Jun 2023 11:35:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1F4C462679;
	Thu, 15 Jun 2023 11:35:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9735AC433C0;
	Thu, 15 Jun 2023 11:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686828951;
	bh=HRKs8EDAMspjkc4t+uSo5TJHix7Rge5uKAkGMWz4HuM=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=TtpHxPUX/FT1K6E8TAqgXlrquSrQWTe7UjZkbStkfBNjBK54jy9Dq91tOMX0ZurWq
	 zg8Q9iQ6WjoxQnftPEJx0gtUeeKKN004PJrdO2V3v6F2PRXBHa7CCO5yd4A/SvL1LH
	 35Aj9aLy1R3cdBCRfF6oggdybHQ3YfPDGiGToRqd9wqTH3fWQoRoaxiWefcn3SilHF
	 15FbPFChl4BFFqQr9L55+NRQlQ3SgQNr8AQOQGWdFp1rfGry75lX1uJji5IEYvzc87
	 2bKdJ8VxRByT2BA6aJH0x9kgeV3mUwioUDowi1NvfZbLMdmxlYmBEbcCKvC4rV3KYR
	 cyZCV6YZcY1sA==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: fix conf_mutex in
 ath12k_mac_op_unassign_vif_chanctx()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230608104444.3134-1-quic_wgong@quicinc.com>
References: <20230608104444.3134-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168682894712.15751.14642356726851590142.kvalo@kernel.org>
Date: Thu, 15 Jun 2023 11:35:50 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_043552_833180_EE9FDB2A 
X-CRM114-Status: UNSURE (   7.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Wen Gong <quic_wgong@quicinc.com> wrote:

> "mutex_unlock(&ar->conf_mutex);" is always called at end of function
> ath12k_mac_op_unassign_vif_chanctx(), so delete this unlock to make
> sure lock/unlock is paired.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

3a5d50f8eb4f wifi: ath12k: fix conf_mutex in ath12k_mac_op_unassign_vif_chanctx()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230608104444.3134-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
