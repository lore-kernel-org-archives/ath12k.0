Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1918C001DF
	for <ath12k@archiver.kernel.org>; Thu,  3 Aug 2023 11:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/sJyl/Vgj/2kDkHksHA5fc0lPTRXGx8kL8J1eWO79is=; b=ZopW5o7EJpHumI
	07vy4YFK3DUkNVWWjM9yMBbazMO3QNylIlm85gg4ey3BBGOX2sYi596zfKLDnEsa6nLLuBPqBJPCU
	o9mhHctx7shBO5592sFFbUbder4Vk4rSsobCXz7LxRDAWnkpjA4n+LVX8CEdlgE4zJdYWhsX0+04u
	dNmL8rbBA8ucvXajccGCIKmLhSYt5iWYimaDxv6zcW7WDyosxEcw0dXccTxdneEhOSE3nzRlk89pY
	j3MUf15jkc1Xr+OYZVFmq8+d+dO4tvyyUGcUSVH9Pq+uBU8hwpjujVPM8D6p1Cmfuk6cO7b+8Wcnd
	qj6a4hgsOCtwg0+eYC/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRWZ5-007s6x-29
	for ath12k@archiver.kernel.org;
	Thu, 03 Aug 2023 11:32:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRWZ3-007s4g-2A
	for ath12k@lists.infradead.org;
	Thu, 03 Aug 2023 11:32:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6291861D53;
	Thu,  3 Aug 2023 11:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F0AC433C8;
	Thu,  3 Aug 2023 11:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691062339;
	bh=2mgGVC2Dfs7rGuoAE5V9tx/SPrTMRLD/AfsO+GTjpTI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=HiX0gQleE28pWg1ATJ5Anxo5m1b3U4oe4myCn0Ux9C/9gkdmBTynMVkV//dn3cZjV
	 iQOxHR7vjpGq2wET7Hue9xS/Ot8YklCZCAf3jCBrrP42t179BIM8dKgEv0nyRyNSrQ
	 XcBObVQV33w2opNKEMVWn1VNhTmmUH+GiGQJpNatl5lktysnB+j9Tzl4CSWeNg65SW
	 W6Imemh1QF680itn99b8o9NR7xKObZLGe1NhE3zZUuixKlFdC4FhX12nBnizWqAvA0
	 ff1c5JO4/kUKinxO7fvorrYO6nvQLp01oewOXjdZOyAaWcxfvCbLULh0mrYpcxsOvq
	 88L/C8ycNNQ2A==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] wifi: ath12k: configure RDDM size to MHI for
 device recovery
References: <20230721055305.20420-2-quic_wgong@quicinc.com>
	<169105464227.894438.15435946207134709277.kvalo@kernel.org>
	<1bbe5e90-1f37-3926-98f7-a685578fef8f@quicinc.com>
Date: Thu, 03 Aug 2023 14:32:17 +0300
In-Reply-To: <1bbe5e90-1f37-3926-98f7-a685578fef8f@quicinc.com> (Wen Gong's
	message of "Thu, 3 Aug 2023 17:40:39 +0800")
Message-ID: <87msz8tl8e.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_043221_768369_9CEF2D77 
X-CRM114-Status: GOOD (  20.30  )
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

Wen Gong <quic_wgong@quicinc.com> writes:

> On 8/3/2023 5:24 PM, Kalle Valo wrote:
>> Wen Gong <quic_wgong@quicinc.com> wrote:
>>
>>> RDDM is RAM DUMP DEBUG module, it is used to debug issues when firmware
>>> encounters an error.
>>>
>>> The rddm_size is needed by firmware while MHI enter RDDM state. Add it
>>> to support device recovery when ath12k receive MHI_CB_EE_RDDM message.
>>>
>>> Tested-on: WCN7850 hw2.0 PCI
>>> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>>>
>>> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
>>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>> I'm not sure what "support device recovery" means exactly. How does this patch
>> change functionality from user's point of view?
>>
>> No need to resend because of this, I can add that to the commit log.
> Device recovery means SSR(subsystem restart), when firmware happen
> crash, ath12k
> will receive the RDDM event, and then ath12k/mac80211 begin to
> re-start wifi/firmware,
> after that, the wifi become normal again.
>
> This patch is to let firmware report RDDM event correctly to ath12k.
> Without this patch,
> firmware will not report RDDM event to ath12k correctly, then ath12k
> will not begin SSR
> process.
>
> I think it should be changed like this:
>
> The rddm_size is needed by firmware while MHI enter RDDM state. Add it
> and then firmware will report MHI_CB_EE_RDDM correctly while firmware
> encounters an error, then ath12k could start the device recovery process.

How about this:

"RDDM is Ram Dump Debug Module which is used to debug issues when the
firmware encounters an error. The rddm_size is needed by the firmware
while MHI goes to the RDDM state. Provide the size to MHI subsystem so
that the firmware restart works when the firmware crashes."

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
