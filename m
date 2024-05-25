Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B59C25B78
	for <ath12k@archiver.kernel.org>; Sat, 25 May 2024 08:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C2C8jyWTykNtDxbG6zfX4W3Gg9pnHS53QTQzxFXrNq8=; b=Y2yW7VtMIMey7hiB6hlWKbLEgY
	DHNvgz9bGLyBE9pYcVsEPTOlU8bIlwt682EBcdfu2+mboQVoX/f+BKjbTYzEZhV8k3bJs9j+iMKJ1
	hx+gMMvgzLNo2+kyZhZULO+i9nL0CBW0QGFkshpdkekqbK3FiSVpgmlUuNXMmWchd5fADEpY2aGbZ
	uGLFMPg6guGiFvlDJPyBDhR0zeF1q/oMCHukHHUpNjYzCC5XA+m5dHEj6VTZqhyC+P+vXIqGsaMhz
	Le4fwB+Y5909GcqlZpmRBeJbcx4oXCcozTL3i9pXARLxiLc99wl81O5GjKQvH+LYM2tJ5pfNoUTAh
	DiYbfa7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAnB8-0000000Aec3-3QKq
	for ath12k@archiver.kernel.org;
	Sat, 25 May 2024 08:55:02 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAnB5-0000000Aeb9-2oj1
	for ath12k@lists.infradead.org;
	Sat, 25 May 2024 08:55:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D0EAFCE0286;
	Sat, 25 May 2024 08:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01C87C3277B;
	Sat, 25 May 2024 08:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716627294;
	bh=Kpixmm+1/z3WzvujAUF+JyjqlGx9bGig4lkBXVLamCM=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=ddZCxgbfeb9hF6fHQfEj/ybs/PsCQRdF28QbkwR/Mb149qxg/cbi7yWjcLYmJRjkZ
	 kLX2oo3r70Xu/uNLl2PLBGIo8fSOPgwtzrpPFqZ0MQv9SLpYLv2T7cLVnmSsPvVaM+
	 dMUJETwnvcCM+jVa1pvhFlf0Fq7rWo0X40YO3OmHHp2yQH75JRieoHMpb0FmNXDWDZ
	 t+QNqNrcYlgyNzctYo9H4FEgN+zar2Q/z5ON4Gv7ef2BZwn70l3zsg/0uAD6dutIA8
	 xFBmj+ZyEcBVJzZnwK9kJWV2oDmUwc6VTKERL4pGMrX9XsSSm+9esMVT+7By3FMYbD
	 dqQevWFon9K9g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] wifi: ath12k: Refactor Rx descriptor CMEM
 configuration
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240516000807.1704913-2-quic_periyasa@quicinc.com>
References: <20240516000807.1704913-2-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171662729107.564311.13966579301897980199.kvalo@kernel.org>
Date: Sat, 25 May 2024 08:54:52 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240525_015500_121126_FEFBB145 
X-CRM114-Status: UNSURE (   7.23  )
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

> Currently, data path Rx descriptor placed in the CMEM memory respective
> to the Rx offset. This Rx descriptor CMEM placement is not meeting the
> requirements to support inter device MLO. In inter device MLO, multiple
> devices participate in a group. The device specific Rx descriptor buffers
> transmit to multiple device REO rings. To distinguish between device
> specific Rx descriptor buffers, the CMEM setup configuration need to
> choose a different placement based on the unique identifier (device index).
> 
> Below are the CMEM configuration placement representation:
> 
> Intra-Device MLO scenario:
> 
>         Device 0                                Device 1
> 
>      +-------------+                         +-------------+
>      |             |                         |             |
>      |     Tx      |                         |     Tx      |
>      |             |                         |             |
>      +-------------+                         +-------------+
>      |             |                         |             |
>      |     Rx      |                         |     Rx      |
>      |             |                         |             |
>      +-------------+                         +-------------+
> 
> Inter-Device MLO scenario:
> 
>         Device 0                                Device 1
> 
>      +-------------+                         +-------------+
>      |             |                         |             |
>      |     Tx      |                         |     Tx      |
>      |             |                         |             |
>      +-------------+                         +-------------+
>      |             |                         |             |
>      |     Rx      |                         |   Reserved  |
>      |  Device 0   |                         |             |
>      |             |                         |             |
>      +-------------+                         +-------------+
>      |             |                         |     Rx      |
>      |   Reserved  |                         |   Device 1  |
>      |             |                         |             |
>      +-------------+                         +-------------+
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 HW2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

4f82a8d5c277 wifi: ath12k: refactor rx descriptor CMEM configuration
35864b62fa12 wifi: ath12k: improve the rx descriptor error information

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240516000807.1704913-2-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


