Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F17C83F25
	for <ath12k@archiver.kernel.org>; Tue, 22 Jul 2025 10:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2Tliujz3v2hXcre43/10OqBxyLUYtZ9+byQ9GdnLgM=; b=ojh5XL4U5duijvTAmukT/Dr6a4
	KFpGz7+3RlkQHkPpm8rjm/5HWBNNhBDna34HcL83nf1t8vg3ZlNuc75fA9b6Czkgx+HVBdAnT1LJH
	mMulAwkU2IaiN/Iik4FWLoavHoWJ0iwMKg7snTHrGnnFJkWYHIhpr5w7tAwygpmOcgZyjompFNJdz
	e6F+G8DENm2Gir73fDZvFtRmPo5U8RKK4J9NwXu0vY2ykr1SPBBIbiYGZxsNHP18t5OiZnB6sjQIT
	8OkXhkV2UpxIQstWMTp6WBQBUJHMmIlhHkRZDEBEn2vc4PEUOT70tZpihiB45KwhG4DuzEACImE/b
	Try33I/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9tk-000000026gd-3StC;
	Tue, 22 Jul 2025 10:07:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9mm-000000024xb-1DZ0
	for ath12k@lists.infradead.org;
	Tue, 22 Jul 2025 09:59:49 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7Ls6r012850
	for <ath12k@lists.infradead.org>; Tue, 22 Jul 2025 09:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s2Tliujz3v2
	hXcre43/10OqBxyLUYtZ9+byQ9GdnLgM=; b=prReFMyqItf8qt7RBM3VCwHNk1i
	IDIB/k7wrRpZirfK2c2BMaKbrHAiv9BJGmR/mYhUREg5GRDVqvMin4ip/qb0K3yf
	TCD/j3ibuR2q52K2yquMfEz52AN8+ZmrAvZ2L6Nrmd7vlqqc0/QsWqfySS6FsI5Y
	ykLeDBQvDhOC5K9VuAZMbt7612x8/EoPWhPP1kBx+6g2dMA/RBITMxZFWaocUGzb
	HZzTkJuyZcujrSILz7qP4R1Ef1oqE5AlnWjYdpNP4m/xtzoOtitff0SEFDol60ej
	J8hYH0pPmM5E/T9gbNVjXpKPiw5I3/jf6oJqRX6n6Vgacdy6m7oa9ojEdpw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3ektet-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 22 Jul 2025 09:59:47 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74ad608d60aso4465276b3a.1
        for <ath12k@lists.infradead.org>; Tue, 22 Jul 2025 02:59:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753178387; x=1753783187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s2Tliujz3v2hXcre43/10OqBxyLUYtZ9+byQ9GdnLgM=;
        b=CKXcRwnlC5MRssLZVVhfK/9Fk8P8cg0v1yrMmjBbaqa6Q+iPu50dHcOBmx9WkEzShe
         GVt/FSVePMQzkBU22bqTJZwHuYnpFSDmB9iFywQQu4cKR27BEdIHb5eUwXRiogjSqCZb
         IfHZ9lWMJliJa8Q7mdRhrVuioI2BJaVzqAi88XvR3Mkrd83K5Wg9y8lgpowVONCwX/Ww
         q/Fh9xcdYlDmudmq9eGIMzycgMtSAcwZjjV0A2/VqlDKRY7az8KnEouDxV4iA4XR42yh
         RCda+usGCwxiKw4sOEEls7eODUmIlP4tZoSmIFGi772T8qJHVCIXtp0OjR5ETVi5i6H6
         PtTg==
X-Gm-Message-State: AOJu0Yzn8It3PjWK3D8ubFRjV3Sj0Cm+pjMDikeoEfV+AHx55BKi61n0
	Jt0Lkm9b9f9YqP6/+ndbIi3oB900vcqmkqqcBXCC/RnjghVdnX/3UZ8Qt2mPacPJbLSEg66KKBQ
	uZQMIZcm+0Y98LZXIGKJ0hfsyfGqZmK1UkrE3Z0dWt8828mRB82f9UgFA159bXJ9OASBTON6k
