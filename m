Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF9DE9462A
	for <ath12k@archiver.kernel.org>; Tue, 10 Feb 2026 02:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6oX3bVTmNxU+vLhGk2hyLQm1uGh8KjppfX+Vzhlvkr8=; b=Bqf7QkKRi/f4NqS9Kie1Shv5N6
	g8I+gpBbZVXxx51+TcA2iuXnScpdCBgPkLGEp74rOlvth5SbVD4gX+OL6UUTpue0P/Nqj7x9P5tsb
	GF4iJWUY2TIa2nG8PIBzueJKQ8w6e6udlrFgjFZcoysiXLmGpK8SETDKnPJPXbofazUa4nZhdf3bn
	jlWol+/bqwJ9LHU2yzA2fW/gNCXx4EkwhbjMw6v1zWo4ChjsiyAnukS/qOtqAX+CncyZN+nkMasnS
	4dGpWcsdYPULn/sEogjQ+XNBlg3Q62cAbpmM4VvvRxPY6AoHW6iCrxewo1dRiGjpMeCNmx9rJDRM5
	Xh/+Venw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpdk9-0000000GLHf-0rK2;
	Tue, 10 Feb 2026 02:44:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpdk6-0000000GLHH-2rEQ
	for ath12k@lists.infradead.org;
	Tue, 10 Feb 2026 02:44:47 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619Ld7w3441723
	for <ath12k@lists.infradead.org>; Tue, 10 Feb 2026 02:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6oX3bVTmNxU+vLhGk2hyLQm1uGh8KjppfX+
	Vzhlvkr8=; b=WPy/z6/817WxLGyKeWO79Ibk//CcAN1vPQFFGx1tV0TwxYb6xfg
	Uc3naF7ITXqDANq6NhO66kxi7cCtLmc8QiCM31+aiZ0YYwpuP1xcxPmdbC8IkE24
	bmnsSTFu/uP8a66Q4CCUHIFPqSnSlevkwpdiJmwppsCMbg4BvTd0xtP0Fmw8Xd5t
	h3kqEfSoB/ayc4QPIc1dxY5BziZTp4IdFbpxFLv7CiWRXfo1FpzBMlPe4iwtER4H
	vRL+FmlIfzrq7EfiNKyU2VcyeyGvdECWlMe0QMuLsXn8C4ZXg7LgWibe0urOi3Yn
	5R52rlnxwHKT1oizHohom5INe66aSGrvvcQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7qp9gu11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Feb 2026 02:44:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ba66faa692so1521256eec.1
        for <ath12k@lists.infradead.org>; Mon, 09 Feb 2026 18:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770691484; x=1771296284; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6oX3bVTmNxU+vLhGk2hyLQm1uGh8KjppfX+Vzhlvkr8=;
        b=cLmHRK0W4SEPLJ53bGODDOEtOcDws3DTkiKr0pOVBkBjA2id/ynVxOauv3nJPE8ULw
         2l1F1Eg0CYyTFGQDcrf+mFNFnyZ9yE/CtsuWOvWwV6BPrx5TLImkUUdDLjQwTb6PulCJ
         GUJbX3G1lTUd3lwYtGWw4guMXCkNbS86PVNbhS/s7rmczOogd6FjH6oR8mtglWyccHOI
         in7GihVqCmMkJLl99RMqwOJIhXN1COllfkupr9mV0T2shdmBRvj/lLQkcuh0w7KknTUj
         qV3DbCjalPBoXnjXN7NADt9/fLMpvdJVzzKxfyzrrOQ7PvvYWabLYEorPgmYDJGEtBXI
         0THQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770691484; x=1771296284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6oX3bVTmNxU+vLhGk2hyLQm1uGh8KjppfX+Vzhlvkr8=;
        b=Cp5PD85gyeNzH70fs0PQV9NF3sjGLZyguOH9GazB5RyGkHqPeXfBAN2q4fUJTOhzCp
         PdZM+wueIWraNrRh3zBVlkhGQpcTkPX/+QnM8Zb8KagclfKZb3ACNkQf+et1LtIKB71o
         tAzNvCdXdteqLTH+dRT27VzOojXQ8Ogqt82lbzJHemrZiv6dSCIb7atgPz/4Tz08KIJM
         n/+NAlGUE9kLeW1inFkE/VQxOi37RGr9jz6vvbUo2XiwHlhjnFbC/wYmyVsJo1rD63q4
         /K/BpZxDyiZ4qMCMK5ZsWQJVN+q+9xqCo/fkrunGHfuX8O5HmcjOFfBTYGALjcxGhgyu
         dKqw==
X-Gm-Message-State: AOJu0Yzd5c1VG/+9eSFnTUkcLs4b6conQJz4AK2SJcCobV8EONUtXbDQ
	K8FPDLbjcX3FGcAS/EtgBhUPkdtUIzCGjnNIGnyNP84syECmLa0xw01PsrGA5sFxIRMG+foyuFF
	wsbz6FFOegSaGRBCFejTed+m7PmAgufyCraQhU3SRXrGPYe+KE6CgUQRNyKib3co7SzPFSwcR
