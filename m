Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AAE0D25040
	for <ath12k@archiver.kernel.org>; Mon, 12 Jan 2026 07:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TjqgNR4qIsXaQ0uW1recCcAkzD+y0LuolDPXsNIQTjQ=; b=PJt5Mmu3MWPtallkFrDjqn9YTs
	u5WY042IRraqgZA+8+6UbSkCc9He3VnCBPW3l8JwLbGdcTDnEqE2NXZFV8gqmfYznHKjECDvXpP8A
	FbOTp9nQL+pD3GgDyO6x2JzGt5ZPwG/3wmgn4z5hwWlETb9ss+i1eor6tAsMzswDLLEawuN5Hp/sx
	Yw7euGsAUGFeucaeuX5wtM/qx5Vfjdc68kzdh6XCa5Mhxfzv0WTqxc0r94dBVA2lVta3+g6WUaRCn
	ca8gJ8A+hYvrjen90BxLLAQSv/AjcDENBtVy7dN0aPakG60dNsc0w4BnKoHM+a9UGzku8SjWD9vTY
	8XpoayUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCUY-00000004tsp-3Asm;
	Mon, 12 Jan 2026 07:37:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCUV-00000004toq-3hbr
	for ath12k@bombadil.infradead.org;
	Mon, 12 Jan 2026 07:37:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=TjqgNR4qIsXaQ0uW1recCcAkzD+y0LuolDPXsNIQTjQ=; b=LwlxPGvUITv8By9XmTokL2pHs9
	msObeml7IuPXzxXvolbLApyyA+BXgS+RJFRndwR3M3h6wGB7XArX4a+HBo2c2tx+VZY18SvOmHWyY
	3Dl9s2bRVWpdheQEPp4bjoxQBNB0ejo2biLm5im0mI55ZOLO0fkilYGW+FO+xDt2XLVX+mZ7VlwD8
	EMv7hqtlF3dd2XwB8s2huhNcxBiMzBRkQnKwy9OfcZqccZG/SZDGoiaLw41PZ7g26DGI1ClTYF1Ja
	1RxTvo3UmeehKTHlakZ/kZUCf2dIPRZ34G7qpTjVvXDW8b58ijuJyPsVlhDg9bVo6tFmURiSJAFBF
	4cUF3NRg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCUQ-00000000Azq-3AyV
	for ath12k@lists.infradead.org;
	Mon, 12 Jan 2026 07:37:29 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C7Ocm9555251
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TjqgNR4qIsXaQ0uW1recCcAkzD+y0LuolDPXsNIQTjQ=; b=fj1IPvvdnyN4hRS1
	Z8oCCUGlc83LYGl2+1S0t+/4ineiLQTV5jeY45TL8n2HIsjtPCflWfmRwGOXzxVB
	0xubD2+8HLOx90A/CNz6Lh/V/DyOn4yllgQv9Im1DSNOoaGtMllChrwHsjWyFJZp
	ubmNj/csjjZ//aBNiAMfDiPS6M24/GELn8HGvrzEC/YF78dTowmkst3sf9onoiBG
	Oo9oc+S0CjmyJm4pk4JuDOUMYQ4zMBgJUC/13Vq4cB+DWul7bs+PJgOLC0J4srEh
	RnrCQOZP9+8WC5ZgVjK2HECSO3ghXJbcu2A8Iu/CPAr8P3pzPGtWud+QhLymmNje
	pf2t8A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmvhw017a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 07:37:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso4313974a12.1
        for <ath12k@lists.infradead.org>; Sun, 11 Jan 2026 23:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768203441; x=1768808241; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TjqgNR4qIsXaQ0uW1recCcAkzD+y0LuolDPXsNIQTjQ=;
        b=WarYl8qlLTYp5SplgEXsb/+5Eux1RvAfqiiOZqbYs5lzuNSxuXaonaxs01JggkkhO7
         WkCKZKWvs1PCnESs4lMttNS0yKWfQXqVw5y5QJrV5IhlYuVhAkNaykneW2zzekiWFbI9
         JFibO/iaCbdbiuAnjyeNhYRYGit5wtSkCWOQSuJBQ+AIMZqDjPb6qHYXnDR3XNeUD7fo
         ToGM6J+bwdrzMP3pxnk+1bkIvAVoT0rkuQUiziuiNqoCrMzZ7iN5Ya1fcnSIjCdOhGzV
         ZxYn8SqD8Fv0DZWasvjcQq+hhgzTB+Mz/Vi0b3g2LRvqMhGSsseKQucoWN05RKETlU14
         j/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768203441; x=1768808241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TjqgNR4qIsXaQ0uW1recCcAkzD+y0LuolDPXsNIQTjQ=;
        b=DfIlOAdlJPaNHHrTnoSsXq/SSuv3+3+V7vFD55jnnQ22GAzN35gAIu85TV3tuVg/ZH
         DdTeCWy0YsV1PsGYYuI2u4dWUVZ5J5ML0pD5ZhkHRCwVH7vWQXXcxF/DqltdxSvm0DNi
         YU0YgWtv6sjYswWB2x8D7a00E2SrEbz/4aTTStpb/jTQomUQg/vn7QchKixQolLkuzlI
         XfRgqQKHlx7oL5842E93KkSPF/KzoncOC8YltZticXRkdPu1CJQan5sYOh8gfPyfBhi7
         SpcgdxR6faJN3JBF9EdtxMphovTD/VGvIHRc4RLUPuo+qGPFICUeiGr1HJvXrBNdmj2C
         iEEA==
