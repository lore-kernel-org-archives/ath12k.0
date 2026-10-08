Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90427CA600B
	for <ath12k@archiver.kernel.org>; Thu,  8 Oct 2026 10:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q6OZXAYBOto1MDL0E50xAmraTgP3CUO6T9Fe2JVUsBE=; b=LQ8xhmAngHpK8HJcwveJ/ZEbDW
	op5Y/iNd/F79V+SLJ3gyviYbGfYzjjXQSfqRNP75x9Z4PI6BGMTBUYDf2XDOOKF7fSWtf8YM2kCcp
	JFW3dcpL2qgBFSv6cJqL8/h9pIoqU4gUVufbFfl6lYP/yzg+rsXKg1Tvr9c8Ip9K1SZngW9YaBiLH
	e8M5GqzPOMWo2xC/1zKqz/G2dyPfLGITsGDp92Q4e2TNoJbMVFNQZRCHo7TOq8C+vFEihUuFrKaYS
	66BhJboyYmGoMr9Fuk4nMyhePWlL8PwX4d77RQ4wiZF+90TmzxpBLnqpIYae3W0RNTaMbeCT8B24Q
	+0y0m4RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElIv-000000046QY-0obG;
	Thu, 08 Oct 2026 10:24:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElIt-000000046OE-00I0
	for ath12k@bombadil.infradead.org;
	Thu, 08 Oct 2026 10:24:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Q6OZXAYBOto1MDL0E50xAmraTgP3CUO6T9Fe2JVUsBE=; b=oWN8uHjc1sLbi9OdiX34ghBsRl
	m7ZipPCNr0ucHxufFdV1nPYREwdHrDWbUzSeYalOBmkEI15gtHU2CEfN9jAosI2rosgL5CxXFhznD
	j6Ng8aoX0TABEhz2jEI+cnYg3RB8t8YS7zHmLcq8mtikqs7m1Keh+uKFXHR0zd0Xz+pQJeTM4eEQD
	EDtY4QYoQQurMR9JeffhM5Ni4kasbf1oXcpk8tC4TbPw+ymfVD98sVvwBvHtl8/s2IxU8rJmhmImP
	YHl4UseNGa58XB3MMmGKOswuKH5i7QJ/x5G1sJRNCe56DQ0aVIUws2lgUhO4+o+1BqA1YeDgRHv9w
	UgYxAKNQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xElIp-0000000AHgh-3Pvq
	for ath12k@lists.infradead.org;
	Thu, 08 Oct 2026 10:24:45 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KBeZ2189934
	for <ath12k@lists.infradead.org>; Thu, 8 Oct 2026 10:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q6OZXAYBOto1MDL0E50xAmraTgP3CUO6T9Fe2JVUsBE=; b=nzhFO8oHld4oRP7n
	/Qkdlr+F/JLuGYFmi5b60hcFPr06wC3vlgvEngOHZFP3NgPHb1VSs6PIj/bnxtbN
	avrWus8Sbl4Q9KZAGiYcLHqqg9WCNzSb4cnumnAdwrHuDS7m1DHgMwsU6oTwLaZx
	qn9xnrHKW4Nf761AwX/0ZDCKRhHByYuEjYhkWytvOieUbm74YZ6EFYVdHmmUbZmf
	A4DOSRaxqQ9rYOlmdwH98FyeYT/q8z8nkJDl55OCrKRb5w+6BvPiNk+WobHmFexi
	AnmsH2nM5JllceCw+hcVSI+3KC73absFVe+Al5EIJ5cuke5y2MCTGK5Wm4XocVNe
	eCvtEw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3adav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 10:24:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e2d4a8623bso49960805ad.1
        for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 03:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791455081; x=1792059881; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q6OZXAYBOto1MDL0E50xAmraTgP3CUO6T9Fe2JVUsBE=;
        b=BMVfAQjrEym33MNuO3z/och/qNRKTYbCbmSgP++B/wEzbP2vmYmzHvRUrGIQULkem8
         /ltdSkIvBcO+Stqd7ayN/uHZmn/bm7V8CLCm6FRaibvXVJrHQHWpWj7CDoQs2VF+kTGg
         VVzj/4o7R+kc3OflXeLbnwoFyQAFXrO77Oribd00Ec3zmU+BVg/8N654qirpMvfU+fsa
         k/EVWcfqlja5omzfwHPGn27Y7m/JFadbfilrvT9Ihq3tGTqyp8kTRVP4Rabbqydbg+Rc
         VJBZSbwyTuxz+yEpzC0ktiVD1qc0X8MCMU/9ayL6raX2D4GDYn7K7VIvltld+/bCFAGb
         w9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455081; x=1792059881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q6OZXAYBOto1MDL0E50xAmraTgP3CUO6T9Fe2JVUsBE=;
        b=Mo6uE1gnYZevS+LEVuLU/wH9enwa0K4YUh/PlQhuiTgA0JI2/Sj5TsgZBeilQoyr2a
         i1YqXPtGyxlcj+zOVHFaAg1qD1ogwiXwBBqNVJjcd1FM9mOOXHJXeABXuPdJ/HNknUiK
         tqsTXtqrfa+ENTqXjYNUeOeiqsnMlrqdNh7EyOdBUMqAxRKlWCflItaXo+Nqu+DD2QHv
         UFpJdP7MT+eQ4IJHJc3BkBcGtP6rH3tnDEjYP/SJ7+SygPKnLYyOz5XszrStp12JRAei
         5cmwIO/+giURWweVlAlPcg2Nz3gYiHn7D77/WxzlA+SbX+ZCZL17QSEkyxjj8Y/GASTL
         ca0A==
