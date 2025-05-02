Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317C7C3ABAC
	for <ath12k@archiver.kernel.org>; Fri,  2 May 2025 23:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ITNozfI5RkhFMbtdCDhndJtiQb2Tu+23G2HG9tUlBoA=; b=t5IBGFbo5/tcl13Gi53g73AJI6
	NjAc/Ux5jiLrvP+/ilUjXYi/jagMmF0VkJqis6+FJ58YqVWk1had6gXqs2IpfF/oHK/yO6kz8J+Ry
	47HTCWUlp75KJQx8VFJ1m/VhHY2suh5iFuHMgK/+S+X+bh4qYJyZ0ywOLZLei6K9iEPgY+tnF43/M
	UTKIe667lQogIPe3rQr5Gd5NgtnHe8I7eGniABxRUSmH9GAaOzy0pUZCxH1i8loscp//hhO/vnyCi
	19XDLr2yOAchyzVbZOaNKrpLr+03qLU2Jw8PBtSlngIwpEen6Lpf+MdEJqiWKNGldEe1otc1rc3P/
	w2Ld6mdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAzPw-00000003Cqk-3WLc;
	Fri, 02 May 2025 23:03:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAzPu-00000003Cq0-0ahj
	for ath12k@lists.infradead.org;
	Fri, 02 May 2025 23:03:39 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KBI8S015978
	for <ath12k@lists.infradead.org>; Fri, 2 May 2025 23:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ITNozfI5RkhFMbtdCDhndJtiQb2Tu+23G2H
	G9tUlBoA=; b=lBU97RPXxNzfKFgTtuHPH766vtk8q78AR/sv4wYfqhZKaNVUyJ9
	bkdj08UhTX5KWQONQJQq1WSk/8MOxG0ZgTX/+yOhRyMJg37eGsocIRAz/IHtwGlO
	SBZi+z6VrtboCFFc45JvUSqXOqAHbirBV8wBCe/vQNWvlISWz2fRzpsGC/rTLQa+
	+ZHVGIsTHg5lgcl5kXNDEcL4uEv7GFmhf0p0eTgHbK3QvX/5yTLy/K+zCBPSJbVP
	HjrN2jDM0dGoqLxcqhs84MMXe1sh5XTQhP+NtMqq9RCFjxH3o/QIzWRS6axpVU0Z
	gaWKdtfmr8Zfc8yLB+I7kAGPZFVIQxGnaJA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u81ke3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 02 May 2025 23:03:36 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b0e5f28841dso1642502a12.2
        for <ath12k@lists.infradead.org>; Fri, 02 May 2025 16:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746227015; x=1746831815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ITNozfI5RkhFMbtdCDhndJtiQb2Tu+23G2HG9tUlBoA=;
        b=iKEbQgyrsOIC8W40HdSBcPErAdSSCWaP52+bI66LfcCKNSLlojQFQtGbnHJrKZg1KT
         eNu3/wyac800eFH3n/Xc855aeiqIuDoe08qZwSmpL+RrOpFYrxo96y7jbPaeFtYl6ceE
         5KqyU1uwPxxK1TevcKoIG3IcqXw3OI0QT+RQ89iw/CgMMlmo8Rv4DBnj3Hg9Htrm0ruZ
         gtMexG34jSYKFPWyU9JeH8RZ6MGQsKpR5wOC6u2bfwDN+v+0PHEv5kygX7nmX+3LD68l
         5EueEUHyf42u16ltg78l9V6L7rk5stq58WDJ5zjkpyFyHWKeOVaiCZepBHJ+9bw5zZ7Q
         0VQA==
X-Gm-Message-State: AOJu0YwyQHD2P8SoIkf2iB+mkPpYCaqsGlgwSBLp+C5tKjgCYc0ra3IT
	wNyFpBAMV+xzYgKLy26IdbGKQHHAPYIapPVwyt/FFJ+ZZkEKM/jxD+oih665AloOJ0M8Nz+C2Pe
	DovnhEbmi1uyp8WRh9uKuMOyyO+MdMyXwBRMfPp5leun22gNTvCwZRDhJKvEXUOFW0oMy
X-Gm-Gg: ASbGncs0lsfsuJ9cfee26fYCo586+8bMn/S9gfHfDPh8PVeF0h5gVZXH5cfDB8C4tgH
	u7vRaUaO+X0YnNo/aBcOqhKSkKEpvyGkbnTV0ea2fwfxWBtWiSCteLsXZJ6zN++B4aycyfvGOvz
	CVRcmbJpEzFzghNm0JzpmNg/YrVJzQeg+iu7LXx52gH5HlXZkZNWeNs8HVP2C3zX8UdY+zO2T8B
	E8UgFlMVVusDrXFcPQ1040ZD3/AO2CLRwfgHBh4LdF1Y68+Gx1dVzoRB6XX0wIOCRXZ4cou5+l9
	7oZLQ+jpLsMxmbIVIxE5gLVDcMxsJwgnl66YK9eGyB7Plly0Lku3aUvRduGqPuJBc1vo
