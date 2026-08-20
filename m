Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F92C5DF81
	for <ath12k@archiver.kernel.org>; Thu, 20 Aug 2026 05:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fLcz+D0Oh2G4V1hvVXrVJp0frMjSMXjzDS9NCvnUauo=; b=wFPX0EX+im8HcOjE0BgmlBLicB
	9Esk/bn9ArD+dbMOMXSLPMCz6yf3X5qpcka3z3jeNEfSJih12+xov6TLK7HCAEE02W02DdFg0jG29
	lUwRf7ywr4qjuxsvC21Bm7r7yYcKaeZSIgg/a0aPBPDYTcHAfIZdUSYx+oAwWFdAnV/HSr03Ab4xJ
	xSoN0LqQXzITPiJ9yXsDjhyyosBhsn8iLpSLy6AmUUODeBnAGS6UMC4VUlU/Vdthvn1oZm3G+bHCB
	ij1bVpcsbr/Ua4dJNAnatsnGb5dd/O392qKGzze+mD5UukxUT5fZ5MzJ9eF7mw9nHn9Wl6euTw5h4
	oIGEKT9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvdm-0000000Arc3-3UXR;
	Thu, 20 Aug 2026 05:48:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvdj-0000000Ara3-49Ds
	for ath12k@lists.infradead.org;
	Thu, 20 Aug 2026 05:48:37 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JL7dfS1438681
	for <ath12k@lists.infradead.org>; Thu, 20 Aug 2026 05:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fLcz+D0Oh2G
	4V1hvVXrVJp0frMjSMXjzDS9NCvnUauo=; b=KIN0yVX1cHQuhTedcQy8DDM0/pr
	Y8DK+44y7s1Ig8voflMLMMNoqzT9YyEuAmswoaDmzbQh4xBmegp+hMZV8ymjS/rN
	BIDD1gs2MQ7l73+7LewGNHhYrI1A3ZBILG4jpHmuxiz31iUOmLMPxIIJDQA++HfM
	qt4IGT1IivUguJTIV/E2qSfoOb/8G4udouuD4DszT4tB4ShFpYjHEKdoLHwJYTdC
	wEDDuQcmtwjJN+H4lsAa6nN+rriabOi3ftyCZMYlP+IxXlZI2ZvS25LhTsjCQpL3
	bUn+GklU6P+mziu6TbsRrwWjuqICqcKO1DbH/kBYLRzQjB4ltZvsWW7jXAA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5daa3tsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 20 Aug 2026 05:48:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3931cd2e4cbso2415073a91.2
        for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 22:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787204915; x=1787809715; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fLcz+D0Oh2G4V1hvVXrVJp0frMjSMXjzDS9NCvnUauo=;
        b=MqCzj8PI+z5/qZnFf7UkLDTMzEnwXkNrvVlyZgMGhfYaqeqcWyTT3LIrEFqGQC6Wit
         Rz//M87bzM1UJ3BwjFimlexYdfVcDJNGUEXH6LzLeTT7sRetajckEw2VCpfqVpPbQUam
         VGNdzGm1yXoFwwrgp9p/WZNdoZPuGYu332nrKdytR+ahapAQWWuOC4SmJJjWhdhBthbq
         2Oarr0QWZKON4yJAxzjB32O8tQOhWfTbQ8QspPY0SclwMBVyIFt1YPjKRmWtOJZ7Q93Y
         e+jq/ZK0kyiyXE9EaImEtIcEX9kU65Tm1Tf6ETrToLlyGcVn+OChSZUdDW3aPmhSgRcR
         H8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787204915; x=1787809715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fLcz+D0Oh2G4V1hvVXrVJp0frMjSMXjzDS9NCvnUauo=;
        b=Z9noYaWFiBJGXKyHE+3Zjl8K+h9oHpSs0SY7bmP7TAyuTwPBWb+A6BVhiLQMRc1d2r
         vEhuF8d83Uia4BmPvCdR+cB/tL7nQA2CgaL8y0dMk4OUtKwCa6Jc3rbk8h3EVw/N2lY0
         YFyZ0CuiiHEKTFPG3EX2GtIgue0+cgXZkRzggFA7zmMMGpnHQQmWyj9kmDS81Dyz1gm6
         jlZJGPDQX4JKS+mVmLmb6SFHmBXeTY8z92Z9KYHPrszKi4eaMu8KYlwEyxOY3FxNB72j
         cEYbPm+sKufYYZbrGm8dB3z3nIK2vcgxgj37DGiAN8Z8xq44DdlPsnLGuUA0DosaYc3L
         MVnA==
