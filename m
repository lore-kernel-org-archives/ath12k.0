Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2922CC6B00
	for <ath12k@archiver.kernel.org>; Thu,  2 Apr 2026 03:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G+ZQek3ZrEXnkEljZj/45IgLfCqU1WoOU94hrFBCK+8=; b=lb3U0UMhqMU6vRK3DTmPY+Im37
	w24IIWml4Lix2BhvEQ9NaoceTveWFOnjc6XiaUNP1w3Vt/D6824mqkxxz68yk+rCeufIwLCtYiK6i
	9A5/AWh578TeWaspn4gwXDu1PthDKMxJ5apzK7JGSg0MVJVca+sqhdyrkMlA2XgiGLsFxoflj9vBG
	2cKrphZGFmEcXu2BVtYyf3HPzDPRsUeOZ8iq76nCLNuvOj2dFH5VWtB7myORbuy/7NVtBf4/KAm1Z
	lu1EF38aR/z7dfYja4QT/Z+qT+b7qyR9+W6sFVjM0SeZa6HJbkao4YczthLBQ3RB9lcpAne7pPSRO
	Fbj9YjZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w898S-0000000GggP-2eAD;
	Thu, 02 Apr 2026 03:54:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w898P-0000000GgfX-0J6J
	for ath12k@lists.infradead.org;
	Thu, 02 Apr 2026 03:54:22 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M47l34009504
	for <ath12k@lists.infradead.org>; Thu, 2 Apr 2026 03:54:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G+ZQek3ZrEXnkEljZj/45IgLfCqU1WoOU94hrFBCK+8=; b=M+UYTIgUMZrH9zmv
	egLUbU1MCT6jsyUW6xUZUq2aAAjK7Qd8dEDAz4EYaHY2BWt8nyw3q6vGEmRfOTB8
	luZsv6LM2hwb7hMxmPBO+HsXMP1dgJJkwEBpB81VzN6G+qqAaPCz8kqPaH7YmdW5
	7mb/I9mI6tNCa7TS8KeHk5B3SmGG4NunhxxMbrjmZBA9hfAfQs6BQNPkeVh77xNd
	CsKHKXDkJ827mMOYc+AHVWXjPdEaDi4tosz+UxT1oukMVy6l2Nh6W+FPa4uC6mbX
	OlBzal8sHf1RaBWVoTFXBGiij2xs16yhLJ9NeqRpjTG7ooLXPtsCOy5gFx6CcoaR
	h0JUpQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d97e01xbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 02 Apr 2026 03:54:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c649dc145so244865b3a.3
        for <ath12k@lists.infradead.org>; Wed, 01 Apr 2026 20:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775102060; x=1775706860; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+ZQek3ZrEXnkEljZj/45IgLfCqU1WoOU94hrFBCK+8=;
        b=LIHcKKsVUxckqpXgc1j0XTQXWxPHSx0D6kOvN7/ToH3bz4K1giIbcEX3j7V1G9YfdE
         +7xSq3YyIbr9om0jTS9WkHbov4xQzEJs5wBBdXZq3I2etqwj7aZjB35/YrUoLjYROySZ
         UUr3QkUN4LpXDAr8E66EVD1XVIzhrISrszQXwE6/e8mpjwUVKTfWha2oGiZJCcegYtiU
         1TbLXPAml6FOHLdmmGQ9VEwOgKEPttT7mlRBXU3lbO61HUP2OzqZZFpAsolUoBx18bYl
         mc9rSi5qj7znKX87nCxf4XietU+AG40ZNO+PaZIMnWrWboHuesrsZiVWqixAc8YbWRmq
         7hmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775102060; x=1775706860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G+ZQek3ZrEXnkEljZj/45IgLfCqU1WoOU94hrFBCK+8=;
        b=oDRWLqXScl11BRG2eSDsTbZd9W3ty3HwKKAmsjIbw6BoJp4XWekNwKH7mOxiIzorlC
         4r81uTG0TbwTfhQVgov9PRlYtsS7bb+SmSmiJqkq80bbWUvtKYJbDHzzFkIEmGPYtPzP
         SmSkN5w/1fnChSwt1VbihUzK5lGnyBZb2AI1FwOJ9EuHyM/IgucCdK4HKcAFKWXjwAzD
         f8p8A3WbsIke8LNzIMRTZBEC3kZp3EnOIRMaGJiLmtdb/wYaqwv4nI/5a++qwsCotnK4
         du1uR1Zu2sxae4l5vHTslnqeo3TzJ8FE0O6Eo1PlS31NlTBHagoO6Q01p+9GD7QJ04M6
         7B2w==
