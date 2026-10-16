Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03204CC6B38
	for <ath12k@archiver.kernel.org>; Fri, 16 Oct 2026 05:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nTODudGNTz3m10Dxqs1k0cfH0C+ngep5olRntbkeung=; b=rA0+SDQZpvEVU/vSaF648ydxYH
	p56V0/AAl6S2kwvNJq0Lv26KkIjmSOa2DvYFogpLNTpjBfvDG7sowXLHE+c5st+vsdBg5oLpEpl2x
	c6L09e78tcBLIx6sbFcyaWCbkef21BapC/VDVRpecMXkm4zYKsLYCCF7Gld43nPJMWs3f2oyl9E0N
	xMSCgcHtvfJvdbHexa0M8W/d27D/l8N/xtYYmLRBswdjnkBh0jyQX0vwrA/qrrZfD0Wr6ZmVemtig
	w3AydizguWY45I4PJcIllDVaphMkQ1WXyFIPm0S2zb4piHGasedobwkn9jxGGLQoJIunXcXUuQiAu
	iC2O7dvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHap1-000000023jF-2ICK;
	Fri, 16 Oct 2026 05:49:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHaoy-000000023ij-26AL
	for ath12k@lists.infradead.org;
	Fri, 16 Oct 2026 05:49:37 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G2ZuFY405956
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 05:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nTODudGNTz3m10Dxqs1k0c
	fH0C+ngep5olRntbkeung=; b=M+eMjzYY27prAdwHEegNeC/Xky13K+CVK4ietW
	D7IGMLZTd7u4Mxjj01tIlci1zFwFeryEqL2EMkFn7YfnZ8X/9BIleCWviLYMVGMr
	lPxrN3tPT4RErY1hL5sqIUzL7DLXmfBaipy/zwKU47d0Ax/SHvHJaVYKZroEaafp
	LInrruy4zpMHFNh42dRwx1Y9BxTALaqalI6J4V91XBh7c2jWxJY5VDXU50kVvafy
	kMilwKe9UjxZ72Fm8eszO9YBeNIfQOIOvX2QJoSZIL5GCmFeGPvgrKSINsuijXLV
	oCsN+tAaKof9Pvgt2RtRpDlUOaoC1YLJ7UVuo/8R9lz9osaQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sa27cd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 Oct 2026 05:49:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3510d0baf63so8453275eec.1
        for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 22:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792129773; x=1792734573; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nTODudGNTz3m10Dxqs1k0cfH0C+ngep5olRntbkeung=;
        b=Xw1O2MBIXykaMYmH8iiWUnM1Gt6Ucq2v7DYGjWif8o7OiIQgireHgC7gOiNWTdZQBy
         Df8NXSFeVZNXw8v7RtMLZVokm4YClk/Uh1dF+x41yHLB2bARAbb8m8Ez8feA2nawq9/Q
         WRY3wC2dwELUEmSiws60FrAWRQidtSEkTN4o4kOvKrsOJF7dJSuu6vv2CQdKoDMPcPFk
         c36FERuCoIOoYXCfum3KqYiFGTc7HMqFq5WU5fNrFMHnys56BChhvTq2FohpF7xFZbn7
         EVEV2PZQwhLm68xSdKCNVoA5HrsEVkOiFEEFqqNou10oyHBFtXbFy0lpnOPMwgiYb1f0
         1UUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792129773; x=1792734573;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nTODudGNTz3m10Dxqs1k0cfH0C+ngep5olRntbkeung=;
        b=r+3T4M5ZtHOmdvK9GUoOZvQnommpSgJ2ndVbT2NVffyjNoiAeb6LuwRXQnRefs2luo
         GEAGToPnX17JYmt8xFEdDDXkk1i7ce6/+BHZZGdFBZHRhV+ZcYpuRr7iFUOWh6apW1yR
         ofYG94bV47jmA8GBo1XuMzqzdJT42vIDe4j2HLSIIlhzUijs/l5GardaJhlI1W5nb5uz
         skQCtycRoIG32+BVNZqDceMD6viKSe5Dv8uWXYAhbQczYU2S92RDM60yaxRpQDCc4s+T
         le1YcdWey9ysSpqJDFQuDBsnl1DPIuTto3eG/fXjwBlPcfdgoxTma1uSRFLjdJ9hFpq3
         Kb3Q==
