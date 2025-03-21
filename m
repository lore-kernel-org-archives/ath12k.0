Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCE5C35FF3
	for <ath12k@archiver.kernel.org>; Fri, 21 Mar 2025 08:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5PcUnaVib5AXnTXDGkrV0vtcrYKQO7n4H2dxYoup3qw=; b=kZ1yf/b2O1tDHtDRFsLrNEWVaR
	KEExbxX8MVgoaV9HWCPB9NIZtZPbKY5bwC50qmbw/t1ZjE1Ws8K91YcB4aeO9oligxtSPg05JQl53
	lEgW+mg02YuEw8CQMIUU+j94iWSHPgTYcqIMg4hFcsMkoCnsRDAEhLLMOMF+pXzFPp7Ec8ljZzVh+
	d97FYwPQk8DD17JDUo287hvoBUe/IydDtqPlOAgLSQNr9MIYQQ7tCsTFYHGbg0wm4TXxtXEUjTN72
	n41+i0850SA1EOYKElLVGVWVWo5VIuL5H2HAV/5ZIIOwyDZZE8wF/qS6PheApKKRIf4cliyE5MUOK
	ZpMbIGYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvY0h-0000000EGlN-0Xyd
	for ath12k@archiver.kernel.org;
	Fri, 21 Mar 2025 08:45:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvY0e-0000000EGkv-2Hwv
	for ath12k@lists.infradead.org;
	Fri, 21 Mar 2025 08:45:46 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52L7w78N006557;
	Fri, 21 Mar 2025 08:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5PcUnaVib5AXnTXDGkrV0v
	tcrYKQO7n4H2dxYoup3qw=; b=jdec6cjYkuVt3Ehp950/vFgAUXaOZVsjwx+MhI
	+I5fgHG7z4wgftWY31ctFaL3N1iTFdQkw8V40BRiJbUW+icP+vYdpo5KN7UZp7d+
	JFv2siewK+DjQchzr4f98ijFGt1Wd8xJ89Pv/Dstdm9UnkuIe0Fp6awyR4dGb3yb
	TqRQzZkY0mFFMEWKgthT6YvvCE5xBL+qhhAWKdcuSVexLgyczHBZAMjnQgF7FT1h
	3zKAplumf7+GU715fX7bjWeZeszt+XY3whGmRlOZHelpcgto4mfJiWOmSS2wp9pA
	hpaY4i1Comphx76yqql8U+6Qn17ybUZXKhh8ZoCfJ5bFMBOQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45etmc4frt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 08:45:42 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52L8jfcS013457
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 08:45:41 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 21 Mar 2025 01:45:39 -0700
From: kangyang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH ath-next v12 0/4] wifi: ath12k: add 11d scan offload support and handle country code for WCN7850
Date: Fri, 21 Mar 2025 16:45:14 +0800
Message-ID: <20250321084518.1619-1-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nCUS5Fnvkt_DculOXN9UtF4N5c9xFrTk
X-Proofpoint-GUID: nCUS5Fnvkt_DculOXN9UtF4N5c9xFrTk
X-Authority-Analysis: v=2.4 cv=aMLwqa9m c=1 sm=1 tr=0 ts=67dd2736 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=IvkglCj0MCVAe19RatQA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_03,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_014544_727224_3B5285CD 
X-CRM114-Status: UNSURE (   9.97  )
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

From: Kang Yang <quic_kangyang@quicinc.com>

This patch-set mainly does four things:
1. Add handler to send WMI_SET_CURRENT_COUNTRY_CMDID to firmware.
2. Use WMI_SET_CURRENT_COUNTRY_CMDID to set country code for WCN7850.
3. Implement 11d scan offload, and update new channel list to firmware
when 11d scan finished.
4. Store country code, and update it to firmware after device recovery.

With this patch-set, WCN7850 can do 11d offload scan and update country
code to firmware successfully.

Note: This patch-set is an old patch-set in public review written by
Wen Gong. Just resend it for him.
Link: https://patchwork.kernel.org/project/linux-wireless/cover/20230914090746.23560-1-quic_wgong@quicinc.com/

v12:
    1. add reviewed-by tag.
    2. rebase on tag: ath-202503172347.
v11:
    1. swap the order of patch #2 and #3.
    2. rebase on tag:ath/main(ath-202502181756).
v10: rebase on tag: ath/main(ath-202502111625).
v9: update copy right in patch #1, #2, #3.
v8: rebase on tag: ath/main(ath-202501172342).
v7:
    1. rebase on tag: ath/main(ath-202412191756).
    2. rewrite commit message for patch#2.
v6: rebase on tag: ath/main(ath-202410161539).
v5: rebase on tag: ath/main(ath-202410111606).
v4: rebase on tag: ath-202410072115.
v3:
    1. use wiphy::mtx lock instead of adding a new lock(patch#2).
    2. rename struct according to wmi naming convention(patch#1, #2).
    3. update copyright in reg.h
    4. modifiy patch#3, #4 due to struct name change.
v2: change per Jeff.
    1. change alpha2 length from 3 to 2.
    2. change wmi_11d_new_cc_ev to wmi_11d_new_cc_event.

Wen Gong (4):
  wifi: ath12k: add configure country code for WCN7850
  wifi: ath12k: use correct WMI command to set country code for WCN7850
  wifi: ath12k: add 11d scan offload support
  wifi: ath12k: store and send country code to firmware after recovery

 drivers/net/wireless/ath/ath12k/core.c |  34 ++++-
 drivers/net/wireless/ath/ath12k/core.h |  17 +++
 drivers/net/wireless/ath/ath12k/hw.c   |   8 +-
 drivers/net/wireless/ath/ath12k/hw.h   |   3 +-
 drivers/net/wireless/ath/ath12k/mac.c  | 167 ++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/mac.h  |   7 ++
 drivers/net/wireless/ath/ath12k/reg.c  |  72 ++++++++---
 drivers/net/wireless/ath/ath12k/reg.h  |   2 +-
 drivers/net/wireless/ath/ath12k/wmi.c  | 158 ++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/wmi.h  |  38 ++++++
 10 files changed, 482 insertions(+), 24 deletions(-)


base-commit: b6f473c96421b8b451a8df8ccb620bcd71d4b3f4
-- 
2.34.1


