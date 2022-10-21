Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF13CC4332F
	for <ath12k@archiver.kernel.org>; Fri, 21 Oct 2022 11:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W3CSK6mz74WSfe1HMzAjg7FY9ntiujbJ0RxGOh9mMUo=; b=myTldws5G+uroB
	yRQShGhdEIXeOdTQIctD+t+pHgVBwtmJ7nl86G4xIB6mv9gs/fwqEXQ6vOeT3rPXk//TnanTGW2S8
	rEcSWBlEOwUepnQ3+VmJpFeFZ1sr13FqTJdtyc89Y+AV1Yi93YnxJZrnMXM0cNXAtP8G3a5+GNU9f
	yPXSFMvOWqIIMcFDsNgEl5vGzRAwFgakHq5M8FG8qwd0eb0vn1PX+8bau3L8g80a/b5y3YNq33qPa
	SF67CD/c2w1HCXLlssxvpgaJAIMhwvCtaKd1yFJvS7XVM1iP6iYJ1Q09p5mYgmMO/OjpL9MRe/4HU
	tfMxANlX1GXp+okTjUIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olpsG-007I2r-9r
	for ath12k@archiver.kernel.org; Fri, 21 Oct 2022 11:07:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olpsD-007I2F-R9
	for ath12k@lists.infradead.org; Fri, 21 Oct 2022 11:07:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 22FB161E4D;
	Fri, 21 Oct 2022 11:07:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9ECEC433C1;
	Fri, 21 Oct 2022 11:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666350452;
	bh=KiDKvGNH29WQDs7TzlkbxJyAX/pWfvnZQyxfCLqQWuQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=BfvRsP7dZ/YvgZ/8xs3ieVwdwAJfjO0KOFcP+n0lxep/2k3FMdDbVFKvbdopuil6t
	 0B2dpR2RK7y4SoH1oXQRtFeHJZ9JmEqeH3+gf7ic2OrqYtBPhQoivb/qpAHPBxENiF
	 53DzUue1jlCt2k46EfeT1+1lb75NlRu+0GTXpnpQj7rt+4gMx4svUE9HO6Rc5j2DSy
	 MWPnapjjVHwg2KFaViUw+AUWYq8Mw70JL9E1Qxb4ZLIB0tM9K0c6V1jL0swwDGXLEu
	 y47Wiau24InTUlxPQIqcIAoZ0u7r9Cc5ArJf8+2QM2V4PrGtmtDRKaqNCIh56m8G7K
	 oVpXV2/kjThbQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <linux-wireless@vger.kernel.org>,  <ath12k@lists.infradead.org>
Subject: Re: [PATCH 08/50] wifi: ath12k: add dbring.h
References: <20220812161003.27279-1-kvalo@kernel.org>
	<20220812161003.27279-9-kvalo@kernel.org>
	<3f8edc37-6be7-efe5-ac02-2d068f428277@quicinc.com>
Date: Fri, 21 Oct 2022 14:07:29 +0300
In-Reply-To: <3f8edc37-6be7-efe5-ac02-2d068f428277@quicinc.com> (Jeff
	Johnson's message of "Mon, 15 Aug 2022 12:59:31 -0700")
Message-ID: <87r0z1juz2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_040733_934892_F46761CA 
X-CRM114-Status: GOOD (  14.08  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 8/12/2022 9:09 AM, Kalle Valo wrote:
>
>> From: Kalle Valo <quic_kvalo@quicinc.com>
>>
>> (Patches split into one patch per file for easier review, but the final
>> commit will be one big patch. See the cover letter for more info.)
>>
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/dbring.h | 80 ++++++++++++++++++++++++++++++++
>>   1 file changed, 80 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/dbring.h
>> b/drivers/net/wireless/ath/ath12k/dbring.h
>> new file mode 100644
>> index 000000000000..2be2d8def3f0
>> --- /dev/null
>> +++ b/drivers/net/wireless/ath/ath12k/dbring.h
>> @@ -0,0 +1,80 @@
>> +/* SPDX-License-Identifier: BSD-3-Clause-Clear */
>> +/*
>> + * Copyright (c) 2019-2021 The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#ifndef ATH12K_DBRING_H
>> +#define ATH12K_DBRING_H
>> +
>> +#include <linux/types.h>
>> +#include <linux/idr.h>
>> +#include <linux/spinlock.h>
>> +#include "dp.h"
>> +
>> +struct ath12k_dbring_element {
>> +	dma_addr_t paddr;
>> +	u8 payload[0];
>
> should just be payload[]
>
> <https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays>

Praneesh fixed this:

c568d8bc26de ath12k: convert payload[0] to payload[], use ab variable and fix __ath12k_dbg() signature

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
