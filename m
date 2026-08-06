Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA24C5AC7A
	for <ath12k@archiver.kernel.org>; Thu,  6 Aug 2026 12:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WfGjm0JB1ke59rn7c3qNVGhDamzhVdkvGmTOqnhyvnI=; b=TuBTMsdr435z3PDRC5FHxCd3Ae
	BLU0c2kLaRpxlDNeJTql130L3OvqM1iXQWOzBZqH8vYK0pNSO31buPfJvcoR2+UvGpgwQF0OrxhEr
	G8aSTQ7wlirn2yde4Wn0Bo5U9OD1mLHIbz/my3fQQlHNGn5zG5VeMAMg/wXhQy+dNcuh41hyvWX1n
	kZzZkuIUGte//GnKaNUjULu/DD7Vw4Y8plUmJC0CA7xFPGEVP2IvLNg1Tg8Wul/PkZHy9Z3wSfrjh
	ebBkrroFufeburCiZQwuj4vpxgXg+cQC5n9Fhz3aU0zepAPd09UEsnNG48uNOjA/AeWqwBGhfk8Hh
	AiTNf4lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwv9-00000005iRk-0GWY;
	Thu, 06 Aug 2026 12:09:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwv6-00000005iQ8-1nU8
	for ath12k@lists.infradead.org;
	Thu, 06 Aug 2026 12:09:57 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769neaG2104769
	for <ath12k@lists.infradead.org>; Thu, 6 Aug 2026 12:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WfGjm0JB1ke
	59rn7c3qNVGhDamzhVdkvGmTOqnhyvnI=; b=AEBPcCUayOYg3mCrdXGgBV4+zWB
	LsETg89VdNaTvutjm/wV5HRvXLhFSDuAGNXcZ7ukEOmxkgFVR6W3MWCuDuPaw27X
	ECPn9RP4Td9xu76z3f5zFfDHBaIVnVtH3VIKOoQfxOVYS2OlHQZ+rYZfRRVVRQ+f
	Ltxt4b/rW+JRFFdw0/M+909SU3Rv0F1Pszr/PVbLZ2FagMEY/Z0Ak0udCXjBfx8s
	UWhLvtEZ1qZYC77nlUICjxPNeIex/bI03xg83VsntE/nQsKKVWcA06665d92p3k/
	Z4MiFkhu8mVkkEDPwmwashGDutAKO8Z4TYtHnUGHJ8LVrkCHUNLOOXbAY2g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvq730vm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 12:09:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso3061164a91.1
        for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 05:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786018195; x=1786622995; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WfGjm0JB1ke59rn7c3qNVGhDamzhVdkvGmTOqnhyvnI=;
        b=TIAnfImf+uFa5iiomo8c2p+QoCYqGTVm1XUhQWMK7DUsT+xdo9q1Cy4FLuTcdSCMhH
         XlLBEyshRzxXjBIITniFxaoyl5sycFsAQgF5k3ABf4V+GRxomFw7FPlwNE5+mGLaN2KB
         tNrKCmvw2GGPz4hy4YBGe8kzQHr/Dl5iBTI6Pe+T2cU31DMI1i0xGKrYhPCzFyMWAWmP
         TE1GkEJde6ZB5X8HxNnw9iGhkS92q+Z7Wh/8Xxt4i7S53ssxgemTPQI8BKgutr48IhrS
         t+vN5ElwMkrwkeSq1d6MUkaNXI/lkEQ4gCNn8vf9cd4epbPVAWntPYhqwFyTBICwB6vE
         DNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786018195; x=1786622995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WfGjm0JB1ke59rn7c3qNVGhDamzhVdkvGmTOqnhyvnI=;
        b=D/E+itYaqCT+F3bbxD7ueybsQ0h7+ocWOYTh8u/MU42fPdyzrQ4rYWuHQrGCem5Qva
         EjqLBdc86k1LBW3/Yjk20lgswQqL8Kacq78nA4LOxq0fg4ZVnzvjWWElk+jb7eKXM9UR
         bH1Y9ZqIFdWLnbcaB7loq9Arh19vNrAm/vIF/P5DGyEEj6TRGe1XVjEUKOIcWiVUJ5qi
         h/UgELqFN+9aBmAhJbTFzI+C5ppwBbv+TP5uetm3TBE0w9j8u7o8FW3FliqSa0dB9TPj
         YluMwZwmGsVUVUFmLSkB7ot9OHngk0J4OIq2Fdaq2STQeoG18AKkUaNc1bHkNo1PvvHj
         bKLA==
