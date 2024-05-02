Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2C5C25B4F
	for <ath12k@archiver.kernel.org>; Thu,  2 May 2024 10:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AYUgWsEi9OCaLHmpFgABg1oI0l+F0CUQKVrXwZDYJh0=; b=C4i1aYew+ODUfhSsFWyj37oaIN
	zmt6/7hrGbAuZ6Kq9y7hN3lNkgpyUDFHoFT38IxkphxM/WZ3OthOD49blRfHYMsgH6bJTuCRBu3fP
	QOwdFH6TqOQTjA87qUGVUmgfCXf0qbPRcI494xdzOw9tBdIi6hh0ZeXlYhbigQFrCq+QHSkqacfBv
	W630mCjSQ2hFdAW7/ySQ7ZpX8fDEfcyrJMZumzE5AA88DioRpU6JxJ4OeBA6zbTMHhIpJ4N5Nm27v
	iJllxIWd3RReQmoER0kSuc4OSeR3PIu2T8uCmQd1vU39I0qLd7NESB2Q2q0DipVGqifY3ljZNw2Jo
	4SjhJfVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Trf-0000000CN8P-3tqq
	for ath12k@archiver.kernel.org;
	Thu, 02 May 2024 10:40:35 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2TrC-0000000CMih-0lp4
	for ath12k@lists.infradead.org;
	Thu, 02 May 2024 10:40:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E96F5CE1320;
	Thu,  2 May 2024 10:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 567C9C113CC;
	Thu,  2 May 2024 10:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714646402;
	bh=59Lg6crkNG6Sw6l0EhZYHYibNEh0Vh+UltVt2CkQPtw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=GKikgIve3HlnI+kmPeCvuanO1VfDVm8lMunBkigrAKVzERlkyoo+uxFmJVrUSfx7R
	 xBhYov2cYOuuKr1udbJeCmwCrf7wQZSCwAcER9AbekYM2c5X+N5a5Uyc86Om5ThW+S
	 fz05hMfDctfY/o+2xHB04zynMspK2rXcETI4H9XIpFRuT5zQRhqLsCjo1BvrshaZUe
	 uC+k4AljV2HgC5XpouW1ogt9iWe6MXTaYnwwiYIb2wkrLBJwz7rPQS1LKh810LjAIl
	 yOiqf2lqC0MGdp2N9865vyol6tqdGPrKVnvE1bN7Jwv3EDp2DbaF6T+3mWDSAng+CC
	 lJ7ng00y5S6tQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>,
  <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] wifi: ath12k: drop failed transmitted frames
 from metric calculation.
References: <20240430074313.885807-1-quic_kathirve@quicinc.com>
	<20240430074313.885807-3-quic_kathirve@quicinc.com>
	<8a7823bb-dcee-4ddb-93e0-077371408014@quicinc.com>
Date: Thu, 02 May 2024 13:39:59 +0300
In-Reply-To: <8a7823bb-dcee-4ddb-93e0-077371408014@quicinc.com> (Jeff
	Johnson's message of "Tue, 30 Apr 2024 10:50:00 -0700")
Message-ID: <87zft8o5ts.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_034006_794689_4F3C2FA7 
X-CRM114-Status: GOOD (  11.38  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 4/30/2024 12:43 AM, Karthikeyan Kathirvel wrote:
>> In mesh node traffic, internal firmware-transmitted failures are
>> reported as transmitted failures in mesh metric calculation, leading
>> to the breakage of the mesh link.
>> 
>> Fix the issue by dropping the internal firmware-transmitted failures
>> before updating the TX completion status to mac80211, in order to
>> prevent false failure averaging in mesh metric calculation.
>> 
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> 
>> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
>> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
> With one caveat noted below,
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>
> [...]
>> diff --git a/drivers/net/wireless/ath/ath12k/hal_desc.h b/drivers/net/wireless/ath/ath12k/hal_desc.h
>> index 63340256d3f6..71e8c8a091ae 100644
>> --- a/drivers/net/wireless/ath/ath12k/hal_desc.h
>> +++ b/drivers/net/wireless/ath/ath12k/hal_desc.h
>> @@ -1,7 +1,7 @@
>>  /* SPDX-License-Identifier: BSD-3-Clause-Clear */
>>  /*
>>   * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
>> - * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>
> should be 2021-2022, 2024 per current guidance
>
> Kalle can probably fix this in the pending branch

Fixed to this:

--- a/drivers/net/wireless/ath/ath12k/hal_desc.h
+++ b/drivers/net/wireless/ath/ath12k/hal_desc.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

