Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90492C56208
	for <ath12k@archiver.kernel.org>; Thu,  6 Aug 2026 10:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+ExpY11XrGNkqspeKakk5KKiupmYq5hGJ+hWgPI7D8=; b=qfAmsIBVqLcmHyX+uHRvMsgT1/
	yeLt7peZIU3laDXHqUrnr4VLmgf1LLyG74ljGASLizAtMIuB5D42clUNYiOzHW+ptmdc/BHLTddl+
	wbjDKrdwbuo+vTh2gswiE4TEgxHTWzuBEbfsKPAU1Ts0pKa1cKFy9y7CahxQy2vau/cHtEgfanFcH
	Xkt3mrXfzDjhnON9x/jiLr8prSXokWnLWDk8JjwpWX4nPIlNeRnsFNeNVTWLYrHJheAtfEc11tWta
	vMaQlXMUuYxyt0OvSm5Q9soUfvorqStd0T1Vth2CbOBwASYCRzW8JBbgD68tFUs8N/XSCRcG+uS1e
	VkBIR1Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrv17-00000005Ve8-17b1;
	Thu, 06 Aug 2026 10:08:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrv16-00000005VcA-0qCE
	for ath12k@bombadil.infradead.org;
	Thu, 06 Aug 2026 10:08:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=f+ExpY11XrGNkqspeKakk5KKiupmYq5hGJ+hWgPI7D8=; b=e5TUlTOIdQGYk3FZ56fkzU4xYJ
	Y3Wn06zNBym1yBokJqKM2LWIX7o+vxPM6VTDouNC4SF0v6+MqLuulqKtnD4vWDzUypRef5uEIf7T9
	GE3751LquorXJnO73DFMDhM6kXgprDrgFHIsfgvNd22jG2KK1JiSRYKRkeHdcgKazjYwqe1hhlbA6
	7Z1M+569dhCcudeYrkQiwpC0wkc1I22d/Hnek1V6lf9+6yUqJaOIgkbd0PJIhIZP+Ksyt5HCIyREo
	5tttzQSGoOWE1OL3t26W3hoxgA6UCYb/WN+VN91VVZ4bwEpo8rvkJ05YZuTyGSvQH25DwwT7/WKsI
	y46xjPMA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrv13-0000000BP1J-0WkX
	for ath12k@lists.infradead.org;
	Thu, 06 Aug 2026 10:07:59 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nmO02724774
	for <ath12k@lists.infradead.org>; Thu, 6 Aug 2026 10:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=f+ExpY11XrG
	NkqspeKakk5KKiupmYq5hGJ+hWgPI7D8=; b=AsS5Q0U2JLPQ3Li5tl+qfX/o/hl
	OLCc+10iGdtHDEPAkosrGc69qmZ+UK3tbQK6rxfw4A+wWGpG52hiJvMl8gjukMmj
	Sg9u0cAp+2j2dKKH4+EJr7Ow5H5Wlje2xuC+Ehxddbc1ocEiMUBUi15iClRauAsM
	TG8fWmvlO/iQiWLQg5VMMtOPp0FkCypvYGKV807UWaPzStgGl6VWzWbGxI108D9I
	ghPByWF4eqHIH8gYr/4N6m2hQVZNqWimanWNhFYnxJ1KW+GvnBXXnLzMX60aiHjh
	MpS5UVHZr07p65/t/SsvTWSwL04PX4iaDIJ4cn/Eh5SKYmgh24VTzJiKiHw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv9dmkmee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 10:07:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc86a9ef97so34952385ad.3
        for <ath12k@lists.infradead.org>; Thu, 06 Aug 2026 03:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786010872; x=1786615672; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f+ExpY11XrGNkqspeKakk5KKiupmYq5hGJ+hWgPI7D8=;
        b=ZIOVIFbwvti1sz4VXgkdxZRB6wWZ+n3aUcks8a/uZYUZ3cLv24pdf54DpfTQ15t1fE
         EoAPXjDsM2vHLxxkWZ04L8uSbBQyP9sPTPr27B0e5if2gjrYeukndL14SXavadY6shoL
         /GfAgRxJC/fPBYjhZvm/OJdPVFoLetvgjff5a7OU5hNeNxSLnxvJk6NjJdR4hV/QBO2D
         +Po5l52EyCzsncwg3vYtsC66rbhO6sqRhvjlLUsBg7VEj1S0KiRbs+xt+4QlMXq0ID5q
         +IRxpWndYJjUgl/3KuHw7sV5Tfy95oEc4CfKQI229i1HKxug/cmkliFzOf1gfHYJuC7m
         szyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786010872; x=1786615672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f+ExpY11XrGNkqspeKakk5KKiupmYq5hGJ+hWgPI7D8=;
        b=THFRf9X/oYa/NUQf0+WlVgHsuhepcrWlyhRdTRBj/0a+EJCHNV9Vz//HUEpdQY/GMj
         UzHkGK9VjQzzF+MCjcK+EZCJ8HY1N4dY89Ii9O3sQB67oZiwgxzLTq4xbKNJ0sPPj9n1
         8aIpRklp/uktbikrbkug26Gi3NoX5F08QY0wJ1Dz1+jD5+84vgEcNYN7k9ZarwyuMj8n
         aG1P0zi781iE6ncVmOAs/OlY88OA7ZIAnUSYelChP16MUXjW0xdswJtY9lklJN2rLBhv
         2mQQiktX9uyDIfXZa4/7xwS+FTyxPb4W4bvgfvBN+GqrSO+5+yXuSrk4EJNaLbEX2JOX
         OcWg==
