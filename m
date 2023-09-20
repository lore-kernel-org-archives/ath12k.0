Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBB0CE79D0
	for <ath12k@archiver.kernel.org>; Wed, 20 Sep 2023 13:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Biq7V7ugpmxLn8ZHAJ9ScbSDGqn+JzwAgpbj8+mVOKc=; b=ZTBcgIEqmSZedh
	SwSfzk0zWEP3jcfH18mxIg7jtZ3YPYrmHGUDrRqnyxnHtaymEchD9TzBh5Bt2GOmF9tyUAkjFOKhL
	aB6z+x2bH1Yl+HmfC+q+tYI9+XL1GHrUqsNzHeSjJLXDeecOSHnbnQGN1UamcT8+e5B6vyxg0degP
	k5PzEQ8BPn2jjivAHGV06dDNwv25GdxPLgJJ07Dr7QdJo20Yp8srRNYxa4xufDHSgvp9KtQexqN4W
	59DKkMVRt//ir2ts5GFdT2iRlWcIfDgQaVG/rakJoKsdg6JWpRU6D3jvAB0tAPJpIXHEybqVD91HT
	/pLzINAAHruIWC1j8Pcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qixQH-003Cjo-0J
	for ath12k@archiver.kernel.org;
	Wed, 20 Sep 2023 13:39:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qixQE-003CjI-1t
	for ath12k@lists.infradead.org;
	Wed, 20 Sep 2023 13:39:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DBE0D61C47;
	Wed, 20 Sep 2023 13:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C0C8C433C8;
	Wed, 20 Sep 2023 13:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695217157;
	bh=M6RshhLbzetmH2nFUPQwMg7KWrCKQHdVfZRtDrFUBls=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=WsO99o8RA9Ht0g10U0Axlr1P1a9/idNH2bFt1j6UV3rP08ehvcNqaJqbBZYDVntEv
	 sVZ0//QN5mW4nuK8M2X3yiYOOi2P+I0+BoEh/Uu9TCkht5ZQOHlNJl2s8hh9AnW0n6
	 XAAgPRBsUs6T66m7iFjndk7qT48eFd4Cz2qkIm6M0oGkVYhUOlTglfLQ5hqt2OnbD3
	 ZaOxmcPG2CLMf88NfyMZDsbS8A5I0DJVs25ZPTIkn2kynBb07NmQfrtJ2oYQDc4qPh
	 A8wgZyYws2eg3YWVTQYH7t+KH8cKFT++mu2jAzPaLp5/ynzzWepwe74bQEEfDYyhU4
	 L3qXUfeuk3aMA==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: add chip id board name while searching
 board-2.bin for WCN6855
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230830060226.18664-1-quic_wgong@quicinc.com>
References: <20230830060226.18664-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169521715461.1118199.17273674544092350994.kvalo@kernel.org>
Date: Wed, 20 Sep 2023 13:39:16 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_063918_663278_528FF7AB 
X-CRM114-Status: UNSURE (   7.68  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Wen Gong <quic_wgong@quicinc.com> wrote:

> Sometimes board-2.bin does not have the board data which matched the
> parameters such as bus type, vendor, device, subsystem-vendor,
> subsystem-device, qmi-chip-id and qmi-board-id, then wlan will load fail.
> 
> Hence add another type which only matches the bus type and qmi-chip-id,
> then the ratio of missing board data reduced.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

1133af5aea58 wifi: ath11k: add chip id board name while searching board-2.bin for WCN6855

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230830060226.18664-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