X-Gm-Message-State: AFq9FYLxOvFsm0UpLf9zMqH0ds/9e2ewoI045ohOParOG7NQBMywgr17
	OwnBXYysAxWQIG08zx7o+cz48DhVs8Gf3Nk1JEH1dI86KPY4xIvIiPCmV+nb6OyOpzedbqsGGEX
	dBFf9h3LYfLmC4EqeRUH06jC8djg/7rmUluMq9ju/N3qCYeoLG42czvNgLI0Eeaay
X-Gm-Gg: AYBFou0q17bacq2d1k4MtPKzWomJ2uCifCveVB4tLj3V/sYgvI5hwCWd9orghJZZBYD
	dNsVBaFxXt5JC+FBmM0GVpQIVtN/qCdJcvI9kMGArWathXbKDyPCdGGfBvrFFrEOF7EiHJbCCn6
	M3LvgR8flIFa4RBX0Z3YloP/Ev/aONGfBfsTo5OiXoapfClWqy9hA6IIZUauT3f3Ns3d5eHqMti
	iXy+xLLZux1gz4jnMORVed48ZNPQ5vkfZ5eCIkCB56mI5Yc33sB473IVW58VeyWynXj5ZzMVpZk
	G7twC9NaJ+rmHjD47qMUVpziVj2BGHbt3czQj7f+0vx/55ScGFYYr3uU0ZFO0I9rDWfyE2JLP6F
	HDi4iRHRyRhGkEW+xN1rGthrrf1nTxQqS2XDy3VapW6C+VXJ7jA==
X-Received: by 2002:a05:7301:4546:b0:343:ff9f:26f3 with SMTP id 5a478bee46e88-3537e033fd4mr25913203eec.9.1792129773322;
        Thu, 15 Oct 2026 22:49:33 -0700 (PDT)
X-Received: by 2002:a05:7301:4546:b0:343:ff9f:26f3 with SMTP id 5a478bee46e88-3537e033fd4mr25913181eec.9.1792129772764;
        Thu, 15 Oct 2026 22:49:32 -0700 (PDT)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081ab80f9sm5154534eec.12.2026.10.15.22.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 22:49:32 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 22:49:11 -0700
Subject: [PATCH ath-next] wifi: ath12k: use hal_rx_mon_status for PPDU
 parse result
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-hal_rx_mon_status-v1-1-b32d5a7383fd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANa60WoC/yWM0QrCMAwAf2Xk2cJacGP7FZESZ7pmaCdNJoWxf
 7fq43Hc7SCUmQTGZodMbxZeUwV7amCKmGYyfK8MrnWdbe3ZRHz4XPxzTV4UdRPTk+1cCD0O6KB
 2r0yBy+95AdRoEhWF69/Idlto0u8SjuMDur0lBH8AAAA=
X-Change-ID: 20261015-hal_rx_mon_status-7e162ff7a9a2
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792129771; l=2102;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=I9d8xWEo5OHZJlpC7CvboIe1aUH6zlpyma8avvawm+M=;
 b=yeFdn6b26ATm8jKXV4WetkuB1U8Qf2yEDn8iGo/SCAWA4+pvJIFFG1xVHYEUuDQtQG2Atsxav
 51TdFA5P1FyBIFbMWzWNGueWMO2+KkR8WlUjxYYAWMvdXsYecy7vtET
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAyMiBTYWx0ZWRfX1+XgB+D1SmhN
 BL8vyTliu0gxQRD5YjXEqiCzYpYXuZU0FsPOTzuUYTufdAnTBrzBA0Y2swXoscLEJ40zG9LWH10
 1eL8WQ3IM39RjMXif6IKCD1jVSHTcG0=