X-Gm-Gg: AZuq6aLmyW4ILY4J5TxqdkXjvm0t19TReQYK+mLM0+IVxUmr86lj4kalqbrGgCi2ZFa
	2ePT60cOQ/97l+aW5owYn0jJrM6VEZ+RKiYfpV5yUuXsCsNrxT1ueXvYre9+LKOJuHDzAOypyit
	bZF6b9+PmfJ1K8Ang9LjjyIQlYvrFlYtOtBFdcUWkLo35zOeP0+wCiDh+EvtdpsM/KJ9x/AYJNl
	t3x8O42fSrEkefZ7vAj+GT9vSmaR3Rh34wav43lhNwz1bmrsYk3Vm89R3lt/R40R4AWj9Vb72VE
	k4/R9uVyfoBZ0Qb13Dg8kyA4nN/W2JYH6nY4mjz3/fPDWcmcI1ql2pfOwblnP3lvd4OHUwhb67/
	8IHHlRryJtd0z1wOet1eIGkUs9e8RoYHa1PTDESuIYyGRtEqAUS1iyo6pLDGNX85LDDeoTkvkhI
	6c
X-Received: by 2002:a05:7300:f602:b0:2b6:af85:dd2d with SMTP id 5a478bee46e88-2b856833be8mr5762292eec.32.1770691484141;
        Mon, 09 Feb 2026 18:44:44 -0800 (PST)
X-Received: by 2002:a05:7300:f602:b0:2b6:af85:dd2d with SMTP id 5a478bee46e88-2b856833be8mr5762285eec.32.1770691483568;
        Mon, 09 Feb 2026 18:44:43 -0800 (PST)
Received: from hu-yintang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba734ed83csm3143196eec.23.2026.02.09.18.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:44:43 -0800 (PST)
From: Yingying Tang <yingying.tang@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com,
        yingying.tang@oss.qualcomm.com
Subject: [PATCH ath-current] wifi: ath12k: fix incorrect channel survey index
Date: Tue, 10 Feb 2026 10:44:40 +0800
Message-Id: <20260210024440.3422264-1-yingying.tang@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OWL3b334CCLTSy8qPCnP0QdEA0nlVsQJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDAyMSBTYWx0ZWRfX0b3L+gl14Z51
 EzB2k8TL4/u7LHJdHpAgPP3EEY/sW9ix38ij8BJG1adKE5QcY9uOQp2t7q5jmANmV/M4bDOQVVm
 nlcfg1I8st4hFJaSHMOp4hyaF0KN13XrOetLgWXZkK7TffqF4JFl33+21Dmb9PWLgXQg1Sq5jrL
 XJyo+6afPnTHKTVE395gLVVZjDBkP0lSXmR+aFOmTqVJxhREkRFMeAy1UM1KmL8oIY29ySyjdBC
 rQusYtEMLJIDB1s9wGepZtOIYdg6rmg3a/oWVuMnvzEuQebbecwkos+4uUukBNjk+6TxWhOnqXQ
 kOu3N2nB8fMPlxydglg2JsPyPfzn0FJU8IntD5zbxVt38/EBjlXKwnPpZSO/j+rG5mTXVbc0URK
 xci+YlOFJrey1DUR/OS0n65gbJGW6qH4N6/yzS+1hU3+pzJEd2Eli7/yOm9dZAYmiDImlEErYUV
 eQ3aR6X6KHa1tqQKohA==
X-Authority-Analysis: v=2.4 cv=dP2rWeZb c=1 sm=1 tr=0 ts=698a9b9d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=qZVxHVLM7CW3LY0gG6MA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: OWL3b334CCLTSy8qPCnP0QdEA0nlVsQJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_184446_762347_9D257924 
X-CRM114-Status: GOOD (  11.55  )
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

A wrong channel survey index was introduced in
ath12k_mac_op_get_survey by [1], which can cause ACS to fail.

The index is decremented before being used, resulting in an
incorrect value when accessing the channel survey data.

Fix the index handling to ensure the correct survey entry is
used and avoid ACS failures.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Fixes: 4f242b1d6996 ("wifi: ath12k: support get_survey mac op for single wiphy") # [1]
Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>

---
 drivers/net/wireless/ath/ath12k/mac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index e0e49f782bf8..86ce7d87b5a5 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -13086,6 +13086,7 @@ static int ath12k_mac_op_get_survey(struct ieee80211_hw *hw, int idx,
 	struct ath12k *ar;
 	struct ieee80211_supported_band *sband;
 	struct survey_info *ar_survey;
+	int orig_idx = idx;
 
 	lockdep_assert_wiphy(hw->wiphy);
 
@@ -13120,7 +13121,7 @@ static int ath12k_mac_op_get_survey(struct ieee80211_hw *hw, int idx,
 		return -ENOENT;
 	}
 
-	ar_survey = &ar->survey[idx];
+	ar_survey = &ar->survey[orig_idx];
 
 	ath12k_mac_update_bss_chan_survey(ar, &sband->channels[idx]);
 
-- 
base-commit: 1cac38910ecb881b09f61f57545a771bbe57ba68

