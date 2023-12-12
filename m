Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31DFC4332F
	for <ath12k@archiver.kernel.org>; Tue, 12 Dec 2023 17:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y1QjbiOMdB6Orm54ZIokYmAOMrXtnnFoV1dQr2iaU8s=; b=J5UhAfcnhRG/tNei0Xt35wuqYe
	2HBZJzeyKZp00bzoC/fGZI3/sLgulS/RUOmMsmqt3i3vmMVHG15bn3gBIRAHdiRO/7Zox/zL1j107
	8Jerihv4vT15K3MCnhwHXpG4HPN2g4ISU01/7z2yeWLvI8vgvjWxXK5boMM9Bifi+3uIXy80kS8+d
	Bumh62ryxKrWGfuvnmXb36ruyUEYcAyzkPp76BRv0b38uDhbLW/+3WHoleHw6Q8p5yhelQ1lX1fRm
	Hf9s8brop6nnnR3pIBjLR36az1j2DLmZ/JFjzjGYVSFMauLE8Tu9lcNikP5F97aQMi6MIS4+F2P35
	075542hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD6eK-00COwk-1j
	for ath12k@archiver.kernel.org;
	Tue, 12 Dec 2023 17:34:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD6eI-00COvw-11
	for ath12k@bombadil.infradead.org;
	Tue, 12 Dec 2023 17:34:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=y1QjbiOMdB6Orm54ZIokYmAOMrXtnnFoV1dQr2iaU8s=; b=R6WCOk5sbD12etxK5NCwAt+E1Q
	WesOL9JrbijkYqpkvCjnNsmIAAabVVxWlC9nsfBGshUR/+bbqysEvycCEaVPeQUKc6nOVogOiBm+s
	qcXqniy2Ef6e29avSCkodc/k2DlHXpg6FOdrTWiixIN+leGv6xqk+iPHm3kJAcUOglU3PN0mb7NY4
	76ffMi+7Y4YmFj33c1a6fAcG0r7Wnb7Zy9hXIpZaeGP7PBhiildpKm5QcSmDCD+KpviJvCbQQar2Y
	NMT+LTmiPgLWfzgpgZKTYLmrDuHzF8Ft0YrU18+OO4+y4n0Jg7bqTgiDN/EF4iOnqxREZqo5M4gDD
	8laFNwGw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD6eD-008nPk-33
	for ath12k@lists.infradead.org;
	Tue, 12 Dec 2023 17:34:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B66CE618CA;
	Tue, 12 Dec 2023 17:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F48C433C7;
	Tue, 12 Dec 2023 17:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702402455;
	bh=yk6/skGYK6YvSbUR9DTx4a8xAsateDiOD9tx7ERd4nQ=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=WYBVRVY1g61Otta5VIkRm5KAu0U3eGsGlKSBeIr10JSJ5wg5V9N0MN8LBKhkPf3Yb
	 IIDGkuEMDxZRsgXqDEdmm/ackG5+kMhcaqZr1GSRwOxc6Wi8jM8VQ7v3ixHUaA0y5d
	 8ausYg5HlF0K5jfaZbHlgQL/DLN0zfSWzjhhM1UMupi30gf0Tz1f9OR5oGD2hGBKLf
	 ziPeKe2MHIaC23jQt37dQkiqpQMEKjqWwlYObtk09lijv37bCIxR9egbYhjh82rPdU
	 WuLysKGGzS1p8SJgbk6vPJCKOla3aWNU7HlpaHWcnxmJkDrVexVwIoBKHedHcn7ymi
	 BsEKTly41MY0A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] wifi: ath12k: fix the issue that the
 multicast/broadcast
 indicator is not read correctly for WCN7850
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231206141759.5430-1-quic_lingbok@quicinc.com>
References: <20231206141759.5430-1-quic_lingbok@quicinc.com>
To: Lingbo Kong <quic_lingbok@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_lingbok@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170240245237.422537.1028242008359125098.kvalo@kernel.org>
Date: Tue, 12 Dec 2023 17:34:14 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_173422_381114_E6D0E96B 
X-CRM114-Status: UNSURE (   6.57  )
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

Lingbo Kong <quic_lingbok@quicinc.com> wrote:

> We observe some packets are discarded in ieee80211_rx_handlers_result
> function for WCN7850. This is because the way to get multicast/broadcast
> indicator with RX_MSDU_END_INFO5_DA_IS_MCBC & info5 is incorrect. It should
> use RX_MSDU_END_INFO13_MCAST_BCAST & info13 to get multicast/broadcast
> indicator.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

7133b072dfbf wifi: ath12k: fix the issue that the multicast/broadcast indicator is not read correctly for WCN7850

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231206141759.5430-1-quic_lingbok@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


