Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37169C43458
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 07:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cSkM2sZ6NfRboh9TdbBfSTlyiPdbQTQESCI/5cewzIE=; b=NftQkq07cQVOXfl75/NcNKYbwk
	u54PvbGb21lWp9PivyCdbJ+dlRFrNLH7jxteySj6xBf3iqTjWSqMHRNDjxbCi5YKoycuMv6jX/+qu
	LLKugVqSKUp1GVM1oD0jR/l2P8lZUM+FoOvKUuW1uFO3AsPhmK8QJYC7ticnwMWv7Z2wD0/hHYP8E
	OsguUls938iZEuC+p7BWMJmQofcrdobA+k2JGuZoOOw7kks83vgJxE9hFVQJIpkNwrABpenlhjWMF
	BCeneKyN/DAbX7/oGCpHIbGdiZgk387QbqocrniodjUPZOpSjy6ZkkHJZK+ig4qn3G1QcWD6yrMVb
	WOt5xK7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBAo-00000008QvT-47tM;
	Mon, 13 Jul 2026 07:33:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBAl-00000008Qse-3VDb
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 07:33:53 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6O1uM507448
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cSkM2sZ6NfRboh9TdbBfSTlyiPdbQTQESCI/5cewzIE=; b=IE5WFS+Bwkano6D/
	nLrYC/tA3dUoexvW18WnK6yYkFXe1nj/+xLDBjrTE5/dxFqnPsEF3fXmYEct/lF8
	RMOzEEYmms3ZTwTrIumA6KfMfkc7hxly/Xs/ZHN6oL80xFyzKu2jS6u2kccSrtYQ
	k9UrHqL/+wTL5zT1+eDb1/vzmROtda+up+RXjlb8Ks1bvjqqC+KmYolI9JI8r8Or
	mIs4XxvNrGT2QB48ACm3mnfyFrOWHh8nBvtzG73cKVxJkXltXjpIw8aorhr6E6Ux
	SNsoOMrT23oG+nXV7PkTqjr0Kx1utE9C20Is52sNTHRBXioM9gv7eCnfxTklGluR
	dLZTgA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8gd11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:33:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccb687f82eso45288085ad.3
        for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 00:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783928031; x=1784532831; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cSkM2sZ6NfRboh9TdbBfSTlyiPdbQTQESCI/5cewzIE=;
        b=Pj/VYDh+190WmPo5ptBuX0tp/rTDRAU7QWqPAPsMC6zg+DFLusXCtuaN/G7oakmWTJ
         n5HJITYkUntaPtItrMrVwgF4Gk0ruEsGquiTKpFe7vpA1ijAcmg4FOGGbS3FprMfSM1x
         VL1oVJvTXfNfKa+rPukxCHCHMMi039oP9iZHJL88YPBsVv1SQSehG/bWM6ZWP+tUBy5a
         porTPueF9GLg/uzGzKIcv4ULDWbQjkMh+Uqzb0RecVWlMA9K60IqHEvNBlVxHLI5Yi2+
         zaa+2dK/exZm9wicmt0SkLvKF5aBLdykF3xzHXvmkCe1mxSfn82GR2x/Z7acLGCFTJiQ
         ZuWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783928031; x=1784532831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cSkM2sZ6NfRboh9TdbBfSTlyiPdbQTQESCI/5cewzIE=;
        b=ALLItqGPx8ad7GAfkb3W6oAP8H4dLeQgVVvSo39tB+oqbYGOlJzxrH5x+zhFqtRwJo
         gV+aShT/ys5SjxbdO9TVEf4+dKBcQdVuqzp6EuCpapwq5g52anX9BegzxN2v8gwal6sG
         yPbIPMTwaYznUQrPkVVWrWFx5hhoBwOj+++YSMb7WIWWozMyC2DrNjzEJyNum8iw75wW
         kku1ZDjWCL7Zusm5oO8pzUyEfdjLkKoMvMW9UxoBNyefR4dYHZmfpYq1hqu0CQiFYPiu
         H0l8DDIBzivWrnQI8hor+dVGUNkPotTUNZAjFpGLSx/pl7ZkaaqEgl6hOLBppAqZ0XLr
         SgLw==
X-Forwarded-Encrypted: i=1; AHgh+Rr5aG/hmZx8/7W17LJUOvg0pE0wl87x7NtbO0PPy1GLBk6qij8hPO+W8BhpTUH4fqF9wPwSnD4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzrK6Yzs2N2tuoTRmTbC533H4c07Fxk47tjYrYjAjnbN/EqWaU2
	uYkeOC1WzS8gYBEhi/UBFPmNcXFgc/e4JNdB9t2Yq+BZkYg8OI9pUNX3ZnzNQq/t0OxaNE5Sagc
	Qv6uakHj0nhdFZyly79KIBfWFklI9WnG7vseN0n8tr6bCQmF5Qg+lj8KKeZn2DKW9
