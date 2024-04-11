Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC93DC4345F
	for <ath12k@archiver.kernel.org>; Thu, 11 Apr 2024 16:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uMMeAP9+yPZOc8eqCWi9xbR+9yNMzW7vAIMbAX8oShE=; b=BVeoaJmQrLgnN2iRAV9gUvJSOy
	HD/xeBDVJrdT6R7/FlaO8xRz1sSefyyb04GepPrA6mXtS4xj4Hkcnpt4cBbB5zOjLDDh7bKiot9Uv
	6CazwfE810SKq1ZO3H2rG+J1iqou8MlFKR9IoHxFvorUwlWQ++pKRrLLCvo+ICpVk7swQSE2cHzIx
	VnYPNsN1/AhdkWX1448UIMhoOmCGyr5YL5Ibo7zS5hX0G7I2xKSLVHjahVowzMCMcFPJnKTWfiqkE
	OONC6XXiSmr8AVTjkB74i1IPMex9nxyf0lVeS5q6OZQiuPjzGJGUTitR5qInxvqV+z463xtbsQ8Cg
	2uFAKrRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rux1n-0000000CzG6-20uG
	for ath12k@archiver.kernel.org;
	Thu, 11 Apr 2024 16:11:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rux1i-0000000CzEW-1CBL
	for ath12k@lists.infradead.org;
	Thu, 11 Apr 2024 16:11:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8025E6059A;
	Thu, 11 Apr 2024 16:11:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D62BC072AA;
	Thu, 11 Apr 2024 16:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712851909;
	bh=oPu+pMXZ7sRT7O7K/FKCAc6Llc8DXE8N568jWkHtkNY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=jblsBXOTD+h7jlVDV66ht7fwDJbS60pdTPAcYYxdRC+bgR7AUFjeRj+1fNxFlk50i
	 UpH9F8gNgdO/wNSV+GmGUo2B20/GnIiX50R3pfJNc3hPBsHl7nnNHyuke8zp16HxGg
	 y85+d5pP5F/nmJLEQctLufi3Esug2SjgEUiX3sMrIXq4LenzJku8vD0hFX+MQTNEIQ
	 XZtyGNbTWubk7BqZ4LyVXXW1lUc5GK5buQYkY1/wBPBGy4ZT+2fBqfOo0R33CYxHoP
	 NdL2zhD6fxTVXKBVXUP8EZkoPbFymz59DAd9xd6Kcp/KQqvN+YzIXVgcdtP8CYH2MS
	 A41z2OUm1OX+g==
From: Kalle Valo <kvalo@kernel.org>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: add support to handle beacon miss for
 WCN7850
References: <20240319023032.719-1-quic_kangyang@quicinc.com>
	<8734rsz0gk.fsf@kernel.org>
	<e7c11c22-0b2c-4c54-b9f5-c01b8ba3a4b5@quicinc.com>
Date: Thu, 11 Apr 2024 19:11:46 +0300
In-Reply-To: <e7c11c22-0b2c-4c54-b9f5-c01b8ba3a4b5@quicinc.com> (Kang Yang's
	message of "Thu, 11 Apr 2024 19:31:41 +0800")
Message-ID: <87y19jyj3x.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_091150_470879_5BA227B8 
X-CRM114-Status: GOOD (  13.49  )
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

Kang Yang <quic_kangyang@quicinc.com> writes:

> On 4/11/2024 5:56 PM, Kalle Valo wrote:
>> kangyang <quic_kangyang@quicinc.com> writes:
>> 
>>> From: Kang Yang <quic_kangyang@quicinc.com>
>>>
>>> When AP goes down or too far away without indication to STA, beacon miss
>>> will be detected. Then for WCN7850's firmware, it will use roam event
>>> to send beacon miss to host.
>>>
>>> If STA doesn't handle the beacon miss, will keep the fake connection
>>> and unable to roam.
>>>
>>> So add support for WCN7850 to trigger disconnection from AP when
>>> receiving this event from firmware.
>>>
>>> It has to be noted that beacon miss event notification for QCN9274
>>> to be handled in a separate patch as it uses STA kickout WMI event
>>> to notify beacon miss and the current STA kickout event is processed
>>> as low_ack.
>>>
>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>>
>>> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
>>
>> There were conflicts but I fixed in the pending branch, though I
>> admit I
>> did that hastily:
>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=e5b7eced753bc7e5af133624f6ff37141c5b3442
>> But now I see warnings like below, I don't if it's caused my
>> conflict
>> fixes or was there originally.

[...]

> 	I just tried on latest ath.tag. After i fixed conflict, there
> 	is no warning.
>
>
> 	I saw conflict only happen at add/remove_interface(). Could
> 	you show me your conflict fix? I cannot reproduce this
> 	warning.

I already gave you the URL of my rebased commit above but here it is again:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=e5b7eced753bc7e5af133624f6ff37141c5b3442

But please submit your rebased version as v2 and I'll test that one.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

