Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1E9F8D776
	for <ath12k@archiver.kernel.org>; Thu, 16 Apr 2026 20:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iQiSDyR+7IR6z4B1Cctk+F+qGlI2kN06paw0xf4+Y9o=; b=vv/V5vXVKU9cq0JfCrFECR3gve
	u8874saE/MwC01mJwT8PRuLZPLBoUSubBfbguF3YJ5Fz3cKo3R/476GFbWTYcvXO+e2ppqNdSCQfH
	8dfKS70OtQ6c9AcmYnMgHvQMI7pcTD2LgyehhunFEIiT6HuHfujTCHJypOc/Hzwg4v5WhFUtVTd4i
	V4F57sP8qRzp+Mbr7vXN7pZYqpAfdWDZrBOvNGq98qqjxwHRp7Td4r2aP0d8fuLecPFOjg32srA9o
	GpkUwpQYq9Z51BbWZzkN7wjJCwBqBCsEQ63eer5D7OI/7L6UQC31Q9rJZXZLqrOGPqVL0bdVsMOUu
	FUGR4X9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDSvO-00000002wHl-1Rqs;
	Thu, 16 Apr 2026 20:02:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDSvL-00000002wH8-1aL1
	for ath12k@lists.infradead.org;
	Thu, 16 Apr 2026 20:02:52 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GFxx1x2979274
	for <ath12k@lists.infradead.org>; Thu, 16 Apr 2026 20:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iQiSDyR+7IR6z4B1Cctk+F
	+qGlI2kN06paw0xf4+Y9o=; b=SlwsJOWcs7VAcMTXjBrylGhosmaY833fw/KHe4
	SNGY4y0NVLnD5VtrHAM4KNF82VpRkaLFJ8Gf2fSCcKW1p7zUX6a8KRI0x3IUJquc
	GNnQ+zgrRQKSBvarXnKjiU58hCzzLCz9KSRjaH9SI9Xz+xLvpSZazMfl8RScQopy
	2ATg+sbLyeegGse5/EAAFHoGXo5h8nOWyHXf8uhzOZOR46HPq+yOUa4QSjW9euFe
	QNrQw77mv/5zMBN+1Wb7yFxMoQ7SAWcA56Eor+H4HP0CGsj/5zHl5z1xQlJzCsp6
	AETsflGnpaHL1UVQFY4QHRIe+hRpPaAnKX9dOMX04CHBp+ZA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djvruactm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 16 Apr 2026 20:02:50 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12c7169f3a9so3295845c88.1
        for <ath12k@lists.infradead.org>; Thu, 16 Apr 2026 13:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776369769; x=1776974569; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iQiSDyR+7IR6z4B1Cctk+F+qGlI2kN06paw0xf4+Y9o=;
        b=Nsf/ieR6A+0fBTXf9K+h4C9hBfW9xwFInKVh3OrL9jlyO5hHY3PGjvA0+1abLRddKd
         maxEExgK5qEsVuaftKsuEVasw9ynr8c6jzc+Lu9OUSXYT6mIeFt/KCeyI/ab+LVqYeof
         +S4gjHt/XlKldJ4nFif7leQjzhmoJpaFZp/6nAI5quXaAK3EyTg4EPfPNblAgWeFolmN
         vbb8+64JoblFIRDSVe9mGJCCT7RMZhrVgHiHXm0srGMhsnesIzR+UuX5KzzGT6kD3tRG
         FgY1CKKET75InKqYWjEAyMXe88pz5vY0/PT3dti5Oj8rUViKHj6Dq12YMM8Yd5BoOXI4
         mqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776369769; x=1776974569;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQiSDyR+7IR6z4B1Cctk+F+qGlI2kN06paw0xf4+Y9o=;
        b=l5D4AEaVEHa7eed26W093n2Ii0YyNkNZSGqp6qn8LpXc/pEtU9lVuEFEWNxAGb1V1S
         wzJIXoVhjgenRNsWlfn1qQGFTu8MnqV4YaIuq/o+3oEQYYZOSH9u8XVUkA7DpCXKFNk8
         GOUKO3C2WXQJmJSkWhvfuEvu6TvQ9o26zP2MfWlfA1HqIaZ0jzgNi8Z5PvMfJxt0FKsf
         tQYCPjOyPBtZstKg+8Emzfr33ZA6Zu/hyRnoi994m3D2rMuAmQm3Dqp22YaFKFGbruHl
         Tn1X0q8d9QTLunaCGCLkJCv1GLCCdtIk15vT8wLGqA/b6ISvy1KSViHsqxrnWa8NQgCC
         TMog==
X-Forwarded-Encrypted: i=1; AFNElJ/ZdjphE61H65Dgj4MZ8Ey4dLgOUmR80D1is161IWdiWYYH+72L1o312wp6ga449KEjjgx2vcw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwF/eVgz4TM+cGTaPzL4fmU93perPaUqGoBllHJmOGfL3zkHmor
	idnjxIHcdHUwer0wCvpWqHfBIarXCaRj4dwBs94nGABC8nlxKzZHggv7h5YjS+612pdZXSXhg+O
	fnSrEauXrGLRdu44fqKjQChFcosUWlQJX1QyNR0N1fQMihCQDYPvMh2eXGW2yacGU
