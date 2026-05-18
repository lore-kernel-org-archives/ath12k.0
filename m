Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FF1CD343F
	for <ath12k@archiver.kernel.org>; Mon, 18 May 2026 23:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:
	MIME-Version:Content-Type:Date:Message-ID:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MwQ4+T8/IHn57ekqGl0FuTuuwxp2E9CrynR+1mutik0=; b=CDVTvng+2wEqLEb6fC+99NTBKf
	gkN0pAeO/BEEKq7+I9nPdbDbvSA6xG/0OntlOeUWNTkWUviKyivtxMASKVHn0XV0Og+S4klZCIa+v
	bY6N9VFXpQc291xPuymnF0wLq7ZSfP/1pWKXrOvM+NKjxigSRKZMxcfiqSEjX1c5rrEqcoA++LQsH
	DriEiY/w14nvSGwase7NQauIa6jjhoxLywW77MHqQq8xIPJ/2uYsodmYV+m1VspZoNp1lsPaixVW+
	emjUFvqc5bbDCkrEgfPxdIL15+RhavvbV/5EHifpOug+AY8ptogUHlrvlfYzog4oK8UsXUc+HCak9
	5WMqbRxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP7E7-0000000HAkA-1nAI;
	Mon, 18 May 2026 23:18:23 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP7E4-0000000HAjW-2kZi
	for ath12k@lists.infradead.org;
	Mon, 18 May 2026 23:18:22 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so34181485e9.2
        for <ath12k@lists.infradead.org>; Mon, 18 May 2026 16:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779146298; x=1779751098; darn=lists.infradead.org;
        h=subject:cc:to:from:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MwQ4+T8/IHn57ekqGl0FuTuuwxp2E9CrynR+1mutik0=;
        b=nLOqSEamXSRK58bHqyP9NDNSnxtFRiD4J/kFgEBbi/oOCUI2+nPoe9gp9nmlMZEel2
         Vcy8nsDkR6Y38rKrqckkdOAM0bVOCL6viBLdsPqRPL447MQLxL3KADjoQNpC8O0blPxX
         0OJV6kt1GU+a7JlFuwXzfPHTyYqVXrva8YahOjbmULoSXXaIFhgfyx1ulOErc8Jg8yN3
         RSiubLqIRvst7s9IdeSHr1vI+3Y5dFk9XHipaVgiG2f7O0+MShKA6lEe7sdxYAj/smED
         QyXMpN/BrnQagFuWR8qdheO0I0WPTqfEk8yz+46l+1X/VB6JvIT7CSqVLO3Va1j7+iV4
         gnzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779146298; x=1779751098;
        h=subject:cc:to:from:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MwQ4+T8/IHn57ekqGl0FuTuuwxp2E9CrynR+1mutik0=;
        b=S+At4D70ma+2s9GS0akhSOC3ArOvqVdq7jIflixKZCy4ZyS1P7c7XZlMdYxgim8f2Z
         aX8PoktsScGCDPLtWR5d+BcRgcwGIUI9b9jNqEhMI3zRQyNTIALQ3dj4bAT1FqlUi78g
         ZIiofDiRKa0qwXQXmiUf9mMs7ym56Nwow6DF7i1QlH1TqbqybaBoLv7o0ZL5PbQtQ7UD
         ahZ2EAFwaMkX5qkQ135qZ4In09zUS2QiJ2PNPgFS7HRXB02hU1NqoHOX43Rtq1IZIsv0
         ADUwiVBP2ZVksQbMZGjqppMDnjejEQURx7dTES3ABH2hMFdZ8p88yrB+1cXzy/T6+B8N
         wqag==
X-Gm-Message-State: AOJu0YzJ0lav/JNCM/Xu9cK9JS0S1m0hTKv6Rdq5Ya1Q3QYrA9QkR5mJ
	P7e9jgve5d73wEJZzD+6BZIUqfaZ6o4FRNjuvj6gouc61XmiH3q3V3c1Sv7eTNQDKDQ=