X-Gm-Message-State: AFuF++lzFc1EyLU6vUaGMYRZhFtfoICtYEqwhds+zFGPKdiVIxWWPBT9
	OKtt4apPXHCsispIt7XIYPPdxnm/dt9OBsGM1pVLhtzn4/4vXHEh56EPVWvFEuPLlq0FkaTNHsc
	fhaxWwRWEBUQcmCMuTZERPaeQHQLsnns7bfdOuCUCdZJkYAm4DroWhrZfUhqAVbKEwmOtu+90
X-Gm-Gg: AR+sD13fVL6LQprMe0uTQ5seFK/GCk24ARMCqwj4Z/33HXQZ6ObhiVNa/rdMuy0fbcf
	LNxsoXbQGpECz1+zGFR3CdFUSQqhnNuyEvB0f1zSSomykiaPbObtaVGC7mY8946Y8K/soudAUxW
	dVZYOLKWp54KhVUpXeFk08E8wJYEhw1zN8scuQENi9gUUJU19ZD6gFfpecG7TJCWKUELnvGCXd8
	Vbk4+ZBjtpV+TEGmYyJK878+FlfRdqZN+0dTNT4z8jadtSj+3/7SidA64qswHChXAjtxkOhbwa0
	wkGciNT8HPO9E3jDB0dDd+t6v3EQQoR4PrZpTUJXkkrMq1/oriKrirOp8kekxj/ciHf6q5HYvqu
	OD2RY2kss0xw7kINANauzesCqNPMHpzBV1qN13Hwvq1rjR6ViVb/oxAgMo9RPGMTaxHuOtxENvK
	6AiEvTMnJAKKWE3QqtkufBdvk=
X-Received: by 2002:a17:90b:3cc5:b0:393:194d:5366 with SMTP id 98e67ed59e1d1-39580f3bcdemr19869640a91.10.1787204914750;
        Wed, 19 Aug 2026 22:48:34 -0700 (PDT)
X-Received: by 2002:a17:90b:3cc5:b0:393:194d:5366 with SMTP id 98e67ed59e1d1-39580f3bcdemr19869545a91.10.1787204914342;
        Wed, 19 Aug 2026 22:48:34 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fbf3dc2sm5440931a91.17.2026.08.19.22.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 22:48:33 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        quic_kiranv@quicinc.com, baochen.qiang@oss.qualcomm.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com, quic_periyasa@quicinc.com,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next 7/7] wifi: ath12k: convert DP_RX_RELEASE_RING_SIZE to inline helper
