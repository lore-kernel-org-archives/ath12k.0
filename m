Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2601EC4345F
	for <ath12k@archiver.kernel.org>; Fri, 19 Apr 2024 04:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8WMtjwMHRrNW7r6l7QYjsRv/oTa9KGccD3egJelvxMo=; b=3YgU984NAfAV7+wNPC6ZR3OFQ/
	21Z2pjqVXGJb/kkkLHmiR6b1HSFEZ11Q2zdSzlfD+5rMNb2/JCDFJpPWi3GqeHxMWvgYfUtTPoXIn
	5DDnJjM/JHfsN2BOh1r/0bDbMW7hee4r13mhRrUQ78KyNCR2fwp2w7spxg1NlVaWWTcmY9Tq7mewf
	uQl9CFePld+ZkBEAXiV1voW7Ui9JoRFdrJ+t3voBb/j0QRdNamcoai03KKyPT64eP4ijTU8a1kGY6
	gadlK7CQw337Zj+CcfQSDdhvQYQ8Yj9knM1RtWc5ftLh7PMVh0KoKOQKYVDnJAQzrzBw6nHhz9xHq
	XMWgWmPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxffd-00000004LTX-1agu
	for ath12k@archiver.kernel.org;
	Fri, 19 Apr 2024 04:16:17 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxffa-00000004LSG-1eyk
	for ath12k@lists.infradead.org;
	Fri, 19 Apr 2024 04:16:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A48CFCE1733;
	Fri, 19 Apr 2024 04:16:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F339C072AA;
	Fri, 19 Apr 2024 04:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713500169;
	bh=VDSdyBPL2K1RF8ChwR1cpTQb7PqWJtUVtC/o9MaNRHY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Lyikg3T9ZGTR/cBFvFx5NBZUrNjHjoWGwpDZBdSVwOKYmm2kuLJqK/yYUA5xUQgd8
	 omRJ8+xKjLUWY+J0gdy0KzAp4Y4FGQjvIE19qYyIFygzbygwrCfaT0bQYjrMZJQAk5
	 yLy9k7viENv1IdCm39K3+Tz3lubqTL+6q9qQq+atfS0Gk04sNE5N0XmHK80TTrPDK/
	 dhCMphSnDCzccPyzngC1kZXCIBa9vv2dba88RkKxxG4DzrNHpXIzG85iJhtEmkE6tx
	 Q3ll7mt6mEE/2A74EKtmlzaouMb6Eb1z3CEVD+4JI3H5TwBFEG3epwrkEtIgN5LG90
	 E2ao8PCbmJfHQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v8 0/4] wifi: ath12k: ACPI support
References: <20240418162019.1246749-1-kvalo@kernel.org>
	<71414c51-26b2-4ce7-898c-5df0e8e31825@quicinc.com>
Date: Fri, 19 Apr 2024 07:16:07 +0300
In-Reply-To: <71414c51-26b2-4ce7-898c-5df0e8e31825@quicinc.com> (Jeff
	Johnson's message of "Thu, 18 Apr 2024 15:23:48 -0700")
Message-ID: <87h6fyhtrs.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_211614_642980_16768688 
X-CRM114-Status: GOOD (  11.40  )
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

> On 4/18/2024 9:20 AM, Kalle Valo wrote:
>
>> From: Kalle Valo <quic_kvalo@quicinc.com>
>> 
>> Through reading ACPI tables, implement Time-Average-SAR(TAS), BIOS SAR,
>> configuration of CCA threshold and band edge channel power functionalities.
>> This is enabled only on WCN7850.
>> 
>> TODO:
>> 
>> * test with ACPI support in hardware (I don't have such hardware), especially
>>   suspend and hibernation

[...]

> I can verify this doesn't crash my system, but apparently my ACPI doesn't have
> the underlying settings, so cannot verify actual functionality

Thanks for testing. I hope Lingbo has a device with proper ACPI settings.

> Apr 18 15:13:59 qca-HP-ZBook-14-G2 kernel: ath12k_pci 0000:03:00.0: acpi_evaluate_dsm() failed
> Apr 18 15:13:59 qca-HP-ZBook-14-G2 kernel: ath12k_pci 0000:03:00.0: failed to get ACPI DSM data: -2
> Apr 18 15:13:59 qca-HP-ZBook-14-G2 kernel: ath12k_pci 0000:03:00.0: acpi failed: -2

I just want to verify that these are debug messages, right? Normal users
shouldn't see any ACPI errors if there are no ACPI settings in the system.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

