Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38959C5516F
	for <ath12k@archiver.kernel.org>; Fri, 31 Jul 2026 17:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ixOpGGSOB4JxiijiwyE8XeZhHl//VOjjOoGntCQrL2w=; b=Od0/NqAPDaUWVhBtXdYuDNoxo+
	+hlpyjntOhdMImy1SaKK2UkiXmfkFl94BOROV0peaxtgii1w0NFCiTpBKDt2jIs/hyYd5LWH3OT1l
	SQyXABz6o5NDiRvl6MH+hZtovdlGeySyhQPPYGQ35gTlrJov93ynTOWR9wzELe/Jc3f+rHPXllPPK
	TLl1HY2S7bJ5Zbcj/OsmCajh49nTgdFF3AbZiW2cuUKJV3qBdZASVCNWy7tDOInV3bV/kygREzfNS
	ocZ8WKOgPO+StVWcP/GDc4qHN1gPz7suymLpEIbQzOS3hDraCFjJ6khd05CHmy26i7kbNVdek3AvI
	jmxWmIuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wprOJ-0000000DIEL-3rnB;
	Fri, 31 Jul 2026 17:51:27 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wprOE-0000000DIDU-1icn
	for ath12k@lists.infradead.org;
	Fri, 31 Jul 2026 17:51:24 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-39c953950dfso11134201fa.1
        for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 10:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785520280; x=1786125080; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ixOpGGSOB4JxiijiwyE8XeZhHl//VOjjOoGntCQrL2w=;
        b=f6Ns/VyVdeDz/f8/H7nLNcwy118HYGtJApsWs3gw332NnBu7WfrMPP9R4PtmvMxEFW
         mXMCUyguR7lxvOqcLX32OMuthAUZrokabqitfSshZ7pwx0aVOSOEOXyudMBXjwmUY6iL
         N9HA5qEEzqOdFmFORu0ASXvmNG6iPlvxfA/OpTyStNvoCbB1FpQ7xw2ypJCYIr5VEYvm
         hatixiBuYAYIhlG0wgQUHWmfiuqJZODyY/mfDjz6yRVh4KeCdUtI/uCCmljsfRNW9no6
         zZrDQCJpEZCWRiw4uUkCR6P3yrG6nPhoNOn1IThZw4jgverNkvyrJVGqYBkcz8C9MBgb
         iLYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785520280; x=1786125080;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ixOpGGSOB4JxiijiwyE8XeZhHl//VOjjOoGntCQrL2w=;
        b=tDhmZS8NnJyLWw5jE+fCQClUZskn9vOUvH6v99xlD8FTbe8gD3gJgKCEYQlBABVFBL
         xOAUOtg9cSmocO1FA+8kK3Qen8bFyGzfOjAA7I+2UOLkMfNNJ7Wrg+cQDkacJTMnte+F
         iZ6hRoX6mwOtQnJvvq2B0MQ0g9AxAcD0vRzg95ocxzi9mNozbTboIrn1fhi/rzfuQghB
         RGjXLU6/uKjJUmkpocd9XRpEUTlyy1fFe4ezHcrQn+OLwxgEN1xsJIQzvSpbL3DzSJkZ
         YHQL8YHReMv5U5g5EaEuZT2eYOyXE/D9OyQWVWfFC3OAwwpQU8yNpS0PteRk6n97sEI6
         NnpA==
X-Forwarded-Encrypted: i=1; AHgh+RobJkNsSlNG849wakx3NITL3b+kkF0RNFeotgvmsAuhhaq2obt+kTbRvptGQeAwqwy8IN22uoM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxLPQPQyxaLlrevv5PNRkuFnrrgz1Jl/wi4Xuovymx7QSw4Ijgp
	7D1gN4nEBT9bnVRWE8UZMbBhIe6YApTDsEwLbFTkfRdorgnnbUVq0H9t
