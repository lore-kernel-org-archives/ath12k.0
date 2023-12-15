Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11412C4332F
	for <ath12k@archiver.kernel.org>; Fri, 15 Dec 2023 15:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ESHRTQA0/wSPSEyXTWqocjA+Ja7aX+T76GdGoh+LD/U=; b=Hkk5grFFlRmrQzXUkb3sb4YYGw
	U5sN9zY7AO7GvTbTzvmkkrNg6f8MgjF7uMjfjdDRFwz73NPJMViBltqf6oyjn1HBed5FID/o7XGID
	GhtuTow96c75M3fiZN4C2aUogI3dNiaRXT90EFsQFbrcZrNU4nSFIhwhqhrlHAifEwXUpw2i2f+T1
	TjCwiWE0nHQNmixAQfnASv5LNz0ZrfvuteFF6rGQFEqE+A9d1E5dbyuoWw8sRulXYLqknBhV9MhW1
	5x0JBS9s2lQDy+Rp1pIIFSY2HQbmBZMna043LFMBrlDl0Se74ieUPptYGS+UExXFdWHGAb1I01Jbs
	iWXtLuWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEAZo-003n2S-2X
	for ath12k@archiver.kernel.org;
	Fri, 15 Dec 2023 15:58:12 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEAZl-003n13-1r
	for ath12k@lists.infradead.org;
	Fri, 15 Dec 2023 15:58:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 94A3CB827DD;
	Fri, 15 Dec 2023 15:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCEDCC433C7;
	Fri, 15 Dec 2023 15:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702655887;
	bh=+SRuaRH9TFJnZpf+5dCEqvsOBgddW5XNqa4kkhWfp5Q=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=DnMuWxHYPQ1SWa74i4dIJR9ddfxawsxak03jSekaF2Pt2+9EqPz5WJdQjQQZ+/Qe4
	 IFQQUINLMnk6k/VnXoYMDFEtNJzAWwoVeUM2TuOURg84QwS5atbe93SScSl6naR0Yz
	 yUwwPmU52mTMECqWm6ujM2WDcUK8HAlfZs5TRBM80oZY9lqD0QwOwj8lv3KmceWKq7
	 BbrP2cYJShUkJYTd1nTTFJNJVSFYCZjC1krW2MVEQ+xFkto6DLLdlkDCscckaYsv/8
	 seWdelRLTGkJvoheAH7CGQS53SEN4T/y3vYkPa/U3VHR4QFNsSER3vWaDgjJpVHWUv
	 LjFKmuS7JGXQg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] Revert "wifi: ath12k: use ATH12K_PCI_IRQ_DP_OFFSET for DP
 IRQ"
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231214053215.2087308-1-quic_periyasa@quicinc.com>
References: <20231214053215.2087308-1-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_kangyang@quicinc.com>,
 "Karthikeyan Periyasamy" <quic_periyasa@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170265588405.1834402.8684389045597196068.kvalo@kernel.org>
Date: Fri, 15 Dec 2023 15:58:05 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_075809_785371_9DB21FFD 
X-CRM114-Status: UNSURE (   7.92  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> wrote:

> This reverts commit 1f1f7d548a00ebe50808cb1f580df9693e194a7c. The commit
> caused bootup failure on QCN9274 hw2.0 platform. Incorrect hardcode DP
> irq offset overwrite the CE irq, which caused the driver to miss the
> mandatory bootup message from the firmware through the CE interrupt. This
> occurs because the CE count differs between platforms. The revert has no
> impact since the original change was based on an incorrect assumption.
> 
> Log:
> 
> ath12k_pci 0000:06:00.0: fw_version 0x1011001d fw_build_timestamp 2022-12-02 01:16 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> ath12k_pci 0000:06:00.0: failed to receive control response completion, polling..
> ath12k_pci 0000:06:00.0: Service connect timeout
> ath12k_pci 0000:06:00.0: failed to connect to HTT: -110
> ath12k_pci 0000:06:00.0: failed to start core: -110
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

e75fda64f0fe Revert "wifi: ath12k: use ATH12K_PCI_IRQ_DP_OFFSET for DP IRQ"

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231214053215.2087308-1-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