X-Gm-Gg: Acq92OHzovA0ZaR9zXGD1pmU+iUygn40UgW/i+S6d5I2tEFr42W6DJvsyVuhyGIfz0p
	6lqwV3GoTFzoix0hhCq/8pP/LwLwtpu4+LcYG2YVlPNhR7qbHOXJhHd6xSxLJP4vKDo8P+wfoP5
	hBIIWX6TJ0fSNMLDbOdjhBitvoA80AUvRNg7Cg97hfuYR1EWyVywzbiG6fEdZtG92l7JWhG0RQr
	yRAOLXsh1so+Uoqu++Gz3XNcrNcjhIdlvU2MycYiuE2SMvHK+vbvG5PMrkh5z71lJTL1x9sAJUw
	YWDIydW9EHlMo1iTrdOoHcMRx+pwGMzhR7KuZ/5yMdU/NSiQsUZFl/bc/KogMR+DFVLpzwNWlur
	rD1L6aa2MS5M6WvBTH+YS9qibpPYGFxWvhccAjgZxmuxuKEYK2XjUSVRDjR3bIRPCktcYIA/IOJ
	bzsNUXFQ/7eu1heQNe01OwcXlL86fLNXtd4XDP3C7ZjL/blFvp2ms=
X-Received: by 2002:a05:600c:698d:b0:48f:e230:2a1c with SMTP id 5b1f17b1804b1-48fe6631158mr275019155e9.31.1779146298231;
        Mon, 18 May 2026 16:18:18 -0700 (PDT)
