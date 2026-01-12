Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F55D25032
	for <ath12k@archiver.kernel.org>; Mon, 12 Jan 2026 07:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=arthdfnc7nsVai6q8H5JKb4gBCDzValB0SGVEOtsN/U=; b=Q/cGK5JHu/LFXGnkAtS5Z/ohtf
	OzzykN3XiHXVwTuWy7BRbXs9mXFfxuTSqSauRtxaK81O7Uyhoqnit4O4RDrfG+02ZKNQpd5DWK9rc
	fpNJieeuXdlkvF3FSKl6QFvN8YEomHBdW5XpkAUl03zjxxnSKQIUyiLOw5ALBRML0M+yFJQ/cdPKT
	jdGMIz3CKd7F4lepyQ4YIEevHU6qX70aUXkeN6DCOqthrI1KxcwwKr38TBMh0SQ1lBhPfDrZdZ+1e
	aLYuJZwsi6jdFQLhw6dyYxTzpqDvJsRh2oaV+nkso8Edhz+3P4rCb4J32j7O+UHoNPDov/Q6FQCmz
	qZOXPeYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCU5-00000004tMO-0SX9;
	Mon, 12 Jan 2026 07:37:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCU2-00000004tLA-47ED
	for ath12k@lists.infradead.org;
	Mon, 12 Jan 2026 07:37:04 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BNcgNQ3286906
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	arthdfnc7nsVai6q8H5JKb4gBCDzValB0SGVEOtsN/U=; b=AyQ2STQGKCQBgWrt
	0SbSxlOk3JxIJUrRXBeTBvVWR4M6RXo17fkNduXbOeVe7wyjNQTamma+/fmDUoVo
	Q8Y2pAsofwdy5I1wZ3DFDflmrlA7Go2feIsTRJ8gjYIOcAXVP7/07NEYGidY8XxW
	sFGBOP2L4r4F/g27yKBTrT59gzDn892XaXpiZIrTMoXRFu3zF80bZtJtLvtGrlTM
	ISbwctdqJf/C7J14z54cq/TxM4OwRVAVwM3RCEFR3O6+xKZMJq+zz0rpfO2N/mTA
	edvKpdmiTK2dK5WYCTAjNIFkiCZ3FFu7x5gLGd48TCZ/7jilxnqPwuP5wgfO1mWs
	sS99Xw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkntukdc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:37:02 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-81f53036ac9so551818b3a.3
        for <ath12k@lists.infradead.org>; Sun, 11 Jan 2026 23:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768203421; x=1768808221; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=arthdfnc7nsVai6q8H5JKb4gBCDzValB0SGVEOtsN/U=;
        b=OREw0tWdfHShs31Ab67lTKiklOyOzv/oVKhYLiOizbWrhDbB4ZOcVPvsqZ5CzHBsgO
         z8tzZtEn4T9P5s54bHmpjBv/gIYQPcojgNjeAJRQq2m3GoADlVo44N3zyAVOGiwb6HCs
         +CcbzVQzwUF61NYIhdQoioZP85Y7LFTn41aCiBnQmAc88bIxk3T1D2qHQr9ylcTV/AEs
         9zqEB8WzQqw1wmyDP5gAAqHSZtcY3zNI1zNZ9ZlYpk4VkLN9bzdh63P4LG4bl+GPzJIe
         5TGzqINpXPM3cwzyuglF4KYFbutW3hWo8V2p0rZKa8AoScr/vyfAyvuFTrq6WuRL/2Jq
         8lcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768203421; x=1768808221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=arthdfnc7nsVai6q8H5JKb4gBCDzValB0SGVEOtsN/U=;
        b=CeqzK5I51cNvFL15fX3Vdam+cr5ZteeYkUdIJI9utzWNKREgbQJSZked+pNTKRQhYQ
         RE9ru+55Sap0WAjrV5VUbqqzppvyzPco3FdsKcfnpBZHuowtQ2JURxSswZMwDPTZy/2l
         90AJ3QW+7HMegT1oerugrAWUIFpeNCbGWDN65vs3YbMoYa1RiNAadx+yjTlIQqAtgrvD
         duu6ty/4Iep9Qp/M6Hs9zujztko4ix3xzPiPna5ubb2XrMw9Xb5v1KolWedCPFXSIRFn
         3UIqMdCmG2fbVdScz7aL3tMeL1pBKljS1axjYBUaoYB2br/CD7KmnAxulFzX7KhlTqHB
         qT0w==
X-Forwarded-Encrypted: i=1; AJvYcCXSfVchaul0kBmxr6DiTxVgK7nZ7NQsBuZVbUJbUSZYgD3owRiY9NTAqrlnjvJNEdDYpt+ugdo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzAeKDdtKarmW8eBMRq/LEGaFASMpFBujdBtpbgZEVRugWDYhXZ
	KMkNJmDf5S18kmdH63hBjtcoIRH4GqCe1BP9JwQ9WLZ8tMF1Vx+Re+fbugJfH11kHtlEYxs07/R
	ilVxpX4ximeD/gqAcjur/EbztwGS9wIpFxvo/Saf67F41mZMIX5C/nM8Nn2tjxUzhffxxBXa2vB
	s=
