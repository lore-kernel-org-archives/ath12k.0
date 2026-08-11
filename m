Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD32AC5AD7B
	for <ath12k@archiver.kernel.org>; Tue, 11 Aug 2026 05:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O5NmTEUAjhQGnZWakLMc8D2G16RTjE18CVtx5iwl2Ow=; b=f4s6MnHTB3EyQEOC2emClLzC4m
	Dd3GJCsYtWjH0Phwu08egLu3sC/C11A+C/OdXSgB/h05E7QRceiphuitAbGQ+lYUCzXGpaIAOQ0/7
	ETs9ZW8XJ0wV0aN2c/eA0gnYXbo0vO14T58fPLKHzNpuHC4KsQccTalJiiACNWHih0rz18WXQm49B
	Nun887TXfSmpk7shNwA8vuBU/YXXjyUe5W9WOrgVkYUl8mc3bT5+enxZH3k8NCHE4XtrmjO7vsHVn
	gcVip4YhNpOhj1NrEZiDFKjiKOEUCo/zBaZh2J7RWDqA4O9I+YCPn8mY6nq8/ImuW5P/G+SJ2wjz/
	rY6vXFWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfH4-0000000DKep-1kEF;
	Tue, 11 Aug 2026 05:43:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfH0-0000000DKdF-3tZt
	for ath12k@lists.infradead.org;
	Tue, 11 Aug 2026 05:43:41 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AMq9PY3009584
	for <ath12k@lists.infradead.org>; Tue, 11 Aug 2026 05:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=O5NmTEUAjhQGnZWakLMc8D2G16RTjE18CVt
	x5iwl2Ow=; b=d2bhk1QA2khFdxwSOppHhljjdyh1gMKu6CpQ1Re31HCyHyED9hH
	sqqJ+EKfUxQEfFDrYZa3v6mRzPBw4gMYmgJ+qYkQWB+XMIs1AmouhXoX7VhXftnF
	t0XlEP3n3QB1X/B4GGIfnW2sqUa4miC/NQ6IxjfyCxfxwaa6PIsfPFff6rHrt/e/
	bGzBzs9SDD197IZ4/rBYGNwzlLWHWETolnQX0bSmtozAb51xXuZk7xAUNvpGJPCg
	1ZzJ2WBeF3oHqecswjlch+8sbuRXCB355P4OWl5QsPcHM1pPe0p9LzsJ0aJMiHwC
	CnYGzafSM8drlR2ynGEDFFEl58B+X5peHKQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjjtjgs2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 11 Aug 2026 05:43:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso4456788a91.0
        for <ath12k@lists.infradead.org>; Mon, 10 Aug 2026 22:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786427014; x=1787031814; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O5NmTEUAjhQGnZWakLMc8D2G16RTjE18CVtx5iwl2Ow=;
        b=fbl+Xvw3bAXVqir5fhnTD3RC9kR8ip/df2wBfI3GT+6HsiQallDhU9SCppOkQ9HIH4
         UNUmwO9BvcI3KIZnYFFPGEwUSYxzOl9ZLt+wruGOkKjPj3w+lmziDJg1lvyfU1qAeXSJ
         7ogGU5g+qJzm4klRPGhWHpWv8Iezdv1F2NRv5Z97XwhpcwzC/Mi1uCIuDHzxfuY1F6SK
         LHKW8SrdGcPghivc/4lNSQM7sknH8Oaj8s3qucdZJND59i4T/aMHzgZ+bNbwUxx8XMp+
         u1/YCGtD6YVjIvVRvub1oQ+AueshexIYCnw+oLBMwduJ95GyBMjWLUgVwimwTei3SMJe
         Z5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786427014; x=1787031814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O5NmTEUAjhQGnZWakLMc8D2G16RTjE18CVtx5iwl2Ow=;
        b=iOK4dEEjns87bRqdAwkoiinujBZUquQ7bF4PX+KCIf7RE1IpgA0kT9cainOuyIL98i
         Ybas5bX8EYHrV8NWRXC+avexeu+hTrfFfupWPYaOfcoLYzJe+vvZg9TNiETPQrgjPO5j
         rYXk964jQaRfOQxoZ0Y13OyYrFXc+qQOrdXLNsDzQpKQ5nHjjZPat7qVBBT9tBfWBllN
         LvfRK9gd2135t9rPjrZN3dnmTH4dotqHvXiElrBcc87Ydx4+xqf7yy8vQXFjbFP9UdP0
         KIsnaoXBtMTI9W7RFg6uwBXiRiV0rZAyS0EWNQIKuraAkcA7aM+SDDHXjQ2B8m76pgEV
         ZqDg==
