Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB68CA6007
	for <ath12k@archiver.kernel.org>; Thu,  8 Oct 2026 10:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aYa3+GVmGr9BmGXwLVt9xn5ynL0J/pgsZaVZ4wz1X8U=; b=me0OhCF4b2V1TOLUsat9L+xerr
	LgPAFEsW8qFNPCY4N7eVHxE9vKiXfwhnsUpJcthEfDcSCqfvF8NrvGiy5cAFLVsJLrQdWfbTcMruF
	56F2LvbmIQNO1gkK8dgi0uAOpvihUx6tWN4kYQEyP9Q6a8SsqaQIfe9l6lJEZM7qCXeqRdbbgZULn
	1Uj4CpXHoMgdzvdPtXNTOBUu46UL6Gjw3wB5e2OUvhjVVfMlcrvLZ7iY0wpqFzFkWkY37+85yzJq3
	w4hpSJ7zW+MDAWy5IF+L8tTyM5oZcGE7c6/LwGhwEbax580uji6fxs7joTvzMo7tLmHQrjeRqFkCj
	5QFtj0JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElJd-0000000472r-0vRo;
	Thu, 08 Oct 2026 10:25:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElJc-0000000472A-0rf8
	for ath12k@bombadil.infradead.org;
	Thu, 08 Oct 2026 10:25:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=aYa3+GVmGr9BmGXwLVt9xn5ynL0J/pgsZaVZ4wz1X8U=; b=A8ZJg8b13lVLlbkOS8WQ60Sh2U
	FQnx88F3AYDYaS9sOeCVkjBLO5/ux/gBsn2rysIdjeoS3CR+uksftxpA167n8siARSXCcfV7nirxS
	oedgrCRbS3QIHZTKIvJ87OZ5yN5Y4CE80sIGKOZeVYXE6dOZG5AHhqy5dWkmPIUC2bbhhSayJr9TK
	teA1mqFMZB+K/uB+7HecltflJwDaHPJGIV7VDrD3cZNeWUy15pYr4XB4mopHmklqVZOABqdU9NSu5
	cKGSxDFHhq3G/OTHr2b75BFEddac5FobIhDLoM7NasyOF/SZW+0BHnnaUhBgJ8a/KqsEl6Z6lOkMB
	j1rN7ptA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xElJY-0000000AHvh-2IIx
	for ath12k@lists.infradead.org;
	Thu, 08 Oct 2026 10:25:31 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987Kd6B2686693
	for <ath12k@lists.infradead.org>; Thu, 8 Oct 2026 10:25:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aYa3+GVmGr9BmGXwLVt9xn5ynL0J/pgsZaVZ4wz1X8U=; b=coiEW/1LJUyT/o9B
	gX5VytdBNFX0xy2Y379KjuthfKoXj37Ps/8FyR5M0io9HE4RN3AMQx2kPmbCdfsf
	PO3c/Xri1fwJqfd75vVNYdWMlSmFYJl0ClVCdKlp3xJqXdP1JcLJHz/9F6YVR46O
	bdbNEZKjxU6ln1Wb4bAo6WZ/Dh1PG1xvukAwgIWctl+4TH7T7vkhd1VI1Zd6ILVe
	gJPcaj3/G97ZqpVgYWT9gKvn5aL62ExMhUn6Ed3jzUTJwOE3BONCte/eHdmQMoVV
	PXguaoqglAJeen1TsCqEhvmMt3Af5O5m9WHNoON41la0i2bTLNyWBocwH7cofo7o
	5mNkRg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe42fbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 10:25:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e5df3b58a4so25372275ad.1
        for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 03:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791455126; x=1792059926; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aYa3+GVmGr9BmGXwLVt9xn5ynL0J/pgsZaVZ4wz1X8U=;
        b=QqQEabBkXGwVfV/dy1dV+wfpc1bM89CEN9CjM0TG5lwPoMSMd396NR1bzqVKML7uQE
         QQlLNypbKVU0zlOoqe8Tnb/8O4WQxRKGHutIimV/IcReLF9wkzDJIOTEzHVMtY8ovYwb
         QpCFHPY442LxUCe9Pzd0m+ASBNcWZFFMjeNmiY/GXsTK38JoOmRbZUedUGKb79D3sSiD
         hqwF+esWWhK2cNQpR2VcFzX60gp0ZFYlpwH2mcqJHIYTS5NQmlsGyk0C8e7ixMcKqlhw
         PXoN6McGFvc1sZuwRWFmQ68PkRl70PnKABnXpdKd/4CK1S8YzjfeziN/wQn53l742qtE
         Rs6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455126; x=1792059926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aYa3+GVmGr9BmGXwLVt9xn5ynL0J/pgsZaVZ4wz1X8U=;
        b=wKzPBm/NfK40JPXsbv+nlaS7mYI6QyElLitd1bIjoS5mPwas5OWwbDjxvLG4ai2Mlq
         6K3L2pZPuioIwv77KZ9Ooc+SD2NiuWeai2xkH7GvqK+zPQRQSmdID9bJb1TRIk3Ezytr
         5BDVJpJXnlAYiRVpvRUz7pTekpfTXbDiS77QE4fLRoqUHkVgCqzFF6yr3fJYhLM02YFl
         5cratMGNI1ygqDiyWOaCchCrq6CuYH53nldolVneZEkz0KUdznzJA/yZ+I6a8IPUdhWB
         5JCkqK9WrkDksp4n8AO7TPAarfLwh1458rzGmFPoJSha8ekXm0nD0CxqqLR/tyOTDfc/
         jjlg==
