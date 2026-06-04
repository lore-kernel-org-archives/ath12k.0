Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3285DCD6E55
	for <ath12k@archiver.kernel.org>; Thu,  4 Jun 2026 03:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/rQrilZvfEdbVQGwvZi/nn2E5Isj0FIpMXtoYPlM6dI=; b=IChtwaLhgL9ywtEi5SyHjTq7dW
	yzRJteOJp4EZLgK0F8QGWuChl7rCb10R3rDasMaeBV673xi5GFiVz95MrkWOwiXOWR5xO33tlef/x
	Fhf5wkNhRKHXr3igcWSJu9IfYZzy8cWioBZuI711tHIfoScithcyxZcWP/VT0bbRAPWrwP9kSZHsD
	BcyWsIx1maNZLs32EA+hQE1ssPF1VW8ZGkWhDOXc1XTQ/XWH8x0kWrKE6LkESIh/xGV7rO4TolMCW
	Iug7xx7es00ZuAn2xGSzKuhpEg6g7ygqQeEwSsPhRwzeVbiXUEquhf6i3okt41tVh1cWUe7F0kBuo
	fpERsCcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUyZ1-0000000G5gx-3u1E;
	Thu, 04 Jun 2026 03:16:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUyYz-0000000G5gQ-38Ue
	for ath12k@lists.infradead.org;
	Thu, 04 Jun 2026 03:16:11 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6542xVtd2368040
	for <ath12k@lists.infradead.org>; Thu, 4 Jun 2026 03:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/rQrilZvfEdbVQGwvZi/nn2E5Isj0FIpMXt
	oYPlM6dI=; b=LKNI8r09MsA+oU0fjZ3AzmUn1qFA18znAFjP3ZVPaQspImZtM3Q
	b6NhS8sDXD3no31opH6woZ3XttKOgo+ClB4B12zXdutlnkYq4pbXxapb6+0TFhsF
	TYUZlcK2JyMDCglMeTv9zUrooytV+CvORgRcvcvLfnMprqcAj9Zt6qNpX4OE5tx6
	6BEM3BIOFwDWi5NxD8q8fcX+F14QnCmDWz3WO/XLO6lLfi95YyM2O8X88BFGW5zJ
	Kie+tKRo6QOWaCVRgC6t2BmEGsvojQAL8gaKVxxyLrr2uCdVniwKha0a68n/gOme
	C255i4oJW/GwLCth+oqS82Uw/YL4Ze2U2Lg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj3gkt0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 04 Jun 2026 03:16:08 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8596e4272aso307548a12.2
        for <ath12k@lists.infradead.org>; Wed, 03 Jun 2026 20:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780542967; x=1781147767; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/rQrilZvfEdbVQGwvZi/nn2E5Isj0FIpMXtoYPlM6dI=;
        b=GzHAiZO/OW9ZRIM6P6uB6cFLAjJZ2fFd7NaiSfeyVaD1oQ6PcF+drbjT/ZpUsQ0qCv
         1G7Ign6NoNSHyrWXJv0SREQpdooFgOQJcrtRv903Kg+IJb6s3B3jQqB6TOjI5zUqygtw
         6eU4Mfpe/XqoqvRqw78Z5HfV+Pv+L8uqLRUIfSFO7w+H0UzfaD8rKiKSxXU4csCIboTW
         yVP6jxcCCTB68cpG47HU1QvlEYoX0oAECPcphahaleyr8a85uDlbV5wJjJLrHyyefY8z
         +r6FUB+hDAw+SKmN7QK98LEputZlel8EqmrD6H8WfaWHI8D4DVNAs6LYJN1ekiDNyG01
         R75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780542967; x=1781147767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rQrilZvfEdbVQGwvZi/nn2E5Isj0FIpMXtoYPlM6dI=;
        b=XuaOHPv5da/yh2AkQjx5N29ksWKjaFZUDPcy17tlhrn2x0zbSwL/JwO2/MdBSShoMA
         gVZVq4yU+IZhmS8RDTF6ca5QiMm3YMAGjjAqxRO7Qs3tdeFZZGSNtLnfENbDshZzesho
         m1HkztV7p7OebpU4JwcHWWna7sfgfIkmAdmUhD03GL5ep4Hr+xTN0WZQgDlci533pQxk
         scS/g71+JjZKF7QMlNVWU2aSlX7Va64bIaJjaQDoBSzX9wTa3ikcwUYbrOrYL2TOgoL4
         tDl4Yx0YJfEjFtHcWs+FqIOSg7LSorSQTzh5g97A9pYg9a7g/VAXfFA01uSyrU5Ori1u
         6gWA==
X-Gm-Message-State: AOJu0YwXURa9KbIFCDVVqfzxfjSqFYVIUaOSWYdYb8zbhgsRDM19h4P3
	BHKW0/AHDvl5IZh5wvPvxFBKFH/tXz8a46d4mUPFa7i5IKK0otgV3JB4O//qHb+9SasdxLziSm9
	pmpqNmY+sNZ5q0SVbwXplkDeA9WZtHiNLCyMpwL/+HB3ME+xuwpmyuZ0OLlSbnUMBrMD3hh95