X-Gm-Message-State: AOJu0Yz1yrhEXKF1sQ9+bpsmeW37xGqEPTNJCWGFIR1QwxQr6UXurGG9
	Q+lgPtEKU/Yx73zMeaHGTL0SysaesUaZYFldWJl7PS1TPsqntBLS19ZJXeCA0y3RVfVe1mTk9bm
	0Jr78nNntagY+rplHoRqDPKbCKgkrc/7XalXtEKPe+wAOpQxiMWmcBHD9yIupr3qsc0LqYyAw
X-Gm-Gg: AR+sD13xFYuyIivtaFav5QPKcrIquY6ry7F8QsuWWjfYSFe4eXTz/QPZLYbbEPLya+b
	dw3+t8k+ZfHFQpdNQbWdkr/lHW+u1LDYOevLkoZm2qfrgMxk6P6rqK8S+0rQmFz7jlk1tBt9FCH
	iDUa0RYylYjrJdTdxJv7oI8ftYM92ARRK/RmEkNvAxp4OnglaxXsBHjGN07L5qu27I/t1jnwAWg
	L5Ody/6A4MbWS3/kQpgTJtB4Tpwh0RxcEcKOQTVr+PMoKZVBB+Pvigea6Ttwi4gzaiTZDGiFuIz
	q2IgpCH73a1gdV/Iu0CG289X0qqrWkaV6ZOYgMLu1ovuruRnSiYqRdZzjkytlqnNYb1QH1074qx
	xtvHUCt0wWneAOlybW+scv2bBK27DB2MWIS0RmV5dffEbvl89fBNpp7+iSIFUuQ2+2w5DWQdxM7
	S+ZCXQNx9MWKjS7S/N7TEkymM=
X-Received: by 2002:a17:90b:35d0:b0:38e:2517:5d1f with SMTP id 98e67ed59e1d1-392ec54600emr923191a91.9.1786427014008;
        Mon, 10 Aug 2026 22:43:34 -0700 (PDT)
X-Received: by 2002:a17:90b:35d0:b0:38e:2517:5d1f with SMTP id 98e67ed59e1d1-392ec54600emr923133a91.9.1786427013458;
        Mon, 10 Aug 2026 22:43:33 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392ee2119ffsm302141a91.5.2026.08.10.22.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 22:43:33 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        quic_kiranv@quicinc.com, baochen.qiang@oss.qualcomm.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: add support to load shared firmware on multiPD
Date: Tue, 11 Aug 2026 11:13:16 +0530
Message-Id: <20260811054316.518494-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA0NiBTYWx0ZWRfX87SFNh8TqDoR
 Aa2FKLV90R9dpuz/xPR+25lICaPgQSpphswlYtx8WLdCiLiYjdSnB/04NvhzewzRQpUN1/Rzjvg
 261RdWm1li0dz3H4Ho2fkRsniufIKaE29PyYo9OKjiWT/7ppxNKTHDhfK65+hK+2rLBfuNo23BJ
 u4uHFcHaFj+QKiqXWFDutfA0wqAD8IJ0Ppmat2wuvYP2P5G0TalSJZCrj1kf8sK6uXWABs1dUh0
 bDsH15kzKF9JdeF0wRiQ2XZFAatHXuNMdO63ftw1G7qcE7PCiUMyrLDxKc38cmqHp6UoWsHZ6ai
 BXvF6fNpK3OouuxQT/6QvxNuusfor3uFgwWlrC6pIKMLtQoBiJCuT2iMP8zEdJEAp+7EPlR0bD/
 vkv4gkq1DLvnkfI85h6dMTWxflIgmlV+sAkIO2R5wYb+ejpVCFqOtTlC23NY1NAuVqXHnyeM+ln
 SbVyPpXaRnm6huBQv3Q==
