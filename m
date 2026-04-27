Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90391FF885E
	for <ath12k@archiver.kernel.org>; Mon, 27 Apr 2026 10:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gv09TPI2227ZiJMzvPU4OIzd2ArvduENZbalsUu74Ig=; b=lAw1OZ+fdcBi2Y+tXmE2l+WZh+
	+PdGLNEwGvEPrs8MUf2FhRR457pwVf8O05o7WxcQ6eVDOniZ67q6SmCEXrY1rPISZRkku7vE1TlSM
	HUW4py1XTt5UlLGQ35CnrxxNLwi+ES7kWLhO7wP6rAvdhxYd7C8ImVFMR0LV0fTFXlA4BRjmZxc5k
	Um52b7Q82+eHOduTaMWgQ0CxniNrSTrBeHCjWqLP6Su4l6Vc0xWpGmgkofqPtZQEUEkuKOE+Jy5hA
	kTn7UoKqFjUVJ+SPREp9vrpPV35ELiBacP+7VRDTVgrm31ItAk5hPaU7BpevQhx0OOdpgBfPvRQ3+
	Olcvs2wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJFb-0000000GhJ7-1Hmi;
	Mon, 27 Apr 2026 10:31:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJFZ-0000000GhIU-23Rv
	for ath12k@lists.infradead.org;
	Mon, 27 Apr 2026 10:31:38 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RA3pxQ3123642
	for <ath12k@lists.infradead.org>; Mon, 27 Apr 2026 10:31:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gv09TPI2227ZiJMzvPU4OIzd2ArvduENZba
	lsUu74Ig=; b=jtHe3VIQe7VVRx+0kNYiy6XkhRDysylQVvgs4LjhUP83GVkBisa
	unjF3O3FkjvLm2fAwFtzd0qdX5Oh+tAElrdH3t+LxJbktnZnVKdSdfKEwF3XA6qu
	Zhj8sBpQQWwCOMBetmvnuYwaF5Yk9bXK11sVXgXnLbDIibQRZXEoVsNhEANiPHco
	aANt/7K6h8/c+vLLkXLRaVU0AgmM5EjTHH2TbU+ZO+m/BpbsEoiZBv0K5mOgAg9w
	1YwCjPGeabxwJmd5m3Vh0c5XXEHpMHBq8xmD+b/4zbHJ3dfrHR0Rke39uCuybxiI
	GZsCh/9Khm9j0dZC/ZyNiqRKlSEFXwc42cw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5qgg3gh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 27 Apr 2026 10:31:36 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82cf8dcd079so6539947b3a.1
        for <ath12k@lists.infradead.org>; Mon, 27 Apr 2026 03:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777285896; x=1777890696; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gv09TPI2227ZiJMzvPU4OIzd2ArvduENZbalsUu74Ig=;
        b=A78uABV8aMzlnbHF5I19odAb1KgswjcmpFi7zYyutLkIBEvozsksnjCOEHhKStp5mJ
         6h74SJRLotmt+7WUdDWeOMGEwr27Lmec4zbYZ9gyz1C9QkOqlot0Awh0sucQL2K1EbId
         DZM737dMOPwos55VX1stUfzGAmldOluaVsnWC4UkJVQ4grdnFCkTO2FFqPW8tLaIwwoZ
         t4STIjFySdCkViZfxNjS6cgdpEyg2nf5b2sOeon5iify6KGRCV/FtMNtbsyabRJ7+I4u
         1v2rAOBQNNeLBLMwFbr6hS6c4QjvwOVOFQTxRNb9TfMYcEhkMD9BDuFUpNojbFd32oq6
         NCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777285896; x=1777890696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gv09TPI2227ZiJMzvPU4OIzd2ArvduENZbalsUu74Ig=;
        b=m09gPTKfso1TiS1RF+N2IjtvEA+/x/Uf2a0ZWVhsM0UdjJME91kXPhIjdAy4myyFcs
         +eBSoQmIRYw8jSSa8Sa0u7PHeiIVldNgfUTEZMUNiNXrV9NfXBeKZrOivfiJre98qu5d
         z4C3IjhBcQRtVFLE+XYnu5Ml57iGNDMf+88tqYaUSrmlGwXEARwJ8J9Cv2zpAY4PIYxV
         S1inDCo0RTZfa2LW306uk1xSWdcn4+iVIiaadOn2mDJMDJk42ntqBZWnAbawv6MODaU4
         7yZUfb2ESPur65/WAtGsbd1ezT2K0QVFeGwC9PJB60BvPNN3JmzYLboZzNIlgsjocnuD
         MyHA==
X-Gm-Message-State: AOJu0YzYpRsBCMvSTzTLB2ZI23CoJkIrpPViwydvzh/CtfSY018pYo+5
	jo/Fu5LDyOPpCANvAzQ1hlhMmyS+f28/mBvMLG+vkEAVGoGfDMn0XwIniRLYPFu2jXeM7MgYZG+
	WbtcWGZHtJiU7YZ5SbNcyZ9LNS9bpXlj81K9MwY4EhafK6+Px6oEwr2lQqqxChAd8GufBUday
