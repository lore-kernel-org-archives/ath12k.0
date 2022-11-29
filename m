Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D5FC4321E
	for <ath12k@archiver.kernel.org>; Tue, 29 Nov 2022 11:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XdaZ2PlVrbHwDgnz18OPo1QY37CHOwOyeaz1PnRqWTk=; b=Bk9DsR+IMBKXMF
	R5FfMyQdzxxMu0Wa7+nZlzMAdDMVjJ4M42LodBty73DKYYK3qTC7gf7CAdwc42d1P8tRa3JrRyKjY
	7hDasKd7XvVIEedAApGotqE9q8d8m2QiPl5wSGL7BCAAFmWIJY+AoyPyAS+SZafC0TqzTwwRde0+v
	MHtkxYyXeGjf/tF0n3H79IBHMkVD2Hs2f0VNVrGo1NxiJ9RaLJeFrZOA/UFLTr9QcKgyrTlswlWhv
	D5jT4jaHSCrys2LSVWx+gO0ypTThIMCpOCyI8D+WELARwhcgA/4iIEvf3IA1OqvVzffT2aPg9ORk/
	Q7vwtwsvMVX23HjveIqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozyVb-008PoY-4K
	for ath12k@archiver.kernel.org; Tue, 29 Nov 2022 11:10:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozyVX-008Pmp-Q7
	for ath12k@lists.infradead.org; Tue, 29 Nov 2022 11:10:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2C9E861654
	for <ath12k@lists.infradead.org>; Tue, 29 Nov 2022 11:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1BB2C433D6;
	Tue, 29 Nov 2022 11:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669720234;
	bh=Vo1h5c5yYhZpaGlAJTVMWRh5gAvNdsziUO0LWAm+iAw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=CHRM1gks4ryL/sOKO6hYFNldBXhHPDnfIEAijpC0+Jk4T3D8oAop+X8XIWAtldf6a
	 Hb15KOosWdniudh6CDZO4fJv/iPL/gKEe6pmRDMsvD3H8+X453+GZsjHHclbs+BI+E
	 WP+ZJd/9FUWYo/V3LhmRQXauGqfSmXbsmidAJdnuDeO9LETlaDJ/n8rRVxJBpEziVw
	 /1tk4vejpory3Ypl0VyaCxmOo66Hh3ziSVLT1788HTe+hCDPKUgX0CqTTIaS5OxKsZ
	 UMfr+MfQWng3po/MHzehXTi4icelwd6pAP8bfrFQFls+E6gcbju37795UyrRsOAXj7
	 oU9vGuVJWb8WA==
From: Kalle Valo <kvalo@kernel.org>
To: linux-wireless@vger.kernel.org
Cc: ath12k@lists.infradead.org
Subject: Re: [PATCH v2 00/50] wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices
References: <20221116163902.24996-1-kvalo@kernel.org>
	<878rjv5drj.fsf@kernel.org>
Date: Tue, 29 Nov 2022 13:10:28 +0200
In-Reply-To: <878rjv5drj.fsf@kernel.org> (Kalle Valo's message of "Mon, 28 Nov
	2022 16:56:16 +0200")
Message-ID: <87y1ru3tjv.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_031035_940921_29C0E21F 
X-CRM114-Status: GOOD (  16.94  )
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

> Kalle Valo <kvalo@kernel.org> writes:
>
>> From: Kalle Valo <quic_kvalo@quicinc.com>
>>
>> ath12k is a new mac80211 driver for Qualcomm Wi-Fi 7 devices, first
>> supporting QCN9274 and WCN7850 PCI devices.  QCN9274 supports both AP
>> and station; WCN7850 supports only station mode. Monitor mode is not
>> (yet) supported. Only PCI bus devices are supported.
>>
>> ath12k is forked from an earlier version of ath11k. It was simpler to
>> have a "clean start" for the new generation and not try to share the
>> code with ath11k. This makes maintenance easier and avoids major
>> changes in ath11k, which would have significantly increased the risk
>> of regressions in existing setups.
>>
>> ath12k uses le32 and cpu_to_le32() macros to handle endian
>> conversions, instead of using the firmware byte swap feature utilized
>> by ath11k. There is only one kernel module, named ath12k.ko.
>>
>> Currently ath12k only supports HE mode (IEEE 802.11ax) or older, but
>> work is ongoing to add EHT mode (IEEE 802.11be) support.
>>
>> The size of the driver is ~41 kLOC and 45 files. To make the review
>> easier, this initial version of ath12k does not support Device Tree,
>> debugfs or any other extra features. Those will be added later, after
>> ath12k is accepted to upstream.
>>
>> The driver is build tested by Intel's kernel test robot with both GCC
>> and Clang. Sparse reports no warnings. The driver is mostly free of
>> checkpatch warnings, albeit few of the warnings are omitted on
>> purpose, list of them here:
>>
>> https://github.com/qca/qca-swiss-army-knife/blob/master/tools/scripts/ath12k/ath12k-check#L52
>>
>> The driver has had multiple authors who are listed in alphabetical
>> order below.
>>
>> Co-developed-by: Balamurugan S <quic_bselvara@quicinc.com>
>> Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
>> Co-developed-by: Balamurugan Selvarajan <quic_bselvara@quicinc.com>
>> Signed-off-by: Balamurugan Selvarajan <quic_bselvara@quicinc.com>
>
> I noticed that Balamurugan is twice here, fixed in the pending branch:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=master-pending&id=b644733d58cb65d2e319bad0e0f89a852021c5c2

And the big patch is now applied to ath-next branch:

d889913205cf wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
