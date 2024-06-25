Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386FAC3064D
	for <ath12k@archiver.kernel.org>; Tue, 25 Jun 2024 15:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3Dtt8OALJCGGcrdOt4ccqNWWixtdIR0kqxLyPu5ftM=; b=K4rZZoSf3kNz1WHkze8HVXGl+k
	MMhuYIjC313HSI0MB+FJglRQoizt4K/jJamx4zdcvcP0EpbbC5+PZeLw1phbcwE5PYlo3Z3gkcguL
	sdKXLYUbgRvM8khhva/9V+WDKcrhlLtNqZBcxJ0hJy1XLP0+zKvIPAORuSOGmQTuz1mLqCkOJc7Cj
	8NQsjqVBLOF/+DBuwH5mMAoT7XCjM0AVB4VEV3a2I3FyXhLYqZYPAkpHe9EMtUkr4V3IkV9Y9yvHY
	M2h3KLRH5nXjjHI0MqwHfDzwMtFzhQUM65kJcfwZsWi2N6Kg0U+4e/t5RXsvfABoUp8HLFmip4aCc
	IZ/48m8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM8Ug-00000003bwA-3zEN
	for ath12k@archiver.kernel.org;
	Tue, 25 Jun 2024 15:54:06 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM8Ue-00000003bvD-0xBn
	for ath12k@lists.infradead.org;
	Tue, 25 Jun 2024 15:54:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 51180CE0C70;
	Tue, 25 Jun 2024 15:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3EDCC32786;
	Tue, 25 Jun 2024 15:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719330841;
	bh=MM9rEZjt1n3fUQ17F0SoJjGbm5zXc4odPQRTmAJEi/8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=mxptkDUGmtZ18r2xS28etP7Nl/GfLhsLMaHpdqE3gLZra3+NFPRvo1xcI4SphOj6o
	 rXE8fBpNY65G2DMwJKDwWQDQiY1EZbxHM8BjX0pCeyjlEUwrswy2reS19ltYbGxHdW
	 zVUCzdxJXoje5WdDCtWT5Es359sjO64jT5uj63C/KwVRY0kcU7TNNY55oCoFGnPDgk
	 uZ1xtvKqG0biKUCpGfHNW6iL/zJT1dKUoNWu5yUF8MDZR6aBg4RIgGjEGLe7puXvAW
	 hg1qPMG8qdEd5L1IeNYC5c2fPryeaHVL6wp8IysTieGtVUnuz2k9JcsanrHSKmCp96
	 vHO/eOc/3ja8g==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: fix peer metadata parsing
References: <20240624145418.2043461-1-quic_periyasa@quicinc.com>
Date: Tue, 25 Jun 2024 18:53:58 +0300
In-Reply-To: <20240624145418.2043461-1-quic_periyasa@quicinc.com> (Karthikeyan
	Periyasamy's message of "Mon, 24 Jun 2024 20:24:18 +0530")
Message-ID: <87frt1hvc9.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_085404_462930_8C58FF72 
X-CRM114-Status: GOOD (  10.55  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:

> Currently, the Rx data path only supports parsing peer metadata of version
> zero. However, the QCN9274 platform configures the peer metadata version
> as V1B. When V1B peer metadata is parsed using the version zero logic,
> invalid data is populated, causing valid packets to be dropped. To address
> this issue, refactor the peer metadata version and add the version based
> parsing to populate the data from peer metadata correctly.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>
> Fixes: 287033810990 ("wifi: ath12k: add support for peer meta data version")
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

[...]

> +static u16 ath12k_dp_rx_get_peer_id(enum ath12k_peer_metadata_version ver,
> +				    __le32 peer_metadata)
> +{
> +	switch (ver) {
> +	default:
> +		WARN_ON(1);
> +		fallthrough;

I'm a bit wary of using WARN_ON() in data path, so in the pending branch
I changed this to ath12k_warn():

	default:
		ath12k_warn(ab, "Unknown peer metadata version: %d", ver);
		fallthrough;

The benefit is also that now we print the unknown value. Would this
work?

Please check:

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=0228ca402186a123e5c90187f952121de50bf64f

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

