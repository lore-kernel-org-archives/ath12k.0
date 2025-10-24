Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C82DCCD1BF
	for <ath12k@archiver.kernel.org>; Fri, 24 Oct 2025 00:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ian0X17PCBEpR7XIWg1U5JGbosj94lRWoIUAocF34vk=; b=rTY3DZZMf8d8+9QMQjNSA6tkkB
	DAMMFkMh2nfop9hJMEkM5UwFbvPj/I0xeWmyltO281IP0QejjrA4x1ehNqO/5K+QQic7SzTqyMAgt
	93H0xUIlZrYTyqtQmOWu9BWmARxZywxwfpdU1qT0ef4Ay6yR3NylW7jnIRJcxq6rROmc4Kb68yojh
	YG7YFNu6GEER+E3rFisEbsW99iJbLJCTzkEbbCFfG645tVMcWOPOkAqKscU2EHqOGdjufGchuL3GB
	HfTYPxM+cjmyKxA2fpX4yQAdq7iGB0a4ecNXFvZUBieavxDUUPDEDpTCRkYR6h1t0zC2MMlx4hg02
	7DcrbNaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5Wt-00000007tQM-0lf2;
	Fri, 24 Oct 2025 00:19:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC5Wq-00000007tPx-3Nna
	for ath12k@lists.infradead.org;
	Fri, 24 Oct 2025 00:19:38 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NFCn7j011794
	for <ath12k@lists.infradead.org>; Fri, 24 Oct 2025 00:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ian0X17PCBEpR7XIWg1U5JGbosj94lRWoIU
	AocF34vk=; b=dfQ2IRvdZKyhgj0TTCQgntpzxC7LUTD0fexh1swXaI01+3wF7vB
	z8WTyA9zfvM6L0QcmyCTexMi0103JfKx6DLePtrbnt1tx2oVwJjrtVJXLjcfuiZW
	dCwl9FEkYNmyhuwrqvbH23Wp5PQQWPMUqddhu80m/Pfltwc7jPAdNLDyAsdqDDsR
	edg3t+onHFy6vUqxGJZejLCY2zL7ibiMccIKlt+CXfOQNm/0+6gwnIiN9uz6TVTr
	y2SD0BC0JzHXUCEivyUTyHxiawwC4xhLKpiPz3g1F7N5K9R2KTNZVxpg8bWYYxnH
	i3OfrhoEz453u0cVKYb/RYeEiNvRynVBF4w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y524cg68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 24 Oct 2025 00:19:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33baef12edaso1372021a91.0
        for <ath12k@lists.infradead.org>; Thu, 23 Oct 2025 17:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761265175; x=1761869975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ian0X17PCBEpR7XIWg1U5JGbosj94lRWoIUAocF34vk=;
        b=RsNymQTdevljzk4foIUZs2D5JdYogLIFIQzYe2mcwT9H3GIeru3La1znTMAmuHxHpA
         X2kWDXaAgtwTshDvTinZ+ALnAa+CLfuplsQVO1J520bTc4DVuU2iC6DeTS9h56MDgfM9
         Lwooat9hhciGEHkCxMfzguD/LJuKPYi4Vir+Oa3v/fET9kEFfxnDHdO8izKqtZgLz5+g
         u6GLK6beG87f2bpW8YniS4mZl5tKRm0Nby1pduaHO4V/1EHEfEwmbwME9tFKevx6Qz3i
         r6zipsqRiNhqVNPrbdwxJepq0wKiPOIJ/yKAoxdZeqcBepyab3l8XbIjRBeF05/TXKxp
         z++w==
X-Gm-Message-State: AOJu0YxqiPKiLNUhNjfB7d7kRTbmwZ2M8mPtYAVIfY/WCF1d3Bt3pxzA
	fTaE+w5/WX3SG89WSGz1m0BahgQ6WpdYKrcMJRcfanmjpo0bFACRFJE1UrYKyAtz0JGNuR/l63F
	cTb51OdF4j3UQyDNqqyFSgqRHvqXCRyB60VooV8zMzv+98lcwpewZz2LCzz8WVcUJhrc8PAGY
