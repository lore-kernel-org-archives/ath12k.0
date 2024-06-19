Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5CBC2BB85
	for <ath12k@archiver.kernel.org>; Wed, 19 Jun 2024 17:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h0IxGx6pctC4qlSAPhN47VhHV1jCIGt/0w5cfIuR1+Y=; b=PB2XBinn4puGRYEAhxzBNjHhkd
	xksPPP5hBe9MQIG/5Q6RzL1Sdl8xxnRJC1HfqE8pjoGvRkMfp8hIwU0oGW/Uq7tzrihXjyDQlsnbZ
	8YVxSrwKFBTjAlG3uexbrK6svgKsDVrNV1uLerX69W1ZWxn0MI5j40yjN6Hn/GvH2+8G8j9vwQUWm
	cs4D/8smLQVWXxOlSWszyuSj6joodzmi6SbxZVLUTe7wL9iKWciOSCQUMY3mJNAvAZLOW4Qi0bsvi
	8KzYZHNaYF/uy4xpP2YwCnXVBlRFxIK1QAYKYeg49CmrZwVMwNzXuxh8LMQossHBdqIptvhwYc4zX
	2fkUlc2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJz4x-00000002CoM-09pE
	for ath12k@archiver.kernel.org;
	Wed, 19 Jun 2024 17:26:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJz4s-00000002ClI-2Vxg
	for ath12k@lists.infradead.org;
	Wed, 19 Jun 2024 17:26:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 28ECB61F10;
	Wed, 19 Jun 2024 17:26:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D24D3C32786;
	Wed, 19 Jun 2024 17:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718817992;
	bh=LQw+/TonZhZDttlWr3droi1gEt1TcWFwPUmwR/RQLM4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=iNm1NptUUgN3vogGU7B+FK0vwBlqM3BtfbFSGcg6yqlTRhGcuajvoi5xrSbosBfiE
	 nP9R2o0Cbnmd7PSWPf4geROhaSsmlfIUuohMcgPo7r+M/OAL8qnuCl8hbTFpZsw0Px
	 PqPNw6LhVaGM89JghiJZp+PwoHTFrVF5CSocJfoI3THMfOAOdo8oPTkmU5h9hn0PtA
	 nSvRUEXJ9yvp9RlU+eOHz2q4IgBcuv3ToEeeksckEyLcnoMTbmuqOrwCXKac5wW3hK
	 eYjW+7pRf8NEpkIrOfRBVbAQgT/1qFaPpY5CPieRDnHx8XXHwmxwe+He2sfdl8MJ6U
	 N36hIEPCEFOuQ==
From: Kalle Valo <kvalo@kernel.org>
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,
  "Lingbo Kong" <quic_lingbok@quicinc.com>
Subject: Re: [PATCH] wifi: ath12k: Fix pdev id sent to firmware for single
 phy devices
References: <20240611043342.2672998-1-quic_rgnanase@quicinc.com>
	<878qz1kokv.fsf@kernel.org>
	<eb7ab3a3-4365-44fe-a33b-fdcd47524778@quicinc.com>
Date: Wed, 19 Jun 2024 20:26:29 +0300
In-Reply-To: <eb7ab3a3-4365-44fe-a33b-fdcd47524778@quicinc.com> (Ramya
	Gnanasekar's message of "Wed, 19 Jun 2024 21:42:35 +0530")
Message-ID: <874j9olu7u.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_102634_858501_F35FE25C 
X-CRM114-Status: GOOD (  16.76  )
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

Ramya Gnanasekar <quic_rgnanase@quicinc.com> writes:

> On 6/19/2024 7:43 PM, Kalle Valo wrote:
>> Ramya Gnanasekar <quic_rgnanase@quicinc.com> writes:
>> 
>>> From: Lingbo Kong <quic_lingbok@quicinc.com>
>>>
>>> Pdev id from mac phy capabilities will be sent as a part of
>>> HTT/WMI command to firmware. This causes issue with single pdev
>>> devices where firmware does not respond to the WMI/HTT request
>>> sent from host.
>> 
>> But WCN7850 already works so I'm not really understanding the bug
>> description. Can you elaborate, please?
>
> pdev id from mac capabilities sent as a part of HTT stats request or WMI
> control path stats request was not expected by WCN7850 and hence fails
> to send the stats response.

Ok, now I understand. Please include that info to the commit message.

>>> @@ -81,5 +81,8 @@ int ath12k_mac_rfkill_config(struct ath12k *ar);
>>>  int ath12k_mac_wait_tx_complete(struct ath12k *ar);
>>>  void ath12k_mac_handle_beacon(struct ath12k *ar, struct sk_buff *skb);
>>>  void ath12k_mac_handle_beacon_miss(struct ath12k *ar, u32 vdev_id);
>>> +u8 ath12k_mac_get_target_pdev_id(struct ath12k *ar);
>>> +u8 ath12k_mac_get_target_pdev_id_from_vif(struct ath12k_vif *arvif);
>>> +struct ath12k_vif *ath12k_mac_get_vif_up(struct ath12k *ar);
>> 
>> AFAICS ath12k_mac_get_target_pdev_id_from_vif() and
>> ath12k_mac_get_vif_up() can be static, no need to add them to mac.h.
>
> Ah! Sure Kalle. I will take care.

Thanks.

>> So we are left with ath12k_mac_get_target_pdev_id() but I don't see it
>> called anywhere. Isn't that dead code we are adding?
>
> The wrapper is used by upcoming HTT stats and WMI control path stats
> support. Initially this change was added in the HTT stats infrastructure
> support series. Since WMI control path stats also depends on this patch,
> to eliminate the another patch series dependency, I pulled out this
> patch from HTT stats series.
> This wrapper will be used by below changes:
> HTT stats:
> https://lore.kernel.org/linux-wireless/20240614063404.2659089-1-quic_rgnanase@quicinc.com/T/
> WMI control path stats:
> https://patchwork.kernel.org/project/linux-wireless/patch/20240529180920.1472003-1-quic_rgnanase@quicinc.com/
>
> WMI control path stats has to be rebased on this current patch. Since it
> is deferred, I refrained from sending v2.

Ok, you could for example mention this is in a comment after '---' line.
Adding dead code is usually suspicious.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

