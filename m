Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDFDC02196
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 04:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tuQlDAC1uyRPPd0Q4t6t3ezvkbclNHfIbx+5IkTBwug=; b=0SxAqmgzFdjyYD506WVCtR8dsz
	kZOs97TlnFO7tJ8oeCej8I2LcZ12kBF0ZTBc7qVC2B3idxJJwCqm321GHEj56yM878L4ag/yBJgt7
	ME6RTTaZyAJPRxqMFzCFaSEnuCziE0TQx22t59ZUSRXdp8sLyDAOeXvNYZdTLL6+feAhInXN7+taW
	LNttznRbBNP8wJbbwcZ+EYTyjPKdUNrgoAraMqUkeEafeNQl2oOt9oYZ8gZlS/x1tTn/KkAhzOT51
	g9cyuYoBVziAXKuwywI4HHQqa3cGDGqFJvvuBaxv2hf2ASEtRw6qb/EXq1RIffqsci2F4u8+sWQ1X
	KWeH8LEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfATn-0000000HDy3-0CwR
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 04:24:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfATk-0000000HDwW-3P5Y
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 04:24:06 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513Ipq2r006214
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 04:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tuQlDAC1uyRPPd0Q4t6t3ezvkbclNHfIbx+5IkTBwug=; b=DgqKHV0h1jrfEX/d
	rh8PTezs0abJW+KW4BAl/Sg6Rd70DaUtuAQJJ94j/stW8Mfl/FZ0IgPxFcrKaHzQ
	VRK5aJVgD3QDot8LFoxaOKGxRZguloKI3GwkP/HQVG2dkhKU5axEyvO15FBsqNIW
	BMSyXlmeclJtjLltsSZWD9tBI19Wb7YRhxH38A+tYuh/j1ZO6i0oUvt2ebEVHCGw
	jmEZNHWEm0pjTefi9as/3ve4BcneeFrEjJbucdoK2zDoPBiDnUOf11wygoUuL14c
	HsYAEniao7nSSa+HnkMuo23Nb1emRYXtGwvPvDA8/C3UupCSC8g/wUmsaaVOyxld
	jp0jAA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k3ex10sd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 04:24:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-21638389f63so87931835ad.1
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 20:24:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738643042; x=1739247842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tuQlDAC1uyRPPd0Q4t6t3ezvkbclNHfIbx+5IkTBwug=;
        b=CHlLGSc4ggAUkadH/iECB2doCre+R/SwfdB34Sq3u3Ij4y8YF0BKttikOx06LOqPvt
         6y8IlMjgaDlAGjbY9szmlCu6qBRzYD9OEML0ySsJ8GFSl8SNLxdR3niM17pOsG/BCFU+
         abdWV5jxzXkeItqC9S7i+is6Vp6SyXG2UcXnuZeFHcYmvuOBQq8lh9ggmpEmXMax0zDm
         v+oYiAycA43JXA9F8+cQmjS3OJEX9grQf6QSUpfp5IT436Qjo0E4rie8QBULDHlGejbc
         Xpun/AnBtP4b0S27R0yRd1Pe/oKc40afWG6nKCZ9cSH8IBfrwnVd6hEYqrsA+CJEPBz+
         KMrg==
X-Forwarded-Encrypted: i=1; AJvYcCX/OMhSvhsfBjfXDwmLZjrUrSie4uA1lTbMsXhSNN68dUZwg27WxgkPNFOJ16ybiTf6tg9ORAI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx97aR8g+3UiHJ/tGZMMKG0DUFRTZxkFYlQwuZk3qZkEDHFDmiD
	gfbMA3ESAoqopKLOHjpYruN7bRrUlUFuR2yZ90RYcnD+tNtVjknLQqfCKKc4/N0Nh8GRk1vgvrd
	hRnPpVTGAOFNONm3JZMvjjbcvMwKXTk4TEQVis7Yba5ekwhDJXK8sCDWkONhJCqEBj1Bb
