Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2053BC54F55
	for <ath12k@archiver.kernel.org>; Wed, 29 Jul 2026 07:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n3X7sjZrsiUmJKo1zr6UpG6RzjyU/w/4kRvDouCMrB4=; b=lD5R30NxQ03Hfp8KZ6uN0RFAMy
	qYN+mAyWVzjzYL/3Ltx8oTWTAdwifmyi/nTQ68ARVdzoTEcY1bW7+K346wRzqqSAlHkF2ddhUKmNJ
	j14RFHbM9Jsq+sSfdguWtp0BTm+ERjljgOevqIFMdDk3bD/8wY5B6nlEbKQ0dn6DJGvd8eOkHDpLH
	Q1zoJhMtHt4LW0+9X+arErJqJFr473eT5J4u99Bv2gpj4qw4JMYY96iDHx9La92ZGfAn9YYEpXwr9
	/75gmw9Z3gKCTeoAY/xbrlrsFpaiI/xbaTpt7KJONbJJ+jjr5ReCUm74V1jCvvIi87BYzeBhOTIjr
	8PRVA7Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woyYv-000000076Ac-2eh8;
	Wed, 29 Jul 2026 07:18:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woyYp-0000000768P-2aV0
	for ath12k@lists.infradead.org;
	Wed, 29 Jul 2026 07:18:42 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T4cIIZ897795
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 07:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n3X7sjZrsiUmJKo1zr6UpG6RzjyU/w/4kRvDouCMrB4=; b=gC7TQB7GNe3/y7uK
	6d8uM/ehne9tkvEXWZeDO8oGax3HIwVBPrmHwiqJ0u5G03QiMWyjFE82+bYE5CZ9
	jzLv4gB/3aYlZYTCgIEpHeohPB6LtyaCz0cQmczhQ9wbnD4ZTqtl0HihwBM2RzOO
	ENnvkIq8fatkQNydJggqGv+0PRcsoJOcK7ph8AgNNGZ1EFwN6yxyrZtwLSmbd5c8
	yc95noExarQvkgeyGKaIcWZ8eVluE0u5lg6qVY0kyxWZmXdC8Xz41NwR6421sGMZ
	8XAlGcS75e+exLiue30zyhiWrIlxJku5z0lbpJU2RYJbXVFanUA5aX4TRBoTAbpP
	9cmztA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqa330ns9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 07:18:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so516372a12.0
        for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 00:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785309517; x=1785914317; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n3X7sjZrsiUmJKo1zr6UpG6RzjyU/w/4kRvDouCMrB4=;
        b=cNLeC6qCj1EKTN8J1EzhiLoSgPyDxiKawPfBb1WqDJsKGiA80IvmRYrj65euI7mgei
         r+X+wlVILwVeG/nPaRCpkTLmxsAr39DM4SurhmLwR6re9UCOC/p/fKeJNYwMZLBcM5ou
         x5v/HJ5tBzydHaodkiWauGskTyCPXjmT6jJKxmBpd0No40imL6uZPBXpjZyAfomdkWGR
         ttPI20Ia51a47GaxgvDM3mDvZcEnIpiksTQz4uQkJpqq8G6a25pvQ4EOThjHyY3G9oRx
         dlEI5KzJY376HBSuhZIyTR/OLFCY+a/7HcvTJXsqGKgwccmURvx7vMdNPzFu9kt0PmFv
         6VNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785309517; x=1785914317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n3X7sjZrsiUmJKo1zr6UpG6RzjyU/w/4kRvDouCMrB4=;
        b=dSuZX/Ifb9fgKBFOoQnv+3pwBD+ye7KOZ6KKqfBurF9lgZwc9/COURY0BO5gSCv086
         al2yWwwoe8T+3a+S8imPjjftDw0U0Dy+4pG8izqrzMtT4F6i2O5JC3Z8McyYyo9oyFyn
         ZWoj54nenOTmvhbpT+kZFFWVSlbosLuVSWuZ0LE8XRa1uCGmyWTSV+0rJoFRAjjRCQqs
         LPgGcNq+AF9AyVAzsUN7oRb9O64fkmPo4fkkFnv10Bhjuj8G0LnXge87DvQNR4OIzsX7
         tuhhBKZcOwWIpNtk9zpjGFcsez4dwlgKAUdQbb+7fPl/oySV9/OF3p+NvWQEGZnYfE7Y
         33ZA==
