Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98F5CCA462
	for <ath12k@archiver.kernel.org>; Fri, 16 Oct 2026 03:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RGC/QxMhfVN6aPNvFvuuD0sy0cwQERaXx2h5yO0ek1U=; b=Gv2UtQUI8AullArTSozc4+sPu4
	TdZMdoviErjylb2+IoSSM10uJOIEErswHIf5MT9Pa+0/+brT+p4bxnfYYRXtQk8e2EB4uyzX5VmdH
	wqopPu9+K35U3W4wpAQTkOLt5Ltzz0pRM2kyUW5F3EKOf81WSwwcDpBXVJKMEzLe8N6Ql66gUuom6
	ErhYv4NK1QQw6f6uncp5IdI+v6kgDzy9BcV41T39OUUNP3s6/d77uldcD9M3cqAeK/xbGhK22tEOH
	iCSqkJuvIpuDUap3bXac1wPE02/4V7QRhtaZhR+O0kNYHSPUanGzvr6ASKOYx+kW17jHAh/AGHeTD
	V1Z1gtBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYWW-00000001pWb-28Jj;
	Fri, 16 Oct 2026 03:22:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYWU-00000001pVE-1fHA
	for ath12k@lists.infradead.org;
	Fri, 16 Oct 2026 03:22:23 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G1mrfL3202262
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 03:22:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RGC/QxMhfVN6aPNvFvuuD0sy0cwQERaXx2h5yO0ek1U=; b=lD8ZmV6gDbUHEnJN
	zIKz94ksP35NolSKboP1igNSZR2fjbKsm+IQYr1atd1DQjDq8EGX5UHDcppXxw6Q
	CPZkuUa6QUmUVJ1eQn5MQ0P2FquJ84VrBXyxGNBYUkXgvPgBfK1gNCJB94iS82jY
	QQxP16QROKwYYNtQLA/Y1h+TuDR/qNZqicyc69AJaJB3s6DyyKQ73t2ctDSHhpV/
	UFLkQzNl7K7KNBHk8pu0/WxYxfQoNttcXEKFNvb0XijzqA7F0nuqFUpw+1IcfKLf
	EshyQykoReL/J1XmB1qTV7cz1CCUfOPFPJ6zGAXT6x40yPp5BtU/Rjbc7U8GaRYQ
	ZDmCqQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3r39u02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 03:22:21 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-351788121cfso13835381eec.0
        for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 20:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120941; x=1792725741; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RGC/QxMhfVN6aPNvFvuuD0sy0cwQERaXx2h5yO0ek1U=;
        b=WDsaXjaYj6gySyu9m9j3eU6ITJ5mTB0F1IrrtJLZDSSx6yWq5SVZU+99mU5Bf1nxYU
         jSqknqTca3GP/e+zqvyluYk+VCw8l7S83vYINEma9hCb2N8/ZFs7PotxjSgDbSgv5eJb
         HNTQRLbdV31KClzXV1yphffPw9Jnfq05FiGPyy7D/8uLfK3IagKKvvdt7+VpKa3JfRZV
         aNGAoZIbrjCLWXoi1xwidKF1UvulRa7BLz/7D6ex0lMkQXCtjuv5iWUdIzwmqq/S2tpd
         zxFpPKg9Zq2yhuQrsKgSjufjMvt2pLcUlDbWGubv8SyrRk378OO/Kfk6JIkXoektWOPe
         o4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120941; x=1792725741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RGC/QxMhfVN6aPNvFvuuD0sy0cwQERaXx2h5yO0ek1U=;
        b=eONjPKFCJ/AE/fOWA5/lsPa+2MR/sHVj3s1A3UZtU/PNrLQUe5HDLiB3yscy8wFMlN
         g4IekoHrMfQuhyAmqLlIgNhgsnXJE8jlPdOawRj/dPU5+ZT/EH+yCdBlPZV75k3kDAp8
         gWxHTMNBFw4oEoNTJdBa/lox6r2c6Tv/VPiWaCMzKyrrWCKj6eXWW/abdsGSTEXkM0Wz
         Y7wphBqiBSKq1iJ17y9GktsTuv9yhAxCbcQJfokdxm1g93MWwd8a64Zdc0FMCauZxC/M
         KPDSVeNyxKASYM0u980F4dRWZhRFdDZvNEoH7J5WueN0YRaIHDpCefEuB0b6dSFhrALl
         jIFA==
X-Forwarded-Encrypted: i=1; AKwUvBxI5iDSHjSBFk2WInmzGChfZqX7p+kbrlcwhF8wGUvMe9j1nCehbZe3vDLAu4i2cLKeE1xNGVU=@lists.infradead.org
X-Gm-Message-State: AFq9FYJAzp3NEU/MukEDs1eiGFn8YQ1xdIO3TupsF8wTDfbwGjeROKrs
	OeS2GcA1QyDnqOAHXogJcewd2Wh6DZSXKs9aTGbkisogiUwKvvP9gEEJR0ZQAMxl0cjzdAwKIvv
	nWYDLyRZ0t2MsahausubNcH627iKgMdGoSZJ6YHM2rsNppfILjIB9enheG372uA3R