X-Gm-Gg: AeBDiev1xDMuse9lEB5GI+AEFjWWfz4+Ai061e+gjceNp4H389UdYPqmSvSvC2YUY7S
	tNMGedkfCo+KMwgbfhw1zuJfUrUrIf/rxY9Dyhc8re+lrKqO3kPxUOwKiGg/+sUhdzHbYU5MUhh
	P2zbcj1JRwppiSUtpgtK3ziyQyoVYapeO7RfLsguBaC/VRoinA4FFk+IerpGIiC9MujqXyImQuk
	hnldMC9OXDhfRTreUg5FtHw8DT3KwxC337lDyI7fXBeI+Zuf5B54ETkq5jzAx7pBli7CdspA1vS
	FaWAwgGZhllbQJydHO1Lm4he2J5yZyjPO8PpycHAZa9a+9i4VMIRX/J60So2OsCnzbsndxa6Za1
	pgTkNcGToaXvKyDg47+2aqCs1dmleyJkI2sPw9jx3bYB9U35cAlOAtHQTtJA3KAY1uh6kygebHD
	UKn4aoyWzCTbda9tLgJF0vX2YMB8OLBnkZhLj/Yngt3/CeJQdmtYPwuBGSnT1e
X-Received: by 2002:aa7:8faa:0:b0:82f:7ba2:e120 with SMTP id d2e1a72fcca58-82f8c8beec4mr31641280b3a.28.1777285895554;
        Mon, 27 Apr 2026 03:31:35 -0700 (PDT)
X-Received: by 2002:aa7:8faa:0:b0:82f:7ba2:e120 with SMTP id d2e1a72fcca58-82f8c8beec4mr31641259b3a.28.1777285895008;
        Mon, 27 Apr 2026 03:31:35 -0700 (PDT)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9cbb1dsm34626181b3a.14.2026.04.27.03.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:31:34 -0700 (PDT)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: initialize RSSI dBm conversion event state
Date: Mon, 27 Apr 2026 16:00:11 +0530
Message-Id: <20260427103011.2983269-1-rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDExMSBTYWx0ZWRfX3yZ2FWwGi360
 OWT8aBrFJCmPEvdqb7Hf6QRX77cEIR4QjrGz/HG0whgGqZrKwX1Gv8pImbxtdWFMzKQi2pLhq7V
 JLrHQQsdxMsokNsPOKtofwbsHYpy180RMgQYTSx7eh00w433NW7rBT8Hs/oEeaEp3qVr4Ogf01Q
 FlNLsH+4EhC+MZlxJMwaXBjwVsNw3kPxrElgpDXazPwL571710kdBFzos/PHjv+vgt/NRdykKug
 TeENVDwr026u4O8znbPfO+0ibaoj6hatgO9g2vIA7sZQVc8y4LYBCbw0xrmhVptLDhHInpopVra
 tFSnU8QV9o88JvB2S/1VpzlOKl/SdkpHV77S4FzR0r7vRkxbmw8MvLnoVTP+l3jLzHQbyDpoi9z
 WEWBTXYy4i2BbzwpLgf1mcIgd+v0h9YBzfQ25wpfd5k8AU0xChpwxD7RhP4aAQFKVL9yey+YsY+
 HdjDNFbclYZIzwFEIbg==
X-Authority-Analysis: v=2.4 cv=V69NF+ni c=1 sm=1 tr=0 ts=69ef3b08 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Gc6irwjrgtZuW1ZZY8IA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: BYYxEE9yjUGWHFvanvStAYLnjuWotEqp
X-Proofpoint-ORIG-GUID: BYYxEE9yjUGWHFvanvStAYLnjuWotEqp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_033137_534110_F1D0CFAC 
X-CRM114-Status: GOOD (  13.37  )
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

Currently, the RSSI dBm conversion event handler leaves struct
ath12k_wmi_rssi_dbm_conv_info_arg uninitialized on the stack before
calling the TLV parser. If one of the optional sub-TLVs is absent, the
corresponding *_present flag retains stack garbage and later gets read
in ath12k_wmi_update_rssi_offsets(). With UBSAN enabled this triggers an
invalid-load report for _Bool:

UBSAN: invalid-load in drivers/net/wireless/ath/ath12k/wmi.c:9682:15
load of value 9 is not a valid value for type '_Bool'
Call Trace:
 ath12k_wmi_rssi_dbm_conversion_params_info_event.cold+0x72/0x85 [ath12k]
 ath12k_wmi_op_rx+0x1871/0x2ab0 [ath12k]
 ath12k_htc_rx_completion_handler+0x44b/0x810 [ath12k]
 ath12k_ce_recv_process_cb+0x554/0x9f0 [ath12k]
 ath12k_ce_per_engine_service+0xbe/0xf0 [ath12k]
 ath12k_pci_ce_workqueue+0x69/0x120 [ath12k]

Initialize the parsed event state to zero before passing it to the TLV
parser so missing sub-TLVs correctly leave the presence flags false.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Fixes: 0314ee81a91d ("wifi: ath12k: handle WMI event for real noise floor calculation")
Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 484fdd3b1b7f..1e2e1fddd081 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -9689,7 +9689,7 @@ static void
 ath12k_wmi_rssi_dbm_conversion_params_info_event(struct ath12k_base *ab,
 						 struct sk_buff *skb)
 {
-	struct ath12k_wmi_rssi_dbm_conv_info_arg rssi_info;
+	struct ath12k_wmi_rssi_dbm_conv_info_arg rssi_info = {};
 	struct ath12k *ar;
 	s32 noise_floor;
 	u32 pdev_id;

base-commit: 7aa24d964a04648b547197c22364e2b76aec096e
-- 
2.34.1


