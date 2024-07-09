Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6686C2BD09
	for <ath12k@archiver.kernel.org>; Tue,  9 Jul 2024 16:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rm5kXQo9P938BAZImCI9WcdQttRAWgDFl8YcnvJorLU=; b=y9r5y3NTWJ2+EfT/LyySaPzFYR
	FgGawliHKHnA8qhV4QmrRVgduSozN5dWdxZTacKWIsUalSG6TIuA0984lw0f+r6yUk0+W+e8hhZ/+
	7w0Dl6LHhlYBzzcp7azvENdm4kzLQjaHo4fLagzw6JvrmzMEuolaS2z9Q/34zJiuL8ISeWZIWegAP
	jPKQJtIVkbvgsY4rASjh5cgUWwzuol2nW2gIWXaf+a6NfItkPisp9EHlsi2t9LaS+T/gKtnbEOAEW
	0pNJ8inBUmceIz5i8RhzaAcvbd1u9YnLOOLQpVbmLkzlIePJWKMmrq9/yvGfORcXppVnP9CGcAp+5
	+Xf1tvgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRDYU-00000007uFC-47kV
	for ath12k@archiver.kernel.org;
	Tue, 09 Jul 2024 16:19:03 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRDYR-00000007uDx-26Ba
	for ath12k@lists.infradead.org;
	Tue, 09 Jul 2024 16:19:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 45A72CE0ACB;
	Tue,  9 Jul 2024 16:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67BC9C3277B;
	Tue,  9 Jul 2024 16:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720541933;
	bh=6CxWOEITHjIhWLXILz9JbgNImfhmSiAYeuju8IvNgdY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=dhXmN2A3Wvh0y2X9vbMZiyQeSdcg1nqJe6GWH3VlzbevWZqh6yyqznzdwXptak8W2
	 OKOhijmjiyHw+BKcffio4QTHn1aZx+UuKa0TIxoRP8EAu/L+yZLSug+XAXHss+RA4B
	 b9IHLQYSUv8uTf8eTX0Jx4qd0chTbdp7iefVrtnXNmsbBaXcHyYqow5cOLUKeeRwZx
	 RdRVWDGHfBrGUio9Q8fZwbN/sFNADfrJtGNXn662ovDKDCHwE/7hCqJEqLn4OnSs3U
	 b1XeExMVPSdRSoZDZbGMU4Q8GomsQG32dwQK5LVr3HJlq7h+15UEucAcWzjG1kSkBH
	 tZ97xTsfv0zqQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>,  <linux-kernel@vger.kernel.org>,
  <ath12k@lists.infradead.org>
Subject: Re: crosstool: x86 kernel compiled with GCC 14.1 fails to boot
References: <87y16bbvgb.fsf@kernel.org>
	<917565ee-732a-4df0-a717-a71fbb34fd79@quicinc.com>
	<837cd2e4-d231-411a-8af4-64b950c4066a@quicinc.com>
	<c9b23ee3-6790-404d-80a3-4ca196327546@app.fastmail.com>
	<0e0150ca-fdfa-40cb-ad7f-6ac695b702e4@quicinc.com>
Date: Tue, 09 Jul 2024 19:18:50 +0300
In-Reply-To: <0e0150ca-fdfa-40cb-ad7f-6ac695b702e4@quicinc.com> (Jeff
	Johnson's message of "Tue, 9 Jul 2024 08:29:25 -0700")
Message-ID: <87le2abkt1.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_091859_741224_91728AE2 
X-CRM114-Status: GOOD (  12.51  )
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

> On 7/8/2024 10:44 PM, Arnd Bergmann wrote:
>> On Tue, Jul 9, 2024, at 05:55, Jeff Johnson wrote:
>>> On 7/8/2024 6:57 PM, Jeff Johnson wrote:
>>>> We tend to enable a lot of debug config options, so I'm wondering if one of
>>>> them is contributing to the issue? Guess I'll turn off a bunch of those
>>>> options and try again.
>>>
>>> OK, with a bunch of debug turned off my image boots.
>>>
>>> Now to find the culprit.
>>>
>>> Current diff between original config and working config:
>> 
>> Nice! I've tried the reverse now, turning on the options
>> you have turned off on top of my defconfig. This version
>> still works for me, booting with a plain
>> 'qemu-system-x86_64 -kernel arch/x86_64/boot/bzImage'
>> and building with my arm64-to-x86 cross compiler.
>
> I picked my favorite to begin with, enabling KASAN (which in turn enabled a
> few others). The resulting kernel did not boot for me (just saw a black screen
> after the GRUB menu). Diff between working and non-working config is below.
>
> I then downloaded and built the config you supplied. With that I have the same
> behavior as my original config, the display is frozen with:
> Loading initial ramdisk ...
>
>
> [jjohnson:laptop 1966] diff .config.old .config

BTW there's also scripts/diffconfig which provides a prettier diff.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