X-Forwarded-Encrypted: i=1; AJvYcCV2BH+wYaBfoHT9z6VSla6X5YIu2qoRUcuSTuyvp8OTLW5mlh44svshhqnS5GpVKNWAS0CcfKo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyCp4C416e15xFjg6++iF9HuR2FzgvUYvhu/Ivh51eqmeZGEs6S
	jdcVthOFA0QH70ujNVwQJa0FytVQQIuhjVHvbbNMUFMEOFeni5QYOGqYbqGEcMuNAZy0aJ+6pPX
	8lOgTxnXxDDj0xnFYcBRf/yDxcKhwtDP3ikzmCbDZ05ml7fRSriRec0ymPNLK1+OaaZvku6wqf2
	M=
X-Gm-Gg: AY/fxX6HL3dvrThZq5P7qSlGqaTo71fe1BcQLdHq970c3zn6xWenYzNxvHaEEl+zOea
	wFrmxmWvDuBh8Wd/MwkLz1llVx4cgZtIJE+cXlakmaksBS7LO3aA0uSoLjyQ3tkGwdvmKiRAq2Q
	b1WuuYoIkt652ZPYsTobbN/qSrfBfrnwy5hmAu5ym8yH0LJJGD9ceiPE6Q0SYW7wZgYfQN/z4iT
	7oWrQjWGXoKzk2vVAVg1hZ8npnQEFxntnFDaReAaF9gTsvt/GnnCRtKX7bXwPkwjKz94GXYUyR2
	TOO1DRd/qcNGR36zqkgXJrOHMWsNFoGIZGsirIRoILmfjKw0c+ayQhkFAqk5gqgLsXnSD+18vEV
	LBqFooGOEexYrmkaK7KuVwfcI3cvDU4nF3Gi4VYoFUIsRa3gb/WHKKoziIzw8TAQ=
X-Received: by 2002:a05:6a20:9154:b0:352:220d:e5fe with SMTP id adf61e73a8af0-3898f952f52mr14903138637.50.1768203440891;
        Sun, 11 Jan 2026 23:37:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJaQj/rvVI+Zh/H0A906IIIjJAjKK9ohDcirHhoZwBGcLyWdB3bv+oKOqMp+1X5rMvz1UFYg==
