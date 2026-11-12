Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9935606A31C
	for <ath12k@archiver.kernel.org>; Thu, 12 Nov 2026 11:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T4MeZYFa;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c42fgQ/H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=EHL+ZSQQJOt6k6Fmf6PJcWAXM06Cn8Zw4xySScxtGSI=; b=T4MeZYFa/aQKfuyj7gN7FxtEAK
	Idir04jPGyL1+1QOuJKHtas3ZjzcCoNNmhfedDOS0Ewh+NyjOFMKNyy3mARKoZSWx84JXHl51uSk1
	OZeRfReeUybSzD3gLJJfj1jTsYQ9nSPk0g3HQ7f7f45MP8FKTjxmwBT1kJd6g/FrxxUciFhsd4CPA
	P07sH+KlqDVARny4eLAeWbu3FYDYMLQ4WeqguNDu3O7grzIdRyGjl98m/31nvUfodScflsSeX3GXt
	XVVezwcWcdY0YqyacTyDd87GYal0qo3NnfnDa/2vyHH0DjtkIcF4F5cpQYqd/DXYAuQhR+nA+AftO
	h1+YhJJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSXg-00000009bHv-01ss;
	Thu, 12 Nov 2026 11:00:32 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSXb-00000009bHW-1xDR
	for ath12k@lists.infradead.org;
	Thu, 12 Nov 2026 11:00:29 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48e10a70540so2492976f8f.1
        for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 03:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794481223; x=1795086023; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EHL+ZSQQJOt6k6Fmf6PJcWAXM06Cn8Zw4xySScxtGSI=;
        b=c42fgQ/Hwyamp4PDwfvk1zbP3gX8tn816ULU7bw0B12berYZi9JSXzIra2nfCIvCeg
         oTR/MHWC2TA6OuhQwcZGe3zBJXah/SwWb61O4pZjITozARBMRS+2B5e9tGGYgUinzV9M
         doNn7fzkeR0OAXd76LakIpT79X49ufpeIBQS4rzEDu+3RHL5zYxkYn0cBpjhSUlk4jMJ
         cbdHrqGi9nPKf9/fGN9we1MX3BP25f1njaoLRoFjd/0nk5xQujMMqAB2YNhnzWsZLy2b
         UfCy9CUg3eB0NOIlG167HqAwkuxbilqCuonPmceW9t8p3gbhXFldlKq+qOEe6rdwWqvL
         s8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794481223; x=1795086023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EHL+ZSQQJOt6k6Fmf6PJcWAXM06Cn8Zw4xySScxtGSI=;
        b=AfMTpYyGekXOQLH75rdl4j0EE4wIKLN8IIeihPR7Wv0ZEVSDrtWKINKVhHfNIrDs3b
         oNuJNunSsM4ce0SqpeBc6U3SEht2F0TA0cDT+zGH/LNP1aJh1od0/V24gndgVrP7s745
         g59m0L7TmnGRJdZtNMZrYAX9y1GnL7Qxb8W/PTNUZfhuX2Q6JZRe55Sks0ViPqsL7bSN
         QDNEKB0sMlVdDw5KYEuVHAepPjWGS+Et63u2xNskWqnJF5JNAmTTHmr/EouUDPd7H7lD
         JuN0kbjNKajQoRucKbaeVbEWAkU1p983EXXgtc6gaa/8ZI2IxqJAkYs9KnDLdHK60L3c
         RMSw==
X-Forwarded-Encrypted: i=1; AL+hErGu3+g0M6lwCTjdMMucPY8Kx/q8Rnm+oI3vV1s2z+9lzhJGX52kvwdLNDPwmkflX5ZL3p+YUQ0=@lists.infradead.org
X-Gm-Message-State: APuU4Z8CycE9dRXByK9leEF/DPIEMaZSRpmw7NgqR0EkruePwmNlgEvL
	KXO2lYVkHPwkZMPz4P6YPFVvtSlCyV1dmD1Bay9ha7RDypHbMMOPPq1W
X-Gm-Gg: AYBFou3AlfcdFgwndgZ8D/JibrKGtlapsidhqqBenkO1oMvjeZTIxa3qzdR0AdJXMGL
	Mj2Ci1EiWL/dzUr2yZFH+3PTRxWfwF9W+9qi5mlvMmWz6XmBiUiMwDkKhWC6XiFSbObIkI3AP9p
	gvjcaRCduTOoeGiDJIXrNI1imh+lFR1P9N2zikL+HTygmTfMAA9UcSHAX/OcmH80yTBUWMKMg/9
	loytnc0oLO6vu0YjeC+ujqzxT8bIr3tKihoEQVtA4dF03zetW/I9AQF0Xs+JcBwfgO59AlFYCe1
	ym6puNNbfw2oJ30QWz3Fvs2Aj6eFvZU+Zr0FdW/IMYxTI1hL1wBVxptcHsY8GIFGjIDImLXY2g7
	dkWKTUnm/YuYVLMSzZwtwZ36M0r6TD53QRqvSI/KY/3ia05DtaXFXgQHjPrPbVEKA4w1WGTQOC4
	ZynQpaFMCUbni/xDyZgOPCczedePk01V3bpbUzRmxkTgORIlOeCuN0cmy5i+GSiVvmE+39CavSG
	OpryaFX0o6TR96Vm5jfRpwmbr+qo7qnL3OBRik9VEDimgkaNx2B7oYVS8f7VOp4NsGTVWNF4FJ6
	zQ3aPtI/t8NMpam1lA2UMz08B8tRhpmUhUNZuYhTCVbAGAgKopxX6D8=
