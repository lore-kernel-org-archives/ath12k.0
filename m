Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57DEC369C2
	for <ath12k@archiver.kernel.org>; Mon, 21 Apr 2025 02:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tW3j/DnQ/3JQHYjRoZr4kKxIV+9c+oTW2VadZhYyqC0=; b=48s1YqfOcK8u/cbNpRP/AnVEsR
	64aQsSKQjWC8yiT9c/eAIjjuQC8ibkaD3Rh8cM5hdiHUEMNZoxw5O2ipw+ppGObcYOh0F97vLgL82
	eTRWmY48c+Ym1OSIzOIdg0TLrjOjmUss5jLxiHsXVEwGpE9aEuSNpxDQFxKENdlHQ9MxpToKxmJ3V
	X8i4q6oT1jYV1nYMVRh45SmpEoJU+Wc3f+VQBfv3GfZoN352OgRs5A4880VJlrKagFTmSim2PbhBU
	BYkcqk1qzTKOTFeX1dP0o0AZHzTirNgcj31sJBuMQN+0bN3gdQYSvNeLTHy2ewUBmFVRkzvkZLIkK
	4SLX2Aow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6h0X-00000003SCR-1iVV;
	Mon, 21 Apr 2025 02:35:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6h0R-00000003S6v-3pN4
	for ath12k@lists.infradead.org;
	Mon, 21 Apr 2025 02:35:38 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53L0qDu1014067
	for <ath12k@lists.infradead.org>; Mon, 21 Apr 2025 02:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tW3j/DnQ/3J
	QHYjRoZr4kKxIV+9c+oTW2VadZhYyqC0=; b=S+zjEQ1fwS/x18fHYHy3HkSP3Dx
	w5p8IdCS7F7T/yvFb4PEa90JLqDQ/q1KrRPJfI4HIgHrrFl9UyIcNJVKF2BRgoSd
	NPtNgOJ3AktD5Ih2duu7YSqNh7WwN0Lxk5BJFGPKmLMhwnPsd+pjZElC5kdHcmW7
	DgCm42q7jaSS4PYbFrEC2NKgRyxr+N5fCRiHIMrXdNyE3IXKrLvauEjfSVc7YynM
	L9kOZWJJWeetdisO9YXoGq8r2htf/IP/bPWC9QCB5/pkeyk4PbcZgRVpxWdNo/Aw
	hlrauzSwevUDNQ137ZVE/VQP05P92PHJtaK/qStmbdghsnS84ABmQCZ2uRQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4641hhjx64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 21 Apr 2025 02:35:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff62f96b10so3464048a91.0
        for <ath12k@lists.infradead.org>; Sun, 20 Apr 2025 19:35:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745202923; x=1745807723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tW3j/DnQ/3JQHYjRoZr4kKxIV+9c+oTW2VadZhYyqC0=;
        b=nMgthlF8OBtHXxO1Nsk8VBE5SUPUPzQ2vwhybVxaKEaJ5JoB6cUf7mjd+Zm2qdZ4LF
         feSydTLt2W4t2jSE15AbUM8oCiDIhDN6C02b9cpxdbZ+F3ilQd2r/1kRlPKTZeAaDv/C
         4QRuX20C/GC4ttQbg+rIIgPxPbzRrjoK4cPK8VIh9KtuYeqqEuGOGyXg+iA8Y12xcJ3v
         FMEEDry3vhF9tkQ9eQsgR53rTHmLh4mYw8cLempAmZ8DL+IB6qY+iBD03TSGpC3u5kyR
         m2CnJZi8Ht1EIoYxL6RQ5Ou7gglhSJDZivPULaG19uTPHzN2LkZ5Rww3KYWL4IgnALlI
         GTTw==
