Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA28CE7A95
	for <ath12k@archiver.kernel.org>; Thu,  5 Sep 2024 19:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wp4cCiYGjwBIyPW4kPnTrnuJaGBB9tVXTQYjvo0Kc1M=; b=1HHonKutVDZr+aMqEM3DmX9DKh
	BkJ7IFm37iToK1cIP9dQ4a4GfouG+7lHQ2uyFHKYqru2Ibmh4xR3Y6RC3ccjJj6Q+S+awhdhzFzyV
	n0Ev0SRIW/wunYIh1pgk8FFBr/52urY7zlAIVAYjm2EKCgqD0FEKodA4guucel0A9RLAcJEXD2OuF
	PgWzmNUXEXGEpscwJXaPPo0yZ4VleLHKTi+1W8xta85uEq9lx2eDTAHyROGSBm8WNrrVbHCwl/X8u
	G+jN+z4RsntR9mCzvHfutZOg13MfGb38EN5risQYX05vHD1nC+/7RnuuQ0MDfmXFZEMztkJvIgwIh
	K+UFlaCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smIdY-00000009g0m-39Eo
	for ath12k@archiver.kernel.org;
	Thu, 05 Sep 2024 19:59:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smIdU-00000009fzn-3tAG
	for ath12k@lists.infradead.org;
	Thu, 05 Sep 2024 19:59:22 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485IQHO8028679;
	Thu, 5 Sep 2024 19:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wp4cCiYGjwBIyPW4kPnTrnuJaGBB9tVXTQYjvo0Kc1M=; b=XK/y5liFZH6BEAW3
	0Av0/Fj/porflVUHWy4QfOneZu4P2HM/6ft12z7ZAN2mKbQhJO4ueDqsMGW6DZL4
	EFAS/Z07vB4XMuP30IyKrXfrN1cWi7sk8LahWWd+lLiWnhpRDbqQDFnVZ19Iy3hw
	9sC5zpoDn7OzrNO+/E0WLMCqzmPL9RdZzbVnpSF9Onegqe7bGrdXkCavUfR6kXhA
	ByVpNZ21XddEw+YNnAD4aViYS45Nw8KECfu46+yvgh8SBkLO+9kLcbnYi2/yaI7G
	7+Yyv66oumeSdGZZkbDhpY7z/ASWjTp1ugwTg4oAKrU/4j7XqD2fga7gJ/F1BuhA
	ZqRdQg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhwu05wg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 19:59:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 485JxJUC017747
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 19:59:19 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Sep 2024
 12:59:18 -0700
Message-ID: <38c4c11d-704d-49fd-93b7-9d011a156f0b@quicinc.com>
Date: Thu, 5 Sep 2024 12:59:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Skip Rx TID cleanup for self peer
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240905042851.2282306-1-quic_rgnanase@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240905042851.2282306-1-quic_rgnanase@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -PVmZx4qq5zknAKFZlGEheGCf4xKhIuN
X-Proofpoint-GUID: -PVmZx4qq5zknAKFZlGEheGCf4xKhIuN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_15,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 mlxlogscore=702 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409050149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_125921_006360_EF1EB8CA 
X-CRM114-Status: UNSURE (   9.72  )
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

On 9/4/2024 9:28 PM, Ramya Gnanasekar wrote:
> During peer create, dp setup for the peer is done where Rx TID is
> updated for all the TIDs. Peer object for self peer will not go through
> dp setup.
> 
> When core halts, dp cleanup is done for all the peers. While cleanup,
> rx_tid::ab is accessed which causes below stack trace for self peer.
> 
> WARNING: CPU: 6 PID: 12297 at drivers/net/wireless/ath/ath12k/dp_rx.c:851
> Call Trace:
> __warn+0x7b/0x1a0
> ath12k_dp_rx_frags_cleanup+0xd2/0xe0 [ath12k]
> report_bug+0x10b/0x200
> handle_bug+0x3f/0x70
> exc_invalid_op+0x13/0x60
> asm_exc_invalid_op+0x16/0x20
> ath12k_dp_rx_frags_cleanup+0xd2/0xe0 [ath12k]
> ath12k_dp_rx_frags_cleanup+0xca/0xe0 [ath12k]
> ath12k_dp_rx_peer_tid_cleanup+0x39/0xa0 [ath12k]
> ath12k_mac_peer_cleanup_all+0x61/0x100 [ath12k]
> ath12k_core_halt+0x3b/0x100 [ath12k]
> ath12k_core_reset+0x494/0x4c0 [ath12k]
> 
> sta object in peer will be updated when remote peer is created. Hence
> use peer::sta to detect the self peer and skip the cleanup.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> 

remove this blank line. Kalle can fix this in the pending branch

> Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