X-Forwarded-Encrypted: i=1; AKwUvBzg0i2G/4o3XP9rtpOPNxV+1rwj9HDKYia58oLMB4gMTzYEdh+zoEfAiO5XO95aUAZJ7J0CEik=@lists.infradead.org
X-Gm-Message-State: AFq9FYJCcbt6STi/g5FrdIeYUAezDy7AE5We8O4xrALAd+9K77tGofgU
	6rTR3np0fUZUcmijXt9eoJLqfLFCEuXOBZhEZIcuF23K7JllXqPWv5qwjldbHu/uug75n9hGeUF
	4mNmB+jdKgZ4OG9T86c4jp+8qSckS+tN/eS4u9XZWr8DgC+4r8gpsGCj3lcMVptAf
X-Gm-Gg: AYBFou1oXdMGjKz6PxiINUBB67rX8B90XtqlP4yzpp4sMyh1bpC/z1IgkphcjKEiji7
	i3mo9QGcNb5ZQFY0XO6EQIMcwC4bJLQVBp/SK0J3JbgpvbuNfu9nSCYUREPnCs5Tiy/ABuja5Em
	FjeyUJ90T7VY5B9S+eE6faJmD25+YeTIbsD3Z2TSb8C9mek81St5trc2+q5CFhLKOCaF2YFCg8f
	RtkU5wDQeS58NPvcNDf0XdWzu2qN7JwU505C0zFqflhl0zSH8/IM5J6YvNaKBg7r+P2Ltdox1Rb
	F7Y9ms2ftRVNubcFIx890YYNjrChO6ol0Tt3xZKB302wTg7GCxj7aui/R+6kX4e+M4rxffi6iRY
	ZhnlovAyR7pYBdQQ8VPcKRBvRTspmgsHcALquIEHU0UKHHifOOnLq7W3/AWnPg7DLGM5OC46Hhc
	omdMfedBqicNk0G1DZMg3G8Q==
X-Received: by 2002:a17:903:1aeb:b0:2e2:df57:fffa with SMTP id d9443c01a7336-2e6004bd351mr48679385ad.31.1791455126032;
        Thu, 08 Oct 2026 03:25:26 -0700 (PDT)
X-Received: by 2002:a17:903:1aeb:b0:2e2:df57:fffa with SMTP id d9443c01a7336-2e6004bd351mr48679225ad.31.1791455125495;
        Thu, 08 Oct 2026 03:25:25 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe39csm22081655ad.16.2026.10.08.03.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:25:25 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 15:54:12 +0530
Subject: [PATCH ath-next 16/17] wifi: ath12k: Resolve userPD ID per device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpp_bringup-v1-16-2c5797b5e4ac@oss.qualcomm.com>
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
In-Reply-To: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: x3OZNpIJwPL_4xNxwKQ5mSU1Owa7zN-f
X-Authority-Analysis: v=2.4 cv=AbwkjHXG c=1 sm=1 tr=0 ts=6ac76f97 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=OMOyA7uMCkrHFcBVPHAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX9U17t+nXizeU
 SrM60yRaQt0Rx7M4dmm5BUPqVIaTW3jKauEuHVdYsDAhoElOuA6hGVEYY82FZsaZmiy0DPSTrBG
 DM19Tt/GwJ1cxtkpi59gIwkLAg4ddxc=
