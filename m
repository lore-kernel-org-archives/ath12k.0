Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7028C55173
	for <ath12k@archiver.kernel.org>; Fri, 31 Jul 2026 18:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8E4+shQav05WgyUY6G3Mum98V9wgbtXbHPtbTkAf4bQ=; b=lGCtTuEn/+WkwQFGsobqaKVNrs
	ovuOZGwrOaiY0Z/xObELIiJjsbZ+mrDljlLrXv899ef5HtL5VFTV56rEyVg1wBLMUXsXSRx0c3S2w
	GAyYB91YUxSV+fIScHd9zIzXpD8GRCH8rppZA8xBnxXeNWLzkWyKOJAN5tp+WpLp/F4B9QSL/nb3j
	Cq8NR4Om26uSmhETrCiDCZRiW0LhfOJORg6b/g/AlJHribe5cO1SkQlmpgycPwEth3q6WjSQ0hk/R
	RZD5RI3yhdGtJuPNpCaVdIBPYi3hBa20np8pNlt4MRS9Ly9tWVvk9sXnxSYaHq02oPeU/fuO8HsAQ
	WJx88T3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpsOl-0000000DQl5-1l7X;
	Fri, 31 Jul 2026 18:55:59 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpsOi-0000000DQkT-3kIl
	for ath12k@lists.infradead.org;
	Fri, 31 Jul 2026 18:55:58 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-8f29ec73064so9173326d6.1
        for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 11:55:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785524156; cv=none;
        d=google.com; s=arc-20260327;
        b=R+44y5sfLHQzNVTliHPjwrvROe/kKw8mJi4bl2/D7FDuFro3RPfp5RUrg+3gK3fcoc
         +UVDBTCCBELVvFIGFVPZ/fwFaeSyZUFDB9s/ePXeHlA3PDxIgh8wzRFwWPwxscdS+Yyd
         AlIlpZfcv12dnsDyzbtmuRGT+Ez4i2PiRxhTcOboSl2o7ta+DbQo8/zUSW3T0acuFyYr
         Mt9fgxmf0UwyNr+W3dTZfvCXgdaI5FMiJ2+IEvfLCDjk6DDcm0WB5LEyIj6TgeRZ2DfD
         MqQqw3Uw4km+fA7IAfzB1jDFvc8WFBTUsliwXPtUF9qRPt+qlHm61HicB3h50rSQOqWY
         N0hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8E4+shQav05WgyUY6G3Mum98V9wgbtXbHPtbTkAf4bQ=;
        fh=xv4mov04uSA4sIqpW+VxESafT+I7pCpRoCO4atGjLV0=;
        b=EW6Ox4JMV34EGsL+ne7YmFpU+JDufwFuacgO+qJvME+8jDfJoBn4cJC6z55r27CuGn
         D4icT0DYrrsRAWM4YKFarzz1KacNG1+EK/TG27+dXkHJWAnYGEC3bvflcsOEby/UIYFv
         0BIcgp+kFiMo746JkRrrz4GWkXympZlPygHxPvI3HuRyJW3VkLX2VPrU9tfoziyihBOO
         i36noaCClrqZOgEXyX4C7i2yX4ta7S2vho2x0rjKiN4cT+l5Vdh0WNePX3IZkzlpqmUa
         jbMZngpXLsyEiazrL2AeXJNWBL3W44vUowvWoQtjNxLAT+BxHq7I2KBwFMJljzkMxa9n
         38qA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785524156; x=1786128956; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8E4+shQav05WgyUY6G3Mum98V9wgbtXbHPtbTkAf4bQ=;
        b=CCDimcJQhXDq9U1N2K13yJazt4kNQYzsgdtDlzSO3V5CHVPJVlMRUwxvXBEN5NWqbd
         dQMUF9V6xzqu5xhuDXEQQxjmtxhJPmTSP5LqfZDiZHM0/4XR7TDCSCHUhjIMmovliMpI
         tl1NVQtCDNfUo0nkfElEcEnOFuxg4X2jbx/CnZtJhSLSBUhXuZyVjJaBEJB+H6VTdn3i
         hmmxfT9WHu2pxvSrHuEw0pUV9L2YwB2BBVVS7BFyFMg+EmzmwKw3QQCWlagVGELqxwX8
         z7B6N5sI1GZ2qEEs217dBsE00i4Pl6BhpGRIDUOHD2H0fdDuku1V/I17yR93QYZAB5Mf
         gU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785524156; x=1786128956;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8E4+shQav05WgyUY6G3Mum98V9wgbtXbHPtbTkAf4bQ=;
        b=U30pTEoh6NhoOD3AW/F3pgmegZZ/sHm5LEueRRg/d/TPEMmmB+Pw/iJWtELX2sK/x4
         O3YbnWa7vbKHNwls4uQ0DvKmnZaRiofHnfZ50ZomqWg1F3EO8HiNs010TAYow/FSzx6l
         9MMyT8qCYvHZd+hkd+dXojPg4m+Slz2qrOqlc08Dvpg+s8oApvuBwaozF6yzpxJV6Hpy
         TGRb8K+Y65s+QBC4V6yji5cCI7oYbBCPgtuFp1q6MKnl1jhdjg/OO1UPbayXFI0tt2jX
         DOoa13qdChF0jfcMKst2l3IAEy3+SuPBrrQxiPa/rGThKnUe/hKxkURU7D2WLcN4XaI7
         t0LA==
