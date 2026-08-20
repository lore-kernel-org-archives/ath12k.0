Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D12C5DF82
	for <ath12k@archiver.kernel.org>; Thu, 20 Aug 2026 05:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6KUfB+zYy6tDKwxr07i6VcoSbL28yueCyKaNPo7rWBo=; b=rysmXAIpDePG4GGTlRjEWl8kzL
	pCDMp7ubSP9EVfjCBKB84Va4Vbjo0Nsw16zwlSRgT8X9G42onIMIfR6tGdXBYlrkiRem/Zkv/Ve2W
	wqZWtNN9YvG//nfd/i4JrFKrW1eqxvU4nncSsviE5W85HzqKn/H7nD0hM/H1SS7IsA4xxmxV39uVk
	OADoM8miInvk6rbx9m+7U9iodP67s9IA/5zviFBdOje6bOCzlvxJpKNvMClsuSjJJc3AhM6FJ/c2b
	fUSR5GGSGHGu4MUfOCPE2dhg8bKcmGliBk/cajEsO73uFJDiwIj9sckWyGDEYWWX5bwJ+y1fmoCNe
	p46l4Bfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvdR-0000000ArRc-17rS;
	Thu, 20 Aug 2026 05:48:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvdO-0000000ArR6-0KRn
	for ath12k@lists.infradead.org;
	Thu, 20 Aug 2026 05:48:15 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JL8e2x1354528
	for <ath12k@lists.infradead.org>; Thu, 20 Aug 2026 05:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6KUfB+zYy6tDKwxr07i6VcoSbL28yueCyKa
	NPo7rWBo=; b=RtOL1Sg/oxt4xz2gjN/+b5xwt276xR5SV1V188rF7NY6ib2o/Ew
	YFKsKUjlXGmXINaunA/bXww4gMhXINc0J3Ffx7N6YkX2Uy+Sz8pjKBoPiQVTS5Xv
	PRRIhFC/8gQv31wsktYpa0dDYhBHYDsX7sPaJs2x5Zv6PJrD4dH04K242Ho2lvlO
	BooxT8urazi7Z+ImZQSsFPPvflJQRJe8vxGJ96EGF54/QlivrFVlAskOSU6PIjME
	Csdk96gNijOx68fEdT9tsSJxJ6IuFkzVMXGJpg3xxA5IE/XbVtn+LTd46K4xRgDH
	e1soGck2euk7CWw0VlbYrwzVKOrhTP9ZuXQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es5bc1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 20 Aug 2026 05:48:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so3133872a91.0
        for <ath12k@lists.infradead.org>; Wed, 19 Aug 2026 22:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787204892; x=1787809692; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6KUfB+zYy6tDKwxr07i6VcoSbL28yueCyKaNPo7rWBo=;
        b=Y22XSyiw9fkJw8PeQyLxQZbFg2AIBeP6wGPOqjTZ9FDr+72yS2Mc6wYlYnjIMxp4/J
         4KCViCXcs1LqUjr87eVHCm1gxrX/oamizqh2kvdpf2IGGXEeQUc12a8tKhyxaEnKjqYY
         7ReqJz3jhmMrAK6ibNlrDjPUZUeMhAkTjLS8xc+WwaFTrtDuCBbBW6YBTlwjFEYddxQP
         Y1I26kSPGcgfTZlybjJXZSgHLsWE2cwYCHliAk8MCnvruOg99Hm1tn9VzCuk4wjviKRG
         EPwGThH8FFXJ1MvqklNIVMkTsZrIoSgwCZwbu1+pzjlAePtFU8cILIbqsyMBGEpI88He
         lMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787204892; x=1787809692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6KUfB+zYy6tDKwxr07i6VcoSbL28yueCyKaNPo7rWBo=;
        b=WlbEiPSANxfAnbrbaGuaMIb1lyyGmonpEkntAXwN2jfRmed92zWZU1xUgnlWIFdhzX
         PiRUw6JOLWNWt5XbUTqW5FIQGKe6iXrkLbEimjqnU92xxHi7PaxBdvZ1/pRg5siceBYA
         eTXxBWBngs51R4SpsVOuYdKDMUWSV94IRuO3wlOcwyEjMFg4y0a9Ik6lDjSW2HpUIJ49
         j9uCF0iN3gmM25hiltQbdKodAjQskC8TxjdW0Rb/o5f4LLEuY1qylRKNJ4ENtBIFygii
         oSHxKiYWvwzutxc43sqVhijiAqGwoq2uOqh7LaPGxdeftTW2q2cmDb63/R8nsXK2CCD+
         y8Qw==
X-Gm-Message-State: AFuF++kJgSEcmvvV5mBr1qQqooT8PVzjgAXYvJ1Ch+ZLs9L3Ppar/0fD
	F2HkJ/G6Mup2r3eIc2zssMkWzTb7HFEkBt+RtNBJjPxOYIcC7TcBM+tGHkh82krr5WPM4PQCPdn
	4pVJ8fNbmxPzyD3CsbngA/IICqCS/y2D5adbAU7JGprkOtQkTA9ztXq8VO4885a4B5ppM+VeO