X-Forwarded-Encrypted: i=1; AHgh+Rqs5sUNLIDb1FG8Wls+qo71ii5YyLn7w4uxBV0OdD3QBmVy5xZHHCbu8w9nfMEQoSvS7oeBSTM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyL1VLVEhoM5eBnt2VT+ImLfoFLItNBihF8rs62XJ8OJvOkSvMs
	9GXacauPRFH5br4AUTrmQtVBDNZZUu4pKHH2ZOMYdupqrTZDmoWE9iEAvlfwTiTZQZXI6SoG/7/
	U25ujs1oP3OjgM+Bw0q22VVypEhY9fbepGzeYp0bgM4PMlFb2Cog4wu+/xWtTY38a
X-Gm-Gg: AR+sD12NepVkK49hfLfhhzdGSXTQkv75BpXiI2DiYhG+9GI8eZZaIIsosfZ3xROQaiL
	OC9BwiHfIP1pI79bG0sHeJ1w4Lg7xow3GPkkV0Q3/+uQEIFpJAovRYBVpD9vmGN5Ogazmw1A3gw
	zt+lIXDsLcpeyiE1sNS/vxGPaHO88AOXytWS+AODNWLtRZAgWdgyS3QmlzZHwbNV4usdmFQvrrk
	McrMuD5w/0ZtmeO/uYwqAqo2cyLdHJOcfUfcJD2avyzvSHC020pYEJ1QiWFSpxEcnh64inxWvO1
	Zyk3pdgFz9XY8h32ct93kNRDarGVShrAw/+bAuyk6i4qfpsct4zoKwxK/jRVCISp6oVRTNLPq4M
	wH3KsdleRorON0+jF2UsMuAy7uay2Uf8Oa1OyqygCatTtxstFUQvA2g==
X-Received: by 2002:a05:6a21:4516:b0:3c4:42d9:58e3 with SMTP id adf61e73a8af0-3c8aafa0605mr6894537637.13.1785309517571;
        Wed, 29 Jul 2026 00:18:37 -0700 (PDT)
X-Received: by 2002:a05:6a21:4516:b0:3c4:42d9:58e3 with SMTP id adf61e73a8af0-3c8aafa0605mr6894515637.13.1785309517083;
        Wed, 29 Jul 2026 00:18:37 -0700 (PDT)
Received: from [127.0.1.1] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdb78ae98asm474793a12.1.2026.07.29.00.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 00:18:36 -0700 (PDT)
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 15:18:12 +0800
Subject: [PATCH ath-next 2/4] wifi: ath12k: use per-radio ab in
 ath12k_mac_hw_register()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-ath12k-regd-wait-timeout-v1-2-504aa6e7e93c@oss.qualcomm.com>
