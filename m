Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B733CD128A
	for <ath12k@archiver.kernel.org>; Wed,  3 Apr 2024 18:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u1gg7BtXSbUOjl/vSQpIU9j111eSM4QBolwwCkYmX/8=; b=ZX4L1vccrEwc+CTx9F0unQ82NK
	oNywwEH8sx0lcpnsI8A+QGx3WLBEwGiKGmcL2ZeGc9TabJ38BniyQl7LZtw+ZPcgKSHLjmc31OxRj
	NL6YmoGgkCANPQymOFXT4acO9fNC85ly59/Mj/DPppINE+4TiyI5gRoDzBT9XCDY/Yel9852iXThV
	nXhDutrOj4NoK3wc0wK+FcbwRrCGPT4UpghiBSyYQNFUtUZ0T90gfdeqLordB6qpzcmsq058eWM7t
	OtQpAjx6g0Z2F09IF5lg7IrNSa5n/7MKxx3Xao3Gq9ef7UvbLFij1RH65BXP1L0FSN4g0wId5upD9
	RrPF5F8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs5AX-0000000HLXW-0XoP
	for ath12k@archiver.kernel.org;
	Wed, 03 Apr 2024 18:17:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs5AT-0000000HLUS-1FyP
	for ath12k@lists.infradead.org;
	Wed, 03 Apr 2024 18:17:03 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 433Hwpno027734;
	Wed, 3 Apr 2024 18:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=u1gg7BtXSbUOjl/vSQpIU9j111eSM4QBolwwCkYmX/8=; b=Ih
	kENPo+YK040rYMfxE0jOFp11SREmfpHvK3b25GGvIexC+TH+bRvsGdPDPZSGvNWo
	q7o0V/azbZbx6WJKsw1kfk5qJFNTcuqeiU7xTWMf24N5c3ZJVXQmLfe72BgM5yOm
	Ihwr8MHuzG8Q/Y9Rg0ZuX/vMMNrvkbBajY34g0uUGfP6weAcf/RwdwT7wq1/g+Nq
	jNhK60CugDgAegvnYOCybmuhs6b/fBRSUeVFHs3nEZaLp9PPyO7kfI4zNjquMywk
	RNCnc88kbdeveYm5t1ADjO+rtsIVYToNRs1J+y/HV9hTs5FUx7H69cEVHQMG6LSR
	YE86IaMSrCwoq1RYNt9w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x8xnxt3a7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Apr 2024 18:16:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 433IGuLK023051
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Apr 2024 18:16:56 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 3 Apr 2024
 11:16:56 -0700
Message-ID: <5eaef6a2-7bf9-490b-8edb-d9bd8ce5b5af@quicinc.com>
Date: Wed, 3 Apr 2024 11:16:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] wifi: ath12k: advertise driver capabilities for
 MBSSID and EMA
Content-Language: en-US
To: Aloka Dixit <quic_alokad@quicinc.com>, <ath12k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <20240402210538.7308-1-quic_alokad@quicinc.com>
 <20240402210538.7308-2-quic_alokad@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240402210538.7308-2-quic_alokad@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TrbwhIpfFtKHmVL13qoeGXkjfduNzNKT
X-Proofpoint-GUID: TrbwhIpfFtKHmVL13qoeGXkjfduNzNKT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-03_19,2024-04-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 mlxlogscore=956 priorityscore=1501 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404030122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_111701_573501_82FADE0F 
X-CRM114-Status: UNSURE (   9.57  )
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

On 4/2/2024 2:05 PM, Aloka Dixit wrote:
> Advertise the driver support for multiple BSSID (MBSSID) and
> enhanced multi-BSSID advertisements (EMA) by setting extended
> capabilities.
> 
> Configure mbssid_max_interfaces and ema_max_profile_periodicity
> fields in structure wiphy which are used to advertise maximum number
> of interfaces and profile periodicity supported by the driver.
> 
> Add new WMI fields to configure maximum vdev count supported for
> MBSSID and profile periodicity in case of EMA.
> 
> Set WMI_RSRC_CFG_FLAGS2_CALC_NEXT_DTIM_COUNT_SET flag to allow
> firmware to track and update the DTIM counts for each nontransmitted
> profile.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>




