Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11B3C53219
	for <ath12k@archiver.kernel.org>; Wed, 29 Jul 2026 01:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MZOKf9mSd0crSLc2wh8F4zMblAYXsOwHLgHJ66RKogc=; b=oTW+1qL0onzFfL
	hYnZCc04BmiZ4D5s/DCZS6RQoAig6nSapXzbdhtDrC2GKOs1qaY3JpPoE+2LFykIZmkkQb2lj0F6k
	a4NxQ2wZShVQxjpkfZccuSZWdzHKrYK0FVV47mSaPa4ZbkhwTL/CFeWN+e85f4GBWHOTO3bb38lm5
	TfEQwiBUEIYb7zYc05grwpl6Has99dBgCh3jY2qldw/EWIASyZRjk2mpONwzN36JoXesZBnbNU3yS
	YwItw/fPtzv7e45sKj84BzfD7mBb3m5AfseRBfTXxpuI64/tGHs/uLjvx+FqhnvErlgSSDqg1FniC
	04QRChBHcFouHX4KwLRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wosjq-00000006YYm-1dli;
	Wed, 29 Jul 2026 01:05:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wosjn-00000006YWo-0z6Z
	for ath12k@lists.infradead.org;
	Wed, 29 Jul 2026 01:05:37 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SL2qnT3948169
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 01:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MZOKf9mSd0crSLc2wh8F4z
	MblAYXsOwHLgHJ66RKogc=; b=JKSl9Mt9+gt0IHs6Rf0xu63xOpDPX/vivq7WaV
	+aQVM28mZvKa9sLgrd0BqBIEDub399c91g6al5rLjkyRxJLdty8ShQ+l5m7TG3Na
	+jhN+mDdYqiRCXkjsgKeYsf4O3Xb37RC0E74xGXx7orShoWY05IHA2zgeY8dIueR
	dBWUw/A22dnJoegupbX3ebDGyEKBILh4l2HgzXM6wLRAxDxYwh5x/BGxDLnD+atQ
	fgkAg7tQtYtvDDvUITraA3DUizGpuSHBYcXbpRYj+un3Lzi+riwEmUDjNhYFwm3c
	2zBDsU0Xc+QeWzIeAV4OZyQto25c60T9LsDimS7177A7jBzw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpuygbd4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 01:05:33 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so198133a12.0
        for <ath12k@lists.infradead.org>; Tue, 28 Jul 2026 18:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785287133; x=1785891933; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MZOKf9mSd0crSLc2wh8F4zMblAYXsOwHLgHJ66RKogc=;
        b=La6st6ahOeID+a0qdl9T9XaqMLsupbyqC4+xQtzdtJx24V43+v5IkJ9do5HU7DXOz0
         /xnioc2y0q9spAEmO6vW3CNz/kX6ENvPw+KP6/PeCeLwF7yON9pBYdd9b23uJ2hHpcEM
         1O8FvbSMD+YgpNUOeUAOfKs2o92a/LZd0K50ks0m+G4v3RDaF2eof+nKvMArjB2fHjCc
         lwl69xYIuAduWNE2pMc+qNjqGR+GQ+dMTfrtlVc6zhThcBKhA/+nHRK8wRmx89Dqel7G
         DL8HyMEtJR3Y180raDYjw9fgNsgxqPpb5LipBL1W0KljcTNS+JtoYEPMQn47y7mXKcyg
         ImNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785287133; x=1785891933;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MZOKf9mSd0crSLc2wh8F4zMblAYXsOwHLgHJ66RKogc=;
        b=OfFJ4mAMqvg9ffh7AhpT3lmQrjg3H7EAecarZ5bEwm6y0yLNf1TFx0h3OInRZwX/Ug
         8c0orSebw80Y1OUzpXkjTEr2OmEok3wlqJ5yLiHzUoxO2W4N7yfdlODMWzTo25jQkyPg
         VSx/PK2Spzxzihb8V2QlZ+gsTCRB7BI6QSVKylcM/eDJmVj5dcyr+67lXFAuSqVHKHqT
         ziXNsa4QsKqRkCTK7W9yNwxL6WlycXId5VQmK1gyD12hDDNfbXPdTLAZ3l8khtPPItiB
         lLKmS6Qa81mNqDH2i2O9H81ukVvWtaPBH1LO13XgGB6c8/yldWhDfK6zQPKGK7zQpi6C
         MKeA==
X-Forwarded-Encrypted: i=1; AHgh+RpImDYs6yzN67uZ9nphc8lCkDA0zOOARfh19HmOcPHtzGihs7ZQzxYgcU066EOh/oKFS57rk5Y=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7xwXukgDN5enqLEn9W9YlglGF89hQzTk2sRvlj/n38mZ6WnVh
	d18pc7UL29aP9Qfg4m44EB1ggk+1XhDibaBL/FF5sywUhthv4yaisrKw6JluRB85FyT4tNHi5Z5
	i0UnVGVuz21dOPr7eO+mgRilxFVpP1vpsvgyAkJzaEfbDPIwdZ8NzNvWkdGGIhFhz
