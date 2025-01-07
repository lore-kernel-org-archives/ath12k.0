Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9202E77197
	for <ath12k@archiver.kernel.org>; Tue,  7 Jan 2025 19:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O30flVnOO3MyXmiU76W+O7vqPojqux+wwgXQee5CXMY=; b=VPGbVf74cN4I1jtjisXkhhJw2G
	0ad+Uevb7bRBKHsWAVvByamebLkTp4dT2U9ndpWenGJTGnP1ZO7xwI8tBsikO9CNDk2j19V2M8ajK
	H23dCaFPTgUPCMvT4YNyvDzEOohQos3Dc1hZiNjl77YA3xOV5GbJo7Aj88KlyPtn+zC9vk69KTbGj
	lJFlsPGH5wU4RKb3h5LJZ5zRjbnzKV8KFyPMZpNVqTm6nhP/BN9TYET3oWr4C8SXq6tLtVKk7wztr
	L9f4HXRDQTFNZnjjjffLHgmvBY6c3f3eLDQgA3qdWqf6+0cpXES1yjOiyRBj122WPOVyOgSLFcoZ6
	I3YT4UNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVFSi-000000069l7-1q9E
	for ath12k@archiver.kernel.org;
	Tue, 07 Jan 2025 19:42:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVFSf-000000069kp-3VJ5
	for ath12k@lists.infradead.org;
	Tue, 07 Jan 2025 19:41:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E9474A41C51;
	Tue,  7 Jan 2025 19:40:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FB93C4CED6;
	Tue,  7 Jan 2025 19:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736278916;
	bh=jfyXnyiwS27l4XHf5wb845dXNP3GsC/zYJpvT8CrZz4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=k689uoA7OPxhYoZw3BW3AZRh0nNnsVI6xdpEcoDHG8PZUVAPTYuYN+wOAv00Gh4+F
	 j003TZOjuCRIDR3gqN3C/VQQvmjpOwdB57hpmY8lGvcd8ClVRqNWVm68nvfPtOHnLI
	 tHF4IlGOUNF0xoguq1Nu2wJc/bEqi78v90RBtfbZYoiWDqmv/9ADEYWM69eoktjpAW
	 BBvMO7CunOf7+epSS7ftjEgRAfomcc0x68GrswtArpqR35ZopcCZWVxpYINHORT1eT
	 rZNo4YkKr0cgGvunso75kANtEYUcbtWUNKoNuLgDhAf9igPvZmlefEMQj9mADL7IVO
	 kZIPZiJkp9VCQ==
From: Kalle Valo <kvalo@kernel.org>
To: Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,
  Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Subject: Re: [PATCH 1/2] wifi: ath12k: Support Transmit Rate Buffer Stats
References: <20241128110949.3672364-1-quic_rdevanat@quicinc.com>
	<20241128110949.3672364-2-quic_rdevanat@quicinc.com>
Date: Tue, 07 Jan 2025 21:41:53 +0200
In-Reply-To: <20241128110949.3672364-2-quic_rdevanat@quicinc.com> (Roopni
	Devanathan's message of "Thu, 28 Nov 2024 16:39:48 +0530")
Message-ID: <87o70ifm2m.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_114157_942715_36EB11CB 
X-CRM114-Status: UNSURE (   6.91  )
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

> From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
>
> Add support to request transmit rate buffer stats from firmware through
> HTT stats type 31. These stats give information such as MCS, NSS and
> bandwidth of transmit and input buffer.
>
> Sample output:
> -------------
> echo 31 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> HTT_STATS_PDEV_TX_RATE_TXBF_STATS:
> Legacy OFDM Rates: 6 Mbps: 0, 9 Mbps: 0, 12 Mbps: 0, 18 Mbps: 0
> 24 Mbps: 0, 36 Mbps: 0, 48 Mbps: 0, 54 Mbps: 0
> tx_ol_mcs =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> tx_ibf_mcs =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> tx_txbf_mcs =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0, 11:0, 12:0, 13:0
> tx_ol_nss =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
> tx_ibf_nss =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
> tx_txbf_nss =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
> tx_ol_bw =  0:0, 1:0, 2:0, 3:0, 4:0
> half_tx_ol_bw =  0:0, 1:0, 2:0, 3:0, 4:0
> quarter_tx_ol_bw =  0:0, 1:0, 2:0, 3:0, 4:0
> tx_ibf_bw =  0:0, 1:0, 2:0, 3:0, 4:0
> half_tx_ibf_bw =  0:0, 1:0, 2:0, 3:0, 4:0
> quarter_tx_ibf_bw =  0:0, 1:0, 2:0, 3:0, 4:0
> tx_txbf_bw =  0:0, 1:0, 2:0, 3:0, 4:0
> half_tx_txbf_bw =  0:0, 1:0, 2:0, 3:0, 4:0
> quarter_tx_txbf_bw =  0:0, 1:0, 2:0, 3:0, 4:0
>
> HTT_STATS_PDEV_TXBF_FLAG_RETURN_STATS:
> TXBF_reason_code_stats: 0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00214-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

