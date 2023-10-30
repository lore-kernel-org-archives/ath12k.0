Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F4CC4167D
	for <ath12k@archiver.kernel.org>; Mon, 30 Oct 2023 17:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NHtFsyeWLkPOEnezJUBq75Dj58ke8DfeN90ApadJZCY=; b=n1Z+xo9E4cl245
	Mglbsfq5yZMzz2MXWeKtSDudmfk9lX5gVJHEFuboLY7O0l2fqxTIAViTL82NIZ1QFn3SbV0V82Rjr
	H1NMjKuLWjrcyHtT+nc6KH8KodeUsvgMvjnBYT5wFVFBpjaro4wcERmZcye76Y4ONHyIEMEpCXyTK
	nxMN0mTsJqPLfBooxQEic7poJe2PA7+70ZhLyo/TCClNgOBdwTjZnC5GKskZb6Ybqp9q+YQx+xv6W
	gaWCGe2YMaE5clDga3pdkYR7o2SUu2G6Y7tRfz+LcwPgNQ49MIaZw4BHxPVsxKHOzxtyt6gdqUPi5
	gf8hKgacWiYS6FeH3LBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxVdd-003i2c-0q
	for ath12k@archiver.kernel.org;
	Mon, 30 Oct 2023 17:01:17 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxVda-003i1c-2Q
	for ath12k@lists.infradead.org;
	Mon, 30 Oct 2023 17:01:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 24819CE18DA;
	Mon, 30 Oct 2023 17:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D036C433C7;
	Mon, 30 Oct 2023 17:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698685271;
	bh=uhht+9KTwyk5xSob1/njGftx8cix5tlAAKpjG3TawZE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=t8DS9JKVcR63N9kyRZcLw1my5sk6Ql1WYdfXRXLbkFlOiVhOuTpXG9ZvqV2++eZ5/
	 fCDIpxT6dUA7CrL+zHNYNxQLELEGW0PYhc1JPToFoPJIqLEe3GBdXPfIxxsUeDB4HB
	 /9S7Rtbmeai8X1S1fUg2zdmGjOVZ9Kd6fEPuHSGtorfi73KWbnT24Ei0NNvZk44Xl+
	 IXqxnMld/KW4SA67yf+fiqLrBYhSFY8DXVgut3NrJwfuCFJEG4/a/qoAqKxW6wTx9Z
	 SYRkie6BqBC90CV48MwNwZWtlW2GqvjAXrMuIMlIQ23nrLOQkFCA67x96eZ1ilwAS/
	 sNJmBVUVTs8vw==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Aaradhana Sahu <quic_aarasahu@quicinc.com>,
  <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 0/4] ath12k: Factory test mode support
References: <20231030082749.17855-1-quic_aarasahu@quicinc.com>
	<37452ae3-3006-41ca-9b31-f0d4bed75e35@quicinc.com>
Date: Mon, 30 Oct 2023 19:01:08 +0200
In-Reply-To: <37452ae3-3006-41ca-9b31-f0d4bed75e35@quicinc.com> (Jeff
	Johnson's message of "Mon, 30 Oct 2023 08:21:11 -0700")
Message-ID: <878r7kvycr.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_100115_146564_FCC7FB18 
X-CRM114-Status: GOOD (  12.27  )
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

> On 10/30/2023 1:27 AM, Aaradhana Sahu wrote:
>
>> Device is booted in factory test mode for calibration.
>> The commands are sent from userspace application, which
>> is sent to firmware using wmi commands. Firmware sends
>> the response to driver as wmi events and driver sends
>> these events to the application via netlink message.
>> Also added changes related to correct pdev id access for
>> fw test cmd.
>> Aaradhana Sahu (3):
>>    wifi: ath: create common testmode_i.h file for ath drivers
>>    wifi: ath12k: export ath12k_wmi_tlv_hdr for testmode
>>    wifi: ath12k: add factory test mode support
>> Rajat Soni (1):
>>    wifi: ath12k: Fill pdev id for fw test cmd
>>   drivers/net/wireless/ath/ath11k/testmode.c    |  78 ++--
>>   drivers/net/wireless/ath/ath12k/Makefile      |   1 +
>>   drivers/net/wireless/ath/ath12k/core.c        |  19 +-
>>   drivers/net/wireless/ath/ath12k/core.h        |  13 +
>>   drivers/net/wireless/ath/ath12k/debug.h       |   1 +
>>   drivers/net/wireless/ath/ath12k/dp.c          |   3 +
>>   drivers/net/wireless/ath/ath12k/mac.c         |  13 +-
>>   drivers/net/wireless/ath/ath12k/pci.c         |   1 +
>>   drivers/net/wireless/ath/ath12k/testmode.c    | 413 ++++++++++++++++++
>>   drivers/net/wireless/ath/ath12k/testmode.h    |  42 ++
>>   drivers/net/wireless/ath/ath12k/wmi.c         |  38 +-
>>   drivers/net/wireless/ath/ath12k/wmi.h         |  22 +-
>>   .../wireless/ath/{ath11k => }/testmode_i.h    |  52 +--
>>   13 files changed, 624 insertions(+), 72 deletions(-)
>>   create mode 100644 drivers/net/wireless/ath/ath12k/testmode.c
>>   create mode 100644 drivers/net/wireless/ath/ath12k/testmode.h
>>   rename drivers/net/wireless/ath/{ath11k => }/testmode_i.h (53%)
>> base-commit: 0263687f4441d5a5eab8074d56b4693c8f0acf85
>
> That base-commit is pretty old (tag: ath-202309051328) and your series
> fails to apply to current ath-next, please rebase:

That tag is almost two months old! Aaradhana, what an earth are you
testing with?

> Applying: wifi: ath: create common testmode_i.h file for ath drivers
> Applying: wifi: ath12k: export ath12k_wmi_tlv_hdr for testmode
> Applying: wifi: ath12k: add factory test mode support
> Patch failed at 0003 wifi: ath12k: add factory test mode support
>
> In addition, please use

Jeff, did you sent your mail too early? Something seems to be missing in
your mail.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