X-Gm-Gg: AY/fxX5V+Bi+B2V3mERKPt8t6p3dD4DfrWxDz17dGBbJo7OIiUCZ/e/zw/yhtqkA2Hv
	epgv3hbivXXWtNZ4MrJA3xREpjfpO8HeYEBNR+LDOdw0P7ze8inUSHhRIRh5C5o4XWa5zRDPVkh
	fcy3OoBIVlz4/Og0sIU0ZJK3wOoQAnsVCGk65lnSHiLdOuygIxGofktlb69Dw1+yelXD/uslJNw
	FzFVzRAvRq7wSwhcDxZaCrflUxfmv+MfhzpcjJvXohj72ICcLjLnYjwKV9/Q32vhox6DRTqJLoc
	9ktylayMdm7bIP1tc1xbP0ZuUGy5/7uXK+7EA0ocafW0Pm+PgGYDPBqE3IiH6GZWYIq4VcyyfyX
	Kch6/4e/tTIVIXatHwbpQcZhLcNH5BDSQ5087VpWkerde9Kax1WFz6Q09TFPcjx4=
X-Received: by 2002:a05:6300:218a:b0:37b:992f:8764 with SMTP id adf61e73a8af0-3898f96bfe3mr15069283637.34.1768203421407;
        Sun, 11 Jan 2026 23:37:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeYllVPKi4LiALHfmYM2WVbvhbBCTZynuio8RJugvEi6VFhgjvZZqHrDe81U1+x621yb4BzQ==
X-Received: by 2002:a05:6300:218a:b0:37b:992f:8764 with SMTP id adf61e73a8af0-3898f96bfe3mr15069266637.34.1768203420897;
        Sun, 11 Jan 2026 23:37:00 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28faa9sm16548684a12.2.2026.01.11.23.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 23:37:00 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 15:36:24 +0800
Subject: [PATCH ath-next v2 04/18] wifi: ath12k: fix preferred hardware
 mode calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-ath12k-support-qcc2072-v2-4-fc8ce1e43969@oss.qualcomm.com>
References: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
In-Reply-To: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA1OCBTYWx0ZWRfX80V4g6oAexr6
 tyQZgYdPqPxSNm4xMyfA0FsMeDmEw5azxVpjb0ly0MxyS3iq4m5RwWGMR6/cprruQfuxZ8FsSjo
 K5a2pW5SilAy+KTzuGg+kJeV7jV+Q1UdSVCjm6zeWTbOPDsM9V8mwZTChF1tlkyPc4kJKkeILxT
 5r6fh/hJH4PSiOjgsJRzZwc4hC/WLA3jLX/NKcX34op6IDj/ZUGko5exPXd1aD/dPs0tXCecVxh
 H8ahelcwJUWvfshQUnGFyzMxDQT23QdYkdjNlLykIEqlW0u/T+fUdjV7ES0yB+KG7j4wAGD3h0o
 VVO64F8Yf22X02Q0QlHNovXpd4JVvExuTjT15forSipg9iLsjP2jVKZft9fVbrL6MpttksFO7JC
 7wMrZaMjHCgygFdMSOBt9aH+H5dwRw+S28SMYN1XCt4i0bb6KY/+3WX6C++qPcZDg57ssZF9ATW
 hxgCGf/oERWgC0OArLA==
X-Authority-Analysis: v=2.4 cv=R6AO2NRX c=1 sm=1 tr=0 ts=6964a49e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=zY3FkhqSlrVAWUjZaU8A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 4lhv8h9c45rv52hu65FKoIW7UjfpEYbw
X-Proofpoint-GUID: 4lhv8h9c45rv52hu65FKoIW7UjfpEYbw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_233703_030009_1059E96F 
X-CRM114-Status: GOOD (  15.66  )
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

For single pdev device like WCN7850/QCC2072, preferred_hw_mode is
initialized to WMI_HOST_HW_MODE_SINGLE. Later when firmware sends
supported modes to host, each mode is compared with the initial one
and if the priority of the new mode is higher, update the parameter
and store mode capability.

For WCN7850, this does not result in issue, as one of the supported
mode indeed has a higher priority. However the only available mode of
QCC2072 at this stage is WMI_HOST_HW_MODE_SINGLE, which fails the
comparison, hence mode capability is not stored. Subsequently driver
initialization fails.

Fix it by accepting a mode with the same priority.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 17ffc4822741..32c4e7fe03c4 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -4449,7 +4449,7 @@ static int ath12k_wmi_hw_mode_caps(struct ath12k_base *soc,
 
 		pref = soc->wmi_ab.preferred_hw_mode;
 
-		if (ath12k_hw_mode_pri_map[mode] < ath12k_hw_mode_pri_map[pref]) {
+		if (ath12k_hw_mode_pri_map[mode] <= ath12k_hw_mode_pri_map[pref]) {
 			svc_rdy_ext->pref_hw_mode_caps = *hw_mode_caps;
 			soc->wmi_ab.preferred_hw_mode = mode;
 		}

-- 
2.25.1