X-Gm-Message-State: AOJu0YyHvoelOCd6Ne5/O9X/QxZlNe8hGPY8ZKXDbIpB+B9g6oCdmDT+
	uJKZk5WJpiXc9pCho34sQYBvkca6N01UWJgtveQkjpU/yMYSkan9MzqgwBRwEcHuuckTHsTot0r
	eK46Rmj7OQepHlHG27pJbxueBuwatLkB9zAMJXwbm3ZFuWabM+3wCuJN8it1nCQsqm90g2KI=
X-Gm-Gg: ASbGncv4DqAM9P/MB5ReLGwxlkmD4TJJ3M0rofiQBdxt41zSwr8PPFRWWPeZwIWzaJ6
	xljCrQ+l/U62F0y6+hRMboZ3NIbSgfzokeK5wuLqOPflzbw5gibTor6MM1HdtU4Vie0urQM/Uve
	gSck22f3vHvTeVGtYT4iDaoVGFoF1HpsElDSTRm6LriLZ8gjEWiji4O/ljNJriD6/mFv/KPjotq
	HOHVY4HdPtMHNHsHXwQq2CPzpl/5HBRJp5bxS+wE1y81/+MbbzTrWx/PIhqfMd4JHzFUR4A6yuc
	onhD8Zpz/AdcCZR/xLz7EQtqlcn+x0sSjlOjcxwNomj8MU3RrKW55EtwFW+5BZyqRvY+H7+c3v0
	ZFhGAOBnbLG0=
X-Received: by 2002:a17:90b:5608:b0:2fa:1c09:3cee with SMTP id 98e67ed59e1d1-30879bc43b7mr15652647a91.9.1745202922768;
        Sun, 20 Apr 2025 19:35:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/mlRGhasf2sU4iF4A5vEYt858J1hyPpugHlHFsR0aiwrQcwl6dk1z1Pj1OmGFdXZ3u9KOdw==
X-Received: by 2002:a17:90b:5608:b0:2fa:1c09:3cee with SMTP id 98e67ed59e1d1-30879bc43b7mr15652623a91.9.1745202922344;
        Sun, 20 Apr 2025 19:35:22 -0700 (PDT)
Received: from kangyang.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4287sm54631685ad.130.2025.04.20.19.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 19:35:22 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
To: ath12k@lists.infradead.org, kang.yang@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 02/13] wifi: ath12k: avoid call ath12k_dp_mon_parse_rx_dest_tlv() for WCN7850
Date: Mon, 21 Apr 2025 10:34:33 +0800
Message-Id: <20250421023444.1778-3-kang.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1.windows.1
In-Reply-To: <20250421023444.1778-1-kang.yang@oss.qualcomm.com>
References: <20250421023444.1778-1-kang.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Fe43xI+6 c=1 sm=1 tr=0 ts=6805aef7 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=5djAQ6t7vT4tMu-sRqoA:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: y01ATMdLt8UzSye338XC1l-z2JazXZ5s
X-Proofpoint-ORIG-GUID: y01ATMdLt8UzSye338XC1l-z2JazXZ5s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=858 mlxscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_193535_991169_0D0553AD 
X-CRM114-Status: GOOD (  13.39  )
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

WCN7850 doesn't have RX MON component. So it's monitor mode design is
quite different from AP based chips like QCN9274, which have RX MON
component.

ath12k_dp_mon_parse_rx_dest_tlv() is such a specific function for AP based
chips.

So don't call this function for WCN7850.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 7404d21eed3b..351f52138d39 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -2368,7 +2368,7 @@ ath12k_dp_mon_parse_rx_dest(struct ath12k *ar, struct ath12k_mon_data *pmon,
 
 		hal_status = ath12k_dp_mon_rx_parse_status_tlv(ar, pmon, tlv);
 
-		if (ar->monitor_started &&
+		if (ar->monitor_started && ar->ab->hw_params->rxdma1_enable &&
 		    ath12k_dp_mon_parse_rx_dest_tlv(ar, pmon, hal_status, tlv->value))
 			return HAL_RX_MON_STATUS_PPDU_DONE;
 
-- 
2.34.1