X-Gm-Gg: ASbGnctIMkOuemDgd2btEnCiImE5Dk3GMDVIlORUbWlqfnf2WbMEpm4xlcSUx68NiZx
	KIM+b4SutpqPPOw9kKN8AnR3C5twro87NGMCv1Fo1fXRL6e8A6aOvzqDebd7v0/8YSB0zoxFTQJ
	ZeZC4ZCqzk9p1R3mCKE3ligVyFOC7ucjnWJKL0AyF2MeqgJtME1MlpFtz6Fh80rDa0zfz9sDmoh
	vBuzsUlvM2V2MhM0Iv61GTD5daJUOsOyLV8KC7ZLQ5bnw+fv1zXdlUM1q0HHv5eu22JdMgH4sOp
	EusyVAXQob2pepfXvD+Okk538Wx37fEqPhM+RHgGHSnRNi6Bx7RDh1sx4NerdLzIopvtyEX4shS
	+FochUUrgTUnPWr7DKaj6PcEKZHhN8h5vOE6vMLG8YC0BmkMTWQmYMw==
X-Received: by 2002:a05:6a00:2e28:b0:748:e1e4:71e7 with SMTP id d2e1a72fcca58-75724872367mr33513506b3a.23.1753178386609;
        Tue, 22 Jul 2025 02:59:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4XnkA/E4sC41SuBa9XxXzMgLGHoXAbh9kYuzP9oZZXcfEYMJ+earkW+sULmeGbQcdPlaYCg==
X-Received: by 2002:a05:6a00:2e28:b0:748:e1e4:71e7 with SMTP id d2e1a72fcca58-75724872367mr33513481b3a.23.1753178386142;
        Tue, 22 Jul 2025 02:59:46 -0700 (PDT)
Received: from QCOM-kZLYnuwaz1.na.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c89d6bf2sm6851065b3a.53.2025.07.22.02.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 02:59:45 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
To: ath12k@lists.infradead.org, kang.yang@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 1/3] wifi: ath12k: fix signal in radiotap for WCN7850
Date: Tue, 22 Jul 2025 17:59:32 +0800
Message-ID: <20250722095934.67-2-kang.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250722095934.67-1-kang.yang@oss.qualcomm.com>
References: <20250722095934.67-1-kang.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FjVqArGc3DiJOJBc9jFkv-XrNsOF5doo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA4MiBTYWx0ZWRfX1Q+XVO3eSMrX
 RsoHKwYE7LAFkWXTG+/clud08F/Tfn2SWQBnl7pfLaSDG73gW79L/OZNHTJXxcain+cJmJGQQ5p
 e2kQAJmaOKi3sv+YEH/K+p/DREpzb2SSPer98AlkBDKlVyOCnBHV9hif4SdH8oC5uzus23vSl4A
 GqH5vN9qOBsI8nPPb9KB9NeznwSwvpWE40vC1fUXI/BNXZLkwaKwqJreE2f230SbdS3aMSNVu7X
 Bh7rhD+h5mLIuWdHc3PgePTlYC47wkl4jmfAoZLIaq/SJoSwbmpS/bcCFSA6eXkPqH83mOIjZHo
 dO+4ezcjbuIDcbFkxGDZkCHcQuFrexJKeoYXOB2mu4e7izRJ91NoBtFjRwE7wwzWbYZf6RfSOh4
 NnT6QL+WYX4R9Zj/WWn22xykJEqVu3ZCaTMFnK9AXjHJI5fGC04VUJGs74hY/2vTxBdktZw3
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=687f6113 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=vhDlo96zGHISquwf_XYA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: FjVqArGc3DiJOJBc9jFkv-XrNsOF5doo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_025948_334397_675ABEA4 
X-CRM114-Status: GOOD (  13.96  )
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

Currently host will add ATH12K_DEFAULT_NOISE_FLOOR to rssi_comb to
convert RSSI from dB to dBm.

For WCN7850, this conversion is unnecessary because the RSSI value is
already reported in dBm units.

No longer convert for those firmware that already support dBM conversion.

This patch won't affect QCN chips.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 8189e52ed007..ec1587d0b917 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -2154,8 +2154,12 @@ static void ath12k_dp_mon_update_radiotap(struct ath12k *ar,
 	spin_unlock_bh(&ar->data_lock);
 
 	rxs->flag |= RX_FLAG_MACTIME_START;
-	rxs->signal = ppduinfo->rssi_comb + noise_floor;
 	rxs->nss = ppduinfo->nss + 1;
+	if (test_bit(WMI_TLV_SERVICE_HW_DB2DBM_CONVERSION_SUPPORT,
+		     ar->ab->wmi_ab.svc_map))
+		rxs->signal = ppduinfo->rssi_comb;
+	else
+		rxs->signal = ppduinfo->rssi_comb + noise_floor;
 
 	if (ppduinfo->userstats[ppduinfo->userid].ampdu_present) {
 		rxs->flag |= RX_FLAG_AMPDU_DETAILS;
-- 
2.34.1