Date: Thu, 20 Aug 2026 11:18:04 +0530
Message-Id: <20260820054804.3222296-8-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260820054804.3222296-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260820054804.3222296-1-aaradhana.sahu@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fv3sol4f c=1 sm=1 tr=0 ts=6a869533 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Xy6-sK4-8b3VWbcdOpsA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: n6WfdGckp51Rzb7JY0jUNNjsErNxdAJp
X-Proofpoint-ORIG-GUID: n6WfdGckp51Rzb7JY0jUNNjsErNxdAJp
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA0MCBTYWx0ZWRfX8/5Q0NHSr4dP
 MtPwD2Fn/dQdKY2o3WxBf0/XW5l2fChDZ+mRTY7mqnEd50nc2dCood7Vwioibd7y2SsyENartso
 InKE+zrU891NDat596yJEspezIsk8CQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA0MCBTYWx0ZWRfXxYYYwrS5vZdU
 4iqTUN9jq+2cyxwGJotKki80TpsNb5UNt+OXIohZe13cQfQo4Li/lxrCs53hIrJmAhUQCSAWVBi
 kFeojvuEiEFmMFPjV72F8mUWv4YKpCLPX1zaYwvGBataxc4iP7ZWcia5gEOqP5IZGjOXpWv3tLv
 /0pf1FDaC8A9JxHRILM463Jy3vZVxN2hMO7vRxQKkuVjQAagYtRlzYO9G9UMQrZ1cixm+VA+aw5
 eB2yXb2E6+3kC1faXciGYxIr+TGbFpgYSzNYZu8yT89/FClujnBfZKFxcp3GyV3KYCnNLGCgoak
 IVCz0vPkcuowgtx/BzL1ZCySDuYHUymNqd1ANM3IgwrYGZbIdkXFSTqn55nAZIY/rPdgOTQZkpv
 mvfz/93O4RxVEb7K7iepujAoATnmcIsRs7Uc8f0gAycQemuu+sJ7s4H/n19469P7yrGJFtB1wQJ
 906/ft4MOVSvq8Td+Uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_224836_031504_A593308B 
X-CRM114-Status: GOOD (  14.16  )
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

Replace DP_RX_RELEASE_RING_SIZE macro with ath12k_dp_rx_release_ring_size()
static inline helper. Pass the DP profile parameters explicitly to
improve type safety and make the interface explicit.

No functional change intended.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp.c | 2 +-
 drivers/net/wireless/ath/ath12k/dp.h | 8 ++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
index 417d960bbd07..779529d189f8 100644
--- a/drivers/net/wireless/ath/ath12k/dp.c
+++ b/drivers/net/wireless/ath/ath12k/dp.c
@@ -488,7 +488,7 @@ static int ath12k_dp_srng_common_setup(struct ath12k_base *ab)
 
 	ret = ath12k_dp_srng_setup(ab, &dp->rx_rel_ring, HAL_WBM2SW_RELEASE,
 				   HAL_WBM2SW_REL_ERR_RING_NUM, 0,
-				   DP_RX_RELEASE_RING_SIZE(ab));
+				   ath12k_dp_rx_release_ring_size(dp_params));
 	if (ret) {
 		ath12k_warn(ab, "failed to set up rx_rel ring :%d\n", ret);
 		goto err;
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index c8ca3ab4d5e1..ff62773cfa9a 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -206,8 +206,6 @@ struct ath12k_pdev_dp {
 #define DP_REO_DST_RING_MAX		8
 #define DP_REO_DST_RING_SIZE		2048
 #define DP_REO_REINJECT_RING_SIZE	32
-#define DP_RX_RELEASE_RING_SIZE(ab) \
-	((ab)->profile_param->dp_params.rx_release_ring_size)
 #define DP_REO_EXCEPTION_RING_SIZE	128
 #define DP_REO_CMD_RING_SIZE		256
 #define DP_REO_STATUS_RING_SIZE		2048
@@ -716,6 +714,12 @@ ath12k_dp_num_rx_spt_pages(const struct ath12k_dp_profile_params *p)
 	return ath12k_dp_rx_desc_count(p) / ATH12K_MAX_SPT_ENTRIES;
 }
 
+static inline u32
+ath12k_dp_rx_release_ring_size(const struct ath12k_dp_profile_params *p)
+{
+	return p->rx_release_ring_size;
+}
+
 void ath12k_dp_vdev_tx_attach(struct ath12k *ar, struct ath12k_link_vif *arvif);
 void ath12k_dp_partner_cc_init(struct ath12k_base *ab);
 int ath12k_dp_pdev_alloc(struct ath12k_base *ab);
-- 
2.34.1


