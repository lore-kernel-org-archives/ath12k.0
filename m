Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C91CC0015E
	for <ath12k@archiver.kernel.org>; Thu,  3 Aug 2023 10:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3bf7MgdhhCUbFoQHsOzbwCRV+DqgrwruoODfi4+NwcM=; b=TMOfyR8SlCQnZ9
	gPcYkIiSYbPUU3oGElSrK9TP1M+sVwed6T2Z2rA2RBtg3FEt4zlLbfsB7RO3Fv4hYxtHvP28ef2xq
	fCFvAnUw4F5eWHSIGGLW9Cc09BLY5BfAJzoPY2POz7MznbnifzpAHLo9aR7AMQ7gf/RTluoWjj4ms
	yuYNQ0ebnYIcAOiwXm5NvPIsp3KMBoN6IaXDp+Wn0wmNjU4Q0spTh07IhnYIY1O/rzgkV81a+vphT
	znFLUDSwnn6Gz5O535AlDjk/Q83NfQAO9O2hvFOhMwfNYIZzq9uiL13pYnBCGdLCW6EZq5Wr/DrWy
	1Fpvjlal1u5lUQeW9JTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRVN4-007KH8-2y
	for ath12k@archiver.kernel.org;
	Thu, 03 Aug 2023 10:15:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUNp-0078dv-37
	for ath12k@bombadil.infradead.org;
	Thu, 03 Aug 2023 09:12:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pl860D1LgfTf3t0mAX5dvtTIq/38f4Ra6m61b68FZvU=; b=g6nDjXxzEKtaDDIW1Ip4tr//Oz
	f5Tb6PLMpay8rz2wy2qGrKUap04CCnrQqN/BJeD6c2Y2ctuSO4hELiw6fvZTZBgHuv3/N3vznDLN/
	a+4H0ve20yAG11RQLIb53WOIOQpunQj/idN8lIFR7mdzW5+mLdBzY0ueawd3aKx/eV9Ry8OzATz+G
	JhKzLSq/VbWfxey6X0FMHVl/uEsQp4AtyR+yjyTO1kLUt44W3FE5Jit80Y6kJng3nrqS3R7HfCOaw
	LgBzjkz7Ob/kQTVMuQVAiVxNuSDwd+F8YkMXuzunEBLAzwxOaL5NodOJhlvyFBuE11T6j7OnGTm1j
	bps/9YzQ==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUNm-00Gi4i-2r
	for ath12k@lists.infradead.org;
	Thu, 03 Aug 2023 09:12:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D7E2E61CD9;
	Thu,  3 Aug 2023 09:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59997C433C7;
	Thu,  3 Aug 2023 09:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691053949;
	bh=qw2vBVs61mUR4qNIQQoaQ7yqtAZW3+ItPnYXuXFJZvs=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=PDRd9HkzJJkezc3ySwrhNP/5SuoSYA7l56vVOchoKqXxiW/whJ9HM9q27iQacOXJX
	 EjfsEjOMJ02nakpJaopt5DvIySLArA0vglFbZaew02rFT4OIH758A3aHXcOT6DZb6c
	 oYQLsZMwO7uDOif1C8Z4tG9fc28A8392ADAvClZx3mHNvpRvHGeVMhPLzSHEPOF8nZ
	 AZWCToL8L0PvjNXYOSM11OzOkDtEshi3TYf0uQ8xgKuvKApM2r+tZJam4uV2QLDaqy
	 31306VcrXI9sBUuT7SMXTchwWqR0cTUwuh9GGGwV4p12xQCP4c3QufkzYkE7IJoMmk
	 TfB1VRYYbrSXg==
MIME-Version: 1.0
Subject: Re: [PATCH v5 01/11] wifi: ath12k: rename HE capabilities setup/copy
 functions
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230725224034.14045-2-quic_alokad@quicinc.com>
References: <20230725224034.14045-2-quic_alokad@quicinc.com>
To: Aloka Dixit <quic_alokad@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Aloka Dixit <quic_alokad@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169105394648.894438.12789099943827737318.kvalo@kernel.org>
Date: Thu,  3 Aug 2023 09:12:28 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_101235_102665_9AC9D0CF 
X-CRM114-Status: UNSURE (   9.45  )
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

Aloka Dixit <quic_alokad@quicinc.com> wrote:

> Functions ath12k_mac_setup_he_cap() and ath12k_mac_copy_he_cap()
> propagate HE and 6GHz capabilities to the userspace using an instance
> of struct ieee80211_sband_iftype_data. This structure now has a new
> member 'eht_cap' to include EHT capabilities as well.
> Rename the above mentioned functions to indicate that their use is not
> limited to HE.
> 
> Also, replace the local variable 'band' with 'sband' and reuse
> 'band' for the type enum nl80211_band.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

11 patches applied to ath-next branch of ath.git, thanks.

e22f5b780c69 wifi: ath12k: rename HE capabilities setup/copy functions
a7a6a45d37fe wifi: ath12k: move HE capabilities processing to a new function
1476014fadb6 wifi: ath12k: WMI support to process EHT capabilities
dbe90679bfa1 wifi: ath12k: propagate EHT capabilities to userspace
38013653a697 wifi: ath12k: add EHT PHY modes
17bbb8aa74fd wifi: ath12k: prepare EHT peer assoc parameters
5b70ec6036c1 wifi: ath12k: add WMI support for EHT peer
6734cf9b4cc7 wifi: ath12k: peer assoc for 320 MHz
22e1d1166c27 wifi: ath12k: add MLO header in peer association
9211df5c025a wifi: ath12k: parse WMI service ready ext2 event
07c01b86f21d wifi: ath12k: configure puncturing bitmap

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230725224034.14045-2-quic_alokad@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