X-Received: by 2002:a05:6a20:9154:b0:352:220d:e5fe with SMTP id adf61e73a8af0-3898f952f52mr14903124637.50.1768203440411;
        Sun, 11 Jan 2026 23:37:20 -0800 (PST)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28faa9sm16548684a12.2.2026.01.11.23.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 23:37:20 -0800 (PST)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 15:36:35 +0800
Subject: [PATCH ath-next v2 15/18] wifi: ath12k: limit number of channels
 per WMI command
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-ath12k-support-qcc2072-v2-15-fc8ce1e43969@oss.qualcomm.com>
References: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
In-Reply-To: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA1OCBTYWx0ZWRfXy4BnVoOlygRm
 XkPgSDJ+vPnQH11pCBPS0G9KQP1eCsqtUdDjLW2puNI7wYj7qprz6Nxbg0CfaaAlRfVrFHJtpCb
 Gh2bg6ZA/DpnbUsXpgTTI6/anQ5sUurXG+QV9oZGGnZ7iAUmHX/BJYx/z+4IjN1aKcCnY2dhR6T
 ZQ3IC4JFsKGsl2foeenGDpD5NLuC+VhL2XvBqaR2wG/I53HjnkAGcPOD5xD9GcoAJgCrCfyvcvQ
 ZwZuuPxC+y4DWzoub384PQsesS8MQFnMxRAiBaVvXRKlMNxzIoCqfOayR42yb4czYOZsRrPgAlS
 izpPTTPfPGOoHQAkI9Jlrv/FNyRL2kDAtXm6sRli0fyi405cyOXN8xUclbH6IuaQMDKESm3a54I
 SpbBh1x28IBuym1BLP7VlJhvXGSdCfMidF3P5X0pbwQYVZk5UZ8VcJds1l3XBn8yeUCOPlRjrfw
 4fbmppza01EW+VOC7LQ==
X-Authority-Analysis: v=2.4 cv=JP02csKb c=1 sm=1 tr=0 ts=6964a4b1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3KhbVLdr_5p6mxRQPsQA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: b7KUTKL1fqApsOs-XqK6Y0e2L16Dnri6
X-Proofpoint-ORIG-GUID: b7KUTKL1fqApsOs-XqK6Y0e2L16Dnri6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_073727_576014_625FCAD5 
X-CRM114-Status: GOOD (  14.00  )
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

Currently the number of channels can be sent in a single WMI command is
calculated based on the maximum message length of the target, this results
in WMI exchange hang for QCC2072 as its firmware can not support those
many channels in a single command.

Add a limit to avoid this issue.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0-01560-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 3 ++-
 drivers/net/wireless/ath/ath12k/wmi.h | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 79a26203afad..0e1e6853ab85 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -2806,7 +2806,8 @@ int ath12k_wmi_send_scan_chan_list_cmd(struct ath12k *ar,
 		max_chan_limit = (wmi->wmi_ab->max_msg_len[ar->pdev_idx] - len) /
 			sizeof(*chan_info);
 
-		num_send_chans = min(arg->nallchans, max_chan_limit);
+		num_send_chans = min3(arg->nallchans, max_chan_limit,
+				      ATH12K_WMI_MAX_NUM_CHAN_PER_CMD);
 
 		arg->nallchans -= num_send_chans;
 		len += sizeof(*chan_info) * num_send_chans;
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 65f0d7ed4178..daee2787cdfd 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -6322,6 +6322,9 @@ struct ath12k_wmi_rssi_dbm_conv_info_arg {
 	s8 min_nf_dbm;
 };
 
+/* each WMI cmd can hold 58 channel entries at most */
+#define ATH12K_WMI_MAX_NUM_CHAN_PER_CMD	58
+
 int ath12k_wmi_cmd_send(struct ath12k_wmi_pdev *wmi, struct sk_buff *skb,
 			u32 cmd_id);
 struct sk_buff *ath12k_wmi_alloc_skb(struct ath12k_wmi_base *wmi_sc, u32 len);

-- 
2.25.1


