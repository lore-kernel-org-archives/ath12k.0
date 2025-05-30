Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE42BC5B543
	for <ath12k@archiver.kernel.org>; Fri, 30 May 2025 03:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LnLydFVJZUot5z+c5Is9dilBnJF30AZGWpIs1hJLjiI=; b=EWCU/BNrj6owdk+9Ogf1L2UsB6
	F6hOmBxsaCjQN9MaWHOVhL2HOacGS9h6R6bUdqUrSDRY/c6qAjaqZGrMJ1jSgzH32i0uHGlHcu6Lh
	FujdXB9/v3XMSq/m5bIPeEm8GXzQQy477L/eNXx6rr7zLdG0atQH46hQrVVubwnanVqL3MA5jCUk+
	s2oD8LKWBc+dJylIYP12PghvQDUzohQT3UQt/Og32MjtDET8we4gsv6YeEI0UWxAiddFS9mFIJRVf
	xefAmwHwk4WvcvVvsykex36KBJCde7HG1pq6UjS0abOJAuX4aKQ+941wZQ4ivArj9BWCZN6uMdYUD
	/CzMP0gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKqst-0000000H8ll-2hSC;
	Fri, 30 May 2025 03:58:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKqrZ-0000000H8Ot-3zZd
	for ath12k@lists.infradead.org;
	Fri, 30 May 2025 03:56:59 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U1KJB8006941
	for <ath12k@lists.infradead.org>; Fri, 30 May 2025 03:56:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LnLydFVJZUo
	t5z+c5Is9dilBnJF30AZGWpIs1hJLjiI=; b=EY+qoztZl4aEzBP3MQNGqjVZE7E
	KX/Pq/BmklpXCnVuCL5lu4cnYM5mVdJntK0MJ+AmFh3uS60O4YG5E0m8Id1/DIqf
	QsnDXvg9nbqTMNJwoMuexESCRKsm/m6HZmtDKTccRvLQhSNMaZf163qM85FHdBKo
	v/UZJllaHMNdChgevDnVtka4sBCmOSORTzFwzrhzxNeT4fHxEXVm3XhHZ5tYbrgg
	AfBtddUtPWvLoW1yCCNDxHnSlcjC7xsviYN3aYqWhhwHL+WXwlgTFeOTsi8x9+G5
	MW7QRO05rM4Xe+NigcyQkavDSp4EssBTTtourw475Cd0BMVElJaLysShnJw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fqfvg4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 30 May 2025 03:56:56 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b26cdc70befso1013355a12.1
        for <ath12k@lists.infradead.org>; Thu, 29 May 2025 20:56:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748577415; x=1749182215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LnLydFVJZUot5z+c5Is9dilBnJF30AZGWpIs1hJLjiI=;
        b=kmOo+kazI134ncqRJ9o7VNdLaVLgq3y85iBUPOdSo3Yh6RcEonSGEdiJT9LQG7m1yH
         YsghMBeFWrkwld0Dgaf6kLs9LPYms2r23osI0IGZntGPhqhxwLFypJJDa7uJJbBAfrsN
         YblXFRWq/37yhkqL+mWUtX4Xda5ubB5QMAhxmAUtUhYxvWbZr4romjX0z810c6Y2DsBM
         xhsQxyD98vQrzK2d2fjl1f4AwQO+CSf0Bx+xQH+kAiRlgprnBEm1svCOAp7Hj76OlRZk
         awecMBPMpAzAYHMOjKkaFIKTpoN9YiCG2P3hOxOviID2q9dE1EuMRdihclvRlI5GQaPO
         VAAQ==
X-Gm-Message-State: AOJu0Yw8iowNOxxH3BQOgThaE2zjQMfuTy3hIPBYrqUq0Ogalsni6X7O
	PJ3+ycFtKUd0QnDLEsYQp1GICFBnrE/A1BEkJLM3Xc5085SHyQHX3KMcckN7TfwarzvbGtJi+8p
	Vutz6rZNW0GputdX3OQsQpPnBsgGDUt8IqTZosaSOBngWs0o/9wq7vQY8HaridL/XzGvlryfK