X-Proofpoint-ORIG-GUID: UjL33WmthQ0uqWnIWxXJ020R-zEOwBw-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA0NiBTYWx0ZWRfXzt6HB86ZMhxY
 rsj4ouoAdD4vzRFmNG0xB46+gjq+MZgy2/M1pGmoc75Fhuj65DGxJ74DomVLOnCZH3hC8JM2qEW
 fGSvjB7TYFtQzVRVyrkm0C2Sny+Y3Mo=
X-Proofpoint-GUID: UjL33WmthQ0uqWnIWxXJ020R-zEOwBw-
X-Authority-Analysis: v=2.4 cv=JsHBas4C c=1 sm=1 tr=0 ts=6a7ab687 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=7wHSmVrqTQPSwfwcyrMA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_224339_092955_396A3954 
X-CRM114-Status: GOOD (  23.06  )
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

IPQ5332 platform uses a MultiPD architecture where multiple firmware
instances share common read-only code segments. The driver currently
loads only the per-UserPD firmware, which leaves the shared read-only
firmware unloaded.

Add support for loading the shared read-only firmware once before the
UserPDs are powered up. The shared segment contains common code that is
identical across all UserPDs and reduces the total firmware memory
requirement.

Store the reserved memory mapping in struct ath12k_ahb_rproc_info so it can
be shared by all UserPDs and mapped only once. Keep the mapping valid
across UserPD power cycles, and unmap it when the last UserPD is removed.

Shut down the shared firmware from the rproc deconfiguration path when the
last UserPD is removed.

Also, pass NULL for the reloc_base parameter because the driver uses fixed
memory regions configured through device tree and does not need the
adjusted physical address after relocation.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c       | 166 +++++++++++++++++---
 drivers/net/wireless/ath/ath12k/ahb.h       |   9 ++
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c |   3 +
 3 files changed, 157 insertions(+), 21 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 0fc55c9169e1..3985f4e1c067 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -347,35 +347,60 @@ static void ath12k_ahb_stop(struct ath12k_base *ab)
 	ath12k_ce_cleanup_pipes(ab);
 }
 