X-Gm-Gg: AeBDieuJA6Mt7oV+AZj3OI0/my6ipqm0nhNsqKcShYP4AgcsQhuXNHJr6S6ab4Tvyy8
	aYNAevirx0Bkkb9Ya9J9qJkiytPNx20++rmsqHCVVpT9DA274wNq9hdQVmPhp1fAGPS8+ttzw1a
	JZxDs9D/0cnFQxLkfwaZCUbX3g2M/9NYgEllTJdHnqqBrhqdPqxqaGNiXQrmFr+rZgf7nS/dC4l
	pGbuKJM/V/46n3WLQQdTWmmWBbMN9LA+JQfjzgetcLrMGy3Fz5LzpO4eSPyIeZ1VphbXo2kAq3k
	cRtW11yvYCMihkHYdHdMB/5oOrU9e8CF/UxEc+bVFq7MTiFq5mMRCueLPTIxBvgxXuVkxhWVEm8
	MU7IEhORnJb85MmzlJBI1Q6OLGNEUNlBCn0jpBt1U3xIftr0o4zfQt5njmgSpOrUBRSKm1DYiS3
	WJw4oSNftjyp0=
X-Received: by 2002:a05:7022:660b:b0:128:bae0:e03c with SMTP id a92af1059eb24-12c7287c16amr312414c88.30.1776369769313;
        Thu, 16 Apr 2026 13:02:49 -0700 (PDT)
X-Received: by 2002:a05:7022:660b:b0:128:bae0:e03c with SMTP id a92af1059eb24-12c7287c16amr312381c88.30.1776369768743;
        Thu, 16 Apr 2026 13:02:48 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e630143sm10389841c88.6.2026.04.16.13.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 13:02:48 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 13:02:46 -0700
Subject: [PATCH ath-next] wifi: ath12k: Remove macro
 HAL_RX_EHT_SIG_OFDMA_EB2_MCS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-hal_rx_eht_sig_ofdma_eb2_mcs-v1-1-c44a3177deab@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGZA4WkC/43NQQqDMBQE0KtI1o34v0ZrV71HKeGr0QTUtIkVi
 3j3pq66KLSbgWHgzcq8ckZ5dopW5tRsvLFjKHCIWK1p7BQ3TegME8yTLBFcUy/dIpWepDedtG0
 zkFQVyqH2nBAJi7YUoqpYIG5OtWbZ+QujSfNRLRO7hkUbP1n33H9n2Pf/LmbgwIuSRJqLPANIz
 9b7+P6gvrbDEIfY/Rk/TMh+mPg2ocVjBTkk9M3ctu0F18EITC0BAAA=
X-Change-ID: 20260405-hal_rx_eht_sig_ofdma_eb2_mcs-a22a27f955bb
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDE5MCBTYWx0ZWRfX3EXFEK+Z5Ut9
 97uwbgUIanE3s1Kckd2371KobwriY7g51rYC1DTzhA5fr2A5aeHawAEDqYUE9C54foG1/0oY5yt
 0xx5FGispH6IevhvjhQ2JV5BzEc2edvFhZ24sLWDOWJ6yv0+saKXQoUtEIgE3n4sj5YwEE8jbWT
 WF6/jDYBTOEnj/wPwIi4xnJxaybZyZJUt9v6xS5W2woNsmmJhTGuEkE1dFvGtdkBgU6bpDGZoLl
 LIA8XZyCEgZH5CIRn6IAaVQqLSz+jjxPgeF0P9kj8BsT1T7E6x+vasFsVxF6AP0FzgDaEvn2zZu
 IZu202FH6aeOcTDmfff8AN10jBjA0tyeO6e4cwpT8Ch+fU2Z6c6wpSXS8IpwC4cE6gGLT5rwXQ8
 eczSeM5e8jc9gbYSpBzu3+zMBxPj0RGJTQ28n1QOfBv+pXfxrMDfghx+PLYBGQtF8Knx3J2yuvf
 4jkpTwjwrDbrGwv0MmQ==
X-Proofpoint-GUID: HuFG1L7scwx0fIXJJUwPXAWiSyI5u3Yj
X-Proofpoint-ORIG-GUID: HuFG1L7scwx0fIXJJUwPXAWiSyI5u3Yj
X-Authority-Analysis: v=2.4 cv=GcInWwXL c=1 sm=1 tr=0 ts=69e1406a cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Ty_28zkbBMK94FpjrpcA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_130251_458043_F0C670BA 
X-CRM114-Status: GOOD (  10.56  )
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

Macro HAL_RX_EHT_SIG_OFDMA_EB2_MCS unused, so remove it.

No functional change, compile Tested only.

Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
This issue was highlighted by AI review which noted that the
HAL_RX_EHT_SIG_OFDMA_EB2_MCS macro misspelled GENMASK_ULL().
However, rather than fix an unused macro, it seems "better" to just
remove it.
---
 drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h b/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h
index ac2a8ac03288..dd60626b3240 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h
@@ -559,7 +559,6 @@ struct hal_eht_sig_ofdma_cmn_eb1 {
 #define HAL_RX_EHT_SIG_OFDMA_EB2_RU_ALLOC_2_4		GENMASK_ULL(35, 27)
 #define HAL_RX_EHT_SIG_OFDMA_EB2_RU_ALLOC_2_5		GENMASK_ULL(44, 36)
 #define HAL_RX_EHT_SIG_OFDMA_EB2_RU_ALLOC_2_6		GENMASK_ULL(53, 45)
-#define HAL_RX_EHT_SIG_OFDMA_EB2_MCS			GNEMASK_ULL(57, 54)
 
 struct hal_eht_sig_ofdma_cmn_eb2 {
 	__le64 info0;

---
base-commit: 15551ababf6d4e857f2101366a0c3eaa86dd822c
change-id: 20260405-hal_rx_eht_sig_ofdma_eb2_mcs-a22a27f955bb