X-Gm-Gg: ASbGncuT7o4XJPpn9a5yjKL4/QfS+MZND3/YIx+FcEsp61gMv5xC/nSKyUrsbYiWTtA
	NJAEBEiTWNIrjW430wE58M7kfAGQx82zbj8L8OaOpBFEWHzguRJQvtQns2NyiO8EXOiQh0a2a9L
	0gmSRqJpJAkBrTeE0NvWURpx9/gxxSTjRDXjcHe5PENZd2DJn18hiKxFBvYcpm7BlZzFppqrKUE
	CbmtbGdnrlK5lZZHk3Ne2gA+7022d1kXDU6dUJywMSxFv69On8QrLBtvbs6ePvYiIU/TeIgbP8c
	Qg73zaNAKWkW3my/B13uodsjbUTAvaV3SBulgCpbDB9sBqyakV/3eppPuOXna38SN3sJp6jl/iT
	RYrryp+O6ePrPrO1cWuKlZ0LFyfuc/8W4NiEowc6x
X-Received: by 2002:a05:6a21:2d8c:b0:203:bb3b:5f03 with SMTP id adf61e73a8af0-21ad94e20aamr3346494637.6.1748577415171;
        Thu, 29 May 2025 20:56:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHYzR86d/0VVQ6l0O0L351Zs1467IxLWVb+m5KUlGsppEWboX/Of0JElOahDkEMxYiPdb1vg==
X-Received: by 2002:a05:6a21:2d8c:b0:203:bb3b:5f03 with SMTP id adf61e73a8af0-21ad94e20aamr3346458637.6.1748577414755;
        Thu, 29 May 2025 20:56:54 -0700 (PDT)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb96fe8sm705274a12.59.2025.05.29.20.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 20:56:54 -0700 (PDT)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hari Chandrakanthan <quic_haric@quicinc.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH ath-next 1/2] wifi: ath12k: Fix station association with MBSSID Non-TX BSS
Date: Fri, 30 May 2025 09:26:14 +0530
Message-Id: <20250530035615.3178480-2-rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250530035615.3178480-1-rameshkumar.sundaram@oss.qualcomm.com>
References: <20250530035615.3178480-1-rameshkumar.sundaram@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EmaNQqFRYwECXplqdtp0lsJSJ09wcJlQ
X-Proofpoint-ORIG-GUID: EmaNQqFRYwECXplqdtp0lsJSJ09wcJlQ
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=68392c88 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=yksjwJa0xvd5-aT1PIcA:9
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDAzMCBTYWx0ZWRfXxb+9eIyzdKcn
 TFtUpp+Lri8IPXMc6bK9EfM9m3VqCzlIEBhU+WAQbDXnxXCS/BB2KqCzKQNH8qHwZuoQNLb16qO
 WaR8/ES+HqnNSi0eyzY4Se2OMqVOBJx5mqVzsd3bvsr8xeP7BPsWt9BpBiXasKCQGxFKeXzHUgG
 eYJxyAQVU8RmxP8EUycP3jyYqMzoDwOao/UUuhQPRMKBeUmqQWwC9UTiXGdG+78CiPBMIe5Pclc
 JQywHpUzrjhTxx5diS0D0JKZSVS6k+aSlrElBtW03h4FcOlX91a7M9NVy2X0xbp155JfWPOubI1
 h7OscYE0GMXQpPIPtkT0l1PugwCckEz33xAkuG9+E5EMh9eD8ngG+eBIS3dy9o1iiosyF1vu/qS
 BELvyuZLuz6hpJaKj4i+KpcJfHx2Pnr98Xh+7Ny1qoc4U297S8vtfmYscBh7r/pW+6JSULjg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_01,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505300030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_205658_111254_69BBABFA 
X-CRM114-Status: GOOD (  12.64  )
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

From: Hari Chandrakanthan <quic_haric@quicinc.com>

ath12k station is unable to associate with non-transmitting BSSes
in a Multiple BSS set because the user-space does not receive
information about the non-transmitting BSSes from mac80211's
scan results.

The ath12k driver does not advertise its MBSSID capability to mac80211,
resulting in wiphy->support_mbssid not being set. Consequently, the
information about non-transmitting BSS is not parsed from received
Beacon/Probe response frames and is therefore not included in the
scan results.

Fix this by advertising the MBSSID capability of ath12k driver to
mac80211.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1

Signed-off-by: Hari Chandrakanthan <quic_haric@quicinc.com>
Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 81ff32d2ce5a..5183a7e43e51 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -12078,6 +12078,7 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 
 	wiphy->mbssid_max_interfaces = mbssid_max_interfaces;
 	wiphy->ema_max_profile_periodicity = TARGET_EMA_MAX_PROFILE_PERIOD;
+	ieee80211_hw_set(hw, SUPPORTS_MULTI_BSSID);
 
 	if (is_6ghz) {
 		wiphy_ext_feature_set(wiphy,
-- 
2.34.1