References: <20260729-ath12k-regd-wait-timeout-v1-0-504aa6e7e93c@oss.qualcomm.com>
In-Reply-To: <20260729-ath12k-regd-wait-timeout-v1-0-504aa6e7e93c@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA1OCBTYWx0ZWRfX3Uiyn9Ew0dJZ
 xCu4BNAUhLngcKNppq83D88IH4A9DYmvCtODO0Yfz3zI0ZoBdRqFY1y1Cp1nu0FilHRJfgHjODS
 ZT1RPHGd1ycDNhhTV9+l35L8lgKYVukilOA/zgTBO+s4dpvNZAYPhU7h0Vh59ax/ZNb7K2TneX6
 r887kwazSwS9jY/Y8MpK3fFrECNoijgLQdl08+tZ//0QtD5sXtk3wdYkEfgjlLMUHuRyFYp4h40
 dHe8kLFOq87Is8aH7S3PFK6QUW+AQQfl+sl4RFujS6VrT4r0eIVP13StBdGWAywCWvP68FWVp7e
 ED9nUU8B0p2UCrQZQUvxWFn5G8b8HW4IIUPyPo0oP13rAaCwAWCi50/XeddhJbotcjNTq1mgo8P
 advyscfXsZyNaKbRFGRtVAh0bQrh2e4v32lrIfzYoLxCXTfbweuQCBN0ortOInpvDd0qpiO7pTA
 r7DgbFkmtX2vIoxTN1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA1OCBTYWx0ZWRfX6Rj+rTXg7HKW
 AhS26YqejWf0daSEqHbiT3pwaICAbg6UvbzoZOs81dyZks/AwcGYgt8im9nwVTR1kGJhgecvvNf
 1lLTNONcecEuaNmDwATxOpmVoZGtFQc=
X-Proofpoint-ORIG-GUID: YBw31loQqmV1LhKtZFWNDbRPoqF1lSM0
X-Authority-Analysis: v=2.4 cv=Ap/eGu9P c=1 sm=1 tr=0 ts=6a69a94e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zhjQ6ZcactBYWx6wB3IA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: YBw31loQqmV1LhKtZFWNDbRPoqF1lSM0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_02,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_001841_116208_9635B1A5 
X-CRM114-Status: GOOD (  15.47  )
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

In ath12k_mac_hw_register() the local 'ab' is fetched once from the first
radio, i.e. ath12k_ah_to_ar(ah, 0)->ab. When an ath12k_hw spans more than
one ath12k_base, the radios walked by for_each_ar() may belong to
different ath12k_base instances. Using the function-scope 'ab' inside
that loop then refers to the first radio's device, which is stale with
respect to the ar being processed.

This is not a functional problem currently: the loop only dereferences the
stale 'ab' under hw_params->current_cc_support, which is set only for
WCN7850 and QCC2072. Both devices expose a single radio per ath12k_hw, so
'ab' and ar->ab always point to the same ath12k_base.

Still, relying on that is fragile. Cache ar->ab into a per-iteration
'this_ab' and use it for the country code programming and the log messages
so that each radio is handled against its own ath12k_base regardless of how
many radios an ath12k_hw spans.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 54056dd37409..82cbb5b9cd11 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -15043,24 +15043,26 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 		wiphy->interface_modes &= ~BIT(NL80211_IFTYPE_MONITOR);
 
 	for_each_ar(ah, ar, i) {
+		struct ath12k_base *this_ab = ar->ab;
+
 		/* Apply the regd received during initialization */
 		ret = ath12k_regd_update(ar, true);
 		if (ret) {
-			ath12k_err(ar->ab, "ath12k regd update failed: %d\n", ret);
+			ath12k_err(this_ab, "ath12k regd update failed: %d\n", ret);
 			goto err_unregister_hw;
 		}
 
-		if (ar->ab->hw_params->current_cc_support && ab->new_alpha2[0]) {
+		if (this_ab->hw_params->current_cc_support && this_ab->new_alpha2[0]) {
 			struct wmi_set_current_country_arg current_cc = {};
 
-			memcpy(&current_cc.alpha2, ab->new_alpha2, 2);
-			memcpy(&ar->alpha2, ab->new_alpha2, 2);
+			memcpy(&current_cc.alpha2, this_ab->new_alpha2, 2);
+			memcpy(&ar->alpha2, this_ab->new_alpha2, 2);
 
 			reinit_completion(&ar->regd_update_completed);
 
 			ret = ath12k_wmi_send_set_current_country_cmd(ar, &current_cc);
 			if (ret)
-				ath12k_warn(ar->ab,
+				ath12k_warn(this_ab,
 					    "failed set cc code for mac register: %d\n",
 					    ret);
 		}

-- 
2.25.1