Received: from smtp-relay.insalata-fresca.ch ([91.84.77.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4900c16c62dsm90310455e9.11.2026.05.18.16.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 16:18:17 -0700 (PDT)
Message-ID: <6a0b9e39.87c5160c.1d1e38.353c@mx.google.com>
Date: Mon, 18 May 2026 16:18:17 -0700 (PDT)
Received: from claude-maintenance.insalata-fresca.ch (claude-maintenance.lan [10.42.0.122])
	by smtp-relay.insalata-fresca.ch (Postfix) with ESMTP id 13A3E80BC;
	Mon, 18 May 2026 23:18:17 +0000 (UTC)
Content-Type: multipart/mixed; boundary="===============4304209518966126559=="
MIME-Version: 1.0
From: insalata.fresca@gmail.com
To: jjohnson@kernel.org, quic_rajkbhag@quicinc.com
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, quic_bqiang@quicinc.com
Subject: =?utf-8?q?ath12k=3A_QCN9274_hw2=2E0_single-band_cards_on_IPQ9574_=E2=80=94_firmware_RDDM_after_WMI=5FINIT=5FCMD_=28WLAN=2EWBE=2E1=2E6-01243=29?=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_161820_725945_7C82C108 
X-CRM114-Status: GOOD (  10.07  )
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

--===============4304209518966126559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hi Jeff, Raj Kumar, all,

I'm bringing up mainline OpenWrt on a Wallys DR9574 (IPQ9574 SoC + three
QCN9274 hw2.0 M.2 cards: one 2.4 GHz, one 5 GHz, one 6 GHz, all single-band,
all single-mac firmware). After working through two host-side bugs I've hit
what looks like a firmware crash and would appreciate guidance.

Hardware
--------
  Platform : Wallys DR9574 (Qualcomm AP-AL02-C4 reference design)
  SoC      : IPQ9574, soc_id 0x401a2200
  Cards    : 3x QCN9274 hw2.0 M.2 (DR9274-2GK / DR9274-5GK / DR9274-6GK)
  Firmware : WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1 (linux-firmware 20260410)
             fw_version 0x160484db, built 2025-12-09 19:48
  Kernel   : 6.12.89 + ath12k from current ath-next + backports-6.18.26
  OTP      : slot 0001 board_id=0x1 (2.4 GHz card, programmed)
             slots 0002 0003 board_id=0xff (5/6 GHz cards, unprogrammed)

Two host-side fixes required (separate patches)
-----------------------------------------------

Fix A -- single-mac cards must not request WMI MAC1:

  Without: HTC service WMI MAC1 connect response: status: 0x1 (NOT_FOUND)
  Cause  : hw_params.max_radios=2 for qcn9274 hw2.0 unconditionally drives
           ath12k_htc_init() to open two WMI endpoints. Single-mac firmware
           (dualmac OTP bit clear) does not advertise the MAC1 WMI service.
  Fix    : read dualmac OTP at MHI register time; scope wmi_ep_count to 1
           when ab->dualmac is false for qcn9274 hw2.0.

Fix B -- DMA ring capability parser must tolerate unknown module IDs:

  Without: "Invalid module id 3" -> "failed to parse tlv -22" -> WMI ready timeout
  Cause  : WBE.1.6 sends capability entries for module_id 3 (and possibly
           others) the host enum does not know. ath12k_dp_get_ring_num()
           returns -EINVAL for unknown IDs, breaking TLV parsing entirely.
  Fix    : warn-and-skip on unknown module_id instead of returning -EINVAL.

Both confirmed working on this hardware. Happy to format as [PATCH ath-next] if
useful -- they get all three cards from "won't init" to "init proceeds cleanly
through WMI SVC_READY_EXT".

The blocker: firmware RDDM ~316 ms after host sends WMI_INIT_CMD
-----------------------------------------------------------------

With both fixes applied and CONFIG_ATH12K_DEBUG=y + debug_mask=0xffffff, boot
is clean through service negotiation:

  [19.482] Control service: ul pipe 0 dl pipe 1 eid 0 ready
  [19.485] HTT Data connect response: status: 0, assigned ep: 1
  [19.485] WMI connect response:      status: 0, assigned ep: 2
  [19.486] wmi_ext_service_bitmap 0x5e45be01 0x2d94d02 0x1c7010c6 0xee7d5c14
  [19.486] num hw modes 1  preferred_hw_mode 0
           slot 0002 (5/6 GHz): supported_bands 2  freq 5 GHz [4890-7125 MHz]
           slot 0001 (2.4 GHz): supported_bands 1  freq 2 GHz [2401-2495 MHz]
  [19.486] unsupported dma ring cap module id 3, skipping       (Fix B)
  [20.408] htc ep 2 consumed 1 credits (total 1)  <-- WMI_INIT_CMD sent
  [20.724] ath12k_pci 0003:01:00.0: mhi notify status reason MHI_CB_EE_RDDM
  [20.883] ath12k_pci 0001:01:00.0: mhi notify status reason MHI_CB_EE_RDDM
  [24.517] ath12k_pci 0002:01:00.0: failed to receive wmi unified ready event: -110

MHI_CB_EE_RDDM (RAM Dump Debug Mode) fires 316-476 ms after the host sends
WMI_INIT_CMD. The crash hits all three cards on every boot. Card 0002 does not
crash but times out waiting for WMI_UNIFIED_READY, presumably because the
firmware group is stuck.

I also attempted two host-side patches targeting the post-INIT path: a
NULL-ptr guard in ath12k_core_start and a DMA ring config timing fix in
ath12k_core_hw_group_start. Both were confirmed to have no effect -- RDDM fires
before either code path is reached, ruling out those theories.

A 21013-line verbose ath12k log (multiple consecutive boots) is available on
request.

Questions
---------

1. Is WLAN.WBE.1.6-01243 known to work with current ath-next on QCN9274 hw2.0
   single-band cards? Is there a known-good firmware version to try
   (WBE.1.4.x or WBE.1.3.x)?

2. Is the WMI_INIT_CMD payload format expected to differ between single-band
   and dual-band QCN9274 variants in a way current ath-next doesn't handle?

3. Is there a way to extract an RDDM dump after this crash (debugfs, PCIe BAR,
   MHI API) to identify the specific firmware fault?

4. Wallys vendor documentation says "only single band modules can work with
   current ath12k without extra development". My cards ARE single-band yet all
   three crash. Is there known additional host-side work beyond Fixes A and B?

Full verbose dmesg on request. Patches A and B are ready to post in proper
format if useful upstream.

Thanks,
Stefano

--===============4304209518966126559==--