X-Forwarded-Encrypted: i=1; AJvYcCWoXDjfSAUPc1L1qVL7EgW40uA5VljHNs9g1ZJ+PGKpEYVu/ScCMFD2CwoB8JNVExrZ3SjBAPc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxke4ZNCSSKA8BknW5k6HwT+Csdn0aR8IulbyMZFA0YFzdvh6YV
	Za30F+mHRKwjrzOIXy49TjPTtcav/oeIuMKWsdEGQtVx++RgybDdk3H91SJD+fR9f3EzMo3ZIis
	/b/hNWsmpNoKrgqLiZIdrF8sXWwILoGvQE2fJ1wFgjwRXyCH6yd05h8R6SD8ckFAR
X-Gm-Gg: ATEYQzyYdYEkA4jaGrSnX+olVR3G79mCcLJnSacEAurBoDpjXg7Dia9Rpxzs3Nt30rZ
	Qs2xmjeXCdRgp542J9J3ObYXSBc0c7acKhiGD9nlJLbSFZbcoCuZ4+/G55G40ji7RaXFnfXLlul
	qCp6gXxg5zy90wsPU/zSOEqkaMvUKAORhQ5du3mMmJGiSLEp79XXPj50SonXtHe+wXLwPX7lSOQ
	zTQYtTjSE3IhC8++sgIos6uEV16udZ8QVn74xCMN6ZW0uMsxF4fTMq0RhahFfPJOyplziUhU4dE
	8mATCDu3AGYP2DsQqBMLL7t5sIQBtcmuHKvlhHMtrLzz6iwMhIULcyh6HhyFsvIJY2ACCKVNsZF
	kSrHtYaVSx2YtGxiojYPPwVxsgYYVrWexMEDGNZ90Q/HiqSGH0k8+id89isW5T3foMqURbi+GNC
	LGH72ZKhgL2ciy1AUDldtj5l/EUbTIidg8wdnXpHU=
X-Received: by 2002:a05:6a00:2d1f:b0:82c:e692:1f91 with SMTP id d2e1a72fcca58-82ce89b5662mr6343744b3a.39.1775102059873;
        Wed, 01 Apr 2026 20:54:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d1f:b0:82c:e692:1f91 with SMTP id d2e1a72fcca58-82ce89b5662mr6343717b3a.39.1775102059413;
        Wed, 01 Apr 2026 20:54:19 -0700 (PDT)
Received: from hu-rajkbhag-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b272bdsm1456189b3a.12.2026.04.01.20.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:54:19 -0700 (PDT)
From: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 09:23:59 +0530
Subject: [PATCH ath-next v4 1/6] dt-bindings: net: wireless: add ath12k
 wifi device IPQ5424
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-ath12k-ipq5424-v4-1-cd1e0f0a6c88@oss.qualcomm.com>
References: <20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com>
In-Reply-To: <20260402-ath12k-ipq5424-v4-0-cd1e0f0a6c88@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=fdGgCkQF c=1 sm=1 tr=0 ts=69cde86c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=HmtOZnpMNtbFe9RdH4EA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: K0syv_LyfnJjqpgU5NEmKS3nfyXJoxw3
X-Proofpoint-GUID: K0syv_LyfnJjqpgU5NEmKS3nfyXJoxw3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAzMSBTYWx0ZWRfX9ufI/PFziA1J
 P3De7B6qAF2jBPpolyUd1J60TK0ofX1B86YAj03/LbbbBNfbS09KJaS6bcWSZdR7mUJVgBTh0wz
 P37NcqSHBlVplK6HwjWQG1pxYLkO6tmAk2FXSNSUfe3BUmfIx/qwiMWI3V+N111WCcpSm+Gf/pI
 MTCXKvpKooMIaK5Wbh16mmyNr+rvnig8Qd0KpykoXeZC+adx4qqb+YnLLp1TqnyCgHbk4EvnRVY
 4IumcVMvwBBeayZ9W45GK9wkTfqkzVVjs+cQSOCCU4+SN3qa+5NJG9Zbe+vF5MLgzSHDDbz0OO4
 ufqA+zdjDwxRZm9Vd3O1mN3s5sBwt9SDpI587Py2IWSRVK+eZCPhScI+NxWi3+fIv6a241ynrqS
 qOyNIIcdPuxV0OSlRBVkjbCb4kp8s4evcYS3PlnVXJks/kkw397ggCRlCNvlCJNEpx4hfd7Pfcg
 19lLSvBLIXxlA9eMITQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_205421_121367_D390DABF 
X-CRM114-Status: GOOD (  10.22  )
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

Add the device-tree bindings for the ATH12K AHB wifi device IPQ5424.

Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml
index 363a0ecb6ad9..37d8a0da7780 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,ipq5332-wifi
+      - qcom,ipq5424-wifi
 
   reg:
     maxItems: 1

-- 
2.34.1


