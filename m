Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A00AECE57B
	for <ath12k@archiver.kernel.org>; Mon,  9 Sep 2024 09:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DP3+0KfPojHejo/zlzYwalITZTi8mrYd6w9ZH6gKIpo=; b=0J5N45FmIdZKYL5lLRgNLUo0pg
	kZOR9mCU6u0VlbDKyonns67Hnd4zOE2A47vXnmGYR3fSHG1q01o2oNbZo58XTw2Apq3E9MopWwn1s
	9+PLL/cOqL02tmL924/FP9CzvGpz7Pc0GAy2WVQcBs2u2aVBKwwcDDZs8QJS9lexxAd83N6ofWziO
	+dh13v5b29ei8KW6lmbjQT1aEetB0YQ5tb7eGGU4lgSJprmKtDKbTk2F6WdoIwTKwxll4UcfSYW84
	C5y3GqU8Ga5tGSlFQ/p0/LD8CqD9IiJ/sVDN6t0vAYUtLTW3KlEmxRk4eGGxsaahKS81EsF/AaHh/
	oROca1qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snaNR-00000001Eha-49LS
	for ath12k@archiver.kernel.org;
	Mon, 09 Sep 2024 09:08:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snaNO-00000001EfG-30DO
	for ath12k@lists.infradead.org;
	Mon, 09 Sep 2024 09:08:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 45A85A42944;
	Mon,  9 Sep 2024 09:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF05C4CEC6;
	Mon,  9 Sep 2024 09:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725872881;
	bh=aMXIYRngvNW5mNgwQ1XXr2MOsadY5DrTWID8JdS5+40=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=QfvJjYSe92yYekweG8olMivv0KOalcSzNq6yaikJeYh5DQqVErTdh/5igBcgzlHtl
	 4FDwtyNWpz7hOHF4tVDVvIQx9TlDT508VbZy6M12gE4MUKirq2yM/OfKj5+8pjOH/U
	 Sds1bbclhiHhGC00pbXlgInaKkkH+cO/xLhiIMxfrOglc46h62RTYMUKoyk3b/yohw
	 S2hgYIJFQeSihEprMIiM2o1YitTVub1TejcVBO9HJqx0IkRsejnWzEQbdDz/c2UykK
	 61LqqqLpySLjRE3rkc+93KSBNZJ0JUew23MvbH+H3vuk6XXEPHkizwJsODfRiu4hsi
	 N8Jmg1sQV+3rQ==
From: Kalle Valo <kvalo@kernel.org>
To: "Nicolas Escande" <nico.escande@gmail.com>
Cc: "Santhosh Ramesh" <quic_santrame@quicinc.com>,
  <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,
  "Sathishkumar Muruganandam" <quic_murugana@quicinc.com>
Subject: Re: [PATCH] wifi: ath12k: fix tx power, max reg power update to
 firmware
References: <20240909073049.3423035-1-quic_santrame@quicinc.com>
	<D41LUTO0MIC3.12475D2J3VNX3@gmail.com>
Date: Mon, 09 Sep 2024 12:07:58 +0300
In-Reply-To: <D41LUTO0MIC3.12475D2J3VNX3@gmail.com> (Nicolas Escande's message
	of "Mon, 09 Sep 2024 10:20:02 +0200")
Message-ID: <87mskhgpox.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_020802_842693_2D3D289E 
X-CRM114-Status: GOOD (  12.45  )
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

"Nicolas Escande" <nico.escande@gmail.com> writes:

> On Mon Sep 9, 2024 at 9:30 AM CEST, Santhosh Ramesh wrote:
>
> [...]
>
>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
>> index 137394c36460..6d7a005d83b4 100644
>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
>> @@ -7217,9 +7217,9 @@ ath12k_mac_vdev_start_restart(struct ath12k_vif *arvif,
>>  							chandef->chan->band,
>>  							arvif->vif->type);
>>  	arg.min_power = 0;
>> -	arg.max_power = chandef->chan->max_power * 2;
>> -	arg.max_reg_power = chandef->chan->max_reg_power * 2;
>> -	arg.max_antenna_gain = chandef->chan->max_antenna_gain * 2;
>> +	arg.max_power = chandef->chan->max_power;
>> +	arg.max_reg_power = chandef->chan->max_reg_power;
>> +	arg.max_antenna_gain = chandef->chan->max_antenna_gain;
>>  
>
> For what it's worth, I already got a similar patch from QCA a few month ago, and
> it fixed some tx power problems when scanning so I know there is truth in this.

What hardware and what firmware did you use? The firmware branches can
behave differently so whenever testing something it's good to include
that info.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