X-Gm-Gg: ASbGncvpui8CDMwwwhY4VbnhG78MusjgPDFj3Il/2VIwoKN43SFRSvCN85EIzIUE1eM
	dMvO/EoifCDClnL18EH5ymyiv/zYmHv0AzNe5NQeeME0MEwEMIvYQ8GgaYApmvE1mbXH5JYc+0u
	uxfWLaeU5gjt4893sXGjAkMnLpQJg3QCtLA/g+dF3kW+jNf1g+qrnBB/eo0TNJ/FYBClA546219
	6OIcFBavHQX8wAldlaaxs7Kav9jM0+VWPMzzxx6aRZYhvwQ8YLiYRfDtRH5BBouW5OcJeOHylFU
	60t2pNqkn+pn/z/aksflPWTEPZ8VfilCxK0YCwVFHNb5KkOOW+12T+oNe8OBoQGorNz4yBeiA3y
	yC6TptfD2ZAgkmZQS9ZUxaLWCb6VAoqXbpYy0c/Rv/QidZcYRjalyEuk=
X-Received: by 2002:a17:90b:3803:b0:332:250e:eec8 with SMTP id 98e67ed59e1d1-33fd65fe245mr375929a91.15.1761265174616;
        Thu, 23 Oct 2025 17:19:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGP6BDRLhTXu8nx6xxdniJdhKWROM+z5+g49pAorS7OxXt+mV4BYjS316O8lwYeaCAB8jR5g==
X-Received: by 2002:a17:90b:3803:b0:332:250e:eec8 with SMTP id 98e67ed59e1d1-33fd65fe245mr375901a91.15.1761265174138;
        Thu, 23 Oct 2025 17:19:34 -0700 (PDT)
Received: from msinada-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4bb65b3sm3296264a12.8.2025.10.23.17.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 17:19:33 -0700 (PDT)
From: Muna Sinada <muna.sinada@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Muna Sinada <muna.sinada@oss.qualcomm.com>
Subject: [PATCH ath-next 0/6] wifi: ath12k: Add support for EHT fixed rate
Date: Thu, 23 Oct 2025 17:19:22 -0700
Message-Id: <20251024001928.257356-1-muna.sinada@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE1NSBTYWx0ZWRfXx5XFkOH9eR1l
 EphgTi9QjMN427Z9DmnglXvk8VPsb2lptnZGzfdg+vAIgyeSFQRjTtlwqNnUlqfc3Ja7Z4FJ5aJ
 jSVtnMjZU5PvaEmKkj/tbAR+U/W9ex9K0wcQCaV6TCE75E0+VRzHnbg2rJeF6tcCwEvGs617DvX
 hD0Yd7vR082FeKGXkm2T/SaA2SG16YWBOTzzkwEozh+dtCY4YsV/o/YOPA+X3ZVyotIvaakPrhj
 94xI7cOYX0ozVRxKh3NpO/Y4LpiixDzEzyWLKvkhFfpQmvHolbEPoO0I+rC/TQXgj+yukJzSRQY
 CMCY+D7JvnkHgga1kwx0JYGYY8AZWt7ZhXyE13Fx3RZLvVYKFUXjUSFqk2BN6hWcr7Uv0iNHRMz
 yjzfmr6Kg28BmTHUTjCvGJ+jud850A==
X-Authority-Analysis: v=2.4 cv=Uotu9uwB c=1 sm=1 tr=0 ts=68fac617 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=8Ar4_4e5b34ZrmqIgSoA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 1eo11xKdCTChE6OKRt_C5RyVrEWD3Srb
X-Proofpoint-ORIG-GUID: 1eo11xKdCTChE6OKRt_C5RyVrEWD3Srb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_171936_848125_9160597D 
X-CRM114-Status: UNSURE (   7.59  )
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

Add support for setting EHT fixed rate for mcs, nss, GI and LTF.

Before adding EHT fixed rate support, generalize GI and LTF setting
functions to allow additional modes besides HE to utilize the
functions.

---
Muna Sinada (6):
  wifi: ath12k: generalize GI and LTF fixed rate functions
  wifi: ath12k: add EHT rate handling to existing set rate functions
  wifi: ath12k: Add EHT MCS/NSS rates to Peer Assoc
  wifi: ath12k: Add EHT fixed GI/LTF
  wifi: ath12k: add EHT rates to ath12k_mac_op_set_bitrate_mask()
  wifi: ath12k: Set EHT fixed rates for associated STAs

 drivers/net/wireless/ath/ath12k/mac.c | 579 +++++++++++++++++++++-----
 drivers/net/wireless/ath/ath12k/mac.h |  14 +-
 drivers/net/wireless/ath/ath12k/wmi.h |  13 +-
 3 files changed, 504 insertions(+), 102 deletions(-)


base-commit: 50cb7ccab8176cbce4e32420f9fc2d6d80e69a09
-- 
2.34.1