X-Gm-Gg: AR+sD13X1Ro/vKn5G1WMliq7I1jisGGU0Ck5bP7jmTnZGo/2o11H1HSGcMQCvU5m0jg
	LDFRdB7m4j2OYvfQqYpMvhPKdqMDurmiUnLl5xaYPYfmUvWygfKNZkW9ikhWEy9Gcd4WXrPkv4k
	25C/whIRB09kGkvDY+wCxBz9bKY7Z/FipV+NIRtHKwK/G44yef/z7AdxZAv47nU27ZC1cKwCziy
	MVAUOdIdPWNIebTs2VAP8FMmchglxg/Z0NYXT8tpf4fqYPWweu2Y1nRPYs5vLTU770rjaPx5tTn
	HlzkWTbcey2OHz9NGMPLn5HEvSkH3m4M0JxADtCCVFdaaImv+puHaHk1ySBE+0waNJ4NYb6PwMO
	HyMN8I9hfsW0tvBS4PXdngRT8of/z6SvVsJQPtBJjb+SXeudSdGRucLRMBdu2ap6t0/v6UUqshY
	Nx147EvfB9u+jqI88f72A7cjw=
X-Received: by 2002:a17:90b:1e4a:b0:37f:c97a:939f with SMTP id 98e67ed59e1d1-39580ace5fcmr17925313a91.7.1787204891578;
        Wed, 19 Aug 2026 22:48:11 -0700 (PDT)
X-Received: by 2002:a17:90b:1e4a:b0:37f:c97a:939f with SMTP id 98e67ed59e1d1-39580ace5fcmr17925235a91.7.1787204891156;
        Wed, 19 Aug 2026 22:48:11 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fbf3dc2sm5440931a91.17.2026.08.19.22.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 22:48:10 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        quic_kiranv@quicinc.com, baochen.qiang@oss.qualcomm.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com, quic_periyasa@quicinc.com,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next 0/7] wifi: ath12k: convert DP profile parameter macros to inline helpers
Date: Thu, 20 Aug 2026 11:17:57 +0530
Message-Id: <20260820054804.3222296-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pDrtFEFwkwFyDZRcrdQ4OY9w7DuFdbly
X-Proofpoint-GUID: pDrtFEFwkwFyDZRcrdQ4OY9w7DuFdbly
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA0MCBTYWx0ZWRfX8VahoshAU4Hj
 tFhmL6VxHGzsiRmSZQsoe0VzPjYilb2n89+hXQadMxq9Ncid80QpP2GMEEN4cklU0uP4SI93dpa
 ogsT9eP8P5Jq0DArZR/QoCF5PmYElY0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA0MCBTYWx0ZWRfX645yawP/DgIR
 aRTdak4KMU8xIf5Xt6bitlJHMmaMQEc8AxbDxwrj/gDb6fyFSZmz6v1lLFfpJR2uH5J/THCft+9
 08DITGwUACZNmF/NcEk3+tou7RtZHhcp4mjpT3cjJYV14LTb3mEFaWbRa+bodLdrp19XbmNyVej
 PBrI+qKjNNdDg8Q1cjDrzxwbeWauCcattkZUrITWU5EIIY207dB+gyD9W15IyTraR3g5dDsTptp
 ollufhr3QmvZjtwaXKFpEN2nim+ZyEwJ3j/8jTkuWgTWPJ1RvUiqGDaHuw+xZHTst1u05gwCoKQ
 GwE/XNrym53EPa4OzXScZXtHWot7WkBT1HYyivpsTNCgB3LGD3miCh2Tyx74O0FvpS6V/YNN1Fu
 Cj6V7snbveoPhWkYsTX3r8zaQTzzlOUZGI/zBYa6O0pL/5OcRZl+hUE4smb3Z633z5Ncr2Rwu1R
 iaEV3BqHeWA+PDOKT7A==
X-Authority-Analysis: v=2.4 cv=Oc+oyBTY c=1 sm=1 tr=0 ts=6a86951c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=z779poplHCvFrhnLu2gA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_224814_236244_2C198B95 
X-CRM114-Status: UNSURE (   7.42  )
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

Convert the Data Path (DP) profile parameter macros to static inline helper
function without changing any functional behavior.

Aaradhana Sahu (7):
  wifi: ath12k: move dp_profile_params to dp.h
  wifi: ath12k: convert DP_TX_COMP_RING_SIZE to inline helper
  wifi: ath12k: convert DP_RXDMA_MONITOR_BUF_RING_SIZE to inline helper
  wifi: ath12k: convert DP_RXDMA_MONITOR_DST_RING_SIZE to inline helper
  wifi: ath12k: convert ATH12K_NUM_POOL_TX_DESC to inline helper
  wifi: ath12k: convert ATH12K_RX_DESC_COUNT to inline helper
  wifi: ath12k: convert DP_RX_RELEASE_RING_SIZE to inline helper

 drivers/net/wireless/ath/ath12k/core.h        |   9 --
 drivers/net/wireless/ath/ath12k/dp.c          |  81 ++++++++------
 drivers/net/wireless/ath/ath12k/dp.h          | 100 ++++++++++++------
 drivers/net/wireless/ath/ath12k/dp_rx.c       |  12 ++-
 drivers/net/wireless/ath/ath12k/mac.c         |   5 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c |  12 ++-
 6 files changed, 140 insertions(+), 79 deletions(-)


base-commit: e07447e654476262558bee570f4cf456e2b32565
-- 
2.34.1


