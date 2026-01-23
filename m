Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFBDD74EED
	for <ath12k@archiver.kernel.org>; Fri, 23 Jan 2026 15:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vRv1BELzJOlqLUHCgkqA639wC5nhEL8ETIdNyZ1IXs=; b=Sdkje6qw1yUXXtCP8Yh1Zbfqgn
	bKXb8RCa7dw2Dj6PMBX55RkNn0/GuoOqPQ6F/BD6HFwjYjRTkA8IwTc/WwL8bJfBSgcA3mPKGCLiM
	7A3wIAMG5eZOVRxmuvugxt0pF/8Q2ugLY+haO0j7OU+ya4WHiTXWQyiNKaZwzX/Ns5RWxKZ8Aqoj4
	uqfCpbg3GpsOiINBCQOzodDJ31Y/QU8hDg7dwRTEBeppGJFl+4mLeoe3186uwnI8bgjEeGX21TaUf
	6aeroUXvqNHNAXcYOZC/Z6z702RKhKg6/jN2mPImb4u+DadbUU3r1DjI0zqZ4FJ62VdlY/ZPntyz2
	k7kDT1xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJY5-0000000980G-1RN2;
	Fri, 23 Jan 2026 15:58:13 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJY2-000000097yi-2l3p
	for ath12k@lists.infradead.org;
	Fri, 23 Jan 2026 15:58:12 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-34c5f0222b0so1348045a91.3
        for <ath12k@lists.infradead.org>; Fri, 23 Jan 2026 07:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769183889; x=1769788689; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vRv1BELzJOlqLUHCgkqA639wC5nhEL8ETIdNyZ1IXs=;
        b=XLWNCpo5NH9fuHcparOjBsBpCcpNuDPLojstiTdM2c53eiAe7VYkW8LbGxyYU4fcS8
         3tcXDjfyhh8djbn8ltBxC9fAav1xBQVBJEHSMCW31zf5rWXfmf/GhN0GvAfN1+GmaH9d
         5aVaYfiEv30kRrJDb18dCMLDlDTPYdnt1AJNZBjj93B4eoVO4LU7gp5XQAmeCn5FsqRK
         +BFX3ecMXJIPMUS5KMbAcsXDX1JIGqujt40RnXsc+qCy0kSqK9B93hBbPvLvCgqvS0/s
         0xUcHSVh2tHP9Wo8jOm7oWcEOTLsiS3RUBFpeehcQVswgu+RauGuY/oyrEeZtBtQLT8f
         gbeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769183889; x=1769788689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4vRv1BELzJOlqLUHCgkqA639wC5nhEL8ETIdNyZ1IXs=;
        b=RbuHhkieawCuzjyWAUTC7K9uZ58K/B09tK2GmqJprPeRQEoKCRdL6ef5qVNfaDEzCj
         XDugY8m+6D3XWyHwJ+07kPkbqSE4+QjakOOhOwi5YfBbPilbMMzFl+g7X4coqnzu4rWC
         Gy0pywMMwuuY+tAWNz/uby4E+3CUMVVNP4MjHG98FA7B76+vZm4tAhe4ujJAVgSJmOjX
         Q4kMVT3jTODcCCjJFu8ZDguRYAcDbnrR9/z6wI+cKjVJhr22j+uHvtI78vdsYgUZDqD3
         KQt7VMLd3lxyY/p6GIrksUvpMhNrY9I8Sl6xdsP2ZIqfXJ7qBG1KIFa+ij4f5WaBMJKK
         nbsg==
X-Gm-Message-State: AOJu0YyK1j6GCCKVqsARiMbyJtqY1DL8o1kYEOHi+dn5hQ1iqEU51tFE
	u5Wc6wdupdZ5Ce+JWRB14lqOdTHAhYTe4KqvJsfv0hgNjtQDUsSQzLlLU4oMRr3f
X-Gm-Gg: AZuq6aI/aYFuK0I7OISClKX5d5OuKIVtvOmAlFDZucJra0R259Q6tuc0kV9WtmPAkPU
	JrIwg6+afw4NvBv3bZO5kv7vLncwF9VQzlnxIOFgECfwS5/zSSvFNd9hyK+V6MrbP0t3EC3Zc5m
	xNPdPSXLmQ9i4kyXBI8cRljOGJdLNGpGFnYPwtbChRQsYIhZ95RReEI/uAs9GLR1+ftRMrSrdu+
	99lrNU4pw8bsj/+vTnti6uEG5jgQ4iMWyDDk+z6I7/4w4SI9RGYED/3KEIvPiJxidZj77wkLuA1
	m1kiWq+jUH9jXILbQ2Ydlyqx1jlcvR5N2j7J8ipHaG4nypiQKQzaJl88AptThO4dCLCyI5bJKLS
	AoICVELfEz3XPyPfduJ3MsVu8z1HIHoflnFY+qLEiw1ULqQmZTNlgxAoTKjI9AIWQlvslCv/Qyk
	dZi5KLhRzmDD78IbRXtS3kb/75TpgPN2QHTaZP
X-Received: by 2002:a17:90b:4d0b:b0:34c:3501:d118 with SMTP id 98e67ed59e1d1-35367010b69mr2822214a91.1.1769183889197;
        Fri, 23 Jan 2026 07:58:09 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:dfb6:6b31:aa17:2446])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35335206b23sm5489305a91.3.2026.01.23.07.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 07:58:08 -0800 (PST)
From: Saikiran <bjsaikiran@gmail.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	kvalo@kernel.org,
	Saikiran <bjsaikiran@gmail.com>
Subject: [PATCH] wifi: ath12k: Fix invalid frequency error in freq_to_idx
Date: Fri, 23 Jan 2026 21:27:50 +0530
Message-ID: <20260123155750.6007-6-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260123155750.6007-1-bjsaikiran@gmail.com>
References: <20260123155750.6007-1-bjsaikiran@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_075811_417210_65E066E9 
X-CRM114-Status: GOOD (  11.49  )
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

During suspend/resume, the following error is observed in dmesg:
  ath12k_pci 0004:01:00.0: chan info: invalid frequency <freq> (idx 101 out of bounds)

This occurs because freq_to_idx() incorrectly filters channels based on
ar->freq_range.start_freq and ar->freq_range.end_freq. These values can be
temporarily zeroed out (e.g., during regulatory updates or suspend/resume
sequences) while the hardware is still operational or reporting status.

When these values are zero, the filter skips all valid channels, causing
the function to return the total channel count (e.g. 101) instead of the
actual index, triggering the out-of-bounds warning.

Remove the broken frequency range filtering from freq_to_idx(). Channel
mapping should depend only on the hardware band definition, not on the
transient regulatory frequency range. This mirrors the fix recently applied
to ath12k_reg_update_chan_list().

Tested-on: Lenovo Yoga Slim 7x

Signed-off-by: Saikiran <bjsaikiran@gmail.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index be8b2943094f..bef1b324b62c 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -6576,11 +6576,7 @@ static int freq_to_idx(struct ath12k *ar, int freq)
 			continue;
 
 		for (ch = 0; ch < sband->n_channels; ch++, idx++) {
-			if (sband->channels[ch].center_freq <
-			    KHZ_TO_MHZ(ar->freq_range.start_freq) ||
-			    sband->channels[ch].center_freq >
-			    KHZ_TO_MHZ(ar->freq_range.end_freq))
-				continue;
+
 
 			if (sband->channels[ch].center_freq == freq)
 				goto exit;
-- 
2.51.0