X-Gm-Gg: AR+sD13XcIFWm4IBTleIsSErnTZHq4d+zu1WfS05mbzbpPXWVr2Jsv7kAhmZVamkcFS
	xtN8y8fPhmh5QvSwblLXiHnPvWHj6Nxsenjz/BX1DsHf+KxxcG7FZJfKmELyjhrm2VoW/ghR1Q9
	TbTx8W0nyTarjnN5JsFBSrReeyHatMlSyjk6onaVB1Y/rvGNMSG5eGkk9b2VyLVTe0nQI5nOwnw
	840MPvYt12ksZJLRkF9VlWU+OwP/LGATRRm8tlCycMEoDLzS2zbKDfsRPrHipJamgqIHWkT7g+b
	5a2NN4xRYs5OQCDpX3WimUkukxZQnrjj4AbuOMfZSlWopNp5wQPiq5pWbtIUUqhc7qPHegVsF5Z
	L2hLUzUVJst4lymGgwRg8KiY/Y3tXAygPXuUNE+bQGWFWHpnMeX4ytunyPU4S4eMvOiH4HggK0a
	Do+vD6llt3vgKLn6sUI11InK/5crbHBnw0DHujRQJh/fKkthlCESXLe3XNAvNeV0F+MqCJD9S+G
	AUZWKMP4/wOHhKzw0Tok62TXw==
X-Received: by 2002:a05:651c:a391:20b0:39e:a64f:d7a9 with SMTP id 38308e7fff4ca-39f861047a0mr832931fa.2.1785520279939;
        Fri, 31 Jul 2026 10:51:19 -0700 (PDT)
Received: from zbok.dom.lan (89-79-165-104.dynamic.play.pl. [89.79.165.104])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f812e1f70sm2673481fa.29.2026.07.31.10.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 10:51:18 -0700 (PDT)
From: Kamil Bienkiewicz <perceivalpercy@gmail.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: Re: [BUG] ath12k: NULL deref in ath12k_mac_op_hw_scan() when a scan is requested during firmware recovery (IPQ5332 + QCN9274)
Date: Fri, 31 Jul 2026 19:51:03 +0200
Message-ID: <20260731175103.1745248-1-perceivalpercy@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731094141.2410630-1-perceivalpercy@gmail.com>
References: <20260731094141.2410630-1-perceivalpercy@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_105123_711395_E6834550 
X-CRM114-Status: GOOD (  15.63  )
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

On 7/31/2026, Jeff Johnson wrote:
> Unless you reproduce this with the upstream kernel you should be reporting
> this to the OpenWrt team, not here.

Understood, and I realise the taint makes this hard to act on. Two things
that may change the calculus, and then I will happily take it elsewhere.

First, the reproduction you are asking for is not available to me: this
board is IPQ5332 with the wifi7 AHB path, and that platform has no mainline
support at all — there is no upstream kernel that boots it. So "reproduce on
upstream" is not a bar I can clear on this hardware, rather than one I have
not bothered with.

Second, and more usefully: the code that crashes carries no local changes.

  - ath12k_mac_op_hw_scan() in the backports tree we build is byte-identical
    to drivers/net/wireless/ath/ath12k/mac.c in mainline master. I diffed the
    whole function; there is no delta.
  - None of the out-of-tree ath12k patches in our build touch the scan path.
  - The condition that leaves the device un-recovered is also upstream code.
    ath12k_core_reset() returns early when ATH12K_FLAG_QMI_FW_READY_COMPLETE
    is unset (core.c, "ignore reset dev flags"), so a firmware crash during
    early boot skips recovery entirely. Our tree only adds a clearer warning
    and a coredump call at that point; the control flow is yours.

That is the whole failure: firmware dies before QMI ready, recovery is
skipped by design, the device stays half-initialised, and an nl80211 scan
arriving in that window dereferences a pointer that is not valid yet.
Faulting address 0x1508 is a small structure offset from NULL, and the
faulting task is hostapd — it is running the 20/40 MHz coexistence scan for
a 40 MHz BSS on 2.4 GHz, and hostapd retries that on -EBUSY, so the driver
gets asked repeatedly for the whole recovery window.

I am not asking you to take a fix on this evidence. But if the intended
contract is that ath12k may be scanned while a reset has been skipped, then
ath12k_mac_op_hw_scan() failing the scan (-EBUSY or -ENETDOWN) rather than
dereferencing looks like the correct behaviour regardless of platform, and
both mac80211 and hostapd handle a refused scan cleanly — hostapd already
retries on -EBUSY today.

If you would still prefer this against OpenWrt, say so and I will file it
there. I have full pstore dumps (dmesg-ramoops with the complete log from
boot to oops) and a deterministic trigger, and I am happy to test any patch
on this hardware.

Thanks,
Kamil

