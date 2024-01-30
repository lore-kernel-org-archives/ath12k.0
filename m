Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9EBC47DA9
	for <ath12k@archiver.kernel.org>; Tue, 30 Jan 2024 01:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UitLKtE2RRds5hJpLbCTaQ/DQHIyeASdh/rzRuV196Q=; b=rnNz61mD+bd6v10lE84r0KcV6/
	h7JvkEso/NxJAYQFARurJKhuMqEnu5PHMRQfg6KMxfkN9dx4rYnaTUy0ggCec22Nx5YLf+aVXkz3B
	Zozzs0NPFcIxr03X46hy6eLw19r/WKTcV67+Enpp5jaBICDA5h3eTHalRvg7f6HZengD+cCB/nPqd
	t4Yw3EWzsbeOuyRbWgqrJI4b12XUQKQ4dTJEWBerfULcle2D6DFL/Nx6+lU2nCJiQDEsi9WW1Vfzu
	+yA0Po16A0aBEVCCTfz7YMhz7QEt70VVOd+OImlCqdEGlEJQKOlvqYMOHYFFv2gNdxi1oesn996r5
	vjypKPJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUd6o-0000000EqWE-2iFB
	for ath12k@archiver.kernel.org;
	Tue, 30 Jan 2024 01:40:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUd6l-0000000EqUc-0jsI
	for ath12k@lists.infradead.org;
	Tue, 30 Jan 2024 01:40:16 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40U0Te6r017714;
	Tue, 30 Jan 2024 01:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=UitLKtE2RRds5hJpLbCTaQ/DQHIyeASdh/rzRuV196Q=; b=dK
	2QNPFjtGss70vepqP799x4Y3zABr/J7BJB6C9bAUKxkqyDLSNmngd1TFbgT2fBL1
	oRkJ3Gu5cM2USOdPwc/9XoW3aJ886oSYLyh8e6fHRodGyLm03xUImqRv+bwb68kB
	Wgd8SrTbfDg+bOLma0drV6ghThEczbetmx+IxNJ1ZdTHyPSJzOT/wu/Nc5zfFPBD
	PBRGTMsm+zp3c3/fWxNhhNlTDGMu1ubW092gXo+gV8z9XTpP6C0JQGkliTXzyfbD
	i+f6DZcFQuKNw5Ft6p3fEj0ao5nuWhuHf9yg2yPvqpw8AQg3rohia+goXj2Ibgc4
	iipQGkBGAptMc8TjCmLA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vx23kautj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 01:40:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40U1eD84018282
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 01:40:13 GMT
Received: from [10.110.47.232] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 29 Jan
 2024 17:40:12 -0800
Message-ID: <585ebc14-b3ef-4c09-99a4-b8b855add274@quicinc.com>
Date: Mon, 29 Jan 2024 17:40:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/11] wifi: ath12k: fix incorrect logic of calculating
 vdev_stats_id
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240129101453.368494-1-quic_kangyang@quicinc.com>
 <20240129101453.368494-9-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240129101453.368494-9-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zChsi6YqFvG5ktdY8McyfBSrM2fZcAig
X-Proofpoint-GUID: zChsi6YqFvG5ktdY8McyfBSrM2fZcAig
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_15,2024-01-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxlogscore=920
 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401300009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_174015_317979_259C72BF 
X-CRM114-Status: UNSURE (   9.77  )
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

On 1/29/2024 2:14 AM, Kang Yang wrote:
> During calculate vdev_stats_id, will compare vdev_stats_id with
> ATH12K_INVAL_VDEV_STATS_ID by '<='. If vdev_stats_id is relatively
> small, then assign ATH12K_INVAL_VDEV_STATS_ID to vdev_stats_id.
> 
> This logic is incorrect. Firstly, should use '>=' instead of '<=' to
> check if this u8 variable exceeds the max valid range.
> 
> Secondly, should use the maximum value as comparison value.
> 
> Correct comparison symbols and use the maximum value
> ATH12K_MAX_VDEV_STATS_ID for comparison.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