X-Gm-Gg: AfdE7clWXkA3TvVzqJzqkijc/yI2CxoAyr4krWvjPnkUbZavKKWQwjYcJPInehaSmUc
	NwsuGk2h+oOhQMogmhjyK56A424KrCgqZsdyyc0OqPxErm0jKJZVn6wcbB4O4EMZMmneFAhAoYQ
	lsA7l9oCVBlWgQtCF9i2QZWS+cNqbJfcea1Cq54sUOZPs8ZzIi19Tq+87Gn3pPQl2WNQjKpTL+u
	iQoqihqOb417ch9py3EfC8709mujbskIYR7q1239fW8ZvknhfzHcjcJww4DmlleWd9ir9o3+4f2
	ZI38FfF2ns5LJILzDRO/ui4DuvNCaLwnE43CuOw0+tioNYlgmh3wNjobIkh4QY7A+/CYHS7aXrW
	xtXtmumiLbyhJ3AcFGFEz8rrvlBYKf0f4YQsuKou1jH1pyoj+Zi3fgp1J6j32LfPl
X-Received: by 2002:a17:902:ea0e:b0:2c9:d277:2cdd with SMTP id d9443c01a7336-2ce9eac5789mr80918765ad.13.1783928030611;
        Mon, 13 Jul 2026 00:33:50 -0700 (PDT)
X-Received: by 2002:a17:902:ea0e:b0:2c9:d277:2cdd with SMTP id d9443c01a7336-2ce9eac5789mr80918615ad.13.1783928030120;
        Mon, 13 Jul 2026 00:33:50 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb72fsm95073615ad.6.2026.07.13.00.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:33:49 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:33:20 +0800
Subject: [PATCH ath-current 5/8] wifi: ath12k: introduce host_alloc_ml_id
 hardware parameter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-ath12k-fw-allocated-ml-peer-id-v1-5-d0a2a1a519eb@oss.qualcomm.com>
References: <20260713-ath12k-fw-allocated-ml-peer-id-v1-0-d0a2a1a519eb@oss.qualcomm.com>
In-Reply-To: <20260713-ath12k-fw-allocated-ml-peer-id-v1-0-d0a2a1a519eb@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: zOoHaaqkMhnuskufnZjnlfUBty-GFVPv
X-Proofpoint-ORIG-GUID: zOoHaaqkMhnuskufnZjnlfUBty-GFVPv
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a5494df cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2Mqij7SlxvU2Fhucnr4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3NyBTYWx0ZWRfX3wZhBQC3eCUj
 Vargn7dkQaZ7YAI51JdJiht7D8AmYzxoNqdnDBW0n9mi9Ml3YbbZ1xNtvzs9BXDPzalrxbY5jk1
 kjnKoUXb2TzHzrstQClBODEng08RaOE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3NyBTYWx0ZWRfX/yDUJuNQPKi8
 h9hmUo8Epj3NtfFSvcJjF0smww0Rz4Wf7L7uA+9wdFHURjDKX/35g8MBXIQ4VQqXWWw+rXyQUvf
 ym/qgTuQsFNHONQs1OYLUwv0acCgeHpWM95Gn2hsD85TJEfj62NFrH73iiovvRqL0AYTaZEEM1V
 YT0BTOU98htTk0MGtI9UnE7zqekhs7pjt5Rbi6HAjcp8TCu6LF/yLaStczPaaciCF2lFqAVj+Ww
 vhdV9HIZTfRWXUzmKh7WjqdsCyUuXF+fHUQQcAwgetWSD8+x5VapbEmN/NaX4NdbCp613Sf7UeL
 GrVaVlvxTgWkbc5slnV/3U2kBqu3LiP0QjQLv1+sZ56ebDMqn3ZkoMcdBEft6mgKWkFRUqloIRn
 ZGFEE5nD0JB3L/dtCY506JkEW4bFfiz+I1t0/pY0igRg+HgczOtAO+C5p0pjrFWy4btxGUOHALl
 9sE7KtuKGeJ6S6yfD5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_003351_882801_F9F5180C 
X-CRM114-Status: GOOD (  21.09  )
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

Different ath12k devices diverge on who allocates MLD peer id:
WCN7850/QCC2072 have the firmware allocate it and notify the host via
HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP event; While others let the host allocate
it and pass it down through WMI_PEER_ASSOC_CMDID with
ATH12K_WMI_FLAG_MLO_PEER_ID_VALID set.