X-Forwarded-Encrypted: i=1; AHgh+RopWwdzZlS8l5zpomTjHyXO6HgQ48USn1/p2k4JL+6ZKekAlCx+TH9Lly5Ou2fNtEOzFkEFzO0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzTCIXt52R3RakPbbLy634QZKLAu1lAloEXbBB+ZV2eHY+NKv96
	NHBBrTipO6ci0L4IQeEedDMzXm4s1bIbLznJXBY5KLZsNifZ0RRBl4ULqtCNnkR6W9s6e10r0kg
	cUedTaLwIM+OAkY5nzkWZqh5ilEbWOhXrh8OiQ1I=
X-Gm-Gg: AR+sD11GCHbbAB1FT0LcS0AmDmCGTQWbJQNY0WwOp+fdwAhot3f0k/hfzc6U0qcoZ30
	XKPQzW+MkACNSSDk2jjVSxhRX1fM70BPhMIB17Vo93jICfBwDl1I3Voh9UcBt9JUAub0VGnaoHL
	E8nEz6GDgFbjzq9HCA1W6eRrz/ciyvTszIRI8GQtfiFmpShK1daYFZQ2FK5O22QXofU+mhe/fve
	C2vKyZkoq0FTn51gAG98hToCjxzypm1cbwR6Hipjk5YzRd1oYGiyIZB5huYgnOT2K5PNfbJHeiY
	S62LNg6ZVAfFLmCdF3uBQg46P/QrSue/KrN6evSwNaeATqR4CAKpmnk=
X-Received: by 2002:a05:6214:509e:b0:8f2:d87e:29de with SMTP id
 6a1803df08f44-90849686d43mr18964906d6.27.1785524155376; Fri, 31 Jul 2026
 11:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260731094141.2410630-1-perceivalpercy@gmail.com>
 <20260731175103.1745248-1-perceivalpercy@gmail.com> <8dcc424b-32b1-4152-b75b-10bdac0af9d8@oss.qualcomm.com>
In-Reply-To: <8dcc424b-32b1-4152-b75b-10bdac0af9d8@oss.qualcomm.com>
From: Kamil Bienkiewicz <perceivalpercy@gmail.com>
Date: Fri, 31 Jul 2026 20:55:42 +0200
X-Gm-Features: AUfX_myL8T9vAdW6QqQ1YACdqC_rsZuU2s0TooK_rdtdDDwd2VfH0OH--wwpTFU
Message-ID: <CAKXN0879kBtG=YbCUWRqg=RPcnkOdSiaWB5PREh9oqFVwV=vkQ@mail.gmail.com>
Subject: Re: [BUG] ath12k: NULL deref in ath12k_mac_op_hw_scan() when a scan
 is requested during firmware recovery (IPQ5332 + QCN9274)
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org, 
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>, 
	Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_115556_942802_1BFB6EC3 
X-CRM114-Status: GOOD (  14.67  )
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
> I've cc'd the dev team to have a look at this issue.

Thank you, much appreciated.

For those just added, a short self-contained summary so you don't have to
read back through the thread.

Platform
  GL.iNet GL-BE9300: IPQ5332 (ath12k AHB, 2.4 GHz) + 2x QCN9274 (PCIe,
  5/6 GHz). OpenWrt "qualcommbe" target, kernel 6.18.39, backports 7.2-rc4.

Failure
  The firmware crashes before QMI is ready. ath12k_core_reset() then
  returns early because ATH12K_FLAG_QMI_FW_READY_COMPLETE is unset (core.c,
  "ignore reset dev flags"), so recovery is skipped by design and the devic=
e
  is left half-initialised. An nl80211 scan arriving in that window
  dereferences a pointer that is not valid yet, in
  ath12k_mac_op_hw_scan(). Faulting address is 0x1508 =E2=80=94 a small str=
ucture
  offset from NULL. The faulting task is hostapd.

Why it reproduces rather than being a one-in-a-thousand race
  hostapd runs the 20/40 MHz coexistence scan when bringing up a 40 MHz BSS
  on 2.4 GHz, and it retries that scan on -EBUSY. So for the entire duratio=
n
  of the un-recovered window the driver is asked to scan, over and over.
  Any firmware crash during early boot therefore lands on this reliably.

Provenance of the crashing code
  ath12k_mac_op_hw_scan() in the tree we build is byte-identical to
  drivers/net/wireless/ath/ath12k/mac.c in mainline master =E2=80=94 I diff=
ed the
  whole function. None of our out-of-tree ath12k patches touch the scan
  path, and the early-return in ath12k_core_reset() is upstream code as
  well. Our tree only adds a clearer warning and a coredump call there.

Suggested shape of a fix (not a patch, just the contract question)
  If ath12k may legitimately be scanned while a reset has been skipped,
  then ath12k_mac_op_hw_scan() returning -EBUSY or -ENETDOWN rather than
  dereferencing looks correct independent of platform. Both mac80211 and
  hostapd handle a refused scan cleanly =E2=80=94 hostapd already retries o=
n -EBUSY
  today.

Workaround we run meanwhile, in case it helps narrow it
  Forcing HT20/EHT20 on the 2.4 GHz radio avoids the coexistence scan
  entirely and the crash stops occurring. That is consistent with the scan
  being the trigger rather than a contributing coincidence.

I have the board on the bench, full pstore/ramoops dumps (complete kernel
log from boot through to the oops), and a reliable trigger. I am happy to
test any patch or debug diff on this hardware with a quick turnaround =E2=
=80=94
including the error-path work already in the pipeline, if it is expected to
cover this. If it does, I am glad to confirm that rather than have anyone
spend time on a fresh fix.

Thanks,
Kamil

