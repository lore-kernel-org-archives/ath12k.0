Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFB8CA6007
	for <ath12k@archiver.kernel.org>; Thu,  8 Oct 2026 10:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQKRkceBsEcEBBuv3P9e+e6jVPpMSJdqRVHP6jxhJdI=; b=vMVxo2P/juJf1qCbqAPRkINQV6
	crxtsf4kUSbGO8YLIMJLj4pat8R0ci/wQy5Q7TrOYzM6FkBY5T7YCjazV/Zlw89jj4fdyGCqQd6Af
	fhwlW1Uoe5MNbIucJyekhfPzclc0frvtFk2sYE9dkFA6RnazsGoYsVvJoxRxZqbFaL9ofLzIHDTMX
	ApqiOfMpXOEUfZQHJ27LVS5QrvuF5yWwgOKgf3S9qe/Z4C5c+vMZ5zIU9C2EqHSgowmC8lWPK2ihJ
	VOPn4QGPzqDtfbmZR/RK7TWOdo553faKIXc6SoXyryp3elLTfAV0d9HaSkiTdrw7i680woLEznUYH
	rfO07xvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElJZ-0000000470a-2f0B;
	Thu, 08 Oct 2026 10:25:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElJZ-000000046zg-0Dpf
	for ath12k@bombadil.infradead.org;
	Thu, 08 Oct 2026 10:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=oQKRkceBsEcEBBuv3P9e+e6jVPpMSJdqRVHP6jxhJdI=; b=GOafG0i2zLGMMbNu2otDPLVfVy
	48q01o1cVaLXzVB99rESWXbDZGlHXdi1CgDuFzVHjIbhpHHgfvcKH2Syhox/lexmLodlhwneG/z2t
	D9Krpp1TTx4szf12Vuvo+RLP9kj/ktcxVG0MUtYEWVf9kLfJze/hnfsHCQzP0oSBw8XxJbor9d/3+
	uigFCQ43qkFuRgohiPOPn2mkGpXpjETd8YPGIKdb6zj5Db/VE8VDZGAtGJ/HkEUWFQ01x7CB1s9J6
	7mohX4fCKaS9m9BdRPNC/sAwmCeNBL2ftWruzZ7zQcuvtGRO4KIKFSAdGbk3WmqIUSDMKpsknwgmf
	MtEEmN0Q==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xElJU-0000000AHu3-07fc
	for ath12k@lists.infradead.org;
	Thu, 08 Oct 2026 10:25:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KcDp2686679
	for <ath12k@lists.infradead.org>; Thu, 8 Oct 2026 10:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oQKRkceBsEcEBBuv3P9e+e6jVPpMSJdqRVHP6jxhJdI=; b=NEKK2MXKPNP8DBzo
	hT2ieGi76xJlW43gfDobjLYzAziL/QP4nhLoZDfrZAR/ahZBrSL7zCpOaWfTcpoB
	exINA/hXi8zC88U8mcCij/ZN8TTUw4kLcPcz27x26+jJMBzhi5ZUYz9x5KdWd4Ek
	P/oA+JZ16vR0832CZaSR1+J5GujALxpQYvt1kIGQFhAD/4jvLnXegT4zDyGL1Cn2
	PQ/lTXklLCjeOVtnrDO/ksapZRBzuHky3wR+5NGkX9UAoKBBtA/Mhe5ONd6MuRot
	bb31IkyM4WmnXPR6uSIbbFAtTVb3bapVg2Uf42g6+SE3hZBHs3Sc5Z4V4RjBeBBQ
	G8CgBw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe42fas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 10:25:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e80ef3e0a3so7342105ad.3
        for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 03:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791455121; x=1792059921; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oQKRkceBsEcEBBuv3P9e+e6jVPpMSJdqRVHP6jxhJdI=;
        b=FyVgwX3Y/fqB17e2FDghE5Hd2sX/yLmfUUzp9gjTXIsmVbXxnMtjunZTYmBxxgn1oe
         RRIAcl2BM+LKIcD08WI50ZGusWgUlt6NLN44ZmzcmtgelAY5govc91FBUNqwHQveTIFL
         Zx0ztwrv7wL91T/BCqE8YcXPBogBpdLysUxEbXFobqJ7y7eSITmKji+kZ6C/l1LUWo7P
         ejQZRerNoHTyExhd0WD5Wr8LY3J9Q57BxVuxXVw64PCh2Ui4WScEg3oZE50j8DkwTirN
         yQFnH9ZAbGN2BSnztH22nqaCNli214HmFOiCpl4RG50n0T0X8f3NiuIh0CARJQmt/Z7X
         05tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455121; x=1792059921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oQKRkceBsEcEBBuv3P9e+e6jVPpMSJdqRVHP6jxhJdI=;
        b=La/wBRKIQldjMOyVKtDMAhzvOtJjYBOq7HmR8sXzDDVX/NRuruP48kFFgs2oDekZMA
         zV3ekez4U+1RFYvCvGUhAkVxnIKg6CBtTHuJjruvtgtEXohgCz6bpRX6lh6Q5Dxh9c2E
         Z+pTX2zoHpyZDcjmv3HJaU5C9iroV+s3bqIum329ycsOnwWOwyVi7VR6Wz7ecMuOHmzs
         5NOxsn5KrI1hwh17a1XTkB4f4h3y8jV01D5wLXK9jntb2PDDTqdyGChAshvDKnA/gB6h
         0QHph/7P2XRyZGFY7t1ipLbWbJff0Ts+X65hBG485rH7FGqS4Rq9PHgjtwpnsCvcGfLz
         m92w==
