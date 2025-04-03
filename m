Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE27BC3600C
	for <ath12k@archiver.kernel.org>; Thu,  3 Apr 2025 04:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xd2g+ceJ5l8BEhdDTCbh7lS7CcWUwmAVw8C+dbVGocw=; b=CuOYQFjWdHXi3A2QnBO2vbro6E
	iDbw00BQxs/nkmjnE91eq18Hbjs1Bu/A61FW8O1e5L2KVV1EbrxEcHZDMFibhCVMZ5BizCfb7VQay
	YsRCFpb3cHguXuFDTX3LliArcQvqWg/99W5zwlqCcvDANBtvELSn+kHbu0Nwqv7bI4zLGQx4wb9ou
	HWHI5GxXeXdc45/MyjGBOxuktCDnmzLN+AZx8WG8rZ08mKBE7BZLCsLIInyCsWXVE1NQydfbxXIUZ
	YhAP874xNofdeTmkoi0jDIIyknFcFjn/oommnfiq3wuVBhTZQ0+wvvR6uASK9EO55bJ41HFskbxd+
	xoMhobQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0C6E-00000007jev-1enP
	for ath12k@archiver.kernel.org;
	Thu, 03 Apr 2025 04:22:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0C6B-00000007jeW-1Ifx
	for ath12k@lists.infradead.org;
	Thu, 03 Apr 2025 04:22:40 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5333mcMX012998
	for <ath12k@lists.infradead.org>; Thu, 3 Apr 2025 04:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xd2g+ceJ5l8BEhdDTCbh7lS7CcWUwmAVw8C
	+dbVGocw=; b=BRa1uJ9uQuZ2OQSunvKpeDxfjPAhywOrJeXG96oRspoRdDCEFo4
	Jwnlt94rdloY0QQi3yf804QLcQz4fg2jxjAjaiwOATYodTvC+ZEK2j/vcB/4ZvrK
	j7gAA1Wqj25RdcZOoID8GO7Y6s80Enru5yhgURrk9c4XyjJYDEWG1Cz9XrZ4HItD
	exuoWAPeKTmPjTfi1mT0HG9a9pGGqbHIxPyvWB3yCVicrDE40ObJ7kvmAhCSurra
	OWwNb6faT6JM6A5zpfhaWRI6N2Y6TKpMx7bQMdYTe41FFqzcNZBQMyG+0s5LTWR0
	00KQmfU8ssuWYIguVkMkhVMLU6WP4y3uFRA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45sc7x0tyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 03 Apr 2025 04:22:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7369c5ed395so644336b3a.0
        for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 21:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743654155; x=1744258955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xd2g+ceJ5l8BEhdDTCbh7lS7CcWUwmAVw8C+dbVGocw=;
        b=plNeBb35P0oKkey17kkEZCkv6HL2UBhyYr3FMGlfXzyPeb4r9RTpA8IUxe2YNk0yKi
         2QBwXLBpOXbg3KqbiSCg6/O9CwlPR8VLPE9/xMK3uzHuirEngc9wutxzr8Pj4xHP7rqj
         8PZbHK82WioR77EPQGCS4+fye1bLvnBYo1M8B42mvRF786kAESI5O/Xss9sf0hXTnTUp
         jAi5gvoFNCKa/ICboTtnIC2JyF0igVWFMN4Fw6nprv9rqdjLMr23DIOLTVeK5MHrv1AR
         ak8+ZBs2yBsAyp1D8OA1Oofl5nALhb0caQ6/ql5XrBFOENAJ2FlKtvdYRN0823Qd7Mq7
         C4jA==
X-Gm-Message-State: AOJu0YwFKdO92eHyB6HINfKHNARoXJwMYk5pQgFzDd9WIAybAGl3LBpI
	6mpNuDQhKVi1yz1ZYBpG9vkJ/RuIkCXg/dTlTRrISo59iE1GTR2AHaszmhuIoAm6qEoOVJm6fFb
	TeaZ2mp+7PB251NHBU8gLkS6F+XlNBLgjKbXe0mLneVNIqFMwT2wVnx5WEoICd2H3QDap
X-Gm-Gg: ASbGnctxrzir7yyNkMjOyU1sdUeHGvsxvlVCw4o4dabI/mYxa/rSnUJHJEqN0XC7uKc
	CSfpGme2cNizBwjltv1b5X6J8gx+VL8bOY1nMDtW49b4CCPBXjy+NE+0t9u1UFanqO3ph7OKLZi
	Nj/7r3TGmp1Mun1+frh7w/XRf3gRtlluTJxDnU1wm9nnmhaVpVwr+GQ9x/7PVw6TucdQOwxlLL2
	9J6av2aP+amRXYRiYVFpI0igUM2/lx+ryxgF1sdkwdG7Fj8h9LWMUuEzE5iUoQy+1OZHmjF52Ch
	AGoTnfjlbbXJq52E8BM7AaikurnYHnqKNVYsrtZ8lnCqQXk+7IRL2eyhOBBSaGstSpIPPhiz7zK
	2w/emVdrzZdr4NIHCJq0RDhBFwkxSo461n9QR8ns=
X-Received: by 2002:a05:6a00:1486:b0:739:b1df:2410 with SMTP id d2e1a72fcca58-739d85de28amr1634027b3a.20.1743654155486;
        Wed, 02 Apr 2025 21:22:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvZtR2GP0/ONm55Mb7sq79xJ1ITdYVhzgoqy+Czob613eeuQouLKgvuR7RDpUYtlTlrqN0bg==
X-Received: by 2002:a05:6a00:1486:b0:739:b1df:2410 with SMTP id d2e1a72fcca58-739d85de28amr1633995b3a.20.1743654155045;
        Wed, 02 Apr 2025 21:22:35 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9ea08a8sm422344b3a.100.2025.04.02.21.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 21:22:34 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Thomas Wu <quic_wthomas@quicinc.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: Disable broadcast TWT feature in HE MAC capabilities
Date: Thu,  3 Apr 2025 09:52:29 +0530
Message-Id: <20250403042229.2917376-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2lt7inJnzeEERmO5yJ9CnxaSgNpa_pXq
X-Authority-Analysis: v=2.4 cv=XamJzJ55 c=1 sm=1 tr=0 ts=67ee0d0c cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=gFoxjFOL2NOmklpzGFIA:9 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 2lt7inJnzeEERmO5yJ9CnxaSgNpa_pXq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_01,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 mlxscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_212239_377677_E153D1A5 
X-CRM114-Status: GOOD (  11.14  )
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

From: Thomas Wu <quic_wthomas@quicinc.com>

Currently, the AP does not support the broadcast target wake time (TWT)
feature. Therefore, disable the broadcast TWT feature in the HE MAC
capabilities element field.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00209-QCAHKSWPL_SILICONZ-1

Signed-off-by: Thomas Wu <quic_wthomas@quicinc.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index b19e30d95560..512af779cc02 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -6717,6 +6717,7 @@ static void ath12k_mac_copy_he_cap(struct ath12k_band_cap *band_cap,
 
 	switch (iftype) {
 	case NL80211_IFTYPE_AP:
+		he_cap_elem->mac_cap_info[2] &= ~IEEE80211_HE_MAC_CAP2_BCAST_TWT;
 		he_cap_elem->phy_cap_info[3] &=
 			~IEEE80211_HE_PHY_CAP3_DCM_MAX_CONST_TX_MASK;
 		he_cap_elem->phy_cap_info[9] |=

base-commit: c0d45354abf5763f3de37d0c59fd863d193c7275
-- 
2.34.1