X-Proofpoint-ORIG-GUID: gjfTOU1getQwGpX9XfXyog947JcruMoA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAyMiBTYWx0ZWRfX71V0L2NApVVK
 E52IYklLb5s9AgGsiiNckwR0PZ0Xh+YXHETATGeIwJAt9B9+r55k6yAUJyBPWpZwZ8l6uNd88e3
 JhFgrKhJltvG6llbaiO+GyIj3PBlS05cIDgL7K1ulRNTAcwU8aAczAzvdNdNRBAXvuhmiHioLyw
 PRIokQe67NpEyjBGwqXJz3B7v03A9eUDpoxmA2lieWC8CmvT37FaHGBSZPwoDcOKHep9LKomJ4E
 YUSWpQezpCmYrQ367Jx54cwPBn6HFuy8lKuWj7tvPF8vCqj4A8lAOSJZzpg5WkVJQBt0OVtPkZu
 wTdftveOwsWB85R7fwUVqAEvehMPWBCszySr8UYn6sJEhYAcgv4n/+K7iX8XfJweViz6AeMaYdC
 aER2VgePqe9sPt0oFycnLNdha8Q2a1o4ZHWv2q4pRiTSU1nEkEtQOaPtkyRx7LjbRO+TBt4pb8Q
 ZiFdmiCOVaDlbXGFBBA==
X-Proofpoint-GUID: gjfTOU1getQwGpX9XfXyog947JcruMoA
X-Authority-Analysis: v=2.4 cv=AN0XGc5Z c=1 sm=1 tr=0 ts=6ad1baee cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=oYw4PtFvaC85l-aFUhcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_224936_675139_733506E1 
X-CRM114-Status: GOOD (  11.34  )
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

ath12k_wifi7_dp_mon_parse_rx_dest() returns enum
hal_rx_mon_status, but one caller still checks the result against
HAL_TLV_STATUS_PPDU_DONE.

Use HAL_RX_MON_STATUS_PPDU_DONE instead. This is a cleanup only
since both values are identical.

Remove the now unused HAL_TLV_STATUS_* defines.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c | 2 +-
 drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h | 5 -----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
index 1e29c13ad66d..7d29b49e8a54 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
@@ -3214,7 +3214,7 @@ __ath12k_wifi7_dp_mon_process_ring(struct ath12k *ar, int mac_id,
 
 		hal_status = ath12k_wifi7_dp_mon_parse_rx_dest(&ar->dp, pmon, skb);
 
-		if (hal_status == HAL_TLV_STATUS_PPDU_DONE) {
+		if (hal_status == HAL_RX_MON_STATUS_PPDU_DONE) {
 			ppdu_info->ppdu_continuation = false;
 			if (ar->monitor_started &&
 			    pmon->mon_ppdu_status == DP_PPDU_STATUS_START) {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h b/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h
index dd60626b3240..3d7694c22774 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h
@@ -41,11 +41,6 @@ struct hal_rx_mon_status_tlv_hdr {
 	u8 value[];
 };
 
-#define HAL_TLV_STATUS_PPDU_NOT_DONE            0
-#define HAL_TLV_STATUS_PPDU_DONE                1
-#define HAL_TLV_STATUS_BUF_DONE                 2
-#define HAL_TLV_STATUS_PPDU_NON_STD_DONE        3
-
 enum hal_rx_mon_status {
 	HAL_RX_MON_STATUS_PPDU_NOT_DONE,
 	HAL_RX_MON_STATUS_PPDU_DONE,

---
base-commit: cd026e68fdbf88b9cc522b76c7a9d92c9a41f709
change-id: 20261015-hal_rx_mon_status-7e162ff7a9a2

Best regards,
--  
Kang Yang <kang.yang@oss.qualcomm.com>


