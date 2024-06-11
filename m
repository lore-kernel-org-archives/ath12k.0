Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DFCCC27C75
	for <ath12k@archiver.kernel.org>; Tue, 11 Jun 2024 18:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ir2sYHxRHZEgcZNLY50nfhOnAfJmuvU5Fv0+iO1NW9U=; b=v0yVI9oHXoJDeddyHeS/Ja1mqw
	D7whDpObZycf2wYDw6JVLo9sqnnPcMkIc8fylEnQMKAbHuZDdFvNfFOWakXjCyM2mJgfBGwLI36V1
	Wt70TKH97AIOp0FZnSqY1mxW2r2wLgFORb2ET96bIAG4D9Ejw/QpvodAlQE27u1y0aEILy9XmuaR/
	xcguOLUfjG7E03MyyCh+JRO50VbeaOS/EXaCNmMHSGQ9j24B0Z9/fChf7Cgro2Ka86yhq64ximGnu
	ZC3gVH0vTt1M4FtTdh3eLRxAkVNmkYsZRHNJDa4x69oX2GHgQkxTEUODbeDPDgul42H2iasQbLIua
	Qqtc4WIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH6SS-00000009shQ-0kSs
	for ath12k@archiver.kernel.org;
	Tue, 11 Jun 2024 18:43:00 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH6SP-00000009sfx-11QJ
	for ath12k@lists.infradead.org;
	Tue, 11 Jun 2024 18:42:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4BB1ACE1D6E;
	Tue, 11 Jun 2024 18:42:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2ECFC2BD10;
	Tue, 11 Jun 2024 18:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718131374;
	bh=NOoJ/5u2iqT0kvtELbXBuBpqiPxXcNZfz62k2C29M7M=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=W99yVoRvIOhW0SSvSzCt4kFrQZpgg+/xDPE2+wrsh2uW3Isu5MYqs/R0iV/gv6HzI
	 0n+59UFnpXcQDCq8fNxexp24CqsIuASBk00Df2ckUUnavEmtBhD/gXR3Voyx5VGq1H
	 agxF40OYdq9HeQKAKBkJOhHhJuLTj7ksODDdpTvTlfNFEgBkQxEfcaJAAZBPnpR4sw
	 nnPCPHfHw85ksPhqtuAJk434mZrivCrkXV/cGjUBYy5Mh9odyJAv7c+4Kj5c8sDZy9
	 dFc0/tohOiBtPqb2xwwf6WXGk6BZHo3zDtYX939KRTXkjrEHkHZci257dYOWqDbeeY
	 DGzqhvTwtLzgA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: avoid unnecessary MSDU drop in the Rx error
 process
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240604062641.2956288-1-quic_periyasa@quicinc.com>
References: <20240604062641.2956288-1-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171813137163.3564613.14473521688819768834.kvalo@kernel.org>
Date: Tue, 11 Jun 2024 18:42:53 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_114257_516907_52DA02AF 
X-CRM114-Status: UNSURE (   5.49  )
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

> Currently, in the Rx error processing handler, once an MSDU drop is
> detected, the subsequent MSDUs get unintentionally dropped due to the
> previous drop flag being retained across all MSDU processing, leading
> to the discarding of valid MSDUs. To resolve this issue, the drop flag
> should be reset to false before processing each descriptor.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

9e32058ae62f wifi: ath12k: avoid unnecessary MSDU drop in the Rx error process

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240604062641.2956288-1-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


