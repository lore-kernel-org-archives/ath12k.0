Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64173C4167B
	for <ath12k@archiver.kernel.org>; Tue,  5 Dec 2023 15:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qh4M/HaWRgVz9cqERXkCTW97SfYibLK7II5oA1mLzIE=; b=dFgff4O3UtxVBOxlb+pZQz+uNS
	ldyyER0Lmy0+IOvf6QbWJ36HvpslNBMM1N2g2D3cPBfH7vmhe63ZC6/3o3C7nCajV9mobKIZU9HKi
	kCdfuCZp7AO+ACRAbStAjovxJCJjQLKdLRcbaWvlaPN+uc60jC+2AQiNegVRXm1/imInIdHtINp0W
	HnH0fTdmw2AA7wwi33oaPHvQhFyqiJp3MAFreBCdJMMcm4WlwvcWS6V9pfcWGlEaJTNDaFGt+i0S1
	8rgsoVhU/Uz6csE1MALfbcZafLyVwGMRAaftAyOQl9JL3ivI2nWIMkxJl7m08GKeV4QE91MKah1qo
	dvFTVOgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAWzv-007g4o-0R
	for ath12k@archiver.kernel.org;
	Tue, 05 Dec 2023 15:06:07 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAWzr-007g3n-0I
	for ath12k@lists.infradead.org;
	Tue, 05 Dec 2023 15:06:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 76FD7B81A97;
	Tue,  5 Dec 2023 15:06:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 708B4C433C8;
	Tue,  5 Dec 2023 15:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701788760;
	bh=6XNlK8LiAolYKHBxWx4NVArki/Uu6MojnCM41SR+luI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=ayT6Ffhpsc7mLa0pDG9oXhR7w6GsqIM5JnJhmeFABlRsvjvkRGRe/LVdF1lcVYYd/
	 qW9b8F4uHVvMlqmGNl7DusWF7fmW2XeTW61mMSePnHf6HvN61npRXFJh7gPAvj/8MF
	 i4JNSRkvGY5YvdWTzdKnpXE5QpjjhacaTbER+vUCB9fceYR1uiYd9zqqZru9aYFHru
	 Fl8lzKY8ewUnwexb9+Z5spdEi1IOXgQu/rDdc7iB+cK7U0k3RU7SPZ4txn4iUSh6ru
	 S7h4O53MlrzLPjgAuqEsFFx8MTLT9mGRJ/B6khv/V3aMr+OpFju3F13MH28P97IQ5i
	 ccke1p0W2pLcQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/7] wifi: ath12k: get msi_data again after request_irq
 is
 called
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231121021304.12966-2-quic_kangyang@quicinc.com>
References: <20231121021304.12966-2-quic_kangyang@quicinc.com>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_kangyang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170178875768.2413512.746840226279919618.kvalo@kernel.org>
Date: Tue,  5 Dec 2023 15:05:59 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_070603_286121_59613A76 
X-CRM114-Status: GOOD (  12.84  )
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

Kang Yang <quic_kangyang@quicinc.com> wrote:

> The reservation mode of interrupts in kernel assigns a dummy vector
> when the interrupt is allocated and assigns a real vector when the
> request_irq is called. The reservation mode helps to ease vector
> pressure when devices with a large amount of queues/interrupts are
> initialized, but only a minimal subset of those queues/interrupts
> is actually used.
> 
> So on reservation mode, the msi_data may change after request_irq is
> called, then it will lead to spurious interrupt. But when VT-d in
> BIOS is enabled and ath12k can get 32 MSI vectors, ath12k always get
> the same msi_data before and after request_irq.
> 
> So in case of one MSI vector, ath12k need read msi_data again after
> request_irq is called, and then the correct msi_data is programmed
> into WCN7850 hardware components.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

7 patches applied to ath-next branch of ath.git, thanks.

1b66601d1416 wifi: ath12k: get msi_data again after request_irq is called
604308a34487 wifi: ath12k: add CE and ext IRQ flag to indicate irq_handler
1f1f7d548a00 wifi: ath12k: use ATH12K_PCI_IRQ_DP_OFFSET for DP IRQ
6711b2a80b9a wifi: ath12k: refactor multiple MSI vector implementation
8398654398c2 wifi: ath12k: add support one MSI vector
08d52ba29678 wifi: ath12k: do not restore ASPM in case of single MSI vector
a3012f206d07 wifi: ath12k: set IRQ affinity to CPU0 in case of one MSI vector

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231121021304.12966-2-quic_kangyang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


