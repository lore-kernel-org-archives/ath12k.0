Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731B9D6EBFF
	for <ath12k@archiver.kernel.org>; Fri, 29 Nov 2024 11:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWUWG0vQSsRxljMKboNxB0fA1msoKLGlZEph4rrd3Po=; b=hzsqbFjp9sdGtoRjcwYM2toksa
	rOiwRCk7oEyD3HcHVTulR5Eu4FVdbTz15mV244Y5bHFLwS9MH0pQBmWt7pLipIjov2+PKlMICl321
	pyroNQN9ot+lsOoE9PLvCNbZWFUmthjiNPdQP/sUBDc6DkdCb4HzFfZZPJernseUm8L9mRTqSv0mH
	PYTNWmeVflxqDrCuCaKqzE4JpXkavpLf4qSRcGzNmswY1bx6j90GF5KD+9PU6Gi+o6733wsOheKQ7
	u2eicwtCj/bfZpxe0guC2z3HkhE2rYQGdcwo5IjNpGyOiX9QOim1vyTCkitt/sfXnpWYqUCczbkE5
	PyQhoVEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGz0s-0000000HWKN-10G5
	for ath12k@archiver.kernel.org;
	Fri, 29 Nov 2024 11:18:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGz0p-0000000HWIx-2w5x
	for ath12k@lists.infradead.org;
	Fri, 29 Nov 2024 11:18:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 581ACA43E34
	for <ath12k@lists.infradead.org>; Fri, 29 Nov 2024 11:16:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB65C4CECF;
	Fri, 29 Nov 2024 11:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732879094;
	bh=L7FEE3bo3MjpveP8AdFhKLca7ndLKC43nXLD1+RJwD4=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=jrkvyFq2nquwh/lK6hhi3EsqkffOX2v4iKgUgBkX1CCaj8x0gwKXBIP4sPY+EISXi
	 bClmteav4VEI27chnqLv7OkrHtGlDA2sSNKaOcc6+ofoP1qQnUWlisvTk5to4+GO6o
	 299ElkZvKDkLrQzh1zC5bMnc7l3Ef1kwd1jPV6HRH/Wj+7LMIAOgHxBvweAQShwqMt
	 Yali7TO01xbyX+Glq+wr9buigitpn+ntPgqMyzt7b5cWTDfTWviezwnxMoxAeFfA3y
	 rxSqMZ0B6jfL3M2aThKicRQrxWjr5p0Msb5VHOOeN+/xXI7c977XBS6/2pQZ9/8H1D
	 2q8eqSdFbOSqQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 01/10] wifi: ath12k: convert struct
 ath12k::wmi_mgmt_tx_work
 to struct wiphy_work
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20241126171139.2350704-2-kvalo@kernel.org>
References: <20241126171139.2350704-2-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <173287909210.2696951.465159497492949082.kvalo@kernel.org>
Date: Fri, 29 Nov 2024 11:18:13 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_031815_810457_8B52F4D4 
X-CRM114-Status: UNSURE (   6.79  )
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

Kalle Valo <kvalo@kernel.org> wrote:

> To simplify locking for the next patches convert struct
> ath12k::wmi_mgmt_tx_work to use wiphy_work. After this
> ath12k_mgmt_over_wmi_tx_work() is called with wiphy_lock() taken. In
> ath12k_core_suspend() we need to take wiphy_lock() because
> ath12k_mac_wait_tx_complete() requires it.
> 
> Also add lockdep_assert_wiphy() to document when wiphy_lock() is held.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

10 patches applied to ath-next branch of ath.git, thanks.

56dcbf0b5207 wifi: ath12k: convert struct ath12k::wmi_mgmt_tx_work to struct wiphy_work
648a121bafa3 wifi: ath12k: ath12k_mac_op_tx(): MLO support
2197feb0249d wifi: ath12k: ath12k_mac_op_flush(): MLO support
5419ef950da4 wifi: ath12k: ath12k_mac_op_ampdu_action(): MLO support
85edf16384d1 wifi: ath12k: ath12k_mac_station_add(): fix potential rx_stats leak
90570ba4610b wifi: ath12k: do not return invalid link id for scan link
1833a2ce5d7d wifi: ath12k: ath12k_bss_assoc(): MLO support
aa80f12f3bed wifi: ath12k: defer vdev creation for MLO
ad969bc9ee73 wifi: ath12k: ath12k_mac_op_set_key(): fix uninitialized symbol 'ret'
8c2143702d07 wifi: ath12k: ath12k_mac_op_sta_rc_update(): use mac80211 provided link id

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20241126171139.2350704-2-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
https://docs.kernel.org/process/submitting-patches.html