+static int ath12k_ahb_get_fw_load_region(struct ath12k_base *ab)
+{
+	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
+	struct ath12k_ahb_rproc_info *rproc_info = ab_ahb->rproc_info;
+	struct device *dev = ab->dev;
+	struct resource res;
+	int ret;
+
+	if (rproc_info->mem_region)
+		return 0;
+
+	ret = of_reserved_mem_region_to_resource_byname(dev->of_node, "q6-region", &res);
+	if (ret)
+		return ret;
+
+	rproc_info->mem_phys = res.start;
+	rproc_info->mem_size = resource_size(&res);
+	rproc_info->mem_region = memremap(rproc_info->mem_phys, rproc_info->mem_size,
+					  MEMREMAP_WC);
+	if (!rproc_info->mem_region) {
+		ath12k_err(ab, "unable to map memory region: %pa+%zx\n",
+			   &res.start, rproc_info->mem_size);
+		rproc_info->mem_phys = 0;
+		rproc_info->mem_size = 0;
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static void ath12k_ahb_put_fw_load_region(struct ath12k_ahb_rproc_info *rproc_info)
+{
+	memunmap(rproc_info->mem_region);
+	rproc_info->mem_region = NULL;
+	rproc_info->mem_phys = 0;
+	rproc_info->mem_size = 0;
+}
+
 static int ath12k_ahb_power_up(struct ath12k_base *ab)
 {
 	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
+	struct ath12k_ahb_rproc_info *rproc_info = ab_ahb->rproc_info;
 	char fw_name[ATH12K_USERPD_FW_NAME_LEN];
 	char fw2_name[ATH12K_USERPD_FW_NAME_LEN];
 	struct device *dev = ab->dev;
 	const struct firmware *fw, *fw2;
 	unsigned long time_left;
-	phys_addr_t mem_phys;
-	struct resource res;
-	void *mem_region;
-	size_t mem_size;
 	u32 pasid;
 	int ret;
 
-	ret = of_reserved_mem_region_to_resource_byname(dev->of_node, "q6-region",
-							&res);
+	ret = ath12k_ahb_get_fw_load_region(ab);
 	if (ret)
 		return ret;
 
-	mem_phys = res.start;
-	mem_size = resource_size(&res);
-	mem_region = devm_memremap(dev, mem_phys, mem_size, MEMREMAP_WC);
-	if (IS_ERR(mem_region)) {
-		ath12k_err(ab, "unable to map memory region: %pa+%zx\n",
-			   &res.start, mem_size);
-		return PTR_ERR(mem_region);
-	}
-
 	snprintf(fw_name, sizeof(fw_name), "%s/%s/%s%d%s", ATH12K_FW_DIR,
 		 ab->hw_params->fw.dir, ATH12K_AHB_FW_PREFIX, ab_ahb->userpd_id,
 		 ATH12K_AHB_FW_SUFFIX);
@@ -400,11 +425,13 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 
 	/* Load FW image to a reserved memory location */
 	if (ab_ahb->scm_auth_enabled)
-		ret = qcom_mdt_load(dev, fw, fw_name, pasid, mem_region,
-				    mem_phys, mem_size, &mem_phys);
+		ret = qcom_mdt_load(dev, fw, fw_name, pasid, rproc_info->mem_region,
+				    rproc_info->mem_phys, rproc_info->mem_size,
+				    NULL);
 	else
-		ret = qcom_mdt_load_no_init(dev, fw, fw_name, mem_region,
-					    mem_phys, mem_size, &mem_phys);
+		ret = qcom_mdt_load_no_init(dev, fw, fw_name, rproc_info->mem_region,
+					    rproc_info->mem_phys, rproc_info->mem_size,
+					    NULL);
 	if (ret) {
 		ath12k_err(ab, "Failed to load MDT segments: %d\n", ret);
 		goto err_fw;
@@ -428,8 +455,9 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 		goto err_fw2;
 	}
 
-	ret = qcom_mdt_load_no_init(dev, fw2, fw2_name, mem_region, mem_phys,
-				    mem_size, &mem_phys);
+	ret = qcom_mdt_load_no_init(dev, fw2, fw2_name, rproc_info->mem_region,
+				    rproc_info->mem_phys, rproc_info->mem_size,
+				    NULL);
 	if (ret) {
 		ath12k_err(ab, "Failed to load MDT segments: %d\n", ret);
 		goto err_fw2;
@@ -877,6 +905,7 @@ static struct ath12k_ahb_rproc_info *ath12k_ahb_rproc_info_alloc(struct ath12k_b
 	rproc_info->rootpd_booted_by_driver = false;
 	rproc_info->userpd[ab_ahb->userpd_id - 1] = ab_ahb;
 	rproc_info->num_userpd = 1;
+	rproc_info->shared_fw_loaded = false;
 	init_completion(&rproc_info->rootpd_ready);
 	ab_ahb->rproc_info = rproc_info;
 
@@ -961,6 +990,76 @@ static int ath12k_ahb_boot_root_pd(struct ath12k_base *ab)
 	return 0;
 }
 
+static int ath12k_ahb_load_auth_shared_fw(struct ath12k_base *ab,
+					  struct ath12k_ahb_rproc_info *rproc_info,
+					  const char *fw_name, u32 pasid)
+{
+	int ret;
+
+	const struct firmware *fw __free(firmware) = NULL;
+	ret = request_firmware(&fw, fw_name, ab->dev);
+	if (ret) {
+		ath12k_err(ab, "failed to request shared firmware %s: %d\n",
+			   fw_name, ret);
+		return ret;
+	}
+
+	if (!fw->size) {
+		ath12k_err(ab, "Invalid firmware size\n");
+		return -EINVAL;
+	}
+
+	ath12k_dbg(ab, ATH12K_DBG_AHB, "loading firmware %s, size %zd\n", fw_name,
+		   fw->size);
+
+	ret = qcom_mdt_load(ab->dev, fw, fw_name, pasid, rproc_info->mem_region,
+			    rproc_info->mem_phys, rproc_info->mem_size, NULL);
+	if (ret) {
+		ath12k_err(ab, "failed to load RO firmware %s: %d\n", fw_name, ret);
+		return ret;
+	}
+
+	ret = qcom_pas_auth_and_reset(pasid);
+	if (ret)
+		ath12k_err(ab, "failed to authenticate and boot shared firmware: %d\n",
+			   ret);
+	return ret;
+}
+
+static int ath12k_ahb_load_shared_firmware(struct ath12k_base *ab)
+{
+	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
+	struct ath12k_ahb_rproc_info *rproc_info = ab_ahb->rproc_info;
+	char fw_name[ATH12K_USERPD_FW_NAME_LEN];
+	u32 pasid;
+	int ret;
+
+	lockdep_assert_held(&ath12k_rproc_info_lock);
+
+	if (!ab_ahb->supports_multipd)
+		return 0;
+
+	ret = ath12k_ahb_get_fw_load_region(ab);
+	if (ret)
+		return ret;
+
+	snprintf(fw_name, sizeof(fw_name), "%s/%s/%s%d%s", ATH12K_FW_DIR,
+		 ab->hw_params->fw.dir, ATH12K_AHB_FW_PREFIX, ATH12K_AHB_RO_ID,
+		 ATH12K_AHB_FW_SUFFIX);
+
+	pasid = u32_encode_bits(ATH12K_AHB_RO_ID, ATH12K_USERPD_ID_MASK) |
+		ATH12K_AHB_UPD_SWID;
+
+	ret = ath12k_ahb_load_auth_shared_fw(ab, rproc_info, fw_name, pasid);
+	if (ret) {
+		ath12k_ahb_put_fw_load_region(rproc_info);
+		return ret;
+	}
+
+	rproc_info->shared_fw_loaded = true;
+	return 0;
+}
+
 static int ath12k_ahb_configure_rproc(struct ath12k_base *ab)
 {
 	int ret;
@@ -989,6 +1088,15 @@ static int ath12k_ahb_configure_rproc(struct ath12k_base *ab)
 		g_rproc_info->rootpd_booted_by_driver = true;
 	}
 
+	if (!g_rproc_info->shared_fw_loaded) {
+		ret = ath12k_ahb_load_shared_firmware(ab);
+		if (ret) {
+			if (g_rproc_info->rootpd_booted_by_driver)
+				rproc_shutdown(g_rproc_info->tgt_rproc);
+			goto err_unreg_notifier;
+		}
+	}
+
 	mutex_unlock(&ath12k_rproc_info_lock);
 	return 0;
 
@@ -1012,6 +1120,8 @@ static void ath12k_ahb_deconfigure_rproc(struct ath12k_base *ab)
 {
 	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
 	struct ath12k_ahb_rproc_info *rproc_info = ab_ahb->rproc_info;
+	u32 pasid;
+	int ret;
 
 	lockdep_assert_held(&ath12k_rproc_info_lock);
 
@@ -1023,6 +1133,20 @@ static void ath12k_ahb_deconfigure_rproc(struct ath12k_base *ab)
 	if (!g_rproc_info->num_userpd) {
 		ath12k_ahb_unregister_rproc_notifier();
 
+		if (g_rproc_info->shared_fw_loaded) {
+			pasid = u32_encode_bits(ATH12K_AHB_RO_ID, ATH12K_USERPD_ID_MASK) |
+				ATH12K_AHB_UPD_SWID;
+			ret = qcom_pas_shutdown(pasid);
+			if (ret)
+				ath12k_err(ab, "pas shutdown failed for shared firmware: %d\n",
+					   ret);
+
+			g_rproc_info->shared_fw_loaded = false;
+		}
+
+		if (g_rproc_info->mem_region)
+			ath12k_ahb_put_fw_load_region(g_rproc_info);
+
 		if (g_rproc_info->rootpd_booted_by_driver &&
 		    g_rproc_info->tgt_rproc->state == RPROC_RUNNING)
 			rproc_shutdown(g_rproc_info->tgt_rproc);
diff --git a/drivers/net/wireless/ath/ath12k/ahb.h b/drivers/net/wireless/ath/ath12k/ahb.h
index cdb58b07338f..46a4420d41bd 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.h
+++ b/drivers/net/wireless/ath/ath12k/ahb.h
@@ -30,6 +30,9 @@
 #define ATH12K_USERPD_ID_MASK			GENMASK(10, 8)
 #define ATH12K_USERPD_FW_NAME_LEN		35
 
+/* Shared read-only firmware ID, mandated by MultiPD firmware architecture */
+#define ATH12K_AHB_RO_ID			4
+
 enum ath12k_ahb_userpd_id {
 	ATH12K_AHB_USERPD_ID_0 = 1,
 	ATH12K_AHB_USERPD_ID_1,
@@ -46,6 +49,7 @@ struct ath12k_ahb_desc {
 	enum ath12k_hw_rev hw_rev;
 	bool auth_enabled;
 	const struct ath12k_hif_ops *ops;
+	bool supports_multipd;
 };
 
 enum ath12k_ahb_smp2p_msg_id {
@@ -77,6 +81,10 @@ struct ath12k_ahb_rproc_info {
 	u8 num_userpd;
 	bool rootpd_booted_by_driver;
 	struct ath12k_ahb *userpd[ATH12K_MAX_DEVICES];
+	bool shared_fw_loaded;
+	phys_addr_t mem_phys;
+	size_t mem_size;
+	void *mem_region;
 };
 
 struct ath12k_ahb {
@@ -95,6 +103,7 @@ struct ath12k_ahb {
 	const struct ath12k_ahb_device_family_ops *device_family_ops;
 	bool scm_auth_enabled;
 	struct ath12k_ahb_rproc_info *rproc_info;
+	bool supports_multipd;
 };
 
 struct ath12k_ahb_driver {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
index 98a6606ffd76..a8f5cf8cc2a6 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
@@ -35,11 +35,13 @@ static const struct ath12k_ahb_desc ath12k_wifi7_ahb_desc[] = {
 		.hw_rev = ATH12K_HW_IPQ5332_HW10,
 		.auth_enabled = true,
 		.ops = &ath12k_ahb_hif_ops,
+		.supports_multipd = true,
 	},
 	[ATH12K_HW_IPQ5424_HW10] = {
 		.hw_rev = ATH12K_HW_IPQ5424_HW10,
 		.auth_enabled = false,
 		.ops = &ath12k_ahb_hif_ops,
+		.supports_multipd = false,
 	},
 };
 
@@ -106,6 +108,7 @@ static int ath12k_wifi7_ahb_probe(struct platform_device *pdev)
 	ab->hw_rev = desc->hw_rev;
 	ab->hif.ops = desc->ops;
 	ab_ahb->scm_auth_enabled = desc->auth_enabled;
+	ab_ahb->supports_multipd = desc->supports_multipd;
 	ab_ahb->userpd_id = ath12k_wifi7_ahb_get_userpd_id(ab);
 	if (!ab_ahb->userpd_id)
 		return -EOPNOTSUPP;

base-commit: e07447e654476262558bee570f4cf456e2b32565
-- 
2.34.1