X-Gm-Message-State: AOJu0YzN4omNY7ftYvI0bOq6c6w7okq65pfsGrGkiS/in/ligdbKqHGL
	FYOziK3FjVnWnYa4f0cH6Bny2oE1L16FltELR/MGeC4CATBumrDlXOXOlTp38TlgTbnGUYOtDlv
	XzqijxnpkGDc9W/HoDxg3mgv7EAKkXiZyxbzVt1UGaJBfV6MpgPHXhokbwRXGLa4csIz7xule
X-Gm-Gg: AR+sD12W7ueuwuxHQj96N2QdIqOE7czJP1LJh/CtzAe6GjZqIuF7KaeNciFgtv/Mqhu
	7l2OyfByiSeQpJHozT61swFwkNencmo1wFnZSmo7SJBqxCrpnc0oEfLg9s0cc3T9K4+NWf4/nwo
	arT7XP5GyO8CwCxaLmtTcYLswunBJJY2COlebrBSNmzgE3Za0LnPo5znW8d2Ugkl4QvMCVVjpTy
	NY/PKdYOaUoEsrUZEmtw57o32JgE6T574ViMK0MFsMQfmr5M0FiTLBAW3tDdVCwSzJM+e9XW54n
	CkBZ/4i+SyYI9mdSCvRjXtXrlrMbS62EQaBBMmETYgWPfXuULW8shnQlPHjVeolQoPrztN9XzpD
	IrSEK3TcMn6gz7vM8vfcea5iRACPXn0WUgDx3WLYhgwLcd0b/sMo/
X-Received: by 2002:a17:903:2312:b0:2c9:d88e:f996 with SMTP id d9443c01a7336-2d0ca7fa497mr144437115ad.9.1786010872012;
        Thu, 06 Aug 2026 03:07:52 -0700 (PDT)
X-Received: by 2002:a17:903:2312:b0:2c9:d88e:f996 with SMTP id d9443c01a7336-2d0ca7fa497mr144436505ad.9.1786010871464;
        Thu, 06 Aug 2026 03:07:51 -0700 (PDT)
Received: from hu-kaur-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0b6fbf2c6sm24027115ad.34.2026.08.06.03.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:07:50 -0700 (PDT)
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
X-Google-Original-From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aniruddha Mishra <aniruddha.mishra@oss.qualcomm.com>,
        Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Subject: [PATCH ath-next 8/8] wifi: ath12k: add WBM SW desc fallback counter
Date: Thu,  6 Aug 2026 15:37:02 +0530
Message-Id: <20260806100702.3479326-9-pardeep.kaur@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806100702.3479326-1-pardeep.kaur@oss.qualcomm.com>
References: <20260806100702.3479326-1-pardeep.kaur@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TJR1jVla c=1 sm=1 tr=0 ts=6a745cf8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=7LnAo4KMM85IVg6JStIA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: AB2QxLeVbrkBaIfwNHM-MMKUNXvAMDCY
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3OSBTYWx0ZWRfX+DHndNzvrCCn
 7PKBLBzJXJgcPZaulzrLpX6d3VG690KYz9YlB6Jwq+f2qBMSJ9zX/eBqSWB26iOqhdSfuEAxnIr
 qMeq+DnnrS4rK9Mvfl88GvoKMrintIE=
