Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57002C55167
	for <ath12k@archiver.kernel.org>; Fri, 31 Jul 2026 09:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kndbL1WYWRnbylNGfVVjyaYdbj/n6MK/vKmn3IV2Im0=; b=iW/47ZbfgR+26B/wm4sKzXiqIM
	HNuAryg5+pIVkY9Qg9hsW1oTMF4USdfc82NeAtB4hRC1oQsfxAtrvLCOSXBjMvDCC3IOZf4iqoDPa
	Rt9Ha8evNqf04rXQgIPxY0ZO17iz3ptjq7m0vR4bwNNNeMAuFiKoaF6gJdWtJip6/oycFKRPfXO1T
	kyyKao3XxcOC0fhxyapk8R743v7UGe3GbS5f+C93GEH4YQOYnk5iJi79GWTvjKL/M21gPLM9+ctTp
	nUgJjwBMfnnQIIeFiDzR719OSE0WpEZMozCrlkRw7BotRtzxtSIBy34JJOrvNvJbpzF1WrirngOCd
	kRko7i9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjl1-0000000CD92-0MYm;
	Fri, 31 Jul 2026 09:42:23 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjkx-0000000CD6S-1IbP
	for ath12k@lists.infradead.org;
	Fri, 31 Jul 2026 09:42:21 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5b159850b16so651912e87.3
        for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 02:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785490937; x=1786095737; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kndbL1WYWRnbylNGfVVjyaYdbj/n6MK/vKmn3IV2Im0=;
        b=HyeEpUqeZcz1EovZn3h+J4F/4ZIWwScAQLsAK29lka9nFdV2J6ul3ydgs+2lN+1nDu
         Ux/FK2meA2510HhRCOcGqjSAkdL+3j3siFr2gjZI84V8s5aLfh6D2DECnYqNB11PM1G+
         HyLnOLDWTGwv2Re20VBeE0gARUlol/sMmdLO/C7TmrH0YZj713Sdy9aE6r7VUvwLz9X1
         FlIuovKDycqsluLehaQneSWMRxKHUaR8xMfJgNfaUkWsGBsvMfxmBNz6GxaqTPKJcTWr
         rNY5VUnZoVgSEvJ7Bx1KGJoPmxCdaN7850z/TCEnC0xF31u4yx78lNeqe0DNOaIR6FzK
         fZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785490937; x=1786095737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kndbL1WYWRnbylNGfVVjyaYdbj/n6MK/vKmn3IV2Im0=;
        b=RUdwnWyEk2+tPYI1DZ3rmU5wFSNHnAUz2x9yz5lD2M7vWKCWQs1WvYlBnW7I9ZsRER
         +gCG3m7lsL64AqMwurPsqrKIjbmBml22U0IV9bG0wOIfOsOXbOJDXlJF5ySdIIDottek
         /ylcGOel0IrxPWTHe1aJuIfL3cGGUAGgaZEsDl8DJpB/Rp9xdbyRPJU0duRonCCTG25S
         YwIWhICTRM86K8JWUA+LITasb6hBC8oktt7mkGKAOsFs6HXJkddMKLasQCfCYrui0jeQ
         0wslHMlosvOJHm3FdwmkAso9QERiHFGmBtkn4k0Pzy1WGpv1+QqS1gh+AfFayVoKhU8y
         TrVg==
X-Gm-Message-State: AOJu0Yx2OWTKlP+lsF3T4YUwvsp/gRZk7fu0s6JvYE2o7lmA4YjCGI83
	JesJEnC4sL+yuVZvKCfZriVHAWZpgyUJFkSWiAOmp4168qZDH/6oDMoh
X-Gm-Gg: AR+sD10xsGGVVDu1tACtAZL8lp4MVIPcmKTLUwIcq5PkZSgHEmcSa0Y6ENGunvPSPGj
	5fyd/qs7MTwHR3wqrUisxAFAILg9g2IJSls4seDJG4jbHC03aURaGgkE4iucKPGqOIy1Gopap31
	01ADWlGuMOpp7MEOXQAgyjczC1OTWMRPnajD2NghOiIE9WfKEzTSaM5uYpiX/fCNshse0GZaFWT
	yYdGDVPKim3H1g8IIkGYE4zTUGsx/vaM+k2Uy6i5MohGhnc0JnjNXfDOIe6EkwHY2InnhSsy0Xp
	PRcvp2wOwexiM8gyyQXG3SLRsGBLInxjrcHZrbMeDzRc1h010lDuCLKBVF0QT2iFWjC65mfSYLt
	yJwyCPzGG9dNTi/iUmfbGkII07WiOZaHu0FJaKHUle1tRiiY63P5z2oxpOKLsuJmt+eJWQnnkv8
	WwujjA2PzDvg9AGkQLv4LVD3Is65uZjCslTEUQLUEPh5fFkY6c4/iHHY5rA6xeXeVOKLErAoYpi
	47Jzd7pwF94D+DG9Qqj6wcjSi0=
X-Received: by 2002:a05:6512:3e10:b0:5b2:925d:6c6f with SMTP id 2adb3069b0e04-5b2e1ff0365mr320415e87.34.1785490936676;
        Fri, 31 Jul 2026 02:42:16 -0700 (PDT)