X-Gm-Gg: Acq92OH7I3Zpai9ygmbrNA076CY3sk3x3Xm9RpTDlzObyij9DxD1Yhr//GhiuwVrxAk
	I0xQ9r19Ni2dp0PTpKV0SY1n84Cj0RJBxguG3NBvIcTvWFq6X4JmaB+eFd925GZhuiA4hdhl0yU
	eXDBV1FRgnd8ZbMjPZ4kk2GaKpor0yBV3DKAbtu5cvU/2Ad4OZ0N5m5ixwB47Cpf3zhfgkrNT6R
	q2ZKv5VeuPUQpV6oKDs+/JZeTgYM5V/50rZoymqMjHOK3GVExevMY+MbRqJ9+DnEgUPcMs9Bvsb
	tv2aq+8Pjq/78FPngj7AYc7dDquIGBf1lsSOiPBHp4N8Nzz2PtCwvaz8edI7+m1meda/dYjiQfO
	EjZMd62D6ZasDRxgO2mumvXiZnuzJNZAemxzs0ysWNwrDXoMiahz8O/8DWIsti/XLZHE/gwErHJ
	ydlCWmXMSsiBq3fqEMFKwB4koEduTRU/6AS2zRB+DnBAIuQSy2RSNnDNI=
X-Received: by 2002:a05:6a00:3d01:b0:83e:d427:9817 with SMTP id d2e1a72fcca58-84284dffa92mr5800352b3a.11.1780542967129;
        Wed, 03 Jun 2026 20:16:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d01:b0:83e:d427:9817 with SMTP id d2e1a72fcca58-84284dffa92mr5800336b3a.11.1780542966652;
        Wed, 03 Jun 2026 20:16:06 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282915fe8sm4489750b3a.54.2026.06.03.20.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 20:16:06 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: expand UserPD ID mask to support up to 8 PDs
Date: Thu,  4 Jun 2026 08:45:51 +0530
Message-Id: <20260604031551.4178754-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDAyOCBTYWx0ZWRfX8mv0D4yVxnUp
 Xxz+TPOz2NlZclkRAkXHfd2rRa6+VNYCDd6xHstCGYVmKRZXR7uxyvCCYm0VBT/1XJJVEWmCyXg
 L84Bag5sCwocPIt4eJHpf3lifGXu0sqAXHCfDhodq/fNBeNP/UublT8BVrthHnVt9sO/o9q/RUr
 6xFSC8gWwAhhXPWvdafxF0p9qP6pJ/OdvPdmneX+wVM3fxAd0XojJEW5/HyALsTprEieotANYOk
 q5DJ7QIEn1x6cl0oWyvjIeagsAzUi+Mx3w1SQJTTaHSIg8/y8iVS79qnOgvuh8kh1gHoEEmLolN
 05pxwI4qGS14gHjkzzHKhE4sbQ1zrLEULiLUEfHszb/ZKkNVnyOFSmv4sohJg3g4EwYgQMEb2Pr
 /Nw7aVZR42GCLDHCHVxu/mBNCVBsxV7mq7Egn6KUcqtSt1UjwhWqfCG8z8RYQE6MJrdyNK8rpQn
 TCljBbIqDorpT0ulNtw==
X-Proofpoint-GUID: A0T_4oToypU7Cm2bkxvDN3WvpYYvtBOj
X-Proofpoint-ORIG-GUID: A0T_4oToypU7Cm2bkxvDN3WvpYYvtBOj
X-Authority-Analysis: v=2.4 cv=UvhT8ewB c=1 sm=1 tr=0 ts=6a20edf8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=LR6MN0zy8BHNabX5pRIA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_201609_940750_E1C0DFF5 
X-CRM114-Status: GOOD (  12.58  )
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

Currently ATH12K_USERPD_ID_MASK uses GENMASK(9, 8), which defines a
2-bit field and limits supported UserPD IDs to values 0-3.

Future IPQ5332 multi-PD platform variants support more than three
UserPDs. Expand ATH12K_USERPD_ID_MASK to GENMASK(10, 8), increasing
the field width to 3 bits and allowing UserPD IDs from 0-7.

ATH12K_USERPD_ID_MASK is currently used only while constructing the
ath12k AHB PAS ID, so this change does not affect existing platforms.

Also remove the unused ATH12K_MAX_UPDS definition.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c | 1 -
 drivers/net/wireless/ath/ath12k/ahb.h | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 30733a244454..4912172e106e 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -17,7 +17,6 @@
 #include "hif.h"
 
 #define ATH12K_IRQ_CE0_OFFSET 4
-#define ATH12K_MAX_UPDS 1
 #define ATH12K_UPD_IRQ_WRD_LEN  18
 
 static struct ath12k_ahb_driver *ath12k_ahb_family_drivers[ATH12K_DEVICE_FAMILY_MAX];
diff --git a/drivers/net/wireless/ath/ath12k/ahb.h b/drivers/net/wireless/ath/ath12k/ahb.h
index 0fa15daaa3e6..a153db6cf1d3 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.h
+++ b/drivers/net/wireless/ath/ath12k/ahb.h
@@ -27,7 +27,7 @@
 #define ATH12K_USERPD_SPAWN_TIMEOUT		(5 * HZ)
 #define ATH12K_USERPD_READY_TIMEOUT		(10 * HZ)
 #define ATH12K_USERPD_STOP_TIMEOUT		(5 * HZ)
-#define ATH12K_USERPD_ID_MASK			GENMASK(9, 8)
+#define ATH12K_USERPD_ID_MASK			GENMASK(10, 8)
 #define ATH12K_USERPD_FW_NAME_LEN		35
 
 enum ath12k_ahb_smp2p_msg_id {

base-commit: e1c8fcfd37f76b46a581b794e27765258c9a537d
-- 
2.34.1


