Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA787C4345F
	for <ath12k@archiver.kernel.org>; Fri, 26 Apr 2024 14:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bvOnzxvx0r7m8j8MJGOhNdJ/MtnT50SXgfeDgZXCLbM=; b=dSJobCYwuve0U0yqa5TtudpKb4
	Jk1t8rzuX4Ji/2SDlsmFrmvWlvs6GLRzC+1t09O6zkbBaNP0u2t+ELxTptKLQJ8ErPbswbTU2SiRR
	9M2B8vHrpnSBpK1xln8mAXIsxmrZv+fmBPVYWb6P5nIUy4bgsb79zLEn659He4hAq6cOSp1qEoPa7
	ywNuKwDBYhouHOTEYoFLd3UeCkkoyW/OvS0LAum5bkcFZH8LbhORNJjAVRV533acOx0lqprqV8t1m
	Dmr+4nxgfCQdS3hRchB8c2fImeqIv9S/G7uNVCidTGDXRnplGmJTKbVAmBugz5dheEzhtqsZ+MFnV
	WVstRzxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0MrI-0000000CtiD-2Heu
	for ath12k@archiver.kernel.org;
	Fri, 26 Apr 2024 14:47:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0MrF-0000000Cth3-3zXs
	for ath12k@lists.infradead.org;
	Fri, 26 Apr 2024 14:47:27 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43QDDCSW016595;
	Fri, 26 Apr 2024 14:47:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=bvOnzxvx0r7m8j8MJGOhNdJ/MtnT50SXgfeDgZXCLbM=; b=UN
	3zRWOiKLxK7biGIqJ2rTbtPO4IowwWd399oGam4jtWAiJqlKmBWGyuqvqSkT6Ehk
	27VKU1e8Yb/DRlrr9PLHqdyHhSF7QwmK2+o+hO2Y+7X65bu0wnFnaxypF1tc77lt
	HYga1DmmRXnHR3jvXRvIN/6cyRCgIvWHPWJLlYOfk8sQ/cF3s8YTLYT+tqH4Aty0
	jyrjoJ3egoEAVtrXeIFZiRDomZx8skE7hSWr6Yw6fAsfGWe5dOIAZrUFK9KrFND0
	LhZ8RHAR/swK5e2u0VKbwj27kR56tDkqzDLbqBUNBnP8aiZGe8Wgs2xMvZISKXN7
	4JqB6MN0Pj2K9VWjzR2w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xr35et53h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 14:47:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43QElMbW004278
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 14:47:22 GMT
Received: from [10.110.19.58] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 26 Apr
 2024 07:47:22 -0700
Message-ID: <b6935c08-5a7e-4c88-93a8-522f1226a274@quicinc.com>
Date: Fri, 26 Apr 2024 07:47:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: fix flush failure in recovery scenarios
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240426015434.94840-1-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240426015434.94840-1-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: f8jfrVYj6xjV8EYi1wU3Kxuh_O2dWNfA
X-Proofpoint-ORIG-GUID: f8jfrVYj6xjV8EYi1wU3Kxuh_O2dWNfA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_12,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404260099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_074726_141915_23C70F78 
X-CRM114-Status: GOOD (  14.80  )
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

On 4/25/2024 6:54 PM, Baochen Qiang wrote:
> Commit eaf9f17b861b ("wifi: ath12k: relocate ath12k_dp_pdev_pre_alloc()
> call") moves ath12k_dp_pdev_pre_alloc() from ath12k_core_start() to
> ath12k_mac_allocate(), resulting in ath12k_mac_flush() failure in
> recovery scenarios:
> 
> [ 6849.684104] ath12k_pci 0000:04:00.0: pdev 0 successfully recovered
> [ 6854.907320] ath12k_pci 0000:04:00.0: failed to flush transmit queue 0
> [ 6860.027353] ath12k_pci 0000:04:00.0: failed to flush transmit queue 0
> [ 6865.143385] ath12k_pci 0000:04:00.0: failed to flush transmit queue 0
> 
> This is because, with ath12k_dp_pdev_pre_alloc() moved to ath12k_mac_allocate(),
> dp->num_tx_pending is not reset due to ATH12K_FLAG_REGISTERED set in
> recovery scenarios.
> 
> So a possible fix would be to reset that counter at some proper point,
> just like the old design. But considering that the counter tracks number
> of packets pending to be freed or returned to mac80211, forcefully reset
> it might make it hard to expose some real issues. For example if somehow
> ath12k fails to free/return some TX packets, we don't know that because
> no warnings any more.
> 
> That is to say we should not reset that counter during recovery (which is
> already done due to above commit), instead should decrease it each time
> a packet is freed/returned. Currently almost each related function has
> this logic implemented, except ath12k_dp_cc_cleanup(). So add the same
> there to fix this issue.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