X-Gm-Message-State: AOJu0Yzm/ewh/NfRfD9b/lm9Syru9slzzc24Wkr+TvltPQhmryf8j0jG
	VenIViBg0iUnltE8EM5bxmmMwF0n/vqnDimrvp1RKYdBin641iyJup5ZGNkLdvXwbbQQlJfS0YS
	CFNpUu7299pD6S3hPsW8pUJWljFuowUq1iKp7rNGSAX1SConiIAEGoHyWDjB+xsIHsm0p8rQB
X-Gm-Gg: AR+sD11ZvgBW46H5cujpvHLQBWZCgMFAX6IYB+mfg5vWl863ZyrinRznQstDZ6cpIPS
	HHbkbg3MrFBFA3lVpSZmLEXVXjzntaieAA/4Nocp/PpYfhrmkWmcq1c7e3RhtAxISc/oQYp/1fC
	Mtd+D6vQM3/mLTDctn0Sl4bLsK99L/JMwjwaJ+b2EAJ90IBsWR2/4Zgxn+LIMeDuv1jy56+7cLh
	6/wuE0j727iXIabulBsscngFK71ysRTvxh5GkngSv/ttc3hdRWhN9Wp3Kr52vUpN83s5x01xbX0
	02YPGZcBq1eEZx/mqMLt7OlHqgRQNoG6ezypia1rx6frwoIKw9bwQJerrR3Tk1bh/339Mx7Gu9d
	qqdY+LK3eTEgOnszYEVt2DvMcHAjn7y/8nKzjhAfN5ygSmwccwaEI
X-Received: by 2002:a17:90b:56ce:b0:38d:f94d:4c6e with SMTP id 98e67ed59e1d1-3903c5faa8amr15295120a91.17.1786018195021;
        Thu, 06 Aug 2026 05:09:55 -0700 (PDT)
X-Received: by 2002:a17:90b:56ce:b0:38d:f94d:4c6e with SMTP id 98e67ed59e1d1-3903c5faa8amr15295045a91.17.1786018194496;
        Thu, 06 Aug 2026 05:09:54 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085db4a6csm1469079a91.3.2026.08.06.05.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 05:09:53 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next v2 4/8] wifi: ath12k: add device DP stats reset support via debugfs
Date: Thu,  6 Aug 2026 17:39:23 +0530
Message-Id: <20260806120927.3607733-5-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806120927.3607733-1-pardeep.kaur@oss.qualcomm.com>
References: <20260806120927.3607733-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA5NSBTYWx0ZWRfX5mTZjqzlL3yf
 UhMRD8tOzDTMECMjA2HGoc9TFp4UBXsgwriJSyQGdvGGDGbArvkQRYUfq3lfQVQHVBQHlXBcNqz
 lTXqe8IhCROZSVXZNFJSe8hvDkRDsq6kufHW39L1VFb3y5O9htRBST28foP7etXvomOh8w5eHsv
 hTyu7eA63Sso/oI7eq0s6zq3PE55P8Qyfl5iZpq6fRGcgxSMx5XRI51GaZbBXbybx1bLki8ruXH
 IDmjqoFOZa5d8WU5/uTXxqX5rFKVU6i84sszZI0R4BbiXliV8ydG99nMryOfVxJkDHBdv/pmko8
 awXMxD1z9I7CpizedYWsjBDMjQ/Tl1fxXECPlDlBrK9z7RMYqxRm4nGsoTlNPXTDNsFyBK/jVWU
 6St5UPx208apc06jdnON1UcGhOaHy2AjCWKRcXy99gubMwB0baBwD5757p1qRFezx/PfdulYpQM
 NB7X+VpcP03mAUH7REA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA5NSBTYWx0ZWRfXxjU5yxzIpbRD
 sRUcU1z3yRpS4LewOODGP0ROiGB/lXaJgtudufq16UaNvYMj/Pc57Z8BN0oHmmG5jgNb3opRkgU
 pLfhGEMxJaACvqX5h5fxNFzG8pMaI4U=
