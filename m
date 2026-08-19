Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9E9C5B572
	for <ath12k@archiver.kernel.org>; Wed, 19 Aug 2026 05:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Jl+qZ1wHSWvkymy30nUvtpy1FLQdNzxtXxhzWo2UWQ=; b=IE+wBfObB2UD3k1d7m9COEZJQm
	MhzjV1d/d0OEw0+uIK24lGUHg+t33vQVSW8iLgr4SPOPa8eEDFQyV5frP4x5WOlC67hNPh1XGE9d8
	X42KYZscydurzzw5tDOwhvRQvPvyoqJCOASe+wpSoJz2qjgSk018Xtx2sWkSiYDPhSlkmLt8D8H1C
	inZiDp1mx/3vtn/jrSkAmGTz4FI6RSoM7YqavfcH9Znzh0MbgWNp0jkNGSPUuMgz5aaCtiE/XHHuG
	y5zmEYGfoO7kwp9bVuPfthZvl/OcUWZSj/pN2V5JX1EqhpJ0EoU8Ypn+tEwMA5c1bDlvzQ03VhA71
	YvdzbCaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwYvj-000000091HU-2Mdv;
	Wed, 19 Aug 2026 05:33:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwYvZ-000000091Ax-0JvY
	for ath12k@lists.infradead.org;
	Wed, 19 Aug 2026 05:33:34 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J5HvBH2999944
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 05:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+Jl+qZ1wHSW
	vkymy30nUvtpy1FLQdNzxtXxhzWo2UWQ=; b=ajgY6QB2hywWiMV/l5a2HrLqLuD
	SRb4MPOgT/CEOd+CbBvdKg0id4XGrSFJ78Y6kDLJxAKIOckeD94wm0q7kMuNGkXN
	VIPy+5osR+ClZ0x7XXQkTB+OHMMVA8HVNBIlRsbKuDXGGSvuEF8KdZNlfeSKCWT1
	ZlUX+NtGfSL3akG2CHydOVhPGm+V7zXEhzxdBtlpkpV/XnmubYyHStoA/XwHQP65
	WBcAbBs7GOGm1M3ru7YtraK+/xYPob7a1Z1Ilh3eBFmbnAKSnCpkp7OQkuVewHB7
	yWPgm0A25URXNNrnx0mcc4Nbw0FTd90O72Li40D9LuAogYuNG9SEPXL0DZw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkhgt1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 05:33:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38fa7b09921so1197593a91.1
        for <ath12k@lists.infradead.org>; Tue, 18 Aug 2026 22:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787117608; x=1787722408; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Jl+qZ1wHSWvkymy30nUvtpy1FLQdNzxtXxhzWo2UWQ=;
        b=hGYF2ZjcMRG0t31irt54xCiyRWc6L/WtPe4EoMvZ18TmGfcOUuBsr7GKYF1M1J0fFs
         bVATtoEmfvfJRi3EIlP4F7eWdQZklsNOPH3wLSuc0TxLfO3uHCwk+BG1T3XscI6rznKe
         m1n1jtc3duujiXHQlfIYNoOqypLJi25IL3NWW7zqMrPmkaM5GEr5ez+z2WYp4f+NEIWt
         W5pefF6HyaMcVrce4WncXT/1tPGsPNsufX1W3A+SldYtqAJZicrq8pkKQoap3soH2OiG
         aVdPmI/ZxMAdRvHaAFo8fE2U2ItfqW7fSAy+iaWp1fi0JfMvOqhMgGbi/k+D2EzdiLN3
         9D+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117608; x=1787722408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Jl+qZ1wHSWvkymy30nUvtpy1FLQdNzxtXxhzWo2UWQ=;
        b=o5hP2aDm5cSRatUOfgoaEZQ5O49uG4kqB/W9aXeDAnGnIbSLeXks7bA/nDloKJZ+M+
         oEZD1ACYl/Bn5BOWDIghzMR/35+F2k3PmajpTfNF5AoLiRh4zHTH2g+AWdwX1V81SJZ3
         S54iHReIp2uSQUb7vbCdNGoiJc96ywFDkrwElpQ28eOBXWvNaCKCLqrIR7nbRqi8/xzf
         dGqfo6Klpg9iwsgyi4MWSuSZaL35ZvWtZfx0u4yriJl4/ZGJIEzxBHHuetxFuoLy0hmV
         27WsrfaQFlW4abBnT+wzqIMZC/q/rhyX0pYE1GE7JVGJQuM6Fya44eQMnLv9TqQsLcr6
         2whg==
X-Gm-Message-State: AOJu0Ywc+UVDQRYVaro3xdWs/2/PcLXUQxpEg2Wiqw1rmpl5G37ZKzU+
	MdoPHH+nawRijLlOYdxJxnBuZGf/KMHsxqHakG7WzhWkxzgTETU065nSI4gTpYcI0tXsoAAvJmG
	lwhu/3f4FH2HTeP9lZgbg75Ihbc4xM61JmNBYbiZcaseuWPG9xmkBp1XqHgdTfRxjJZgKbJz/
X-Gm-Gg: AR+sD125kzxR8ai2/sR8POWZvygRTDlIb+qF7S8f/lQuuQXcW6SVag0wtNnm2qrFVUS
	REeNtpmz9wnNK+BFbtSzYwEahAiE5XxhObDlUoZrRvVJTOGuFRwitCC/LV6eN3CZ65XLeHe+vj3
	jtCRzzmbcvkyGs/q86R1+cj5F0kqLGqAXTHne6Rb7ErJZruQbOZph4eEYyuECsriiWMiMiLyT1A
	/JH+Mb00VR6TJcVZmmWApUe6tnbEmavSW8R0k2WF3q9GtSU/HqMPlcHlyk4fg9H61C4PpyzONv5
	D6weAm0SignPWDZ01TYZ5VtduWXIVh1iwrHGdN5d6vCy8qm/SV5f7ENRB7xRi8z8ZArMF2JtQgF
	JoicEHyr01DrQEQsIWeWDUgwBgJ585aWVORFLxOaZjvB+NHINafd7
