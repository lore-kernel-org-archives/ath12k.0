Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C210C25B10
	for <ath12k@archiver.kernel.org>; Mon, 13 May 2024 14:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cLqrMzonII4sTQq+9Ic25mMo0r8UE1nIkWGmgw3UdbE=; b=ukYcb8v5XCEaN6nh8b0ByFrAbI
	QKGAjtqTh2yAQfvMSIV84jTvhTIgE0sLzUq7GnJQ4o3LLdlI2ezGR5P3JIkabpRZtqwMvs4WH2pfO
	bfEZcAhtERD1vIyOu53Vb1DBqZD4klrPm5WpSRHGkvzrTqa5h0orsVixaUIWK4krAB845jgejV41l
	p8RgFl/qidFSN55bipbQcxw37qdGzFtwjY8zvgPZexvqce0pyXqa+rKsn7Ov8Rp/AFPbd48+xmWiP
	luC7XiN29ReHlVtZb2eYx/JmLZeQIAfO+s67n7qLOm3ttvcMv6JAR2czTp9clg7GXhro2jNcYeWp1
	b65UK+DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6WQn-0000000D8od-0N7y
	for ath12k@archiver.kernel.org;
	Mon, 13 May 2024 14:13:33 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6WQk-0000000D8nR-3BQ5
	for ath12k@lists.infradead.org;
	Mon, 13 May 2024 14:13:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DDF43CE0DFF;
	Mon, 13 May 2024 14:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71C15C113CC;
	Mon, 13 May 2024 14:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715609586;
	bh=k5hs2jo2DPrq9jeuC5BRr/1EQid+vELuPYJpggcc5IQ=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=L1Qq5mYVBoc2UN8qllh8m7QnNxhAHiG7Cg8s1/7TIzQATUIaLh1o1OUvpbldPsQ4g
	 90FPj9leTVU3TVz84LGLh1W046yr3TLFFHgRg/r8LuTsvGCkI/gL7QoXL7kZt2sb/t
	 qzbxIlONTmpwYFRVCYXS4sCM6QQFswiE99TjgCdCo1t7EbLaDUXVoBwPnBUqvA963B
	 AJknkyjHOZVbQePq7lPJFZo33UMPL07Gg2jarhM6PUHSFWyOdvM8LA1ly+YsusMSIy
	 p9947eIwt5/rV503ZhSF6U9bPOq5K5IgnwUizuAi+tNPNROOrkkIJ8UMYp5PFDh/L/
	 hq80FusdIrdVQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: avoid double SW2HW_MACID conversion
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240506173017.597715-1-quic_periyasa@quicinc.com>
References: <20240506173017.597715-1-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171560958344.1690511.4558865719984074214.kvalo@kernel.org>
Date: Mon, 13 May 2024 14:13:05 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_071331_043644_B6024736 
X-CRM114-Status: UNSURE (   8.14  )
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

> Currently, ath12k_wmi_pdev_dma_ring_cfg() fails due to an invalid pdev_id
> parameter passed to the WMI_PDEV_DMA_RING_CFG_REQ_CMDID WMI command. This
> invalid pdev_id is caused by a double conversion of the MAC ID. Since the
> the caller of ath12k_wmi_pdev_dma_ring_cfg() already performs the MAC ID
> conversion, it is unnecessary to do it again within the function. To fix
> this, remove the software (SW) to hardware (HW) MAC ID conversion from
> ath12k_wmi_pdev_dma_ring_cfg() to avoid this redundant conversion.
> 
> Found in code review.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

2db7a82fd150 wifi: ath12k: avoid double SW2HW_MACID conversion

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240506173017.597715-1-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


