Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710B1606A321
	for <ath12k@archiver.kernel.org>; Thu, 12 Nov 2026 11:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Dzb7SJGl;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pdKOAGrE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=p4nfBH0ON7Tagwi81J2nyaY4CDROHtzvnVy5cWouAZs=; b=Dzb7SJGle1dPT0f9C33GVEfat9
	YBA6wo4GTExmM0eZ2ZGJkul7ryvRbhBv0pZiOVAxRyNXIF5ZV/KV0C1KQ9qGODDIUXLoGbpPTMO9e
	Hw6j8/HPQp8kSh3yfMLzofmNY7LmvJxu0i5DiF4LeIf9VMmszN/2WRo/oRDvfCzXzGql/1pzhR2YA
	pohWiwsfETrTuaX9nRkdujbNkrZ2LpV9HtoJapRVpDH6tDMPGKuEPzh6xhedk7WOVmZ9eVrjtzb7Z
	bJ2kJhe8qZgMn2UAIeEbVquDuya9Q3KxnaIW23MHFxUbD6wjZm0wETSKvI8fOZg9wZXSopaO6GDqo
	XLiqKYLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSbV-00000009c7N-0dtg;
	Thu, 12 Nov 2026 11:04:29 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSbS-00000009c6v-2XhU
	for ath12k@lists.infradead.org;
	Thu, 12 Nov 2026 11:04:27 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso36270235e9.3
        for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 03:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794481465; x=1795086265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p4nfBH0ON7Tagwi81J2nyaY4CDROHtzvnVy5cWouAZs=;
        b=pdKOAGrEmiOAsXgXO48stWCQ0Hx2fH0ygmCVj6Wec6QDzHiF2KQNrPQtQ+vFQuOeOg
         uYUorYpJEqXRrHPEwOmjvTM4OKXCTqKyHkjR8cNIqPKDpdzvPTOnKkSXgufBU2A52a8V
         mgq+LahVL9HN52Y4PeiGe+zhAIWzDNR2mRYwJHrZuyyyKaTbCDrHfN3e+20gU+lR8ZVz
         Wm3YdjUaZW7H1GIYfyGnfRxwLBmstgwoFFEtTrQO71x3k5XPJGlAL72YZWZ7fuH2r8Cg
         OPOLNJPRxvXGNb0X89MUS8BuFKvzj3u+jsPIcw/W6/750b+IusFcdysO64TEoiIt/LW4
         ZGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794481465; x=1795086265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p4nfBH0ON7Tagwi81J2nyaY4CDROHtzvnVy5cWouAZs=;
        b=TEsYYtKJSHLPM0e7BegaiRacgGWF+3PGQk0D7SOJEiKiDQxTH+uS1XDg5D4SfbfuwH
         ygMsqv6nJbPeuBSXrQ+77Fsrk5mpWFgdvbeuhkvmGrIezdAherSrNpQFyHPyGkDDOICI
         qSNsBIhNFfko5uSc67qhVFBs5fDCFZJ8ohof9nxK9psAxyb0rPrL+bzrwClvTnua9miM
         CzNuG89mNJaj2xHp1l32DolBE9GdQ//sEgkqek/95fecUyPHa8dEL6iGjnQMmMBmCXg5
         KNJqiSbYdJqi5QgdCvGDa3J8CpXJOiDYAK52HMLhyyWlh7pbXtp9NGqllg0TDV/ekdsU
         +N0g==
X-Forwarded-Encrypted: i=1; AL+hErFre3+CwoSef7F5z19/qeolpADqZB+NOEcHNrzYgLHCXmGsFD4nPqSsuUjougn1Yl5uW5jXFhU=@lists.infradead.org
X-Gm-Message-State: APuU4Z9N8O4cCwUt5OeYJTbGTynbwLIa+HRLpZZqbQPqv0HEiUMrpKL/
	BP8eBW++DYv4hMHYTEXDE6aSS8e0TzsXHCe0Osw14pxFiNtdsFTITBES
