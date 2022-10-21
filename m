Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596AAC433FE
	for <ath12k@archiver.kernel.org>; Fri, 21 Oct 2022 13:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rv94D4E4Ific1nwKcE7trhqkOkP4vQKR5I6fT+eYha0=; b=lNDIhbNhABl7wn
	rt1smZBi2nm78ucGD1gbYHh5R2N0/dngHpo5mSDUjh4uqnuHwpGb0WP7GwwpTlDzHuJmRNpAvaror
	ziA9aZH4XrcH5AqjvBk6vWy6FLrwT7vEksQr3i9a/9KV4ZAM1kmkJlXpjk9egwmPzHPtO8IqRQS29
	FZu53mWzuWheUWdWLySw7JCdxeHHqNbzlTJ6eO7tEDLAR3IBeqkFzK+srYeNtIWfTzrlkQoaBdb2V
	SkZJ1Q45zkHNcYFaYSLoA20PknIwF4cv+Ax3XYDx+5CjnDzIeDdG4KMhSXpS02r8tpKLyteSUNmRs
	gQgLKYkpgWNbuiOgXh9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olrku-007oKi-Q8
	for ath12k@archiver.kernel.org; Fri, 21 Oct 2022 13:08:08 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olrkr-007oJd-B0
	for ath12k@lists.infradead.org; Fri, 21 Oct 2022 13:08:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 946B4B82BFE;
	Fri, 21 Oct 2022 13:08:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77A75C433C1;
	Fri, 21 Oct 2022 13:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666357682;
	bh=tKKxs7kbtMVrIJ25VRA8AnRI7kBpz/GZtojXw0IasK8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=U+E+90G+6vXZ3J168+f0JOK6bvHTv4NZIyVeh9nNe97XIvCoTzKliduMT45WRLSH+
	 pXNPFZjEHZzfF3eZrn7DgXbTBoiJQ9NKDzUyekOtls5ugjU8O4p8g5yJBptIvDkOG2
	 dpZN30uzlra3qDAxjAdFJBrDhiaxzJnFJ4/sQKHpwhRvwvejO+IR7XKq9vVIp3G/qV
	 v7gUy+qkpGaMb24yNBUAsLWohw9h0nkFyvWEerJf9qH1/3y+NPd53B9/+waHfkqCKD
	 PdUf4e7bT5f0qoD5KNKNaxtmyFF/yvS6ubgnKeXn6gZr0fEli7nUOCuaEvhcva00XA
	 yLIUlb8Sq0bsQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <linux-wireless@vger.kernel.org>,  <ath12k@lists.infradead.org>
Subject: Re: [PATCH 13/50] wifi: ath12k: add dp_mon.c
References: <20220812161003.27279-1-kvalo@kernel.org>
	<20220812161003.27279-14-kvalo@kernel.org>
	<e4c2c436-82e2-bf15-a635-e8f4e566d8d2@quicinc.com>
Date: Fri, 21 Oct 2022 16:07:58 +0300
In-Reply-To: <e4c2c436-82e2-bf15-a635-e8f4e566d8d2@quicinc.com> (Jeff
	Johnson's message of "Tue, 16 Aug 2022 13:13:46 -0700")
Message-ID: <87y1t9iatt.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_060805_698252_367966CD 
X-CRM114-Status: GOOD (  18.31  )
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
>>   drivers/net/wireless/ath/ath12k/dp_mon.c | 2598 ++++++++++++++++++++++++++++++
>>   1 file changed, 2598 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c
>> b/drivers/net/wireless/ath/ath12k/dp_mon.c
>> new file mode 100644
>> index 000000000000..479be0e441d8
>> --- /dev/null
>> +++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
>> @@ -0,0 +1,2598 @@
>> +// SPDX-License-Identifier: BSD-3-Clause-Clear
>> +/*
>> + * Copyright (c) 2019-2021 The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include "dp_mon.h"
>> +#include "debug.h"
>> +#include "dp_rx.h"
>> +#include "dp_tx.h"
>> +#include "peer.h"
>> +
>> +static void ath12k_dp_mon_rx_handle_ofdma_info(void *rx_tlv,
>> + struct hal_rx_user_status *rx_user_status)
>> +{
>> +	struct hal_rx_ppdu_end_user_stats *ppdu_end_user =
>> +				(struct hal_rx_ppdu_end_user_stats *)rx_tlv;
>> +
>> +	rx_user_status->ul_ofdma_user_v0_word0 = __le32_to_cpu(ppdu_end_user->info6);
>> + rx_user_status->ul_ofdma_user_v0_word1 =
>> __le32_to_cpu(ppdu_end_user->rsvd2[10]);
>
> this violates the convention that info* is used for fields that are
> accessed while rsvd* is used for fields that are not accessed. in
> addition, use of magic number offsets is also not nice.

P Praneesh fixed this:

b290b591dbdd ath12k: remove magic number offset in rx_user_status struct

> imo what would improve this code is to have accessor macros/inline
> functions defined co-resident with the struct so that all the magic
> numbers and magic fields are contained within the acessors, and the
> actual code here looks really readable.

Yeah, in general that would be good. But in this case it would also help
if struct hal_rx_user_status word0 and word1 fields would be renamed to
better reflect what they actually are:

	u32 ul_ofdma_user_v0_word0;
	u32 ul_ofdma_user_v0_word1;

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