X-Forwarded-Encrypted: i=1; AKwUvBxdnFjKqzhsUSGETBE6lcsiXvErVYISDSPMXnfjVittycWHCr92aVXWv7WKKflzGSAtrS1ufQk=@lists.infradead.org
X-Gm-Message-State: AFq9FYKSwudi1Eic9ykogOfHIBGFfGmsjVY/K3TEnm0Cjj9XK3de98sV
	G/Y31fosOZUKdvXrGggSyJcxIB42n+mUDNipqMWagVxpgaElgPODoKWs5yb+IEspsAD/JvsG+Rq
	LqU/91o3pjKkvduoCjbMNh4YhAyveOzuzBHoBgYzwLK4Upb4cCStHcQlBv4/c01rQ
X-Gm-Gg: AYBFou35+TlKwW1xh9iB3Zf2C3JLMPxwVNgI73a7p6DaE65el9sdYvPyFxvVm2Cr3JG
	h64H2zq6R1/nWcT+1vTQh49XtzAf28ezht030lDAb2BaopmbeVUMQRzWb+zwJFZPrDAXb5drQ7Z
	z+cEzkrHpVVz8XKqtcGCEoN5PnhNUmH4l0T0/UopSeCRzf63dhIXryN82cV+u7OJ40z8OLBC8GW
	yMuKa4+rzjv2zc/paf62NnDnWmt2COfjBGA3sTjTsKi9OwebiC3fFxjFdM6R+ARMJQSm4MGoWDl
	Aj7Z3e9DjpogEKiijZotkaMvwAGNJ5uiJdqob//qlgd9wPEm1BC2y6Xbf9lG8pdt/0R9gb0rOef
	49HWVNZLiL8fCBI4s3yk/JakkKLMwhySPL2smsypt0A0Gz5N7hWV2n18TeIyzTXuADqafACHD9n
	RR63u2viZs/FxZVKv9LdaWDw==
X-Received: by 2002:a17:903:906:b0:2d9:520c:38e7 with SMTP id d9443c01a7336-2e5ffaa4eacmr41921535ad.1.1791455081313;
        Thu, 08 Oct 2026 03:24:41 -0700 (PDT)