X-Proofpoint-ORIG-GUID: AB2QxLeVbrkBaIfwNHM-MMKUNXvAMDCY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3OSBTYWx0ZWRfXz8IXk7DIew/W
 KhIh8+FyvlJl6EelW0HJ8F2hxNKKIWh2r9NkVnMlRC1pbh0mpIPfpXnghwfypHqHDHYJIJz6nBh
 rh4tNm+xm6tTQOmv9zAFRUa/dM05+zDGaZ3GnKfTbZs/Qyp1QAXfhtvxbdtUWxguVVJOoeAAEjg
 y4ZlbRTkqDcYhvyfZzsC3vnWOqMoeNMxmMyQQ2BR2xAQ08fUz9+ec0eIYl8k3AtIUfr67FUhPNc
 a44t9vEhudNffESzJD3KK7zxOc16KepaSTZwW/TTtZZZ84eojl9aPlUo7Pm+HdajdmCc6VoruSo
 LUktSujwXQo/ZonTK66BE+0SPuj9RLxvJ9pTA+4BXBNRpgEeoVRCkfJvxte5jYR3FKHNI6D4p1r
 AkerAjfTOOiR+TjQ+ExoSZNX5MwOa895fATRuljrLBNqcTyiY0k4eMmOzOOK/XxhmEYheC7qDe6
 xvMQmOyJVrqbFf5CNWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_110757_633723_A0F140D5 
X-CRM114-Status: GOOD (  15.44  )
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

From: Aniruddha Mishra <aniruddha.mishra@oss.qualcomm.com>

When HW CC is not done, the WBM RX error path falls back to
cookie-based descriptor retrieval via ath12k_dp_get_rx_desc(). This
fallback path is taken before knowing whether the retrieval will
succeed, so it is not a drop event and should not be counted in the
drop[] array.

Add a dedicated sw_desc_fallback counter in
ath12k_device_dp_rx_wbm_err_stats to track how often the HW CC
fallback path is taken, distinct from actual packet drops. Expose
the counter in the device_dp_stats debugfs file as a separate line.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6.r1-00402-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aniruddha Mishra <aniruddha.mishra@oss.qualcomm.com>
Co-developed-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
Signed-off-by: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debugfs.c     | 4 ++++
 drivers/net/wireless/ath/ath12k/dp.h          | 1 +
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 1 +
 3 files changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index d4ea21aac21e..ed7045a2a380 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -1122,6 +1122,10 @@ static ssize_t ath12k_debugfs_dump_device_dp_stats(struct file *file,
 		len += scnprintf(buf + len, size - len, "%s: %u\n",
 				 wbm_rx_drop[i], device_stats->wbm_err.drop[i]);
 
+	len += scnprintf(buf + len, size - len,
+			 "\nWBM SW desc fallback (HW CC not done): %u\n",
+			 device_stats->wbm_err.sw_desc_fallback);
+
 	len += scnprintf(buf + len, size - len, "\nREO sent to stack\n");
 	for (i = 0; i < DP_REO_DST_RING_MAX; i++) {
 		len += scnprintf(buf + len, size - len, "ring%d:", i);
diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 5cfe2096c633..289aede6dabb 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -442,6 +442,7 @@ struct ath12k_device_dp_rx_wbm_err_stats {
 	u32 rxdma_error[HAL_REO_ENTR_RING_RXDMA_ECODE_MAX];
 	u32 reo_error[HAL_REO_DEST_RING_ERROR_CODE_MAX];
 	u32 drop[WBM_ERR_DROP_MAX];
+	u32 sw_desc_fallback;
 };
 
 struct ath12k_device_dp_stats {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 60489cfd4e54..d96d8301565c 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -1968,6 +1968,7 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
 
 		/* retry manual desc retrieval if hw cc is not done */
 		if (!desc_info) {
+			dp->device_stats.wbm_err.sw_desc_fallback++;
 			desc_info = ath12k_dp_get_rx_desc(dp, err_info.cookie);
 			if (!desc_info) {
 				dp->device_stats.wbm_err.drop[WBM_ERR_GET_SW_DESC]++;
-- 
2.34.1


