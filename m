Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FC8C25B78
	for <ath12k@archiver.kernel.org>; Sat, 25 May 2024 08:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kz+oHWNkn7i9uIrR5GkovhRE75vmaLEKpmkVsdKMXmM=; b=gFs4kYexew/sEYxCsNPSQqFheg
	FNrXn5MDJhfav/qWNZt0fo5+Y6otY9rTUn3b5dho2edIRTXbTPue7p6xeguyekxb/5JRJTZOjZixy
	mWzKnAcjsZsYn/5d2lBeOhW92FmztFzDYNwTG4xiQWtgfl/xZsrUQ6XT2GOWP7/UNKbbFkKar5o29
	/Ki76kAhr27LzPro7UBsJOEZeqG1du9SyyXzCII0SRbkWiUodZlS8NHE3szFfbiWDTMdhlAqo4cui
	bAU1BAfrXaCTazLTtq9D03n4Jl2lNIWfasBtL82ExT8AeKbVC5al2YybENf5VR7X+sfCsTxtM2nXj
	GZMYvqIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAnDP-0000000AemW-2Zpo
	for ath12k@archiver.kernel.org;
	Sat, 25 May 2024 08:57:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAnDM-0000000Aem0-1ulN
	for ath12k@lists.infradead.org;
	Sat, 25 May 2024 08:57:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D58B362C53;
	Sat, 25 May 2024 08:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62CE2C3277B;
	Sat, 25 May 2024 08:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716627432;
	bh=Gcf1PjpBNuOzGLzYpXk2kfrm5iEDnDTK2iAiTuh3WLY=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=jiU7u94714TOa0PNEufE937WeRvVjltb8xRYkGs5xyqRrDBi6btp3el2yK1zYXDPM
	 C0Vvl3mRK8uJPzmlL7S+oDJgP6bW+IXLPtSrw9FhocCIgmbXvrX3Z8MLxKyuzJaoK1
	 58w7seCUU0NdMxd9BIbkHILs5e4JQBRFOTwutMcau3OAKE8I3K6dvx5ck87pZ47n+2
	 aE+uUpO8izPjd448Phc1ppUvp9u/m6zl+8EAfgg2LzyjYM54trb3kLFCAlsPVuLW4h
	 IWxF38bBluy7NFcBsBh9iGDOdl2kwG44UOut5amQvM6A2Oneg73EesUbCCnvQa70uv
	 G6O0b4VnEQqzQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/3] wifi: ath12k: change DMA direction while mapping
 reinjected packets
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240520070045.631029-2-quic_ppranees@quicinc.com>
References: <20240520070045.631029-2-quic_ppranees@quicinc.com>
To: P Praneesh <quic_ppranees@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 P Praneesh <quic_ppranees@quicinc.com>,
 Baochen Qiang <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171662742964.564311.15908765736182779932.kvalo@kernel.org>
Date: Sat, 25 May 2024 08:57:11 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240525_015720_567618_65285494 
X-CRM114-Status: UNSURE (   7.59  )
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

P Praneesh <quic_ppranees@quicinc.com> wrote:

> For fragmented packets, ath12k reassembles each fragment as a normal
> packet and then reinjects it into HW ring. In this case, the DMA
> direction should be DMA_TO_DEVICE, not DMA_FROM_DEVICE. Otherwise,
> an invalid payload may be reinjected into the HW and
> subsequently delivered to the host.
> 
> Given that arbitrary memory can be allocated to the skb buffer,
> knowledge about the data contained in the reinjected buffer is lacking.
> Consequently, there’s a risk of private information being leaked.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00209-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Co-developed-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

3 patches applied to ath-next branch of ath.git, thanks.

33322e3ef074 wifi: ath12k: change DMA direction while mapping reinjected packets
073f9f249eec wifi: ath12k: fix invalid memory access while processing fragmented packets
a57ab7cced45 wifi: ath12k: fix firmware crash during reo reinject

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240520070045.631029-2-quic_ppranees@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


