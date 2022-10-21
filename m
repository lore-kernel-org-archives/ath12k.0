Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39869C4332F
	for <ath12k@archiver.kernel.org>; Fri, 21 Oct 2022 11:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pExg5YudI2eZpqHFVpL6HAVGOiOB3Dgp0bdCNNdlf74=; b=Cb5sVQJQtAhScJ
	fdYAZRouvTW9CcOzXO523XnDyiqss7KWkJ03Se7vWJYnAMWGAbGRlZak6lMxFNIX8BIzpb5E6ynzY
	R1I7dGcrHnzgMUGZRQ3KVncS2PKcIofEXXRIyj004VwERe6Cj8m9JCvSHZT/12xT5eydoBvMaO/FJ
	yYOZN9LUuctGBMTi5Ry2zL3icYoefaiDg3Bl/kRnPvROFvAAYwCIvO8kYk4bAyRe6bPF0Toof9ib6
	qOn7S6yQSmLZFqDjKUOLkOtcHWQ19Q3WECl4j5P9pn9pjuA4oGIUdC20cHbgKNFvNEppQWFxtnFWN
	0n7NeUIUFfKscdimbcPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olpxW-007JQF-Mk
	for ath12k@archiver.kernel.org; Fri, 21 Oct 2022 11:13:02 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olpxT-007JOB-8P
	for ath12k@lists.infradead.org; Fri, 21 Oct 2022 11:13:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D054BB82A05;
	Fri, 21 Oct 2022 11:12:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0217C433D6;
	Fri, 21 Oct 2022 11:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666350774;
	bh=EAZr8MnyEYrWDeZ3KDwVf2S2ovNDi+djVop8NKZmqf8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=LZN5fanhjbalZ/93gXChtA8E01oDFDujZp9cqPVF4IYc6lH18LqlGbi+TDt7UyZEh
	 lrbd5wy2bALOh4hCdS5Rr12DMzGbUggvL9ZCilxZMlg9uUBDvSuIgbtG5FUrzwUvDv
	 kf6YEa0HSgtajvPk2fsdI+TA4+pKjATVdPhxkjWlUDUGJsb8ZoFb9ZN0Ev21nYIoTn
	 Tgot6NYRenXgNBhcPZOXfSgVu66bTFjLRk/0GuNYJYBJ8RMS82tMYNHW1Y/eY5Dy9a
	 A2y57aAZ1E3VdmDiw2rr+d+KowWob0iVFxprCfUQLjPOmR867K+PQKObeBKqeyc73m
	 5nzmf7xCsgJ0Q==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <linux-wireless@vger.kernel.org>,  <ath12k@lists.infradead.org>
Subject: Re: [PATCH 08/50] wifi: ath12k: add dbring.h
References: <20220812161003.27279-1-kvalo@kernel.org>
	<20220812161003.27279-9-kvalo@kernel.org>
	<3f8edc37-6be7-efe5-ac02-2d068f428277@quicinc.com>
	<87r0z1juz2.fsf@kernel.org>
Date: Fri, 21 Oct 2022 14:12:48 +0300
In-Reply-To: <87r0z1juz2.fsf@kernel.org> (Kalle Valo's message of "Fri, 21 Oct
	2022 14:07:29 +0300")
Message-ID: <87mt9pjuq7.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_041259_460985_70F34A0B 
X-CRM114-Status: GOOD (  13.51  )
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

Kalle Valo <kvalo@kernel.org> writes:

> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>
>> On 8/12/2022 9:09 AM, Kalle Valo wrote:
>>
>>> From: Kalle Valo <quic_kvalo@quicinc.com>
>>>
>>> (Patches split into one patch per file for easier review, but the final
>>> commit will be one big patch. See the cover letter for more info.)
>>>
>>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>>> ---
>>>   drivers/net/wireless/ath/ath12k/dbring.h | 80 ++++++++++++++++++++++++++++++++
>>>   1 file changed, 80 insertions(+)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath12k/dbring.h
>>> b/drivers/net/wireless/ath/ath12k/dbring.h
>>> new file mode 100644
>>> index 000000000000..2be2d8def3f0
>>> --- /dev/null
>>> +++ b/drivers/net/wireless/ath/ath12k/dbring.h
>>> @@ -0,0 +1,80 @@
>>> +/* SPDX-License-Identifier: BSD-3-Clause-Clear */
>>> +/*
>>> + * Copyright (c) 2019-2021 The Linux Foundation. All rights reserved.
>>> + * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
>>> + */
>>> +
>>> +#ifndef ATH12K_DBRING_H
>>> +#define ATH12K_DBRING_H
>>> +
>>> +#include <linux/types.h>
>>> +#include <linux/idr.h>
>>> +#include <linux/spinlock.h>
>>> +#include "dp.h"
>>> +
>>> +struct ath12k_dbring_element {
>>> +	dma_addr_t paddr;
>>> +	u8 payload[0];
>>
>> should just be payload[]
>>
>> <https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays>
>
> Praneesh fixed this:
>
> c568d8bc26de ath12k: convert payload[0] to payload[], use ab variable
> and fix __ath12k_dbg() signature

But there's still more of these:

ce.h:138:	struct sk_buff *skb[0];
core.h:738:	u8 drv_priv[0] __aligned(sizeof(void *));
dp.h:1336:	u8 data[0];
dp.h:1341:	u8 value[0];
dp.h:1597:	u8 payload[0];
rx_desc.h:1397:	u8 msdu_payload[0];
rx_desc.h:1418:	u8 msdu_payload[0];

I added these to my todo list, need to investigate in detail.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
