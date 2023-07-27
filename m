Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4B4C0015E
	for <ath12k@archiver.kernel.org>; Thu, 27 Jul 2023 17:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tNEylrfSfqg9Wp6uGw8g2WwmhmI8KmtPJdmDfAkVUOA=; b=2dshsBEEMh3Ksj
	waYLpsdjZTm4aWk0RfOtQ6GA9UG4E9FObFKxKnFWp5NoKw8QM1CF5F4cQURnpsuVw+UWh1MOQgRC1
	agAHxH42MY/R8y/wZ+9AIPxad9qUtG8yW6wgpB/X1t/YUbbTZ+vlo6zhWdex/C0HXUDnCfqXBpfpc
	xmg0mAdAYipwG7LwYqnKUnlfWpw+LsELU6nrRIUOsHE+K9xkldm948CJaT4s/y8TO+wr/os+iiDq8
	VZcGUaACrpgyjvbOK45lL+7VdiIJDFDoo25TVTreYfdJL76OV0a/hM57E5h7CMwrUiNUXubfu/nHc
	QEfNdukt/3ZsMhTYKWvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP4Of-00H3SI-0k
	for ath12k@archiver.kernel.org;
	Thu, 27 Jul 2023 17:03:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP4Oc-00H3Ou-0J
	for ath12k@lists.infradead.org;
	Thu, 27 Jul 2023 17:03:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8CCFC61EEA;
	Thu, 27 Jul 2023 17:03:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15DCDC433C7;
	Thu, 27 Jul 2023 17:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690477405;
	bh=ulOPHPt2ESLg3S9AYD+Q3mhjU2BjGUrZpgQLshsMjCE=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=YaIf8QtxGqZmrVop9laBq3zt1zyEX5GQ4YCfJK+1aGGtdk3n4ZbIeeSTwCa8sJAIB
	 U79y3GPogTyN6PSCj583dtQtj5IzTBQSkOp1rIwNiKGslzVReC2fS8AbPUxraAi/+F
	 zaEDUqXx8gP5SnhXoDInThqfiWjLPo2ZITFANtSKFo4oKZGkcn6NRN/JN5J3B4etZS
	 xxrhT2fDX5rWQVuKo8BDMXOaaT6LVt+81fT1oiGmKx8SO080dJFrpnI/u4xw3oSCnc
	 PyY3StptAPSyJlHogEl2eGcUabEu+HNdX5jcfFz1FQg6FqSYLCoUFveT2+ycASTS7n
	 FOv4XgTtILpRg==
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
Message-ID: <169047740218.3806341.10132470501256281430.kvalo@kernel.org>
Date: Thu, 27 Jul 2023 17:03:23 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_100326_191224_A99EB547 
X-CRM114-Status: GOOD (  11.13  )
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

This added a new warning:

drivers/net/wireless/ath/ath12k/mac.c:6762: networking block comments don't use an empty /* line, use /* Comment...

Please remember to run ath12k-check. I fixed this in the pending branch.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230714092555.2018-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
