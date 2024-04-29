Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B94FC4345F
	for <ath12k@archiver.kernel.org>; Mon, 29 Apr 2024 12:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q2xI/AQx94vxPJCS+O+y88ERWdf3zBOCPNqpekjudD0=; b=YHBKoBK8NuGDAc/4yp8Pt72BD+
	wOi5UqXm0wdtJykS3G+BE05V1PQlYlY82viQVT6Xr071QUsvmxfLBnpM7fmYMMe07sm1aXSPCQI0F
	EARGaymIgI7CGlBzu7DeuvHuOGMGxRczUsP4NU5qsRKDDVZ8WM6FLMfmCvBCNUh6CW1t73VIAF6v1
	OjIt52N0GUsShfIEzs+5flfmUdMDXPYQg65dE4DP76vlQyr1E6fZ8YiO5D1nJ36VjZ7Zdi/qWwbtG
	ayVwq0GkhqvE5krTf9OAl5kNkM/MxMJdtp1B//7OdU4jqN6HTEwh525Fn/sMFV/ho36DWuuI1O/FF
	Bgrc9DYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1PoI-00000002bkM-3lYR
	for ath12k@archiver.kernel.org;
	Mon, 29 Apr 2024 12:08:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1PoG-00000002bjC-1bmN
	for ath12k@lists.infradead.org;
	Mon, 29 Apr 2024 12:08:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 06F1F60C16;
	Mon, 29 Apr 2024 12:08:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A27DC113CD;
	Mon, 29 Apr 2024 12:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714392518;
	bh=hh6xj8ii1wDcrGKus6DtblItp0E3LrAfUVATj9Jdzm8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=aD4g/j6nXYrnakOEglCmYtL+66dpVhLJFzIFPol4DVictXYOxxfzP/YSK9t/6Cj6u
	 y4FWm+ySQx0yow74y1+uF26tfubAEzPYwRFA3mSjvrNrG4vF/bcohEsalCZB4NI9g2
	 UXIVJEGCks4yIrMK8hPPQwmHL9KbSQgaVYyXbfEHNWpp2JAiTGe4ZQOh3muoX9rqS5
	 58QgfmQGY6ekH2Xqd51dRcAQkDjGuaggwHvnrwzScynMam2YvASkiMfpyiHODMv/R9
	 t2qeVR8Zjq5Aw894FaRaCLso/rjukBTwEce/qRaYAxWUkHZULL3ZkegCVDQgCSbVa7
	 yFff6t9SXyy6Q==
From: Kalle Valo <kvalo@kernel.org>
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  <ath12k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>,  "Muna Sinada"
 <quic_msinada@quicinc.com>
Subject: Re: [PATCH v3 07/10] wifi: ath12k: add support for setting fixed HE
 rate/GI/LTF
References: <20240424201959.935-1-quic_pradeepc@quicinc.com>
	<20240424201959.935-8-quic_pradeepc@quicinc.com>
	<72bc6772-8bf7-427d-8f03-01e8dbf30d0c@quicinc.com>
	<87y190fulv.fsf@kernel.org>
	<198e317f-a849-4fe2-8080-3d1834d07481@quicinc.com>
Date: Mon, 29 Apr 2024 15:08:35 +0300
In-Reply-To: <198e317f-a849-4fe2-8080-3d1834d07481@quicinc.com> (Pradeep Kumar
	Chitrapu's message of "Fri, 26 Apr 2024 16:42:22 -0700")
Message-ID: <87sez4fk1o.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_050840_527825_686341C5 
X-CRM114-Status: GOOD (  15.98  )
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

Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com> writes:

> On 4/26/2024 12:31 AM, Kalle Valo wrote:
>> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>> 
>>> On 4/24/2024 1:19 PM, Pradeep Kumar Chitrapu wrote:
>>>> Add support to set fixed HE rate/GI/LTF values using nl80211.
>>>> Reuse parts of the existing code path already used for HT/VHT
>>>> to implement the new helpers symmetrically, similar to how
>>>> HT/VHT is handled.
>>>>
>>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>>>
>>>> Co-developed-by: Muna Sinada <quic_msinada@quicinc.com>
>>>> Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>
>>>> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
>>>> ---
>>>
>>> [...]
>>>
>>>> @@ -7753,7 +8034,20 @@ ath12k_mac_bitrate_mask_get_single_nss(struct ath12k *ar,
>>>>   			return false;
>>>>   	}
>>>>   -	if (ht_nss_mask != vht_nss_mask)
>>>> +	he_mcs_map = le16_to_cpu(ath12k_mac_get_tx_mcs_map(&sband->iftype_data->he_cap));
>>>
>>> drivers/net/wireless/ath/ath12k/mac.c:8041:22: warning: incorrect type in argument 1 (different address spaces)
>>> drivers/net/wireless/ath/ath12k/mac.c:8041:22:    expected struct ieee80211_sta_he_cap const *he_cap
>>> drivers/net/wireless/ath/ath12k/mac.c:8041:22:    got struct ieee80211_sta_he_cap const [noderef] __iftype_data *
>> ALWAYS run ath12k-check, we wrote the tool for a reason. Skipping
>> these
>> tests is disrespect for maintainers' time and a great way to get your
>> patches to the bottom of the queue.
>> 
> Hi Kalle
>
> I did run ath12k-check but I don't see these errors. Trying to see if
> this is due to version differences. will update further once I have
> more information on this.
>
> This is version I ran:
> qca-swiss-army-knife/tools/scripts/ath12k/ath12k-check --version
> ath12k-check (md5sum cb8a85242f2ec7343f6f94af9fa5ebb2)
>
> python:         3.6.9 (default, Mar 10 2023, 16:46:00)
> [GCC 8.4.0]
> host gcc:       gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0
> config cc:      gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0
> sparse:         v0.6.4
> checkpatch.pl:  Version: 0.32 (md5sum 12ea394e9bf27280f30a684ff937cc57)
> gtags:          gtags (GNU GLOBAL) 6.6.2

Your sparse is too old, you need to get the latest from git:

https://docs.kernel.org/dev-tools/sparse.html#getting-sparse

Also your GCC is really old, I strongly recommend to use GCC 13.2. You
can get it here:

https://mirrors.edge.kernel.org/pub/tools/crosstool/

Why on earth are you using Ubuntu 18.04? It's end of life was a year
ago.

And please also update ath12k-check. This is what I have:

$ ath12k-check --version
ath12k-check (md5sum c5567fc8aaede613275e8cafea6ed7cd)

python:         3.11.2 (main, Mar 13 2023, 12:18:29) [GCC 12.2.0]
host gcc:       gcc (Debian 12.2.0-14) 12.2.0
config cc:      x86_64-linux-gcc (GCC) 13.2.0
sparse:         v0.6.4-39-gce1a6720f69e
checkpatch.pl:  Version: 0.32 (md5sum 77c655474ed7622c0077caf2f0d7c440)
gtags:          gtags (Global) 6.6.9

> I see some notes like below this in all files:
> drivers/net/wireless/ath/ath12k/mac.c: note: in included file (through
> include/linux/bitops.h, include/linux/kernel.h,
> include/net/mac80211.h):
> drivers/net/wireless/ath/ath12k/mac.c: note: in included file (through
> include/linux/bitops.h, include/linux/kernel.h,
> include/net/mac80211.h):

Jeff and me are extra careful that there are no warnings in ath12k, in
fact in wireless-next the whole wireless subsystem has no sparse
warnings. So if you ever see warnings please report them to maintainers
ASAP.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

