Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D21ECE57A
	for <ath12k@archiver.kernel.org>; Mon,  9 Sep 2024 12:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bg5Pw+dm0+2I65hDfmCUC50Lqaltebxl2dYpHtLABb8=; b=bp/zCz+pB9TyF1q+5Nf/PQ4Gyn
	lf8PU9n2l3vkVEwnVnpHyGWB844ez+qjrJ+vCs/ycTZZ6vmnYqrDBoaCOqCUbCe/apb8B20rZxDwA
	vp5v9E+IOIDtSoBjEZ5idUX6bSmHXU0ZLzYSyV213pV2O+irVI6Hbxxca8kzqg6KtegoZbtY+vwGE
	GgHQXE+NdM4u09nJV3zRiZDgbVHCsHaoKsxhN3vZZAaoGHr9wkMLrLdzLNsp240E0fMSjb8bxsagZ
	/YzfCm9mOpzST0Mi8RaC5kWWiaXiJvGMG+6bGfnzdeSvEVlxjTEiPXTRlvb5R72grt4ya4qYkSeWh
	X00cm10A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sndmg-00000001tSh-1IR6
	for ath12k@archiver.kernel.org;
	Mon, 09 Sep 2024 12:46:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncNG-00000001cxU-1u7A
	for ath12k@lists.infradead.org;
	Mon, 09 Sep 2024 11:16:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2AB27A43334;
	Mon,  9 Sep 2024 11:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25162C4CEC5;
	Mon,  9 Sep 2024 11:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725880561;
	bh=gI4k7l5Rqg8Klpd5dFoSqxAyG7irJrJaa5QtMh4qaro=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=nZY0k346Ug/1rIbbm7btCJ50f7An1eBauRJVOqlu/a+EqdoJiAJJQOY9DLHX4zOI0
	 j4xcRpau+dL9/mAGqVOSwRDBUk4NJ/9qcPKZL4n87EI7eOVIXOHNYU46wphbaY6qMu
	 PRgsGzco+AZM9qpS0wWa91+FRbO1L3naNaSivqz/v9DVU+eceulgimXJDqVxW7b8V5
	 2QrCK6iqo+7FbK3b41V9n7RIxIejLQps9+COg+Fefym4TRLzv//Pw5le9Vc1jPSCUe
	 kH64/fOehRAiYgKqwbqi9GPfiqFqD/xdMNXxmpKLrHO3EMpVt/FAC+PAGWnAg4w7Sc
	 IyCRX0eNg7Bgg==
From: Kalle Valo <kvalo@kernel.org>
To: "Nicolas Escande" <nico.escande@gmail.com>
Cc: "Santhosh Ramesh" <quic_santrame@quicinc.com>,
  <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,
  "Sathishkumar Muruganandam" <quic_murugana@quicinc.com>
Subject: Re: [PATCH] wifi: ath12k: fix tx power, max reg power update to
 firmware
References: <20240909073049.3423035-1-quic_santrame@quicinc.com>
	<D41LUTO0MIC3.12475D2J3VNX3@gmail.com> <87mskhgpox.fsf@kernel.org>
	<D41OHKZYZR9E.2JD7SQKZBBYGH@gmail.com>
Date: Mon, 09 Sep 2024 14:15:58 +0300
In-Reply-To: <D41OHKZYZR9E.2JD7SQKZBBYGH@gmail.com> (Nicolas Escande's message
	of "Mon, 09 Sep 2024 12:23:48 +0200")
Message-ID: <87a5ghgjrl.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_041602_584733_40339AF0 
X-CRM114-Status: GOOD (  15.82  )
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

> On Mon Sep 9, 2024 at 11:07 AM CEST, Kalle Valo wrote:
>
>> "Nicolas Escande" <nico.escande@gmail.com> writes:
>>
>> > On Mon Sep 9, 2024 at 9:30 AM CEST, Santhosh Ramesh wrote:
>> >
>> > [...]
>> >
>> >> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
>> >> index 137394c36460..6d7a005d83b4 100644
>> >> --- a/drivers/net/wireless/ath/ath12k/mac.c
>> >> +++ b/drivers/net/wireless/ath/ath12k/mac.c
>> >> @@ -7217,9 +7217,9 @@ ath12k_mac_vdev_start_restart(struct ath12k_vif *arvif,
>> >>  							chandef->chan->band,
>> >>  							arvif->vif->type);
>> >>  	arg.min_power = 0;
>> >> -	arg.max_power = chandef->chan->max_power * 2;
>> >> -	arg.max_reg_power = chandef->chan->max_reg_power * 2;
>> >> -	arg.max_antenna_gain = chandef->chan->max_antenna_gain * 2;
>> >> +	arg.max_power = chandef->chan->max_power;
>> >> +	arg.max_reg_power = chandef->chan->max_reg_power;
>> >> +	arg.max_antenna_gain = chandef->chan->max_antenna_gain;
>> >>  
>> >
>> > For what it's worth, I already got a similar patch from QCA a few month ago, and
>> > it fixed some tx power problems when scanning so I know there is truth in this.
>>
>> What hardware and what firmware did you use? The firmware branches can
>> behave differently so whenever testing something it's good to include
>> that info.
>
> Well what I tested was with the additionnal patch provided. So depending on
> Santhosh response, I'll either give the proprer tested by tag, or if the patch
> isn't needed. I'll need to find some time to test it :)

Can you say what hardware (QCN9274 or WCN7850) you are using? I'm not
asking for Tested-on tag, just some extra information to help the
review.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

