Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE84EE36B4
	for <ath12k@archiver.kernel.org>; Thu, 12 Feb 2026 18:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i6hbUt341STIcTtnbQMW5kOvwiDdNHYn0X3mxzxIUdE=; b=EOrFrZhYE9t4yNbs3UD496Z/kT
	BzWOGCUHAwU4lNitko8PLBFOvknCU1I+iVC+GcYtoPTnBhjrZKyRS3hCrnw1tnVAB3LjL9urIsGKq
	rxxKgreYuIRja1/9Q3wS2URgBiamSMK9B7+9Vt5fICje7W2xleX+FbCuIWTzSlNcrB/8t+pLaZ9yK
	cDsq2newDcAiCvNmgX3WCI3Rcdm00UA3FIo9+nmbqe0s+hGtm79Ixq5de0ovbFAhfyo5cU0MhJAIT
	Ohp0AY687YmIFOH8egW/6YbRiFzsYcmmBYoMSnv12EkRcoy7VuySS0oQ2HtSHoU6mYtwHvaRAdX3P
	TkXxTpZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqb0t-00000002UPF-150F;
	Thu, 12 Feb 2026 18:02:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqb0r-00000002UOt-2LZS
	for ath12k@lists.infradead.org;
	Thu, 12 Feb 2026 18:02:02 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CDRuRV1068459
	for <ath12k@lists.infradead.org>; Thu, 12 Feb 2026 18:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=i6hbUt341STIcTtnbQMW5kOvwiDdNHYn0X3
	mxzxIUdE=; b=itsgELcM8SdywALRLdx+8kvot8HcZhc92tvof8aeh/cmOEo4h27
	UUSOdefUcJ3p0mJrRSh0tGolTHLwt68jaDVg9kbRv0pWchdN61gpmJ3ChVVAqREx
	WYzZeO9xrRkap3pvujCJzCKysXDKCPWtrIRq1W19mpOtO32t0L5CGNi/jcW36Tpz
	6euxzaeMypDQPeYpVh8wQHbd4BYTStY0wKuPiIkgYfiQJ2XHkf+vkQuV8MPYoeZt
	m7GlmX6v/OHG7RyAnT/EZD2WuRm7Zad+rJUI22P2f5ynPgtRAWsHHVvgP1VOJqAP
	Kj+3BCnhNPiiBbZWURH0ln/Bea1lrdt1slA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9d09hk1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 12 Feb 2026 18:02:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-354490889b6so339171a91.3
        for <ath12k@lists.infradead.org>; Thu, 12 Feb 2026 10:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770919320; x=1771524120; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i6hbUt341STIcTtnbQMW5kOvwiDdNHYn0X3mxzxIUdE=;
        b=JZDGBFoHgpu9JHqwy9I0/3d++ouhv9XdAw7T0Fu8Lro7daTOFpWYHAmTkKXJHADqDB
         Z7E3gPRGDyU7lThTbFs7Q78sIPhiAm0tqdcwWWo6weO8GBwFOyySJZZ1D9gMhXP8YVgQ
         GvyhJRsgOWFXl2e3VNW/UqGzQDQfJIp2cHkQOotj/zIH7w5BwHPo6MMbGph/SVBlTHUE
         p2c3casTBt4kqVOmUM5Ww2ru2SEmqNLhMgckvb8q942MhJHVBdKXf0sZQYpcnQM54tGV
         OonOjHPtrmgZrJ1oK1BJ7ReHFtLCm/ljqK/hsGwEXdc9vXglA08YA5Tsq8Zbz9E1rTjq
         NCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770919320; x=1771524120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6hbUt341STIcTtnbQMW5kOvwiDdNHYn0X3mxzxIUdE=;
        b=C/QaNQ1d/Of2nkmSgdoX7w3rECNwwWvZayhnlbH1OYi7gh3wB5Sm0LT+eea1HaKbxA
         Xx9ohSA38xcvAQRskdJ8OG+3YleHvF7Dae/qn40Z3iKrD7xYUniWmvXjt3A+bqsky3T4
         KN8cKIHKhvHe71gEWbaQbeRoUvVBUN4Yspl4NRPaT4nIiWa2rYQaEtnqCC8qs16sqhN+
         VxZkwPtdlC1hNauSurZk+mf8wM0XJW9EixHja7+nEyW13htKbWKeDzIK1PT9+zA/6ppk
         yRSvgwEQGToy1V/9QKc2ZQQx8E/G9zywXQHgfxmSiKKRAVJhd46qm/4atScfR9a7beJ8
         65xA==
X-Forwarded-Encrypted: i=1; AJvYcCWuujVX1J6AZwEopZqcPy9vbcQCu3UT5n9sl9iRpFtjrmj3hNvFHtAjnqcw88KpCPV8a1TwJ9k=@lists.infradead.org
X-Gm-Message-State: AOJu0YzM5lv/jzPOM7+pZaFR6oi0JedIGuYWOT1Gd2PTkz5GzwxZtC6m
	4fMqfcKv4jGlSe6AN8cegsRHyDg63h7DTL9QKQc+VOEoU22VeiozKKhoc6gAYu/XnI1agdsevyU
	vkdhFj59f6H5qPHgV/0s9JiaOceyiYGa8CdfNYOYSR2/lFrwPH9makrRUIl9IOzRthKwGgQjz
