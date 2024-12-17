Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6A4E7718A
	for <ath12k@archiver.kernel.org>; Tue, 17 Dec 2024 19:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4LdeWBYq1aSGb7t4NSVQ7+AN129mw+BS+zz2tnYtWWg=; b=cibOKzs0RLpWEQ0HIRFSUr68Tp
	kiHoZkSFr1bEkYM9fAdK5xF++hN/bVR3yBUE+sz/WCR3Yzz9pB4xvI7FuI/eMqfYpajR3ZQVGZ6mP
	ld5tQqmnKlbhJnSpEnSShernDjtBB97jB0V93eVYV1KKjPSZff22F/U/gqigVBY2JqoH4Ct6Yw9A+
	/ZBJICZNLGK0TYuaUkgcAQFd31hQhou2/ufFaLgTQV7LMr3VwuM4V873VJkzkos0ugubE9WQ7KtdP
	xGbtEzNhMuDBMEWlnw2XjKO7fQI9OygkTwjoJzVQL3lMLI6qKsGWoDtmE+1ac6bGXKJqLH3Z4AUZi
	HJnB3i+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdYC-0000000Eft5-198U
	for ath12k@archiver.kernel.org;
	Tue, 17 Dec 2024 19:48:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdXe-0000000Efmh-1Sji
	for ath12k@lists.infradead.org;
	Tue, 17 Dec 2024 19:47:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D33C5A40FCF;
	Tue, 17 Dec 2024 19:45:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37B71C4CED7;
	Tue, 17 Dec 2024 19:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734464857;
	bh=qPPXG721ckxWX7mEwf8d3wbkYKZ2GRX3q0EiH53PbJ8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Wid4Bg8H8Km0YwGC7G27quHTDgWpzHo3HUCM1ZR4eI5QLFsIZmRUQ7PJxUma0q0U+
	 9AQSCjFsotsBjcgwMI7Q2WhHD9FdhLrnrHgJarIPbiZMAh9PyeUKknLTjnVqNcllBT
	 N1ADdLbHQj2nTMMqIwJ3pfJFpm1JO/9Y2ELMtZeBZsP0wciKMAe2jTTin9X5VA1zHs
	 8eieWMh5521zZ6lLMFl7AWTqNdtc+OyfZgA/FIjUIed6r3kicnbB27KBF9wFnBQuc3
	 kMm/RpXULmoBabFueu7WkQaRKAa93LDIOPbqzjO+aW02P6y0wseF3XtAFFy4dGVqd5
	 029rOVJOPK59g==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Jeff
 Johnson <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH v3 3/8] wifi: ath12k: cleanup Rx peer statistics structure
References: <20241217084511.2981515-1-quic_periyasa@quicinc.com>
	<20241217084511.2981515-4-quic_periyasa@quicinc.com>
Date: Tue, 17 Dec 2024 21:47:34 +0200
In-Reply-To: <20241217084511.2981515-4-quic_periyasa@quicinc.com> (Karthikeyan
	Periyasamy's message of "Tue, 17 Dec 2024 14:15:06 +0530")
Message-ID: <874j32ks6h.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_114738_446607_5F5AB7F3 
X-CRM114-Status: UNSURE (   5.23  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:

> Currently, unused fields are present in the Rx peer statistics
> structure. These fields are already present in the same structure
> under the ath12k_rx_peer_rate_stats container structure. Therefore,
> remove the unused fields from the Rx peer statistics structure.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