X-Received: by 2002:a05:6000:1acc:b0:490:ae2:b841 with SMTP id ffacd0b85a97d-499c64069ddmr9415525f8f.30.1794481222371;
        Thu, 12 Nov 2026 03:00:22 -0800 (PST)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498366c500asm15473859f8f.48.2026.11.12.03.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:00:22 -0800 (PST)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] wifi: ath12k: recover from a firmware crash during resume
Date: Thu, 12 Nov 2026 13:00:04 +0200
Message-ID: <20261112110008.1229-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_030027_862877_B69D67F8 
X-CRM114-Status: GOOD (  19.71  )
X-Spam-Score: -1.9 (-)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On my device the firmware sometimes crashes during the cold boot of a
resume from s2idle (no WoWLAN, so the device is powered down in
suspend). Without these patches the driver does not recover: the resume
takes 20 s longer, pci_pm_resume returns -110 and the device is dead
until a reboot. Patches 1 and 2 fix that. Patches 3 and 4 fix two
oopses I hit when the firmware crashed more than once in a row while
testing them.

Platform: OnePlus Pad 3 (SM8750) with a WCN7880 hw2.0 (PCI 17cb:110e),
firmware WLAN.GNG.1.0-03342-QCAGNGSWPL_V1.0_V2.0_SILICONZ-1.81206.153.
ath-next does not support this chip; I run it with an out-of-tree patch
that adds it as a WCN7850 derivative, on v7.3-rc5 plus board patches.
For that reason the patches carry no Tested-on tag. On ath-next
(ff4c7359e310) the series is only build tested.

The firmware crash itself is not addressed here; I am sending a
separate report about it. It happened in 1 of 64 and in 1 of 240
suspend cycles.

Tests, all on the tree described above:

- Patches 1-3, crash forced with ath12k_mhi_force_rddm() at the
  ATH12K_QMI_EVENT_FW_READY event of the resume boot: 6 of 6 resumes
  recovered, the link was back 16 s after the resume (6 s without a
  crash). The same build without patch 1 fails like the natural crash
  ("Service connect timeout", "failed to connect to HTT: -110").
- Patches 1-3, no forced crash: 240 suspend cycles, the firmware
  crashed once and the driver recovered, 16 s.
- Patch 4, two forced crashes in a row, the second 3 to 9 s after
  "pdev 0 successfully recovered", followed by "iw scan trigger":
  without the patch the oops in 2 of 2 runs, on the first pair; with
  it 12 pairs without one.

The test hook is not part of the series; I can post it if it is of
use.

Two things I would like comments on:

- Patch 2 lets ath12k_core_resume() return while the reset is still
  running. The alternative I tried, keeping the MHI devices over the
  reset as suspend does (ath12k_hif_power_down(ab, true)), does not
  work: QMI stays silent after the second power up.
- With the series a crash during resume still ends in "Hardware became
  unavailable upon resume" from ieee80211_reconfig(), as the device is
  not up yet when mac80211 resumes, and userspace has to bring the
  interface up again. That is where the 16 s come from. I have not
  tried to change that.

I used an AI assistant (Claude) for the analysis and to draft the
patches and their descriptions; I reviewed the result and ran the tests
on my device.

Vladyslav Tymoshchuk (4):
  wifi: ath12k: disable and enable the CE interrupts only once
  wifi: ath12k: do not wait in resume for a reset that cannot finish
    there
  wifi: ath12k: unregister the thermal devices of a radio only once
  wifi: ath12k: skip the links without a radio when a scan fails

 drivers/net/wireless/ath/ath12k/core.c    | 6 ++++++
 drivers/net/wireless/ath/ath12k/core.h    | 1 +
 drivers/net/wireless/ath/ath12k/mac.c     | 3 +++
 drivers/net/wireless/ath/ath12k/pci.c     | 6 ++++--
 drivers/net/wireless/ath/ath12k/thermal.c | 2 +-
 5 files changed, 15 insertions(+), 3 deletions(-)


base-commit: ff4c7359e310744a7abe53cf66d921fa2969eb19
-- 
2.43.0