X-Gm-Gg: AYBFou0o19LE5lm6tAsuJwD45y5gC1OP9iydCfFKce8XJf1AI0wvDkRFcCOOJv/L0jS
	6sGs3q7/TRCtgJecIQ3MYdFbOJvDBW8zxl17AKpThJk6oOgOLbDY5OPSvwSnNeLVjFsY+qxfjPV
	ggZLZWn9t/jzs1o3JuJWSyyuShDFlf1fU+hxbRrZUCR2TueBTYa47BdoAlw/F+bI4kAH/n/aKT9
	IeZpDKEBJ2sb3JiiLpkBYrHmJZyTi/riqyzEMXVqNxY68Wf722lV22mvQ0ejBDIhElqb5As3YD2
	BY4U6TBYWn/pN05/AeeEtSvkfKxhEYw/n2WVL8Kt7Kb5ds7LJo96VyHlHWfwEMVTErMBM4sh97p
	IGO8HIO9FVydMW/nNqSrRIvX3E07y4WcEP9Fr9Wkh7nee4b26dy3/9zyfmeKE407kmKaZV+Nlic
	GLpeAszru4o9izx7Eizu9L1bDscVzbIevZhxV9y7K8q8YUDaiY7Va/fxvEt7ANpQN48BCSYs8lB
	iu3lfBcMuKa28A6sRUwXfVU5kaLTTvKhuQsWA0Pf1Onq4tGTT73UDoLUO4sSt74xRj6A4Bs8Cf9
	ovAMIuasmbjV5LGzK3GmRkNlZdWcr++sWZwR7G8ds9vgkBOm7gVYtTMZ
X-Received: by 2002:a05:600c:470d:b0:4a2:133:45e1 with SMTP id 5b1f17b1804b1-4ba09380609mr99011215e9.24.1794481464499;
        Thu, 12 Nov 2026 03:04:24 -0800 (PST)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c990sm15301961f8f.3.2026.11.12.03.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:04:24 -0800 (PST)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: ath12k: WCN7880 firmware "NOC ERROR DETECTED" crash during the boot in resume
Date: Thu, 12 Nov 2026 13:04:12 +0200
Message-ID: <20261112110412.1941-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_030426_662593_815F8576 
X-CRM114-Status: GOOD (  14.04  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

The firmware of the WCN7880 in my tablet sometimes crashes while it
boots during a resume from s2idle. The driver side is covered by the
series at [1]; this mail is about the crash itself, in case it is known
or somebody with the firmware sources can tell what it is.

Platform:
- OnePlus Pad 3, SM8750, WCN7880 hw2.0 (PCI 17cb:110e, chip_id 0x2,
  chip_family 0x4, board_id 0xff, soc_id 0x40210200)
- v7.3-rc5 plus board patches. ath12k does not support this chip
  upstream; I run it with an out-of-tree patch that adds it as a
  WCN7850 derivative
- firmware from the device's stock image:
  WLAN.GNG.1.0-03342-QCAGNGSWPL_V1.0_V2.0_SILICONZ-1.81206.153
  (fw_version 0x10097fff, build timestamp 2025-11-18 09:48)
- no WoWLAN: ath12k_core_suspend_late() powers the device down and
  ath12k_core_resume_early() boots the firmware again

What happens
------------
In 1 of 64 and in 1 of 240 suspend/resume cycles the firmware goes to
RDDM early in that boot. Both times the crash reason of the firmware
is the same:

  NOC_error_patched.c:437:0x8NOC ERROR DETECTED.

I have seen this crash reason only on the boot in resume. With WoWLAN
enabled the device is not powered down in suspend and there is no such
boot.

Questions
---------
1. Is this a known firmware problem, and is there a firmware for the
   WCN7880 newer than the one above?
2. Can anybody tell what the firmware accesses when it reports this?
   If it is a block that needs a clock or a power rail the host is
   responsible for during the boot, I can check that side on this
   board.
3. Is there anything the host should do differently before it boots
   the firmware in resume (a delay after power up, a reset sequence)
   that the WCN7850 does not need?

Thanks,
Vladyslav

I used an AI assistant (Claude) for the analysis and to draft this
report; I reviewed the result and ran the tests on my device.

[1] https://lore.kernel.org/all/20261112110008.1229-1-tvlad744@gmail.com/

