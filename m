Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F781C04A6A
	for <ath12k@archiver.kernel.org>; Wed,  2 Aug 2023 17:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LHKtWcejTmUhl4YAmEiFYd95PMGtJoyhbwwjNZSPKcU=; b=24e1uEREnjDpET
	GTOhkVpXlxt0qGgP2NJarsg5EGpCc7xXhDRgq3R9KO4A2W9fUrTe2/tWeuaC4RnrocjFANxbwzXdx
	y89D6746qkYauhxd/jebp7QNzwTkHMnNnN5MZojmI3zoWXLqBPLB0n51k33JB3/HNbWfoPvYyK8NB
	U3rRVPYpgY/IXEEK7GgqVM2FNTeMUIIcrd2ULkHbTVwa4w4XA2fW94ZAkfFsa9rp41q2LAJvUbhmn
	1uvVqoVHB796Njp4bQEk7Y4AzbgHu5qBlpm1fAnzhbX9kCFBVr/gogD/C0ly6NB7syq11p5Cpr4rb
	6xJBPrB0Nuh/j0qtfPoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRFDD-005R4c-12
	for ath12k@archiver.kernel.org;
	Wed, 02 Aug 2023 17:00:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRFDA-005R47-31
	for ath12k@lists.infradead.org;
	Wed, 02 Aug 2023 17:00:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6F54E61377;
	Wed,  2 Aug 2023 17:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA56EC433C7;
	Wed,  2 Aug 2023 17:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690995635;
	bh=4ck9yYVimHcNVcAHTcJwYDRKebArzZRF+tFOsMwiOio=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=ldII4BBkkxhQxUgzmIwIGVopa4r/yq+UOohCY/RqzjS/yIDEPchrWdIcQ+XWQi2TK
	 FUSuBDXTLog0q/cT1D6yymh5pI6WpcMeRHiAh63V2t42Ta6XOuex49Yphz+kBpotlr
	 WJRHu6oUlnuk/dL8yyElOEptxdJqpv3BM+rNu87tcpvswF1GnG9f8qv0bpvcOAs7H4
	 4lwDN4AeHvQ9iAUrfqIDVfRuqho1zazs8T+BYBI1T33rRitERChP8ohMkokEnth3Lu
	 3731hgVPE5/2sLwjG2Oq3I1VrxwAaqiiod6/kc1o54XbIvPfCvEVm3hFQrHE0YUOXp
	 UviLh8X9jmlpg==
MIME-Version: 1.0
Subject: Re: [PATCH v2] wifi: ath12k: trigger station disconnect on hardware
 restart
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230714092555.2018-1-quic_wgong@quicinc.com>
References: <20230714092555.2018-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169099563293.463701.1018312535527006346.kvalo@kernel.org>
Date: Wed,  2 Aug 2023 17:00:34 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_100037_019837_BE90A09A 
X-CRM114-Status: GOOD (  10.05  )
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

> Currently after the hardware restart triggered from the driver, the
> station interface connection remains intact, since a disconnect
> trigger is not sent to userspace. This can lead to a problem in
> targets where the wifi mac sequence is added by the firmware.
> 
> After the target restart, its wifi mac sequence number gets reset to
> zero. Hence AP to which our device is connected will receive frames
> with a wifi mac sequence number jump to the past, thereby resulting
> in the AP dropping all these frames, until the frame arrives with a
> wifi mac sequence number which AP was expecting.
> 
> To avoid such frame drops, its better to trigger a station disconnect
> upon target hardware restart which can be done with API
> ieee80211_reconfig_disconnect exposed to mac80211.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

68c35cc39b41 wifi: ath12k: trigger station disconnect on hardware restart

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230714092555.2018-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