X-Forwarded-Encrypted: i=1; AKwUvBy7Uqt7LNptvsUUUq+Rwd83Le8pAYcwa1AteyYJZQlpqkov3rSmmWbNrx6RXbIeacsh6WxNY3E=@lists.infradead.org
X-Gm-Message-State: AFq9FYKYN0xBCM1AoyhJhF/FRQPD/sqjO0gJI2VB6XmXLs0U1nn//vw0
	F7aPIiOdl1VTLHyu61DwGRPaKEWje6Cpgf5/QEVX40xqxqm17oV2F6b8FjOLQADWtLw3nomkJdk
	ZCs+0XK5X31ukRGqNyuKETge83EwD9Mq1anb6tlqqOslCWN8qAwldAmTn2vPnunO8
X-Gm-Gg: AYBFou3Z17FW0aJt/i+ld/LnpHeXrwU+6nON3QJ8xno5R7kccF3PUgNq/RmlIW2VFl7
	yEU3J24zUAkC0svhIbAe0bY75OH3wk6WZfVvCxXRyRLmekoH3MSWtgT9+s3CCRWig5t/ur42eOF
	ZRoMqbPeexAboGRmOEfbfn9BZq034gsorytGtOTF3B1iKzobNV/ohSYLqHG1Qhkdba0LG0CxtQx
	BHyZ/7HCMkWaWse9PxVFb1xpv/9hQW6GTUTrJIwk0474on/FJlnxRZ2SkjZSZPHe0dS0K7o/WdK
	rY+1ekoXjBJevTGYO0lCBEfTMn4EQ/NFSHu98tquCebl6h+3KQBapob9OjLDLoZ0rym8RcdVkqq
	epGyAFmVL1cVFvUTwnMZRvmBAKgjNsB3EoF0tweDoUY+LLNMZH1J8cQsaImDrwmHXZRa2gOdLM5
	Z6B1FQf7WwC+Pg/MAjdKz8tw==
X-Received: by 2002:a17:902:f787:b0:2e2:d83d:5004 with SMTP id d9443c01a7336-2e60057c005mr44321525ad.58.1791455121454;
        Thu, 08 Oct 2026 03:25:21 -0700 (PDT)
X-Received: by 2002:a17:902:f787:b0:2e2:d83d:5004 with SMTP id d9443c01a7336-2e60057c005mr44321395ad.58.1791455120968;
        Thu, 08 Oct 2026 03:25:20 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe39csm22081655ad.16.2026.10.08.03.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:25:20 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 15:54:11 +0530
