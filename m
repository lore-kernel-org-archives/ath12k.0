Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50745C0218F
	for <ath12k@archiver.kernel.org>; Fri, 31 Jan 2025 16:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9oYsBbrQ1zf84HY5BEvhe+yWwCrTgOfMfHH/MhXlG4=; b=2W42yVamZKr9OSvQqRYXnD10ca
	bB5asgzQJPpc+J7WiwKvPtqG3zHD48t8jss+a8LPBOJKyUsNHPygaDsVz5gDlKxig+90Ux0Kb1lOD
	DG1lem45y0a4ss/YEHHIgDPhz7h/CLEozmXBRO1Mah+EvbXEVfvRvVDlcYqery9qxRB24IdBQc23g
	9lfpgcYUGmfEDie4S+HTWeeLQSetzIaEcL7gDdesKTP2NpSrgflYawP0UKt+sJxU9VKgbzTZeuavj
	REw5vUPa174mV9nxMAU4LOKXPF5FlZ8DI41SGwYNHB/VZryv100Lfozy8FqFpyMC5//f1U9RuiqqE
	ES6xYVDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tduEy-0000000B2iE-060T
	for ath12k@archiver.kernel.org;
	Fri, 31 Jan 2025 16:51:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tduAQ-0000000B27W-09Py
	for ath12k@lists.infradead.org;
	Fri, 31 Jan 2025 16:46:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6EAE5A418DD;
	Fri, 31 Jan 2025 16:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D9F6C4CED1;
	Fri, 31 Jan 2025 16:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738342012;
	bh=vENTkhAyyWu3ElGHpdhddiC1S+MyS5AcNV/4io49NuA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=NKHbWpjHn+AWnlAkf2fD20ABO13nWSriwVDbGYKlXdoSQ1tZ/YSs93iZ1nw2AVyva
	 uzrIE+h7qNyPpAk+kKI3JuzKWyYNoLHRaMm4Y7Eh9cSsscsnE5yWdmudxKt+Ym4tZD
	 fwGcKxCBrvT22QsMt5ArzTqkqBCt8NVorFxe1QMNOYAgbKILHEdup4cZLoBYa979Rk
	 +8qR/SoLZ6nQNVIR96otwuoj8ddURBT32bLSO3SNzZmgiR9NMxLlZEy7wRut7/kwE8
	 NuFNBfYbozBVKAB5ww9mAF2C6IATM7KtgQKr6PbEydIwNIeZO5TW3hYq2eEQ0CnC+t
	 FWzvklWUImeHw==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,  Remi Pommarel
 <repk@triplefau.lt>,  ath12k@lists.infradead.org,
  linux-wireless@vger.kernel.org,  linux-kernel@vger.kernel.org,  Jeff
 Johnson <jjohnson@kernel.org>
Subject: Re: [PATCH v2] wifi: ath12k: remove return for empty tx bitrate in
 mac_op_sta_statistics
References: <38c2a7c4f7eaf57b9306bb95a9e6c42b7d987e05.1738169458.git.repk@triplefau.lt>
	<9c12e9b9-35a4-47f1-bd17-6b4641de92a4@oss.qualcomm.com>
	<Z5s9CO_mmazq2Kg1@pilgrim>
	<94db4020-b1c7-4aee-b22c-6fe6d357e593@oss.qualcomm.com>
	<a1a65ff7-bb5c-4c90-98b6-7155b58e89c0@oss.qualcomm.com>
Date: Fri, 31 Jan 2025 18:46:49 +0200
In-Reply-To: <a1a65ff7-bb5c-4c90-98b6-7155b58e89c0@oss.qualcomm.com> (Jeff
	Johnson's message of "Thu, 30 Jan 2025 10:57:30 -0800")
Message-ID: <874j1fgccm.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_084654_138889_78B8A20A 
X-CRM114-Status: GOOD (  13.87  )
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

Jeff Johnson <jeff.johnson@oss.qualcomm.com> writes:

> On 1/30/2025 1:18 AM, Aditya Kumar Singh wrote:
>
>> On 1/30/25 14:19, Remi Pommarel wrote:
>>> On Thu, Jan 30, 2025 at 12:21:54PM +0530, Aditya Kumar Singh wrote:
>>>> On 1/29/25 22:25, Remi Pommarel wrote:
>>>>> Currently in ath12k_mac_op_sta_statistics() there is the following
>>>>> logic:
>>>>>
>>>>>       if (!arsta->txrate.legacy && !arsta->txrate.nss)
>>>>>           return;
>>>>>
>>>>> Because ath12k_sta_statistics is used to report many info to iw wlan0 link,
>>>>> if it return for empty legacy and nss of arsta->txrate, then the other
>>>>> stats after it will not be set.
>>>>>
>>>>> To address this issue remove the return and instead invert the logic to set
>>>>> the txrate logic if (arsta->txrate.legacy || arsta->txrate.nss).
>>>>>
>>>>> The same was done also in both ath10k with commit 1cd6ba8ae33e ("ath10k:
>>>>> remove return for NL80211_STA_INFO_TX_BITRATE") and ath11k as well with
>>>>> commit 1d795645e1ee ("ath11k: remove return for empty tx bitrate in
>>>>> mac_op_sta_statistics").
>>>>>
>>>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>>>>
>>>> MISSING_BLANK_LINE
>>>> 'Tested-on:' tag missing blank line after it.
>>>>
>>>> You missed v1 comment? :)
>>>
>>> Yes sorry I think your mail never reached me, did you CC me ? Do you
>>> need a respin ?
>>>
>> 
>> No problem. No need of respin just because of this. I think Jeff can fix 
>> in pending?
>> 
>> It's strange that the v1 reply appears to be delivered from my mail box 
>> and it is sent to the list. I see even Jeff replying to that. But none 
>> of those are captured in patchwork. Not sure.
>
> it was only sent to the ath12k list
> perhaps you need to include linux-wireless@vger.kernel.org

Yeah, patchwork only follows linux-wireless.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