X-Gm-Gg: ASbGncshGrPynBLDfHl2lYd1RtF6Ellw0vtC7tUD8pEv5A5kmL7dLMRnEQifPZOAaNU
	LRRtIh0YY3gs/e4cd3QKtIGLkjVpOLEJgYvb0vWdNgE+OAOshSYgyoFMLmVO2uG48iN9KebbM+X
	9ch1JGFNCp2CgFsAlMnx0SHrycBxBV2NdOv+88tdFlWmvoltM5d8uzVM0RRvp2cUUW4yT4fgcSC
	0b/nVaqgWpi0eRAc4ZHwc1ygSzyhO9GKfMJdPIwQhfCY52bR9POmxAOWdtJJjTxje2m9Ls8/uRD
	L2pAH2ZETuI7dmSFE3YjGDy0JYLPETlS7CX1sw/rjC0iy2ggfD4pkfBstZCl+0leJPlxhbK/6BL
	BLNAjtxT9DBAkMuJMEJSse4SuZlnhPw==
X-Received: by 2002:a05:6a21:789b:b0:1eb:7da4:305d with SMTP id adf61e73a8af0-1ed7a5fb009mr40651213637.18.1738643042493;
        Mon, 03 Feb 2025 20:24:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENPasXrHF+Zec4r5yajnE82atYqWgoMYGed6rRtM6Ksm5rh+X8ASOmkezqS1ZZD4BU6HbCbg==
X-Received: by 2002:a05:6a21:789b:b0:1eb:7da4:305d with SMTP id adf61e73a8af0-1ed7a5fb009mr40651164637.18.1738643041997;
        Mon, 03 Feb 2025 20:24:01 -0800 (PST)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec04796e1sm8897144a12.58.2025.02.03.20.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 20:24:01 -0800 (PST)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 04 Feb 2025 09:53:42 +0530
Subject: [PATCH 2/8] wifi: ath12k: introduce ath12k_generic_dbg()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-unlink_link_arvif_from_chanctx-v1-2-675bd4cea339@oss.qualcomm.com>
References: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: cwo3gw3CU-EK2yo2D5zfgo8fOKcN-nP-
X-Proofpoint-GUID: cwo3gw3CU-EK2yo2D5zfgo8fOKcN-nP-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502040032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_202404_977107_0C711CA3 
X-CRM114-Status: GOOD (  14.88  )
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

There might be instances where ath12k_dbg() is needed, but access to
struct ath12k_base (ab) is not readily available. To address this, add
support to print the debug message using printk() when ab is not present.

To avoid the need to explicitly pass NULL each time, introduce a new macro
ath12k_generic_dbg() which resolves to ath12k_dbg() with ab set to NULL.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debug.c | 5 ++++-
 drivers/net/wireless/ath/ath12k/debug.h | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/debug.c b/drivers/net/wireless/ath/ath12k/debug.c
index fd9796b5ad3b9feea5c7e78e8a88d361049e08df..5ce100cd9a9d16f7fcc2dc0a5522b341ebbff8a3 100644
--- a/drivers/net/wireless/ath/ath12k/debug.c
+++ b/drivers/net/wireless/ath/ath12k/debug.c
@@ -63,7 +63,10 @@ void __ath12k_dbg(struct ath12k_base *ab, enum ath12k_debug_mask mask,
 	vaf.fmt = fmt;
 	vaf.va = &args;
 
-	dev_printk(KERN_DEBUG, ab->dev, "%pV", &vaf);
+	if (likely(ab))
+		dev_printk(KERN_DEBUG, ab->dev, "%pV", &vaf);
+	else
+		printk(KERN_DEBUG "ath12k: %pV", &vaf);
 
 	/* TODO: trace log */
 
diff --git a/drivers/net/wireless/ath/ath12k/debug.h b/drivers/net/wireless/ath/ath12k/debug.h
index ba0e4da3bb761a49fb81e3efcb61557df8ad1942..48916e4e1f6014055bbd56d5c71ef9182c78f3b6 100644
--- a/drivers/net/wireless/ath/ath12k/debug.h
+++ b/drivers/net/wireless/ath/ath12k/debug.h
@@ -69,4 +69,7 @@ do {								\
 		__ath12k_dbg(ab, mask, fmt, ##__VA_ARGS__);	\
 } while (0)
 
+#define ath12k_generic_dbg(dbg_mask, fmt, ...)			\
+	ath12k_dbg(NULL, dbg_mask, fmt, ##__VA_ARGS__)
+
 #endif /* _ATH12K_DEBUG_H_ */

-- 
2.34.1


