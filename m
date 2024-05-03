Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC60DC4345F
	for <ath12k@archiver.kernel.org>; Fri,  3 May 2024 13:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2nqu2FQ5722jTXlNyWUONf2pbFhQB8TkFtTD7OCOeq8=; b=H7BHwRTcrQvOYk3XJL24q3EWvb
	+3LjsL5371fno0PIEj+Ts/M3SGQ0PMHCn1YRR5sbrAJU3QuL8N7jGK41kTbf+sbsJ7QmZsDew7sKs
	jhJOUM8IjT4MABvXVaFD0kHaKWLqGo92jjiAeEvwz9RQb1ZEN7CIbNYE4Jdj6XKqR6g2IUsf+Mt9k
	/REc8N6xD2KRYVLGXjwgSRXnOKtA+tVKEnS7BMJ2ovnQGJFSP5ZMQmLozKTSKvYlJ5/Df5xB3rc/v
	pq4grXrBnqRDTCfbHtukBnPZbwzoLyv+KEp4so1N2Lw5SSVHmE4W7AHpHx9WUXYUT/MmD8DJJmZnN
	+PLyXtwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2srG-0000000Ge4b-1lou
	for ath12k@archiver.kernel.org;
	Fri, 03 May 2024 13:21:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2srE-0000000Ge3K-1DhS
	for ath12k@lists.infradead.org;
	Fri, 03 May 2024 13:21:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7A10361BFB;
	Fri,  3 May 2024 13:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF62C116B1;
	Fri,  3 May 2024 13:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714742507;
	bh=5A+4VMOE5esq7k/mQ4qGrJuFbSYMx+6xtBVixfCxXpQ=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=b9U3vP8rnYJmMMr22HRkOkyFw58eEwGkBktVRbQ+0pjktXhncwH6udbD5laFFKkIe
	 LHPRna5SQz6L4hUYWz11O+IOusZKDypumhS0pt4QRUA5l8X3ud8MfHFobK+9wnNVFo
	 9HFebtg57govGRzZhKu/akIu5WI7gFXKN3B1/yddJ93jIfP1Du+LNEZNKmhqae6Qrj
	 aangT19HnyTd+Ncge9R4Dj8OxyRf1GqH6MaeLHv+YqZ6qu+Pbnkx/mYHpFg3vfCQQs
	 3yBr0dxQ8DINkYNV8j1bREGMFHT9OrroXyMdvtnActXw5DCgxqUhxWa31khFzS6Xag
	 TrKDe6EJ1ZL0g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 1/2] wifi: ath12k: Don't drop tx_status in failure case
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240430074313.885807-2-quic_kathirve@quicinc.com>
References: <20240430074313.885807-2-quic_kathirve@quicinc.com>
To: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Sven Eckelmann <sven@narfation.org>,
 Sarika Sharma <quic_sarishar@quicinc.com>, Karthikeyan Kathirvel
	<quic_kathirve@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171474250421.1512332.1102670293581552421.kvalo@kernel.org>
Date: Fri,  3 May 2024 13:21:45 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_062148_433523_31A58BD6 
X-CRM114-Status: GOOD (  13.57  )
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

Karthikeyan Kathirvel <quic_kathirve@quicinc.com> wrote:

> When a station idles for a long time, hostapd will try to send
> a QoS Null frame to the station as "poll". NL80211_CMD_PROBE_CLIENT
> is used for this purpose.
> And the skb will be added to ack_status_frame - waiting for a
> completion via ieee80211_report_ack_skb().
> 
> But when the peer was already removed before the tx_complete arrives,
> the peer will be missing. And when using dev_kfree_skb_any (instead
> of going through mac80211), the entry will stay inside
> ack_status_frames thus not clean up related information in its
> internal data structures. This IDR will therefore run full after
> 8K request were generated for such clients.
> At this point, the access point will then just stall and not allow
> any new clients because idr_alloc() for ack_status_frame will fail.
> 
> ieee80211_free_txskb() on the other hand will (when required) call
> ieee80211_report_ack_skb() and make sure that (when required) remove
> the entry from the ack_status_frame and clean up related
> information in its internal data structures.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Sven Eckelmann <sven@narfation.org>
> Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>
> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
> Link: https://lore.kernel.org/r/20230802-ath11k-ack_status_leak-v2-1-c0af729d6229@narfation.org
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

5453bbd6fef4 wifi: ath12k: Don't drop tx_status in failure case
50971dc6694c wifi: ath12k: drop failed transmitted frames from metric calculation.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240430074313.885807-2-quic_kathirve@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


