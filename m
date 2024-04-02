Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF248C6FD1F
	for <ath12k@archiver.kernel.org>; Tue,  2 Apr 2024 11:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U+vFOwAcwR/neOv/XJ2p7mGdv+Q8FIEXyKb0RanDEIU=; b=Tr3MU956HoX3Iy1d9MEZtCO+Ry
	54mnLbgNKMOujhvZMGoPP0zMdhUtUgYEt0A8ycmmfOSu0V1y3rpDy7z8M7IBZ0zETTpC2Sqe4nWhv
	E7oHasyKCyJZJNTrK4DTBSuFIdnSkBbMPvgTKNHVYC4zZVaWElY8N8UQ4tpjLnZYIx7CQfb4SIaHG
	1V/P07YIfFPOZfHlqbz4nK6nmv6APYwX7bb00xM9v6C6XLODBgxZY9uQTLX2AlcnZFwdX0o7gCvVO
	0L0BHrDZs6q4TjM+gg4Bv1WBSWshbdGghM45KNQgDVC41vhcsj5hEzgu6F15XpXHQ/kg9AEMao9ip
	EL9STWyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrcVz-0000000AuEn-1HO5
	for ath12k@archiver.kernel.org;
	Tue, 02 Apr 2024 11:41:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrcVx-0000000AuEG-00MK
	for ath12k@lists.infradead.org;
	Tue, 02 Apr 2024 11:41:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8A3A460DE1;
	Tue,  2 Apr 2024 11:41:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E90A2C433C7;
	Tue,  2 Apr 2024 11:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712058076;
	bh=gh7Mg3Bq5Y1lBfZpQfzEG8doAdI5MVslWxum7KRfW1Y=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=kA0hMDiVBdhvyaif04T762uzBHERyKSunf48ukdhDnMD1mQ7QYZ4W3Fwiv/ac47mU
	 RwoqVjYqYUMY+gZDmF3qVPGqf2OpsA8PicG4eN2f2c1zUGis9SzWiy8TgE+M/PRBEX
	 ubWfM4/5qx8Ge6Y4mOHKPG+Dpnprg4prdUvzQT/KWHjqiQ8cAPp632oHt+F20YojOQ
	 nrUh+1bDgPGGOcwXSFQXKwpPopUlcY5ktAUPYvkulkim/jTw6XhStpEf/fEmMxsxDA
	 GYusqqYrwNc/aGt5X+zFWOuXZThrTSB4tcJ7AKc63lfiZ6s34cY1mXF6lGfNuZBovq
	 jhdyURQrljZYQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
  <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Muna
 Sinada <quic_msinada@quicinc.com>
Subject: Re: [PATCH v2 07/10] wifi: ath12k: add support for setting fixed HE
 rate/GI/LTF
References: <20240327170910.23975-1-quic_pradeepc@quicinc.com>
	<20240327170910.23975-8-quic_pradeepc@quicinc.com>
	<a217c752-65fb-4975-8208-c708a0ceeab8@quicinc.com>
Date: Tue, 02 Apr 2024 14:41:12 +0300
In-Reply-To: <a217c752-65fb-4975-8208-c708a0ceeab8@quicinc.com> (Jeff
	Johnson's message of "Fri, 29 Mar 2024 14:34:41 -0700")
Message-ID: <875xx06lgn.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_044117_152700_11BAAC5E 
X-CRM114-Status: GOOD (  25.71  )
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

> On 3/27/2024 10:09 AM, Pradeep Kumar Chitrapu wrote:
>> Add support to set fixed HE rate/GI/LTF values using nl80211.
>> Reuse parts of the existing code path already used for HT/VHT
>> to implement the new helpers symmetrically, similar to how
>> HT/VHT is handled.
>> 
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> 
>> Co-developed-by: Muna Sinada <quic_msinada@quicinc.com>
>> Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>
>> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
>> ---
>>  drivers/net/wireless/ath/ath12k/mac.c | 588 ++++++++++++++++++++++++--
>>  drivers/net/wireless/ath/ath12k/wmi.h |  18 +
>>  2 files changed, 562 insertions(+), 44 deletions(-)
>> 
>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c
>> b/drivers/net/wireless/ath/ath12k/mac.c
>> index 46ef2d63a3de..72232285d2b1 100644
>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> [...]
>> @@ -3888,8 +4130,9 @@ static void ath12k_sta_rc_update_wk(struct work_struct *wk)
>>  	mutex_lock(&ar->conf_mutex);
>>  
>>  	nss = max_t(u32, 1, nss);
>> -	nss = min(nss, max(ath12k_mac_max_ht_nss(ht_mcs_mask),
>> -			   ath12k_mac_max_vht_nss(vht_mcs_mask)));
>> +	nss = min(nss, max3(ath12k_mac_max_ht_nss(ht_mcs_mask),
>> +			    ath12k_mac_max_vht_nss(vht_mcs_mask),
>> +			    ath12k_mac_max_he_nss(he_mcs_mask)));
>
> When I run this entire series through ath12k-check I'm getting the following
> issue here:
>
> drivers/net/wireless/ath/ath12k/mac.c:4170:15: error: too long token expansion
> drivers/net/wireless/ath/ath12k/mac.c:4170:15: error: too long token expansion
>
> caeed0eb7fb4d (Pradeep Kumar Chitrapu 2024-03-27 10:09:07 -0700 4170)
> nss = min(nss, max3(ath12k_mac_max_ht_nss(ht_mcs_mask),
>
> I don't see anything wrong with the code.
>
> Even stranger is that when this series is in place, I see this same issue at
> another place:
> drivers/net/wireless/ath/ath12k/mac.c:7903:23: error: too long token expansion
> drivers/net/wireless/ath/ath12k/mac.c:7903:23: error: too long token expansion
>
> But that is actually pre-existing code from the original ath12k driver drop:
> d889913205cf7 (Kalle Valo 2022-11-28 17:09:53 +0200 7903) nss =
> min_t(u32, ar->num_tx_chains,
>
> And the issue is not flagged when this series is not present.
>
> However that same logic also caused the same issue in ath11k, and Kalle fixed
> it there with:
> https://lore.kernel.org/all/20231214161740.1582340-1-kvalo@kernel.org/
>
> And one of the MediaTek drivers encountered a similar issue here:
> https://lore.kernel.org/all/5457b92e41909dd75ab3db7a0e9ec372b917a386.1710858172.git.lorenzo@kernel.org/
>
> So there is definitely a tooling issue here.

IIRC this is due to a statement length limit reached in sparse (or
something like that) and recently max()/min() macros were modified so
that their output is longer than before.

> As a local test I added an intermediate step and now I don't see the issue
> here:
> -       u32 changed, bw, nss, smps, bw_prev;
> +       u32 changed, bw, nss, mac_nss, smps, bw_prev;
> ...
> -       nss = min(nss, max3(ath12k_mac_max_ht_nss(ht_mcs_mask),
> -                           ath12k_mac_max_vht_nss(vht_mcs_mask),
> -                           ath12k_mac_max_he_nss(he_mcs_mask)));
> +       mac_nss = max3(ath12k_mac_max_ht_nss(ht_mcs_mask),
> +                      ath12k_mac_max_vht_nss(vht_mcs_mask),
> +                      ath12k_mac_max_he_nss(he_mcs_mask));
> +       nss = min(nss, mac_nss);
>
> So let's add something like that in v3 (perhaps pick a better name)

Yeah, that's a good way to workaround the warning.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