X-Authority-Analysis: v=2.4 cv=EeH4hvmC c=1 sm=1 tr=0 ts=6a747993 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=_Iy9b4Js2nCRBGGyCYcA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: sGLnIBxNHqRKv4vZzMGMjG_yvghStX21
X-Proofpoint-GUID: sGLnIBxNHqRKv4vZzMGMjG_yvghStX21
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_050956_464946_C507D9E3 
X-CRM114-Status: GOOD (  16.94  )
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

From: Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>

There is no way to reset device DP stats counters without reloading
the driver, making it difficult to isolate issues to a specific time
window during debugging.

Add a write handler to the device_dp_stats debugfs file so that
writing 'reset' clears all device DP stats counters. Change the file
mode from 0400 to 0600 to allow write access. Use strcmp() with
newline stripping to match the input, consistent with the existing
pattern in debugfs.c. Return -EINVAL on unrecognised input.

No lock is taken around the memset since the counters are updated
locklessly in the datapath; taking dp_lock would be misleading as it
does not protect device_stats updates.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1

Signed-off-by: Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
Co-developed-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debugfs.c | 35 ++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index ec49692107a8..0e446a666f4c 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -1220,8 +1220,41 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
 	return ret;
 }
 
+static ssize_t
+ath12k_debugfs_write_device_dp_stats(struct file *file,
+				     const char __user *user_buf,
+				     size_t count, loff_t *ppos)
+{
+	struct ath12k_base *ab = file->private_data;
+	struct ath12k_dp *dp = ath12k_ab_to_dp(ab);
+	struct ath12k_device_dp_stats *device_stats = &dp->device_stats;
+	char buf[20] = {};
+	int ret;
+
+	if (count >= sizeof(buf))
+		return -EINVAL;
+
+	ret = copy_from_user(buf, user_buf, count);
+	if (ret)
+		return -EFAULT;
+
+	/* drop the possible '\n' from the end */
+	if (count > 0 && buf[count - 1] == '\n')
+		buf[count - 1] = '\0';
+
+	if (!strcmp(buf, "reset")) {
+		memset(device_stats, 0, sizeof(*device_stats));
+		return count;
+	}
+
+	ath12k_warn(ab, "unsupported command: %s\n", buf);
+
+	return -EINVAL;
+}
+
 static const struct file_operations fops_device_dp_stats = {
 	.read = ath12k_debugfs_dump_device_dp_stats,
+	.write = ath12k_debugfs_write_device_dp_stats,
 	.open = simple_open,
 	.owner = THIS_MODULE,
 	.llseek = default_llseek,
@@ -1232,7 +1265,7 @@ void ath12k_debugfs_pdev_create(struct ath12k_base *ab)
 	debugfs_create_file("simulate_fw_crash", 0600, ab->debugfs_soc, ab,
 			    &fops_simulate_fw_crash);
 
-	debugfs_create_file("device_dp_stats", 0400, ab->debugfs_soc, ab,
+	debugfs_create_file("device_dp_stats", 0600, ab->debugfs_soc, ab,
 			    &fops_device_dp_stats);
 }
 
-- 
2.34.1