X-Gm-Gg: AR+sD13FPBW9DCILHCyMPYOgAzxHH/Pv+uMCB1J2Il7+QIQG1Zdp7zW+kR5+bWYSVhb
	Ycr1+nWh9EdsRvRNO9SoFTfaogr4de836Ku7ZdajbI15iDJ30/wIt7vxdiUD8VqQYowSfipFhoe
	UI0JubOWnc+vASb63hTnDHdccwHFCAOgm+GY0QfTxkQC+7X2rRUMZbvOWispmtZJEZR0+1l9/2+
	+mHLUHy4rTgk8z92h9kW0WrGZJjLNe2fLRDutAZexlBT/AFPha6knEvqfyvgJPtSHDw5U1k58Ke
	iHWAdg7XlihCxaYAwu/nK1ZYQ+YtVOkW1vy1qeneelayXeWuraD/HsBcLr/LdqRJHfMfaRdFYOV
	dfdg96rCOnFWdwLucfLPhXdPWwfnZqVVha1AHXiixylTZuFiYhU8hS4A=
X-Received: by 2002:a05:6a20:908:b0:3c8:e313:8d42 with SMTP id adf61e73a8af0-3c8e3139510mr383623637.31.1785287132693;
        Tue, 28 Jul 2026 18:05:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:908:b0:3c8:e313:8d42 with SMTP id adf61e73a8af0-3c8e3139510mr383600637.31.1785287132249;
        Tue, 28 Jul 2026 18:05:32 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b67063sm3699381eec.9.2026.07.28.18.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:05:31 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath: fix stride mismatch in
 mac_phy_caps_parse
Date: Tue, 28 Jul 2026 18:05:27 -0700
Message-Id: <20260728-mac_phy_caps_parse-stride-mismatch-v1-0-27a9c1a3fbd0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANdRaWoC/5WNUQqDMBBEryL73UhMUWu/eo8isiRrE2g0zaaii
 Hdv8Ab9GXgMM28HpuiI4V7sEGlx7OYpQ3UpQFucXiScyQxKqka2SgqPegh2GzQGHgJGJsEpOkP
 CO/aYtBXUqk7VNznmAeSjEGl06yl5AiYrJloT9LmxjtMct9O+VGf/j2iphBStkYjXkZradI+Zu
 fx88a1n78sc0B/H8QMAKsWj5QAAAA==
X-Change-ID: 20260720-mac_phy_caps_parse-stride-mismatch-e7292580f072
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: xGHllZyLOG6PUBHKYsYZvMXpGVl4iN5A
X-Proofpoint-ORIG-GUID: xGHllZyLOG6PUBHKYsYZvMXpGVl4iN5A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAwNSBTYWx0ZWRfXy1bp6qFQSsGF
 KP95qXlEtHJBXZfc6LpJTiN2ldX2znThwddcg8LDJqPyVq6XaQ3+QufONUmza7WKzE/cPyrRvae
 e7gWA/0Z/RmkTpNUds/FVkA7HI0hf0/iLfIeQ5LrCN/OTk8d7lghfqYnH9fORWpQXCgFPWxrp9d
 ljh2fB4PN3ez4f6eFZn2sxyvlMBagRTWienuk4EfLHasWatbzMyuSSSu4j2hBCCFOZb08zqUnL9
 6n+y5zAMhahSNQkBrBLzl2ow/2t/neIqVuZf62OSqURtppH/g74fVKmMu+sxKtx2oXzdibfLkE1
 aXQek5BCD8hJtvQEqxyXCqDAmShSJKEigG7yXyVG870KHmZPe0sthaV6sgHIULCIdGzxdqliMbV
 pof5HFsTSVaodSRmEzH7zfrpeuqJrY/xMlh5/VcfPhUmopR+M8kbfc0Uu0cDHxlDrNUik8AMb1O
 a+1VBPp/MlRNXqQs92g==
X-Authority-Analysis: v=2.4 cv=aoWCzyZV c=1 sm=1 tr=0 ts=6a6951dd cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=rUlN9L5Rg0sLS0zbAgQA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAwNSBTYWx0ZWRfX/jC1FoidKETR
 cXHVamzno3XLkyeRKBKWEZU1HlLeXWPo4BDjuwcw8mgJeu8xukexLgEHhHLN+weLI+mFIMBUiYv
 JDoe6YjoBrK3nbjXCtMxabrklQBpMfI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_06,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_180535_382116_BD1E70C4 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
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

Both ath11k and ath12k have the same issue.

---
Jeff Johnson (2):
      wifi: ath12k: fix stride mismatch in mac_phy_caps_parse()
      wifi: ath11k: fix stride mismatch in mac_phy_caps_parse()

 drivers/net/wireless/ath/ath11k/wmi.c | 8 +++++---
 drivers/net/wireless/ath/ath12k/wmi.c | 8 +++++---
 2 files changed, 10 insertions(+), 6 deletions(-)
---
base-commit: 189721a4afa1804315e7dcfca9ca0539c7b1d7af
change-id: 20260720-mac_phy_caps_parse-stride-mismatch-e7292580f072