Subject: [PATCH ath-next 15/17] wifi: ath12k: Derive QMI service instance
 ID per protection domain
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpp_bringup-v1-15-2c5797b5e4ac@oss.qualcomm.com>
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
In-Reply-To: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: P8k4zl79REZY7d4wFadalkSykSvZidg8
X-Authority-Analysis: v=2.4 cv=AbwkjHXG c=1 sm=1 tr=0 ts=6ac76f92 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=1lU9L7Y0PnsvXye6yGIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfXwAA57ZbSCsyo
 /lbWZUpogsdNoKSLAZEZ5Ky/6UZI57zmQoqPl3oWlZOzWZmTnJ6WHA/J9je1Hek0JThivOptom4
 yAP+JuiJgjcCRBdPFDgWZlbF5bDQ01U=
X-Proofpoint-ORIG-GUID: P8k4zl79REZY7d4wFadalkSykSvZidg8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX7crL4JAF1csD
 RysteZAsjd0S7ChG4wbED3Ir8m7VlnwutkSp4ftkZiz8BOqouM360Nn7yuwiUvYUNNIx8dXBpPd
 1osm3/7439MHECIRMc78XIVTBLtDy5YhEqfYEOAru+EM8P/rLqEYKalP8s/oQzUDPacU95ABzV/
 rCvKmGlAwT5/GrmRss6fc0HeotZzUDb3Jh/16sIp+OnZxWPrRKeiA89BvNu/NKrBBX/SGaemwt3
 0H9GITPAaGJNT/DxEOH+Xlu64/I6gf0ONo3rkd7/ILhZNTZpG/IWlBUB2oDWRkgP8UsKtXWLmoR
 RXPq3eyx3o6tkRMlUZpm+yGp16Tml0W1NOC2OEbduMGSWdX47dQ/K7skqfGY7tAEWDur/knyq06
 7GOncoqCg0IIcG9s0iqZk8bpdsShHyV2WKP9sob/Si8r6+ZvoMe4OPjZbyWwY9Cu+nqQYm6Vb9e
 JoB6oWsCOSu2cslqc3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_112524_522435_242E187F 
X-CRM114-Status: GOOD (  14.48  )
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

From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

IPQ5332 platform variants are supporting multiple Protection Domains
(PDs), each PD exposes its own instance of QMI services. The current
implementation uses a fixed qmi_service_ins_id from hw_params, which
results in multiple PDs sharing the same service instance ID.

Update ath12k_ahb_init_qmi_ce_config() to derive the QMI service
instance ID based on the user PD identifier. Offset the base
qmi_service_ins_id with (userpd_id - 1) to ensure each PD gets a
unique service instance.

This avoids QMI service instance conflicts and enables correct
operation on multi-PD targets.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 892872f70b2f..3872aeeb9ba7 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -542,12 +542,14 @@ static void ath12k_ahb_power_down(struct ath12k_base *ab, bool is_suspend)
 static void ath12k_ahb_init_qmi_ce_config(struct ath12k_base *ab)
 {
 	struct ath12k_qmi_ce_cfg *cfg = &ab->qmi.ce_cfg;
+	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
 
 	cfg->tgt_ce_len = ab->hw_params->target_ce_count;
 	cfg->tgt_ce = ab->hw_params->target_ce_config;
 	cfg->svc_to_ce_map_len = ab->hw_params->svc_to_ce_map_len;
 	cfg->svc_to_ce_map = ab->hw_params->svc_to_ce_map;
-	ab->qmi.service_ins_id = ab->hw_params->qmi_service_ins_id;
+	ab->qmi.service_ins_id = ab->hw_params->qmi_service_ins_id +
+				 (ab_ahb->userpd_id - ATH12K_AHB_USERPD_ID_0);
 }
 
 static void ath12k_ahb_disable_irq(struct ath12k_base *ab)

-- 
2.34.1