X-Gm-Gg: AZuq6aLZjYPAcGASmvN94Rh6KG9w9vWUTqG+lHXKriTI69WtWVFI0+z+yaX4a27SdZu
	ukuH97++NYmd/UTzNzF6wcTId2RajSQKcs9h8lWXikiSG226x9jD14okZYy0vAAbCwgnO77ToWz
	RRI4YLRtqe++K4soJwJs7Yfcij3VyT2o2Q/bTMeo0KYjxeLkken6W2Q90GgAAA28cT+hiAaKpgS
	3lXQA9alBlkwUklqIWqKFPPcAKvASKuVln4daxZXNHgXtXQB3zIMvJgFmqZJWATwT42HqYdHTCJ
	axVc9xIjEyxSWGfIitF0qMDEPTtkV6KvAZoECfhGG7qnsQqdOXZJfA9mMqOzTw3RHQvQ9jcUyiP
	wevABqaS2msPBqDeQODgb46Hs8FEwTfc3pgFK2numbYCqBJtO+2W8LP5lncCT1ZpruQ==
X-Received: by 2002:a17:90b:2651:b0:353:e91:9b2f with SMTP id 98e67ed59e1d1-3568f54a934mr3558418a91.37.1770919319268;
        Thu, 12 Feb 2026 10:01:59 -0800 (PST)
X-Received: by 2002:a17:90b:2651:b0:353:e91:9b2f with SMTP id 98e67ed59e1d1-3568f54a934mr3558386a91.37.1770919318708;
        Thu, 12 Feb 2026 10:01:58 -0800 (PST)
Received: from hu-kathirve-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662fac3c1sm9714130a91.17.2026.02.12.10.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 10:01:58 -0800 (PST)
From: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
Subject: [PATCH wireless-next v3 00/02] wifi: ieee80211/mac80211: Add UHR (802.11bn) Capability and Operation parsing helpers
Date: Thu, 12 Feb 2026 23:31:26 +0530
Message-Id: <20260212180128.257565-1-karthikeyan.kathirvel@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDEzOSBTYWx0ZWRfX37teOGhglC6U
 geZV+S4p6piMK3YUk2iIgVislIKG55hCDW6Xu/AIgj3WlMEfLnb75JC2lYmoUJqpAeweScso3D9
 2r27qpLj7CHj+agg+jvX32lxt6iV451Dbk0ybvs3EhLmU8rtcyzMf+aAveqhRhJzLLOb+BDq9K8
 9b5KPESNiBpU/CT9G0KsIG3gFT+TEcH47lMAdmtpjoK93wzm6BUNYN/5y6rC6BjcNOrS6KblwG3
 YBKea08UsblnUZmy5RovFSWGK2b8K487LeXVPZzCq+JrMmjNw96raK2s4CkH4ahsBNgc1mBCLAx
 IWuuAADMAGFDDZ4aUQhU71IDPO+ZD1So7vsPlB19iBOLTyDQHPphDKhJspS/jqS14JlXKXQdoCp
 mD94OKd4FUktI8d09WU6qswEaoAlU4vBvVQ55dq5egik7wMx/wUfqdSrLUDdwTjkQh+QIW+QTij
 byLMRiHAVChj/75PZXw==
X-Proofpoint-GUID: nJneTUxoYr0Tr7EYfIXIIIcVmmcoZLiQ
X-Authority-Analysis: v=2.4 cv=Y6j1cxeN c=1 sm=1 tr=0 ts=698e1598 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=9AfIhKOTUZz-8RWr15wA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: nJneTUxoYr0Tr7EYfIXIIIcVmmcoZLiQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_100201_621925_CA8F4D20 
X-CRM114-Status: UNSURE (   9.26  )
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

This series covers support for UHR capability and operation (11bn)
parsing helpers for DPS/DBE/P-EDCA, and adds mac80211 hwsim changes.

The code changes are based on the IEEE 802.11bn Draft P802.11bn/D1.3.
There may be changes in the code to adopt upcoming 11bn spec changes.

---
v3:
	- Addressed Johannes's comments
	- Removed reserved macros and unwanted
	  IEEE80211_UHR_DBE_OPER_DIS_SUBCHANNEL_BITMAP

v2:
	- Rebased the changes on top of Johannes's initial UHR commits
---
 drivers/net/wireless/virtual/mac80211_hwsim.c | 288 ++++++++++++++++++
 include/linux/ieee80211-uhr.h                 | 239 ++++++++++++++-
 2 files changed, 520 insertions(+), 7 deletions(-)

base-commit: 333225e1e9ead7b06e5363389403bdac72ba3046
-- 
2.34.1


