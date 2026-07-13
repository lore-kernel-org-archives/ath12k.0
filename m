Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586C0C43458
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 07:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cSkM2sZ6NfRboh9TdbBfSTlyiPdbQTQESCI/5cewzIE=; b=ipzchkNpsWy28D/VauE2sYmbKl
	XC9pAG7WOE223+jv+a6cqOydfHQcZW/Q6nGfjJZ/LwPvgC2ZPvU2M4KLeTRDGVstoGsthwH/q9PDE
	6rYNWnDYmpGH8tfZbq8ihvxKLpc29jHARSX86wJro7b4ejQAAtEsmnloceM444FRkQmekD/SJSexS
	8/MTtpgWpoH91IDdPZTJsnx7qoJcyJthpRyDwIzXaRUfhP/MFC2146m8BhQtqeGgU0mSg/OXV5sUs
	tykuYZnWWYL1jhHbK6wLJs1QuK8teqV29g3PC5rCnLrrgv+Ff4z95Lq/4Vw4lFHr+hP3Az0d20B/P
	/+pjNO4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjB7q-00000008PsV-0QF1;
	Mon, 13 Jul 2026 07:30:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjB7l-00000008Ppb-0mMa
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 07:30:47 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NxMM648719
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cSkM2sZ6NfRboh9TdbBfSTlyiPdbQTQESCI/5cewzIE=; b=l7lXHSHl9bMUc8i1
	h8BY14EUpwCC6HSX/2zktgIocWB8yKvJVyoAnxXnQ11Hg8S7L2+jDwE8CgwNrQe6
	Qs3OwbgJEw+ZU6zGyk/sbM9rMYUkjAZZHFACnqb7OUkuj/Au05WcOkV27MLuVvzt
	kx8iaJ306l4faZYumd5D8GknfsYlZTqwA/8VFeHaU0bEcHzEPa1i8fFApGAW3qTz
	UoC0MK5tyQstBkWUabs1y5eRxwkZhezjx2eeSZbjPY1nCMstE6AbohWS99Ou//lm
	+W4jOfCcbpr9C/06vI6gqGBb7WRP2cid5WJVGKllOLQ/oPcEaXA6N3jz366kq4Vj
	5EHqwg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbebr4v2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:30:44 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c891ed872ddso4888646a12.2
        for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 00:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783927844; x=1784532644; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cSkM2sZ6NfRboh9TdbBfSTlyiPdbQTQESCI/5cewzIE=;
        b=BICftb9APyCYUIb4ng0lB6kgqBcQsB5pkbsxSvMD9DfvaB9r3EANpSASlVYrhzUAY7
         rGJURETD7cKt+jRQ/w2yYe5z6Au+EiohIgP6JJqpRJFkqySBQg+OmPVGddKjvwhqjKCd
         S5Cc9LhMYbKiHccsXgMU77nDTQGbuRAjibRv8Q4SHsEEFI+0Sz2s+4O1t1uCOxILNRMP
         ltpMThzS2K6z8G2GmkxEbDNALtyO14mArBvxW5ndTE7WGKzRCjVG26E/03jWf/2VT5rs
         bkiOPEfMVvasDKRpCBhQG26C8fDENOy1Tk55Zz8Tt2hLEKWkuqskM92PccY6QfoyY4DA
         JQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783927844; x=1784532644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cSkM2sZ6NfRboh9TdbBfSTlyiPdbQTQESCI/5cewzIE=;
        b=Er7LpoPP8HDYvt6DtSyBxjhbp6v1BUkw6yeSurMduc3Sv5OUc95BYtvmk0oM8RJCZd
         QsUDJqvrwAePN2WS7I7gML4WCnl/vAsmhjy4UbU5swX/vLWT4qKlPo/RuxJ0WaPrWG4p
         DYfJeW5ZectMtcBgzReR+lCX+LSVQ0ECC48jIc2Kqlib9foHhzWYQMu8fD/cHLFMNi3r
         BkKNA8aUmCqgcP8fKqC0YhUno4HA/rI1vW5GByCH9iz7OvDNSWHZWb6YIeF1VuBKuvj1
         k2yKRrwozMpWN9mqcDEfiaLp+2TZoLiyuuoYMHpMAdaBx84daI4R0CiC9enIF9kD/21z
         QM1Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqg8mfPPiPE5CBebAa5UBYyEk0c8rMpzmU5QWyWA1NZz33WWyc/KnpHItyd0ihDeaQvzRL3qtk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxfwgEKA7Wyp5OpA9nRfRjg1jzuLtFvvHsjHPx/lsc7QEpnGwzE
	6l+uchGH9eu9SG6SylfxgXHegHA3O+f2Qzi8oVh0H6IeXS7pmuIYCvvwI//vmVtVP5eO0Ok/kjc
	FSiTNZ8hwuR9vnx2/E6eKd6A/yiaMQ6CVMGZRHnZgGBV5duo8JrDJPGXC/anSwuwEqIV+TJP5D8
	Q=