Received: from zbok.dom.lan (89-79-165-104.dynamic.play.pl. [89.79.165.104])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e23cb4f1sm204595e87.18.2026.07.31.02.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 02:42:16 -0700 (PDT)
From: Kamil Bienkiewicz <perceivalpercy@gmail.com>
To: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>
Cc: ath12k@lists.infradead.org
Subject: [BUG] ath12k: NULL deref in ath12k_mac_op_hw_scan() when a scan is requested during firmware recovery (IPQ5332 + QCN9274)
Date: Fri, 31 Jul 2026 11:41:41 +0200
Message-ID: <20260731094141.2410630-1-perceivalpercy@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_024219_380925_4E133DF6 
X-CRM114-Status: UNSURE (   9.59  )
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

Hi,

A scan request that arrives while the device is recovering from a firmware
crash oopses the kernel in ath12k_mac_op_hw_scan(). Because the oops reboots
the AP and the same firmware crash tends to recur on the next boot, this
presents as a boot loop rather than a one-off crash.

Hardware:  GL.iNet GL-BE9300 (Flint 3) - IPQ5332 (ath12k_wifi7 AHB, 2.4 GHz)
           + QCN9274 (ath12k_wifi7_pci, 5/6 GHz)
Kernel:    6.18.39, OpenWrt build, ath12k as out-of-tree module (Tainted: O)
Firmware:  fw_version 0x160484db, build 2025-12-09 20:09
Trigger:   hostapd's 20/40 MHz coexistence scan (HT_SCAN) on 2.4 GHz

Sequence, single boot, kernel timestamps:

  [39.670790] qcom-wcss-secure-pil d100000.remoteproc: fatal error without message
  [39.670790] remoteproc remoteproc0: crash detected in q6wcss: type fatal error
  [39.684304] remoteproc remoteproc0: recovering q6wcss
  [55.548545] ath12k_wifi7_pci 0001:01:00.0: firmware crashed: MHI_CB_EE_RDDM
  [56.476959] ath12k_wifi7_pci 0001:01:00.0: Uploading coredump
  [57.777482] Unable to handle kernel access to user memory outside uaccess
              routines at virtual address 0000000000001508
  [57.836328] [0000000000001508] pgd=0000000000000000, p4d=0000000000000000,
              pud=0000000000000000
  [57.842705] Internal error: Oops: 0000000096000005 [#1]  SMP
  [57.889448] CPU: 3 UID: 101 PID: 3410 Comm: hostapd Tainted: G O 6.18.39 #0
  [57.929380] pc : ath12k_mac_op_hw_scan+0x2a0/0x714 [ath12k]
  [57.936322] lr : ath12k_mac_op_hw_scan+0x260/0x714 [ath12k]

  Call trace:
    ath12k_mac_op_hw_scan+0x2a0/0x714 [ath12k] (P)
    ieee80211_can_leave_ch+0x500/0x7a8 [mac80211]
    ieee80211_request_scan+0x10/0x20 [mac80211]
    ieee80211_scan+0x74/0x80 [mac80211]
    cfg80211_scan+0x178/0x1dc [cfg80211]
    nl80211_trigger_scan+0x4ec/0x754 [cfg80211]
    genl_family_rcv_msg_doit+0xcc/0x140
    genl_rcv_msg+0x1b8/0x250
    netlink_rcv_skb+0x60/0x130
    genl_rcv+0x38/0x50
    netlink_unicast+0x210/0x308
    netlink_sendmsg+0x178/0x380
    ____sys_sendmsg+0x1e8/0x250
    ___sys_sendmsg+0x80/0xc8
    __sys_sendmsg+0x60/0xc4
    __arm64_sys_sendmsg+0x24/0x34
    invoke_syscall.constprop.0+0x4c/0xc0
    do_el0_svc+0x40/0xc0
    el0_svc+0x24/0xd0
    el0t_64_sync_handler+0xa0/0xf0
    el0t_64_sync+0x180/0x184
  Code: 93407e78 f9435c15 b40000f5 f9400ab9 (f94a8720)

The faulting address 0x1508 is a small structure offset from a NULL base,
not a wild pointer, so this looks like a member being read off a pointer
that is NULL while the device is in recovery.

Why hostapd keeps asking:

Both radios go down first - the AHB q6wcss takes a fatal error, then the
PCIe QCN9274 enters MHI RDDM. hostapd is meanwhile bringing up a 40 MHz BSS
on 2.4 GHz, which requires the 20/40 MHz coexistence scan, and its scan
requests are rejected while the hardware is busy:

  hostapd: phy0.0-ap0: interface state COUNTRY_UPDATE->HT_SCAN
  hostapd: Failed to request a scan of neighboring BSSes ret=-16
           (Resource busy) - try to scan again

hostapd retries, so the driver is asked to scan repeatedly for as long as
recovery lasts, and one of those requests hits the window where the oops
occurs. This is why it reproduces most reliably on the first boot after a
flash, when all three radios initialise simultaneously.

Workaround that avoids the trigger entirely (does not fix the driver):
configure 2.4 GHz for 20 MHz, or set noscan=1 in hostapd, so no coexistence
scan is ever requested. Both stop the crash here.

Suggested direction: ath12k_mac_op_hw_scan() should fail the scan with
-EBUSY (or -ENETDOWN) while the device is in recovery / not fully
reinitialised, rather than proceeding to dereference. mac80211 and hostapd
both handle a rejected scan gracefully - hostapd already retries on -EBUSY.

I have the full pstore dumps (dmesg-ramoops with the complete log from boot
to oops, plus the previous boot's console) and can provide them, test
patches on this hardware, or run with extra instrumentation. The board has
no usable serial console, so the trace above was recovered via ramoops.

Thanks,
Kamil Bienkiewicz

