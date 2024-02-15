Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F9BC48BEB
	for <ath12k@archiver.kernel.org>; Thu, 15 Feb 2024 11:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8pVE2IbgSesPWu1LL1kYYO9zJ5PGzbkhAEFW8uh3t2U=; b=cQkPaucKKBKjA46/Z2O4JEkAib
	8kKboNBHZsQ0t0WaZpKrhs0JYAQaKv79dbwSn7vgaAwyk+XOY/ungRbJn6HSdnFHdLDz6MlsCyEVb
	h7cIU+od7Z5AkJgRyUGsCy8p3UtgX9IP+QIENtzlFzox9oXg/XXY9nOdJa4LN/+3Z9gVDVKv+KtUY
	82nfj29PGgWWuwHLcHdan/aBEwDEk1Gxg0MP9zfJ/GVWjf3IVvxiPS/9vHJFsBrOXY6O6Lu2QwQ1/
	DcPHmYgtAR39zLHyFCqJ6nOtMagA9RJ96ynO7zRhvRURv9oncSqFUPQLsqkyxXzA2xY2ElAObab8J
	hK+aL7rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZyy-0000000G3UH-2UmI
	for ath12k@archiver.kernel.org;
	Thu, 15 Feb 2024 11:32:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZyv-0000000G3Sw-0a6U
	for ath12k@lists.infradead.org;
	Thu, 15 Feb 2024 11:32:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A4CBA61D22;
	Thu, 15 Feb 2024 11:32:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A250C433C7;
	Thu, 15 Feb 2024 11:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707996764;
	bh=Y75MeSiVwPc8AkG3sXMXhAT4eHoFE1miiimyMA/OJ7M=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=rBuiQTs6ju7+wsFmHunT5vuKkQT1FKtI8m5SXkyx1vL3Mpecw+3E1EdRwzihtCYZo
	 bIl7HXM0qJ0qqv3tVQYsORBAk++LPn5jrZnZoXnN2ZqCDpq7+p0RtZ72jIL0h+ewmO
	 l9sIn27n5wNC1+QyCZEQ2W2b32Vw3u30kYaPiD6bYK6siPXGbH6WAppY2h+MpOYeP1
	 blh5fVeeeYrKAJGurZ1CMVppgEA7WU/V69YI9RoXiXBgj6KzLu+GV9lQTXTw1UgdXS
	 jcdM0MbF6PZLGb0IzlorhPPGRgz4f+wiQOWty8RjCWc3n14FiWz1rPrOtJ20OcDMJT
	 VLrYlb7rMGDIQ==
From: Kalle Valo <kvalo@kernel.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: ath12k@lists.infradead.org,  Raj Kumar Bhagat
 <quic_rajkbhag@quicinc.com>,  linux-wireless@vger.kernel.org,  Ganesh Babu
 Jothiram <quic_gjothira@quicinc.com>
Subject: Re: [PATCH v3 12/13] wifi: ath12k: Read board id to support
 split-PHY QCN9274
References: <20240129065724.2310207-1-quic_rajkbhag@quicinc.com>
	<20240129065724.2310207-13-quic_rajkbhag@quicinc.com>
	<23399810.6Emhk5qWAg@ripper>
Date: Thu, 15 Feb 2024 13:32:41 +0200
In-Reply-To: <23399810.6Emhk5qWAg@ripper> (Sven Eckelmann's message of "Wed,
	14 Feb 2024 15:17:11 +0100")
Message-ID: <87bk8inesm.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_033245_242509_718CF97F 
X-CRM114-Status: GOOD (  18.18  )
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

Sven Eckelmann <sven@narfation.org> writes:

> On Monday, 29 January 2024 07:57:23 CET Raj Kumar Bhagat wrote:
>> diff --git a/drivers/net/wireless/ath/ath12k/fw.c
>> b/drivers/net/wireless/ath/ath12k/fw.c
>> index fbcf40c97792..5be4b2d4a19d 100644
>> --- a/drivers/net/wireless/ath/ath12k/fw.c
>> +++ b/drivers/net/wireless/ath/ath12k/fw.c
>> @@ -119,6 +119,13 @@ static int
>> ath12k_fw_request_firmware_api_n(struct ath12k_base *ab,
> [...]
>> +		case ATH12K_FW_IE_AMSS_DUALMAC_IMAGE:
>> +			ath12k_dbg(ab, ATH12K_DBG_BOOT,
>> +				   "found dualmac fw image ie (%zd B)\n",
>> +				   ie_len);
>> +			ab->fw.amss_dualmac_data = data;
>> +			ab->fw.amss_dualmac_len = ie_len;
>> +			break;
>>  		default:
>>  			ath12k_warn(ab, "Unknown FW IE: %u\n", ie_id);
>>  			break;
>
>> @@ -371,16 +375,43 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
> [...]
>> +	if (dualmac) {
>> +		if (ab->fw.amss_dualmac_data && ab->fw.amss_dualmac_len > 0) {
>> +			/* use MHI firmware file from firmware-N.bin */
>> +			mhi_ctrl->fw_data = ab->fw.amss_dualmac_data;
>> +			mhi_ctrl->fw_sz = ab->fw.amss_dualmac_len;
>> +		} else {
>> + ath12k_warn(ab, "dualmac firmware IE not present in
>> firmware-N.bin\n");
>> +			ret = -ENOENT;
>> +			goto free_controller;
>> +		}
>
> I saw this now already multiple times that the source code was referencing the 
> firmware-N.bin (like we had with ath10k). But they aren't published anywhere. 
> I can't find a single one at:
>
> *
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/ath11k
> *
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/ath12k
> * https://github.com/kvalo/ath11k-firmware
> * https://github.com/quic/upstream-wifi-fw
>
> So I find it odd that the new code now seems to depend on it without actually 
> providing these files anywhere.

For example, firmware-2.bin will be used for qrtr id to support multiple
devices on the same host.

> Might be good to have these soon in linux-firmware.git.

Yeah, we will but just slowly. We are currently moving
ath1?k-firmware.git repos to a new location, firmware-N.bin files should
start emerging after that.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