X-Gm-Gg: AfdE7cke8KcsXcUsyjLHpMtd34QI5PFEow6RdcT64bB4NulhWxMlWiIMdo0UyQOClBJ
	JtTY3w1knZ/Ht2aHsQRwFYVrtHzIXY72ks3YdURWJ+dtHMt+ct2WulMF40aJ2bCPEufmsx0d9un
	0GKLZu0WZqpESvbsU+TOOQv2ulAya8zgIDTo5Afn37OHrkdQMN3aoMqEuJBkgTEwfkNx8dHco1p
	zzJYT2uLhlNRugR2fl6GUSiAboH/WDnGn/briRbTUJZjRaMxN8duuvUou2leSPli4v0Jd+DXypf
	FLIWBQRCYxpvjXVAtKuhFgwoRoWWDCxocLcd7/Muu6BpjpM1PeTbijue9lbPLfQvueHBV2R2582
	X14Gfw9HkWiOcmQxNkwED0wZiqSefs6n2Y4uJKn/l6TBMNu0tZ0nljpmqtXjBkBf1
X-Received: by 2002:a05:6a21:9211:b0:3bf:a0e5:99a0 with SMTP id adf61e73a8af0-3c110be0c4bmr9837164637.47.1783927844073;
        Mon, 13 Jul 2026 00:30:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:9211:b0:3bf:a0e5:99a0 with SMTP id adf61e73a8af0-3c110be0c4bmr9837140637.47.1783927843635;
        Mon, 13 Jul 2026 00:30:43 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b31628c1sm7947252a12.19.2026.07.13.00.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:30:41 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:29:57 +0800
Subject: [PATCH ath-current v6 5/8] wifi: ath12k: introduce
 host_alloc_ml_id hardware parameter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-ath12k-fw-allocated-ml-peer-id-v6-5-20f6f212e413@oss.qualcomm.com>
References: <20260713-ath12k-fw-allocated-ml-peer-id-v6-0-20f6f212e413@oss.qualcomm.com>
In-Reply-To: <20260713-ath12k-fw-allocated-ml-peer-id-v6-0-20f6f212e413@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3NiBTYWx0ZWRfX2UgItASK6fx1
 jMDAgAQf3bjylXOWt7+jDMKMqy1Jww5QPfCeXcZ1ZyLUtwXASq6FgYi74gHbjyW/WSml2L3MJEW
 ZrU+lninUyjyimJW9D6ihqn9eMhkDfQ=
X-Authority-Analysis: v=2.4 cv=OK8XGyaB c=1 sm=1 tr=0 ts=6a549424 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2Mqij7SlxvU2Fhucnr4A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: xP-pVzqwDxQkh-lVHWsT2Zn5mrXZc3vm
X-Proofpoint-ORIG-GUID: xP-pVzqwDxQkh-lVHWsT2Zn5mrXZc3vm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3NiBTYWx0ZWRfX1Ds0tBQBsHv6
 0WjvZrXQgcUjlApvAV/xr1O1TKU6RNlMAaHtobxpDjfvZIrthzviLT5qxt8UH5jetnx4xUOhmfJ
 8tUfR/xzOjGgtjWgTjw0t2otBPns+rQYYeErLHpJ+TwoXOuhzpBL5QkIc+viHpKYXkFKQHSPR36
 skzh9aWTFTdwG4M+Obm8Wn6Gp6jQF8m3+jfBfVvvpilfWqmUWf/7rL1svMS6SQ/A+9udAWTt3Gx
 yWrKgZCWoI0jSND9C2dv0azuUEoD/ftaxSIr0Y1BLF5hUwj/g2jtfdWHG3e6KZx23vrK/b9+TFA
 A6xd4Pre21Hutbzw/xICuIB0q7L8ywAoTySW8cmZ9WPvcQqXYCasNxBTv7fVEdY8Mo+LqQ95K00
 9HmetXFQzcN6pw42G06Pqs1uneaJg40p+SUSPTg5Pccu4m/G3CvhVyzExZ+nOdYIsQcvlFPGv1Y
 hcTSYzTMlpY0ivQypQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_003045_251818_AD13FF72 
X-CRM114-Status: GOOD (  21.53  )
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


