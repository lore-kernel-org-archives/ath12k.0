Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3F3C4345F
	for <ath12k@archiver.kernel.org>; Mon, 22 Apr 2024 17:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ma+VlJhGdG5yNDRDs+hfr7Rqsb3rzYLQzurgicoqwtQ=; b=dNqicilg7OEPYG8NkgwoO4bInp
	8NgkB92EtvqN+0CQtPTaQJpOBmTTLUd7bpgSNTCXpUxN6XcOR6JzrucqjCyZS0th+qvHkIYcGZc7S
	MaBw5RRIOemUKRgz2d1Wdx94tI3FX4uHmbPElt9T0EykmxGtOMSy0Saz4/+6NhZna9La9RWTXzUmp
	hoYv24hneEfTNUZkN1u3ZBRkpwc8V1PivO2Gh5ADNmsIZJ8rzlVMQNOhrKdYkUOpBg4RV/xsDInA0
	iOzV+I4Fe/XNpMa9hBAXMo9xl94JhI1Aw9ZzgHOApIfXH2toPJ6Y7id/cWNMWvlKgp/cxf8L4o0iZ
	YoCb9zCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryxpo-0000000EWNt-21Kx
	for ath12k@archiver.kernel.org;
	Mon, 22 Apr 2024 17:52:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryxpk-0000000EWJx-37Nn
	for ath12k@lists.infradead.org;
	Mon, 22 Apr 2024 17:52:06 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43MDOKtN003901;
	Mon, 22 Apr 2024 17:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Ma+VlJhGdG5yNDRDs+hfr7Rqsb3rzYLQzurgicoqwtQ=; b=Qc
	8cEtTxHZ6mO4yZEV6MqXrv/R/Qaadn2PDtBV3scHT4ZCKtkd68e4m7/NRs5TRRod
	JbSoKFdqTi1fiuNm2oN6HMbdxIOZXR0aP/sFll856LNT1MiJYxiAhomKFraDQKFm
	hzl6E6RDoTYBmFEFuPI8IrWx3hXrUJHLr+YxZlJl84Z1I+aZ2SZyY5N+T8WfgQlJ
	15OcObJj3FjLDQNVEgl1wpU5q2NUYsrKn6x2sPpKJyuPxhkcR6JZQzA6z83Wb4SR
	mUBcaS4Od3aqj2i6bkSRj5D/MY7WzyClaPoSs0hbKHNl4dYJhdnkTXdFUzTPzoFz
	Z+Dg1vDJEf7VVXB4cDzw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xnn82s94g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 17:51:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43MHptFK024416
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 17:51:55 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Apr
 2024 10:51:54 -0700
Message-ID: <2295c7aa-5de6-4a21-941f-e9439dc6601c@quicinc.com>
Date: Mon, 22 Apr 2024 10:51:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] wifi: ath12k: decrease MHI channel buffer length to
 8KB
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240412060620.27519-1-quic_bqiang@quicinc.com>
 <20240412060620.27519-6-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240412060620.27519-6-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oOMe361UtOczZMF-C9i7kGDgWHUBrSYL
X-Proofpoint-ORIG-GUID: oOMe361UtOczZMF-C9i7kGDgWHUBrSYL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_09,2024-04-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=731
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404220075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_105204_835886_B8BB2069 
X-CRM114-Status: GOOD (  12.31  )
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

On 4/11/2024 11:06 PM, Baochen Qiang wrote:
> Currently buf_len field of ath12k_mhi_config_wcn7850 is assigned
> with 0, making MHI use a default size, 64KB, to allocate channel
> buffers. This is likely to fail in some scenarios where system
> memory is highly fragmented and memory compaction or reclaim is
> not allowed.
> 
> For now we haven't get any failure report on this in ath12k, but
> there indeed is one such case in ath11k [1].
> 
> Actually those buffers are used only by QMI target -> host communication.
> And for WCN7850, the largest packet size for that is less than 6KB. So
> change buf_len field to 8KB, which results in order 1 allocation if page
> size is 4KB. In this way, we can at least save some memory, and as well
> as decrease the possibility of allocation failure in those scenarios.
> 
> [1] https://lore.kernel.org/ath11k/96481a45-3547-4d23-ad34-3a8f1d90c1cd@suse.cz/
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


