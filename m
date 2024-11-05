Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608FBD12677
	for <ath12k@archiver.kernel.org>; Tue,  5 Nov 2024 10:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qso3BNgt6veXyizsNwyMPr4H1EWMOffJ4h1epwKOSNQ=; b=D1FDCg+NuWVgjBfzcPJdGR9e1j
	L75JeHdUw1mKZPNlPf+6dg1qTo+k5AqaJiNlfkkgavyNwKQTMaR4mra2nFRJIBR3p7H0Vt6qukhcA
	ItSGjGKLSyeSl5KCuGNKdYDi6l0QIBhbxiG2a5GQTX7wKganzXpuMATXX8PbZIO8hkHDgxuU+MxwK
	C3TwHokyu8pwBsdUXOK3RyMtiEP5ACAiARGfdO8iMAUjh5bs0y/ef2wizB1Scn5gfNAZmZEbBZIrk
	1yRmiCz6FEhDr1f9JSDPxCnh6KGVx4jBk1l47Wr0PUTMdN7t+QrqJlHnWPaU803w0aqomKr7eb/9u
	go6bgRHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8GXE-0000000GdZS-0Uva
	for ath12k@archiver.kernel.org;
	Tue, 05 Nov 2024 10:11:40 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8GXB-0000000GdZ5-1ytl
	for ath12k@lists.infradead.org;
	Tue, 05 Nov 2024 10:11:39 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a998a5ca499so694927166b.0
        for <ath12k@lists.infradead.org>; Tue, 05 Nov 2024 02:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730801495; x=1731406295; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qso3BNgt6veXyizsNwyMPr4H1EWMOffJ4h1epwKOSNQ=;
        b=DTJzfVuGFMbplzvV508qvn1btBZibTX+TFm93RQwMMbXVeyPh+4EVsCXHciHhNJZFL
         cPro+/EMalyylI2T9uP5Qzc9MgsVQgCFhDpPGVcrbG2zScEG4QEoaMlWb8rCOozMboKx
         Yud4Sa8gefeICxDGh4EkzqZB4GmBTS176dyCdOouZjB75ByrnDooitxfMh0z9ZpQbJjF
         AWj291X5hj5mWLY61xy9CI4Tuh18zwOhO8RL2fQ1UekDbL24+FOUzzMz2Cke6V7puq1f
         NUpGm1CWeu2mzyVqeLLa5LChteVJrm2j0ak6hH9kmYDRQN6QbXhgj2AH7JNTXIMPXk2M
         bDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730801495; x=1731406295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qso3BNgt6veXyizsNwyMPr4H1EWMOffJ4h1epwKOSNQ=;
        b=ZBnrbK6B871BWgRD6lgu0waGEZBjIzJtGy+j4Rfah+y8y7EOywImaQQJTCch0iHBEa
         zRBueCSmRCLaqidUIhCYIjODDysAhO/2tJUh2yAfv9EjxdR89IUq8qRu8fI/4rhIlrGe
         Fwk00WS5ebYTRviPurScZ5oWoWKxqcPptnIV663sRAjGbgzJOrw8C0RusAuUIZcTnBqZ
         TCJ8UKGoDABZgpVNd4N2h58fJNMEaOCTw6lvV2HT0lnIb0Fys+JRDnj9EBEl0tAJhk5K
         S1VQNu1pHvhumf7OA13ZnIGpfbRuls1fg38/E1Tb69G6m4ClpV8OKU996UM7AfwMFwE+
         3QfQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1GrRc90zlMaZqfWj0mnwu3eTygmQQzHhr8tHBxFAeNZBvweWP4SavWmfT9C+Ij02UsDwr24c=@lists.infradead.org
X-Gm-Message-State: AOJu0YwhvO2X9jalnY2rfw5Fl4b6W1OJnKQ2f5VKS86flokA6hbpM9RA
	Y+1mSXn+S5xejy5aibKFAcD2j8U1Y3Z0s77FA1Cynk2eMctPGvFaJQhPXX3r
X-Google-Smtp-Source: AGHT+IFnWeG5l3Win9wjTzFybRiE4MG/9kCs5ddsSiKv9wYvZpxcQ5x6vD6FqymkY5FYZL7mKz7YcA==
X-Received: by 2002:a17:906:f5a5:b0:a99:8edf:a367 with SMTP id a640c23a62f3a-a9e657fd779mr1437610966b.57.1730801494703;
        Tue, 05 Nov 2024 02:11:34 -0800 (PST)
Received: from C-KP-LP15v.consult.red ([2a01:96e0:10:2:aaca:6c8f:1aec:b83f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16d6714sm113494266b.64.2024.11.05.02.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 02:11:34 -0800 (PST)
From: Karol Przybylski <karprzy7@gmail.com>
To: kvalo@kernel.org,
	jjohnson@kernel.org
Cc: Karol Przybylski <karprzy7@gmail.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCH v3] wifi: ath12k: Fix for out-of bound access error
Date: Tue,  5 Nov 2024 11:11:31 +0100
Message-Id: <20241105101132.374372-1-karprzy7@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_021137_533459_F925C444 
X-CRM114-Status: UNSURE (   9.70  )
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

Selfgen stats are placed in a buffer using print_array_to_buf_index() function.
Array length parameter passed to the function is too big, resulting in possible
out-of bound memory error.
Decreasing buffer size by one fixes faulty upper bound of passed array.

Discovered in coverity scan, CID 1600742 and CID 1600758

Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
---
Changes in v3:
- Code style: added spaces before and after '-'
- Improved commit msg
- Fixed same error in different function
- Link to previous discussion: https://lore.kernel.org/all/08767ff7-f764-473d-a44b-c3c3b1695008@quicinc.com/
---
 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
index 799b865b89e5..2d47aca681f4 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
@@ -1562,7 +1562,7 @@ ath12k_htt_print_tx_selfgen_ac_stats_tlv(const void *tag_buf, u16 tag_len,
 			 le32_to_cpu(htt_stats_buf->ac_mu_mimo_ndp));
 	len += print_array_to_buf_index(buf, len, "ac_mu_mimo_brpollX_tried = ", 1,
 					htt_stats_buf->ac_mu_mimo_brpoll,
-					ATH12K_HTT_TX_NUM_AC_MUMIMO_USER_STATS, "\n\n");
+					ATH12K_HTT_TX_NUM_AC_MUMIMO_USER_STATS - 1, "\n\n");
 
 	stats_req->buf_len = len;
 }
@@ -1590,7 +1590,7 @@ ath12k_htt_print_tx_selfgen_ax_stats_tlv(const void *tag_buf, u16 tag_len,
 			 le32_to_cpu(htt_stats_buf->ax_mu_mimo_ndp));
 	len += print_array_to_buf_index(buf, len, "ax_mu_mimo_brpollX_tried = ", 1,
 					htt_stats_buf->ax_mu_mimo_brpoll,
-					ATH12K_HTT_TX_NUM_AX_MUMIMO_USER_STATS, "\n");
+					ATH12K_HTT_TX_NUM_AX_MUMIMO_USER_STATS - 1, "\n");
 	len += scnprintf(buf + len, buf_len - len, "ax_basic_trigger = %u\n",
 			 le32_to_cpu(htt_stats_buf->ax_basic_trigger));
 	len += scnprintf(buf + len, buf_len - len, "ax_ulmumimo_total_trigger = %u\n",
-- 
2.34.1