X-Gm-Gg: AYBFou1+vLvSYFB6MIW1LivAcRaWFHVN3NQ4wDNJTpYu26PDEoGM+kUn/n323Qd3eX4
	ijutgCVqE71RbStOxV7mWz8Poz/f0dqd1kiuDKntijUIZoRVOLqO9JwQZzOCloBjEL3NbAT0Yt9
	Fm+Mc7DMCST69YfBmutfUzfdu+RGBY4fI9By1t6hmkL2dapiPDvQMUNTdrJew//8Gnt25D8v2AQ
	hatMrYeTlEZmpLDgpDewWH1xuQSORO/4C23bRR9cj9+AU9RsH//IxHk34IQlEhvtuoPefxFvD1W
	Z8IgjWAEIJY/fo62TVRHKA1DHpXR+MWH8YAFsTPPDbMXIs+Q4zlMi+eGq81zbRyXhThpG/kU0Lb
	QD1FpfL6C44ahY3MjYCn2ZKx6oAzHyk18VnKWKA128EYxoe9sT2dtIVgrKtqN1duOw94eGXO+mg
	zjjXU9NHYXYSaZDkVh5BwZKw==
X-Received: by 2002:a05:693c:87c4:10b0:356:4b46:9393 with SMTP id 5a478bee46e88-3564b46940amr25057548eec.24.1792120941149;
        Thu, 15 Oct 2026 20:22:21 -0700 (PDT)
X-Received: by 2002:a05:693c:87c4:10b0:356:4b46:9393 with SMTP id 5a478bee46e88-3564b46940amr25057524eec.24.1792120940616;
        Thu, 15 Oct 2026 20:22:20 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2256698eec.13.2026.10.15.20.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:22:20 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 08:51:44 +0530
Subject: [PATCH ath-next v2 07/17] wifi: ath12k: Add hybrid_bus_type in
 ath12k_hw_params
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mpp-bringup-v2-7-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
In-Reply-To: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX2dnEygSB6DtF
 liIBRpSeVgQhNCsz0/FdNfYlkmjIETpkEVTWlSt4vJcl6e0DlRuXjB0+Ssr3Svcq+DrSrcrteNh
 T0tAd5wcTOKv6eZaIOU2Kf1Vi7dkUa3dlZD8Cfj8F8An8sqKhE/Fan3tEtAqkpEaC36gCzNXVIs
 EgUxBoqqSAQ6SSuA0scBn85Rw501pJEpC6Ci48AKzJN++VVlI6sJhkPSt9DNpCQzXt4nI2/ahnM
 DgwR46RWZJNDPeDUSn8zEsp2aOcFNbfcpilD65Z71MLfetR019VtVGq55viYaMcJQxeLjhwA1dB
 99H4YroZba9YgTEZkz7UyPA0zfMla1bCbMlTav65Q4QDVuqSRnAxZ1SkYtYtUmJKsJ4ErSuUHls
 ZiC3MP8aiTW7Pir9r1ey8TBv+PC/cHJoJtGtt2DWzUJ/iaRTn+2Pu7+7P+vf5xHNLVpMDTHBkYD
 BQupL7QEx+kY/wzL6pg==
X-Proofpoint-GUID: sWg2SIIg4-sJ-gjllq8Unf6o5zrcOq1S
X-Proofpoint-ORIG-GUID: sWg2SIIg4-sJ-gjllq8Unf6o5zrcOq1S
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX8m2VRO+ZRN36
 1Eqnr6bLVvy0Z+waRsdJXIiXtDvnEQedtjGb1DaNBKtIUc88nO//ePnJlNjTSZdZCdxr1xNe/Iy
 ESpKpj4oQSJTFGn8rxTpwmPEOzOrlfc=
X-Authority-Analysis: v=2.4 cv=INGXmQvG c=1 sm=1 tr=0 ts=6ad1986d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ZOe4Ua_9D0VdX46zIBUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_202222_450740_8D3194ED 
X-CRM114-Status: GOOD (  14.03  )
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
index 833aa6d43ce4..fb807d5a6ae4 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -240,6 +240,12 @@ struct ath12k_hw_params {
 
 	bool host_alloc_ml_id;
 	bool advertise_iface_mac_pool;
+	/*
+	 * True for devices with PCIe hardware registered as AHB platform devices.
+	 * Such devices use AHB APIs for probe/boot but PCIe APIs for operation.
+	 * Example: QCN6432 (PCIe device attached to Q6, registered as AHB).
+	 */
+	bool hybrid_bus_type;
 };
 
 struct ath12k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 616ff695763c..728bf19980b9 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -498,6 +498,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "wcn7850 hw2.0",
@@ -594,6 +595,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = false,
 		.advertise_iface_mac_pool = true,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "qcn9274 hw2.0",
@@ -686,6 +688,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "ipq5332 hw1.0",
@@ -772,6 +775,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "qcc2072 hw1.0",
@@ -869,6 +873,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = false,
 		.advertise_iface_mac_pool = true,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "ipq5424 hw1.0",
@@ -958,6 +963,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "qcn6432 hw1.0",
@@ -1043,6 +1049,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
+		.hybrid_bus_type = true,
 	},
 };
 

-- 
2.34.1


