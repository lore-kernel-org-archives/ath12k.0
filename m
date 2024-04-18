Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E519FC4345F
	for <ath12k@archiver.kernel.org>; Thu, 18 Apr 2024 15:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LiWrbtz8JNmyhR9yp1KB2RyB4IkJw3AXRI3ciPc6Nls=; b=KLLa7Hkq0pqpttCHDpq1vMEWHi
	fT+4tGOVbHvA4QzF5YeBV9fPmC0HKYxAFEREjgGHTjXKf4XfCzGLNY+INlqYirDXntAkZj15GvqrB
	t6JDGmy3WxxLfwymNC3pJRP/awNMZsmkUeOMYnmoEpHXEbAn27vvTBAR2Llq+blXXiOCghX6v4KtK
	5jSNj60OQ+XSESBuP7ifIM9kPNJLbxwMFZiYUqQJWsle1DAa3DMNWJQMs9yR5Qxz5r21oLOpRi0ZS
	zaW9t96he7sOhhbAo5n0X+Z7SS0AqIDaTm+FoG5J146MdLXOy6Uk8r5kRAXl2Z7s9HSSs4oXHLK4t
	3tSONn0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxTci-00000002mOu-0hWd
	for ath12k@archiver.kernel.org;
	Thu, 18 Apr 2024 15:24:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxTce-00000002mOU-3QTP
	for ath12k@lists.infradead.org;
	Thu, 18 Apr 2024 15:24:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EC06361773;
	Thu, 18 Apr 2024 15:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F0D6C113CC;
	Thu, 18 Apr 2024 15:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713453863;
	bh=NCl35dkygku/r+9zzLNuYwTBleJeS28WvmRvBVpg6K8=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=gJydt1OuhDV2MDECYFzpdaXA5OfvutdSf38I+pW2T1wbOeGDYWHL0s7kMcWEw3He6
	 WQBk147gdj6S9XjirxQo+TksQcXPWNdvRUVOkMDxwlz/jw+akLLF9+mUm5FTvXRWd+
	 NFw0eZ7+IVHyHqPyIFLqJ8bijT8kKXRjlyZSLwYiUA7R4478ZbreBGmQdL1QXcvFTk
	 JMRioTPypeLC6E6jf0vGaMmQzkFL7KeCuHUNv/ggNEBZug/kthyHpZ+iaBEvIY+Yhd
	 jKJcbgupKRc8Zvs55G5ao7XiBosX4Pgt8r3bBjQWU0hKiSBfCSUgj5Tc8RrECX4d3U
	 7KI+F87mqesug==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: don't use %pK in dmesg format strings
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240416-pk-v1-1-2c8852743e6d@quicinc.com>
References: <20240416-pk-v1-1-2c8852743e6d@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>,
 <ath12k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171345386046.934743.6076422265444894161.kvalo@kernel.org>
Date: Thu, 18 Apr 2024 15:24:21 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_082425_036421_7C604B72 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> Currently, when debug logs are enabled, messages such as the following
> are found in the kernel log:
> 
> event mgmt rx skb         pK-error len 209 ftype 00 stype 50
> 
> The "pK-error" comes from using %pK to display an skb address in an
> interrupt context.
> 
> Per the guidance in the current "printk-formats" documentation, %pK
> "is only intended when producing content of a file read by userspace
> from e.g. procfs or sysfs, not for dmesg."
> 
> So replace %pK with %p in all of the ath12k_dbg() format strings.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

2372c6d28032 wifi: ath12k: don't use %pK in dmesg format strings

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240416-pk-v1-1-2c8852743e6d@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