Currently ath12k host allocates this ID and sends it to firmware by
default for all devices. This breaks WCN7850/QCC2072, because the host
maintained ID may be different from the firmware-allocated one.
Consequently data path may fail to find the dp peer and drop some received
packets. From user point of view, this results in bugs reported in [1] or
the 4-way handshake timeout issue.

Add host_alloc_ml_id flag to struct ath12k_hw_params (and a copy on struct
ath12k_hw for hot-path access) so subsequent patches can branch on it. Set
true for QCN9274/IPQ5332/IPQ5424, false for WCN7850/QCC2072. The flag will
be consumed by subsequent patches.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221039 # 1
Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h     |  1 +
 drivers/net/wireless/ath/ath12k/hw.h       |  2 ++
 drivers/net/wireless/ath/ath12k/mac.c      | 17 ++++++++++++++++-
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 12 ++++++++++++
 4 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index fc5127b5c1a3..1f56474efbea 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -793,6 +793,7 @@ struct ath12k_hw {
 	enum ath12k_hw_state state;
 	bool regd_updated;
 	bool use_6ghz_regd;
+	bool host_alloc_ml_id;
 
 	u8 num_radio;
 
diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index d135b2936378..8091501cf742 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -232,6 +232,8 @@ struct ath12k_hw_params {
 		u32 max_client_dbs;
 		u32 max_client_dbs_sbs;
 	} client;
+
+	bool host_alloc_ml_id;
 };
 
 struct ath12k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 7d0d7d5fbf53..9e5fcbf8c730 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -15382,8 +15382,9 @@ int ath12k_mac_allocate(struct ath12k_hw_group *ag)
 	int mac_id, device_id, total_radio, num_hw;
 	struct ath12k_base *ab;
 	struct ath12k_hw *ah;
-	int ret, i, j;
+	bool conf = false;
 	u8 radio_per_hw;
+	int ret, i, j;
 
 	total_radio = 0;
 	for (i = 0; i < ag->num_devices; i++) {
@@ -15423,6 +15424,19 @@ int ath12k_mac_allocate(struct ath12k_hw_group *ag)
 			}
 
 			ab = ag->ab[device_id];
+
+			/*
+			 * the assumption is all devices within an ah
+			 * share the same host_alloc_ml_id configuration
+			 */
+			if (j == 0) {
+				conf = ab->hw_params->host_alloc_ml_id;
+			} else if (conf != ab->hw_params->host_alloc_ml_id) {
+				ath12k_warn(ab, "inconsistent ML ID config within ah, device 0 uses %s allocated ID, while device %u doesn't\n",
+					    conf ? "host" : "firmware", device_id);
+				goto err;
+			}
+
 			pdev_map[j].ab = ab;
 			pdev_map[j].pdev_idx = mac_id;
 			mac_id++;
@@ -15447,6 +15461,7 @@ int ath12k_mac_allocate(struct ath12k_hw_group *ag)
 		}
 
 		ah->dev = ab->dev;
+		ah->host_alloc_ml_id = conf;
 
 		ag->ah[i] = ah;
 		ag->num_hw++;
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index e5bf9d218104..0c277f51d99c 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -439,6 +439,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.max_client_dbs = 128,
 			.max_client_dbs_sbs = 128,
 		},
+
+		.host_alloc_ml_id = true,
 	},
 	{
 		.name = "wcn7850 hw2.0",
@@ -530,6 +532,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.max_client_dbs = 128,
 			.max_client_dbs_sbs = 128,
 		},
+
+		.host_alloc_ml_id = false,
 	},
 	{
 		.name = "qcn9274 hw2.0",
@@ -617,6 +621,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.max_client_dbs = 128,
 			.max_client_dbs_sbs = 128,
 		},
+
+		.host_alloc_ml_id = true,
 	},
 	{
 		.name = "ipq5332 hw1.0",
@@ -697,6 +703,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.max_client_dbs = 128,
 			.max_client_dbs_sbs = 128,
 		},
+
+		.host_alloc_ml_id = true,
 	},
 	{
 		.name = "qcc2072 hw1.0",
@@ -789,6 +797,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.max_client_dbs = 128,
 			.max_client_dbs_sbs = 128,
 		},
+
+		.host_alloc_ml_id = false,
 	},
 	{
 		.name = "ipq5424 hw1.0",
@@ -873,6 +883,8 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.max_client_dbs = 128,
 			.max_client_dbs_sbs = 128,
 		},
+
+		.host_alloc_ml_id = true,
 	},
 };
 

-- 
2.25.1