X-Received: by 2002:a17:90a:d60d:b0:390:8361:a532 with SMTP id 98e67ed59e1d1-39580bc9ad4mr4225689a91.7.1787117607785;
        Tue, 18 Aug 2026 22:33:27 -0700 (PDT)
X-Received: by 2002:a17:90a:d60d:b0:390:8361:a532 with SMTP id 98e67ed59e1d1-39580bc9ad4mr4225600a91.7.1787117607354;
        Tue, 18 Aug 2026 22:33:27 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f4c9918sm404261a91.0.2026.08.18.22.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:33:26 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aniruddha Mishra <aniruddha.mishra@oss.qualcomm.com>,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next v4 8/8] wifi: ath12k: add WBM SW desc fallback counter
Date: Wed, 19 Aug 2026 11:02:47 +0530
Message-Id: <20260819053247.1420393-9-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260819053247.1420393-1-pardeep.kaur@oss.qualcomm.com>
References: <20260819053247.1420393-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NoPhtcdJ c=1 sm=1 tr=0 ts=6a854028 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=7LnAo4KMM85IVg6JStIA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 6yAQVOVuy4_6RKZphAPwtVawjO-pVa8L
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDAzOSBTYWx0ZWRfXzszjEPWVtp2s
 DKkrQh7dRah+xT9JkBjLmyNJU2GV2ImzCHo5qK2oNjVqZYvaM7QV8Jh5C3r8VimxRydqo7ICzSL
 s/GyBainog3aiImYYfgU8cOCrRf7SOg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDAzOSBTYWx0ZWRfX3xQ5NpjIsNHz
 zew8vvarbeyNemdfY8VPN2OtMHiDiejL/zrBl2oTpEncO7XaEDWLKQWCFQISWhrB5zXzrJAjNd+
 UK8DtrbgQeyK0f15qsq4LOGK6FmJhQB30xTo6KQpRil5rxC26Eiszn2oR2zvybXlfGIulFQKtVs
 05/p1RfZeKkTo6HdV8YWy8eb6NWwV9tmTuSNzmJwTCTToje8P200jpzHqTTZInRieH+36gU7RuH
 gR6mcMIZdGzMrBHm+7ko/IX5frJCb+H8ChZBRyKKfHvLlyOCzcPm2RrwQx+g5oFdrNw9SmWrSHN
 Q5j8/5+H12bNkaaZzhzkrPNVbgdwIvFQl7dSj1KNStgE1xEGmFisOc8BMVfCZLhYvfUA99py9Zf
 KNogxQPgJ/GVX4INCbNtNwbe5z9mwrddYLlHjUiHO1Tk9928rYMJqqcGP8ps2sibLRKFrkFIPBN
 ExtF4+jvJv2TVNb9Mag==
X-Proofpoint-GUID: 6yAQVOVuy4_6RKZphAPwtVawjO-pVa8L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_223331_605864_9B3A863B 
X-CRM114-Status: GOOD (  16.33  )
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

From: Aniruddha Mishra <aniruddha.mishra@oss.qualcomm.com>

When HW CC is not done, the WBM RX error path falls back to
cookie-based descriptor retrieval via ath12k_dp_get_rx_desc(). This
fallback path is taken before knowing whether the retrieval will
succeed, so it is not a drop event and should not be counted in the
drop[] array.

Add a dedicated sw_desc_fallback counter in
ath12k_device_dp_rx_wbm_err_stats to track how often the HW CC
fallback path is taken, distinct from actual packet drops. Expose
the counter in the device_dp_stats debugfs file as a separate line.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aniruddha Mishra <aniruddha.mishra@oss.qualcomm.com>
Co-developed-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debugfs.c     | 4 ++++
 drivers/net/wireless/ath/ath12k/dp.h          | 1 +
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 1 +
 3 files changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index 5d6710f1160c..12791e267d1a 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -1132,6 +1132,10 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
 		len += scnprintf(buf + len, size - len, "\n");
 	}
 
+	len += scnprintf(buf + len, size - len,
+			 "\nWBM SW desc fallback (HW CC not done): %u\n",
+			 device_stats->wbm_err.sw_desc_fallback);
+
 	len += scnprintf(buf + len, size - len, "\nHAL REO errors:\n");
 
 	for (i = 0; i < DP_REO_DST_RING_MAX; i++)
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 5cfe2096c633..289aede6dabb 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -442,6 +442,7 @@ struct ath12k_device_dp_rx_wbm_err_stats {
 	u32 rxdma_error[HAL_REO_ENTR_RING_RXDMA_ECODE_MAX];
 	u32 reo_error[HAL_REO_DEST_RING_ERROR_CODE_MAX];
 	u32 drop[WBM_ERR_DROP_MAX];
+	u32 sw_desc_fallback;
 };
 
 struct ath12k_device_dp_stats {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 5325d271fd6a..25fd8bf7858f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -1968,6 +1968,7 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 
 		/* retry manual desc retrieval if hw cc is not done */
 		if (!desc_info) {
+			dp->device_stats.wbm_err.sw_desc_fallback++;
 			desc_info = ath12k_dp_get_rx_desc(dp, err_info.cookie);
 			if (!desc_info) {
 				dp->device_stats.wbm_err.drop[WBM_ERR_DROP_GET_SW_DESC]++;
-- 
2.34.1


