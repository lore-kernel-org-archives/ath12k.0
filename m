Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9576C3ABCB
	for <ath12k@archiver.kernel.org>; Mon, 16 Sep 2024 22:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4dYVWhqWiG/i+tE3q0W5k7H0CKTLSs3e0gSYnWXTt7c=; b=M2FXu6A2HRsJQ68Aqm+HK1Zfbz
	79kGRpNxzj4+MWF1vY2Psiy3fyLmh8SulvhiamjCZzhda3+bu1yi+dSJpip8tWL78u+tJEx9TDTmH
	e+U0sY/OmbvniCK21fJc/HK1q43No+YLSeF4X3NVSGs2WA2lC1bLzb0BEc7UtDCZMVeBLK3loTNXT
	G1yEeE/3mGKvaR0aBxkGvLMWGAXmcDJJtr97FPxuMx0zACp5lOy5jZxasyzNrIWTFETiJ/BEF3EeP
	SPci4vqMt55dk4PXjB2hpLS09D2ESl+trciAhPaqKfyqP35A5n9/qw1lwUp7Ae9dYEnVRmeHLIhQ2
	SesbZxwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqJyO-00000004yfV-1XKU
	for ath12k@archiver.kernel.org;
	Mon, 16 Sep 2024 22:13:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqJyL-00000004yf8-3cz2
	for ath12k@lists.infradead.org;
	Mon, 16 Sep 2024 22:13:31 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48GCb4It023049;
	Mon, 16 Sep 2024 22:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4dYVWhqWiG/i+tE3q0W5k7H0CKTLSs3e0gSYnWXTt7c=; b=aEiIIJp8aaJbUEYL
	vWtotknKGNJbdtRuZKX8OPTksPy7knWHztKJTpsa2NflxTiFuVR+574U8A08pRWb
	/mDUaUuxcNEnyUMoz7rsPBLTgf4jFcSRmfil3nL8zfkvBqHKbL1c4jfZi+g/oc3M
	og7dgkfkY+KCXtU1mxXXqq3GW2wvWDqBGYEbFf0j8U9fp3bavwS2AiPqF8co+yf2
	8SZuxPXF3wUkNZuQFspTnUYSaiy5SXSkeRGBYoA2OP5bsR2iJhX2h+MdiOwCuK81
	jKp8Iruli4rqDzib8fESVbArYO9wHgSZI2450cS0sCAC/qNpw47TOu+HlFtb4f/s
	dDgvsg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4jdnbfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 22:13:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48GMDS1A019823
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 22:13:28 GMT
Received: from [10.111.182.118] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Sep
 2024 15:13:27 -0700
Message-ID: <a2f03c0e-6527-42ce-9321-4e8891fc37bf@quicinc.com>
Date: Mon, 16 Sep 2024 15:13:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] wifi: ath12k: Support Self-Generated Transmit stats
To: Roopni Devanathan <quic_rdevanat@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Dinesh Karthikeyan
	<quic_dinek@quicinc.com>
References: <20240913082949.573482-1-quic_rdevanat@quicinc.com>
 <20240913082949.573482-2-quic_rdevanat@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240913082949.573482-2-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8TR7heaDNEK1O7duTlwFBYu5_2CE39YN
X-Proofpoint-GUID: 8TR7heaDNEK1O7duTlwFBYu5_2CE39YN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 clxscore=1015 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409160151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_151329_948678_61130840 
X-CRM114-Status: UNSURE (   7.16  )
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

On 9/13/2024 1:29 AM, Roopni Devanathan wrote:
> From: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> 
> Add support to request transmit selfgen stats from firmware through HTT stats
> type 12. These stats give information about single user NDP packets, multi-
> user MIMO NDP packets, OFDMA triggers, etc.
> 
> Sample output:
> -------------
> echo 12 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> HTT_TX_SELFGEN_CMN_STATS_TLV:
> mac_id = 0
> su_bar = 0
> rts = 0
> .....
> 
> HTT_TX_SELFGEN_AC_STATS_TLV:
> ac_su_ndpa_tried = 0
> ac_su_ndp_tried = 0
> ac_mu_mimo_ndpa_tried = 0
> .....
> 
> HTT_TX_SELFGEN_AX_STATS_TLV:
> ax_su_ndpa_tried = 0
> ax_su_ndp_tried = 0
> ax_mu_mimo_ndpa_tried = 0
> .....
> 
> HTT_TX_SELFGEN_BE_STATS_TLV:
> be_su_ndpa_queued = 0
> be_su_ndpa_tried = 0
> be_su_ndp_queued = 0
> .....
> 
> HTT_TX_SELFGEN_AC_ERR_STATS_TLV:
> ac_su_ndp_err = 0
> ac_su_ndpa_err = 0
> ac_mu_mimo_ndpa_err = 0
> .....
> 
> HTT_TX_SELFGEN_AX_ERR_STATS_TLV:
> ax_su_ndp_err = 0
> ax_su_ndpa_err = 0
> ax_mu_mimo_ndpa_err = 0
> .....
> 
> HTT_TX_SELFGEN_BE_ERR_STATS_TLV:
> be_su_ndp_err = 0
> be_su_ndp_flushed = 0
> be_su_ndpa_err = 0
> .....
> 
> HTT_TX_SELFGEN_AC_SCHED_STATUS_STATS_TLV:
> ac_su_ndpa_sch_status =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0
> ac_su_ndp_sch_status =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0
> ac_mu_mimo_ndpa_sch_status =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0
> .....
> 
> HTT_TX_SELFGEN_AX_SCHED_STATUS_STATS_TLV:
> ax_su_ndpa_sch_status =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0
> ax_su_ndp_sch_status =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0
> ax_mu_mimo_ndpa_sch_status =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0
> .....
> 
> HTT_TX_SELFGEN_BE_SCHED_STATUS_STATS_TLV:
> be_su_ndpa_sch_status =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0
> be_su_ndp_sch_status =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0
> be_mu_mimo_ndpa_sch_status =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0
> .....
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