X-Received: by 2002:a05:6300:668b:b0:1f5:5a0b:4768 with SMTP id adf61e73a8af0-20cded43531mr6975784637.21.1746227015148;
        Fri, 02 May 2025 16:03:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkmy8VQIBA/Z3wJ2zrXg44xjFIk9NFsJDt5RRn7dQchBKgcfsiNd1Qz0qvyfME1r21G6Z/Hg==
X-Received: by 2002:a05:6300:668b:b0:1f5:5a0b:4768 with SMTP id adf61e73a8af0-20cded43531mr6975744637.21.1746227014731;
        Fri, 02 May 2025 16:03:34 -0700 (PDT)
Received: from msinada-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059020e2asm2160527b3a.111.2025.05.02.16.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 16:03:34 -0700 (PDT)
From: Muna Sinada <muna.sinada@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Karthik M <quic_karm@quicinc.com>,
        Muna Sinada <muna.sinada@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: disable pdev for non supported country
Date: Fri,  2 May 2025 16:02:40 -0700
Message-Id: <20250502230240.3692678-1-muna.sinada@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ldc86ifi c=1 sm=1 tr=0 ts=68154f48 cx=c_pps a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=GS2Ra1cEi1otGwMkaT0A:9 a=3WC7DwWrALyhR5TkjVHa:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: GTzq5_W7x0qb_6U-UFN-06m_8mb3IMcy
X-Proofpoint-ORIG-GUID: GTzq5_W7x0qb_6U-UFN-06m_8mb3IMcy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE4OSBTYWx0ZWRfX9vhP2reVYLuy baXNl6smct3+c2NOhfEMyfTpxCYLv6fKiySbgJ+Jd6yQMKW5k7kis8qQP+6VDgYiHRRfJ6KAGGw yWwDEyhU235Er965iJXXe+yL9ZxOCVWaAaYQc8JQc1Rt5tMtxuqgB6XcD8BEcoK1HT6tyxWs/xv
 YuH8QWW/1L1e8Ueb8wsn3drtHk2qo4yrYnwmVfS7EHSj4++tM/Htke95O3b8NbiD+b766UJ0pmJ 7dQfRspqf4HmWoAjJTK5cZ/Ixqqf35Yxd5TVALVy99qoIYZ6G1YrVQYK+PtjpWmcC3pTDaRK95N moc67i7u88rhtXkyYKlm0WdHuq3SIuvxTkxb8JCEELTxku8sDLMYgUUQSO7npy1+8rTvPrT6xsv
 dH0Xc9ecYijMVnXRkBfQGJ8XCZe6dQVjCc0eUxzugylia+pcF0FukVdNmvwO+5Ro3Adjxm11
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 mlxlogscore=704 malwarescore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_160338_187500_2716B081 
X-CRM114-Status: GOOD (  18.82  )
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

From: Karthik M <quic_karm@quicinc.com>

In MLO configuration, ath12k_mac_radio_start() iterates through all
the radios and makes the ar state 'ON'. Even though some bands are
not supported in certain countries, ath12k_reg_update_chan_list()
tries to update the channel list for all the active pdevs and ends
up in the warn_on for non-supported band.

To prevent this, disable the pdev when the num of channels in a band
for a particular country is zero.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthik M <quic_karm@quicinc.com>
Signed-off-by: Muna Sinada <muna.sinada@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 12 +++++++++++-
 drivers/net/wireless/ath/ath12k/reg.c |  7 +++++--
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 4dae941c9615..f731a5759ac3 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7726,7 +7726,17 @@ static int ath12k_mac_start(struct ath12k *ar)
 
 	/* TODO: Do we need to enable ANI? */
 
-	ath12k_reg_update_chan_list(ar, false);
+	ret = ath12k_reg_update_chan_list(ar, false);
+
+	/* The ar state alone can be turned off for non supported country
+	 * without returning the error value. As we need to update the channel
+	 * for the next ar.
+	 */
+	if (ret) {
+		if (ret == -EINVAL)
+			ret = 0;
+		goto err;
+	}
 
 	ar->num_started_vdevs = 0;
 	ar->num_created_vdevs = 0;
diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
index 7048834e0d14..a6c9c670e91d 100644
--- a/drivers/net/wireless/ath/ath12k/reg.c
+++ b/drivers/net/wireless/ath/ath12k/reg.c
@@ -65,7 +65,7 @@ ath12k_reg_notifier(struct wiphy *wiphy, struct regulatory_request *request)
 
 		for_each_ar(ah, ar, i) {
 			ret = ath12k_reg_update_chan_list(ar, true);
-			if (ret) {
+			if (ret && ret != -EINVAL) {
 				ath12k_warn(ar->ab,
 					    "failed to update chan list for pdev %u, ret %d\n",
 					    i, ret);
@@ -181,8 +181,11 @@ int ath12k_reg_update_chan_list(struct ath12k *ar, bool wait)
 		}
 	}
 
-	if (WARN_ON(!num_channels))
+	if (!num_channels) {
+		ath12k_dbg(ar->ab, ATH12K_DBG_REG,
+			   "pdev is not supported for this country\n");
 		return -EINVAL;
+	}
 
 	arg = kzalloc(struct_size(arg, channel, num_channels), GFP_KERNEL);
 

base-commit: 885e5cbaa0ee3738fcd99167439459ede2cc102c
-- 
2.34.1