X-Proofpoint-ORIG-GUID: x3OZNpIJwPL_4xNxwKQ5mSU1Owa7zN-f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfXw/xIT8tBaH1y
 /dpEICYHZT3bMRE2CY+GsIvgr+QLn7R/ALSELiwXeIhwwkYvtF0sNngp8XPqIDovC9S5+5YGn+7
 RFv/RYN7+kME2/6rTslCRJ7rniaxAkG1LocQsONEZL/pWfaipNLd4bEfn+nPoBBnq+JKGehEv6Y
 4y8FYBIeIAm9ClcbJnJW5023Z8rgvgNP9Zfq9V8NndQLz9sPEU1fjW+nkN5grIgvW8e1QGQC0u2
 Ek8qesbQRnIVRnEl4cX14QFaEiFqxdy9oNSbiAutFHXy3GJrfLIHwY2xtWNFdCV3AkHJYKsOukw
 oJNzbd4hYXJM2DiNIP81z+hXGaXWsxcq7QScdb6AlDM8FrisaUXf1HTyKN40MdxJPcSfVwWhkVb
 LlDzbeZjig/XCQLNlDLF5RXLqfsL8Lkyic4MHiwnGKPXzbYw0uEVGE4crDHLS2n0hRQdrN1qJzv
 91bWnO9CTZRg1BJ7lTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_112528_857589_2E19C12B 
X-CRM114-Status: GOOD (  22.19  )
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

Currently, the userPD ID is hard-coded during AHB probe. This does not
work for multi-PD platforms where different devices can have different
userPD IDs even when they use the same compatible string.

Resolve the userPD ID based on the device address so that the correct ID
is assigned to each device. The userPD ID is used to determine the
firmware name and PAS ID for firmware authentication.

Also set the multi-PD support based on the AHB device descriptor.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
index bff48b2fe124..86359ed1eeb2 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
@@ -16,6 +16,10 @@
 #include "core.h"
 #include "hal.h"
 
+static const struct ath12k_ahb_userpd_map ath12k_wifi7_ahb_userpd_map[] = {
+	{ .io_start = 0x0c000000, .upd_id = ATH12K_AHB_USERPD_ID_0 },
+};
+
 static const struct ath12k_ahb_desc ath12k_wifi7_ahb_desc[] = {
 	[ATH12K_HW_IPQ5332_HW10] = {
 		.hw_rev = ATH12K_HW_IPQ5332_HW10,
@@ -43,6 +47,26 @@ static const struct of_device_id ath12k_wifi7_ahb_of_match[] = {
 
 MODULE_DEVICE_TABLE(of, ath12k_wifi7_ahb_of_match);
 
+static u32 ath12k_wifi7_ahb_get_userpd_id(struct ath12k_base *ab)
+{
+	const struct ath12k_ahb_userpd_map *map;
+	struct resource *res;
+	size_t i;
+
+	res = platform_get_resource(ab->pdev, IORESOURCE_MEM, 0);
+
+	for (i = 0; i < ARRAY_SIZE(ath12k_wifi7_ahb_userpd_map); i++) {
+		map = &ath12k_wifi7_ahb_userpd_map[i];
+
+		if (res) {
+			if (map->io_start == res->start)
+				return map->upd_id;
+		}
+	}
+
+	return 0;
+}
+
 static int ath12k_wifi7_ahb_probe(struct platform_device *pdev)
 {
 	const struct ath12k_ahb_desc *desc;
@@ -60,7 +84,8 @@ static int ath12k_wifi7_ahb_probe(struct platform_device *pdev)
 	ab->hw_rev = desc->hw_rev;
 	ab->hif.ops = desc->ops;
 	ab_ahb->scm_auth_enabled = desc->auth_enabled;
-	ab_ahb->userpd_id = ATH12K_AHB_USERPD_ID_0;
+	ab_ahb->supports_multipd = desc->supports_multipd;
+	ab_ahb->userpd_id = ath12k_wifi7_ahb_get_userpd_id(ab);
 	if (!ab_ahb->userpd_id)
 		return -EOPNOTSUPP;
 

-- 
2.34.1