X-Received: by 2002:a17:903:906:b0:2d9:520c:38e7 with SMTP id d9443c01a7336-2e5ffaa4eacmr41920475ad.1.1791455077540;
        Thu, 08 Oct 2026 03:24:37 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe39csm22081655ad.16.2026.10.08.03.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:24:37 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 15:54:03 +0530
Subject: [PATCH ath-next 07/17] wifi: ath12k: Add hybrid_bus_type in
 ath12k_hw_params
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpp_bringup-v1-7-2c5797b5e4ac@oss.qualcomm.com>
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
In-Reply-To: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac76f6a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pcKkHHuJ4FrcyiHCkkIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX3WrVCV5A81YR
 GOqAtCQi6YNeqoDtKweMrgcGTv3Id6MBgj4o0Gz3aCJ0Gdcqfwe1+ZslsGBIYSKrM6zLBzneDej
 oVDS+VNChnlK4xK3wKCuSbDL1LqUCg4=
X-Proofpoint-GUID: gUbIBRvpAAkob9cGWnK4Y9I7_QJls5iv
X-Proofpoint-ORIG-GUID: gUbIBRvpAAkob9cGWnK4Y9I7_QJls5iv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX96X8PuQfaAE4
 oxF2sCkPVK8I1WekQ5TH1U7fZPmQBsSipihh7C7PKTPYL/s/upggPTc41sYVmqZxLSZDxyaEASV
 kC4zS4ljfDesdKSB94osWwuFckGE4Ebc9gCaxTaAaSEptF8BFhtuEKQ0VbsMizZwz2jcaV2x7JC
 nYl+Rae+plmJqkDrXYvHFQoQexfKOOu3SpCt4OlWm41ZeB3mseaKqj6YcdyMalLzuirH1H1v5bY
 74eNzpimXp4QOBcgAU+vZS2bSUIb2NNTa02ge3HiwTnEtasgatKzzX6hHsZM1tnzuVjxaIl/mK+
 C2DJfGrmcr+5ZkvrcywQ5h5uiHk4+FnURD3dtyEKdcqG6Mt4wDVtvec3NgIowBCFBesnA8YLSQe
 Sqhbvk2KJgXXVFF+gOErx7IaZsy/9Kvxm6yqnqbvmhTrPCeU8UVkRkk598cr8B7cNfkSLMkmsl2
 CIAMhTgm1PUK0WdEg3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_112444_345625_15E7A071 
X-CRM114-Status: GOOD (  15.94  )
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

QCN6432 is a PCIe-based device attached to the WCSS Q6 processor,
but it is registered as a platform (AHB) device. It uses AHB APIs
for probe and boot. Because of this hybrid nature, it is called as
a hybrid bus device.

Introduce a hybrid_bus_type field in ath12k_hw_params to indicate the
hybrid nature of the device.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hw.h       | 6 ++++++
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 2e585a42dd9b..84b9440b2c16 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -239,6 +239,12 @@ struct ath12k_hw_params {
 	} client;
 
 	bool host_alloc_ml_id;
+	/*
+	 * True for devices with PCIe hardware registered as AHB platform devices.
+	 * Such devices use AHB APIs for probe/boot but PCIe APIs for operation.
+	 * Example: QCN6432 (PCIe device attached to Q6, registered as AHB).
+	 */
+	bool hybrid_bus_type;
 };
 
 struct ath12k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 408844024dd6..f91279477a20 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -497,6 +497,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = true,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "wcn7850 hw2.0",
@@ -592,6 +593,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = false,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "qcn9274 hw2.0",
@@ -683,6 +685,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = true,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "ipq5332 hw1.0",
@@ -768,6 +771,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = true,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "qcc2072 hw1.0",
@@ -864,6 +868,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = false,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "ipq5424 hw1.0",
@@ -952,6 +957,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = true,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "qcn6432 hw1.0",
@@ -1036,6 +1042,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = true,
+		.hybrid_bus_type = true,
 	},
 };
 

-- 
2.34.1


