Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CC8C54E5D
	for <ath12k@archiver.kernel.org>; Mon, 18 Mar 2024 15:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26w2iVr0qheeJyv9zc92pLo8L8015V/Z7iY9Tjxo4qg=; b=4MceQBMDBxkPfcGdKIsoYwEvOX
	bSFENbj9tJn+CXlTTPrXxhy9w2WVI8e6SOP1cQfYdV9GZJqNHbEpd0KH9Nq9SLj5nYxdaO+b9J/v7
	EoksDMHbGW2GRF0oyD5eVqhcPC58RdXezljereBvUSQI2MkZCFhBJCfYs3rwD8IPLRLLXPhUh+7Sx
	EcYO3yPRqZzw50HPp2HQEapim8pFh8QOkKU0IdHG4E8KOnTbytoinLdwXXPt3fyINirjBuHYFbhYT
	I/1K/MJiFX2GgAuHSNJHaOEftKU2gQey/kzHuXfM1lyg2LadYJXBciOB1MI+tLh03StV7sZb9ap/4
	/oMGqRdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmFHK-000000096h4-0Tsa
	for ath12k@archiver.kernel.org;
	Mon, 18 Mar 2024 15:51:58 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmFHG-000000096dz-2FYg
	for ath12k@lists.infradead.org;
	Mon, 18 Mar 2024 15:51:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6FE7FCE0AD8;
	Mon, 18 Mar 2024 15:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC480C43390;
	Mon, 18 Mar 2024 15:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710777111;
	bh=PHnH0COEHNBZDq8Wm4oxYFn87tNlx1Q+VbmW6kLBc80=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=EayC+uecMtkOf0ReVhmrWiOONMG47Y1bclCnITcIIeG+VdC5eFMfDOThKVOR04sNO
	 hT/n+cB0gwB7GvO2YQjMAhhgzjl/Q7LiHZEXnsWrNgqEEJ+8HvbycV3+2/t4EbCFrH
	 Ca1sCtoQb4cWM0XLqWvkZNbjNsnUNc490jipkYsa/VQVb9zqO3v/gGLLZpR1f3/CJy
	 NHM0EudCDxmIyrox4rVDcJ0Y3rrvBvS//lY7yGlPdzS0NgEw96UxNSi5wl2Y+kX6Ug
	 /wvVpnNZ6RAGTuwb9oeoy/RhusMnXz/8apg0jXtKEUEZzDcEMLLcf7PJeT8QQ/xHh+
	 Sx4aSqF8BQRGg==
From: Kalle Valo <kvalo@kernel.org>
To: Aloka Dixit <quic_alokad@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: use correct flag field for 320 MHz
References: <20240314204651.11075-1-quic_alokad@quicinc.com>
Date: Mon, 18 Mar 2024 17:51:49 +0200
In-Reply-To: <20240314204651.11075-1-quic_alokad@quicinc.com> (Aloka Dixit's
	message of "Thu, 14 Mar 2024 13:46:51 -0700")
Message-ID: <87sf0nczca.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_085154_784251_23D63C17 
X-CRM114-Status: UNSURE (   7.25  )
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

Aloka Dixit <quic_alokad@quicinc.com> writes:

> WMI_PEER_EXT_320MHZ (0x2) is defined as an extended flag, replace
> peer_flags by peer_flags_ext while sending peer data.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>
> Fixes: 6734cf9b4cc7 ("wifi: ath12k: peer assoc for 320 MHz")
> Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>

What does this fix from user's point of view? Does it mean that 320 MHz
chanels were broken before and this commit fixes that? I can ammend the
commit message.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

