Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FD3C35FFC
	for <ath12k@archiver.kernel.org>; Tue, 25 Mar 2025 07:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQvZXJf0BsFvXFeSNrJqUiW+QuoSs0I3sQCkJQdyJkw=; b=xTj/DIPx0RHcbjr4gJORuQb7xT
	8A/vDpM62Dnm4OLjFT2y0rmM7CWO7PwZUvMjzzM2iVb7YKI09FTKru+2/ZbSGhTUdB0tbRyTczjMC
	lU2bzycv/XiT1IGwWiNXmfuJPACVkco6hqu4u1Unw9uxRvBR50qYHDleouWosQ/w61iejsHSZxNXr
	YvbeVDOHbJ90DhGoeAtvwgAjPGQFPmjt7qIZP8oRF94JyoZylmAp2RF2DvFIXJBSbdP9BrCm46rBd
	t80+/ROVJmUJH4g/iMqx93hjqnAXzpGcF+3PuiuG5A7WyyaeSsVc8TO+/IoRuUK1IRCsbZ+Uy+zhC
	owoFooZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twyaZ-0000000547R-07re
	for ath12k@archiver.kernel.org;
	Tue, 25 Mar 2025 07:20:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twyLT-000000052Ox-2m56
	for ath12k@lists.infradead.org;
	Tue, 25 Mar 2025 07:05:08 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52P5vWVV024719
	for <ath12k@lists.infradead.org>; Tue, 25 Mar 2025 07:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dQvZXJf0BsFvXFeSNrJqUiW+QuoSs0I3sQCkJQdyJkw=; b=oZVZRHjruEnml2g7
	0zXrTMscAl0bU6SzBuDJ8tPQzewOaKg9nyWqZZbyrquGflCIn9tww5RD5LCKIZtg
	7Y2fcVNnkZt8Yitd024YUO3blerVjubRbpmZGk/20AoykgYsIf2ZZV6QTvCy7IHe
	cM4JvDl8+NzeqRW1z9gbCEP6UvMdn6z91hTFM2ZnI99D/WWN7QNFgXdeczXKkIhb
	UBeDaj+JuaGUBOhFCALERO3sr+pCC2eDGgO+iQXPIBGZpy61+eQTv6ag8RHlF9x1
	uCqstN58TpUmv4QyEq4GtQJgkOtpRxt+Vga7UDfSqFlC/FIWDx2RrvEgqmXG21K3
	KgsQcA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45k7qjacut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 25 Mar 2025 07:05:06 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52P755Y0003836
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 25 Mar 2025 07:05:05 GMT
Received: from [10.216.44.33] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Mar
 2025 00:05:04 -0700
Message-ID: <b1e44988-a80c-4e60-a093-434e0834aa1a@quicinc.com>
Date: Tue, 25 Mar 2025 12:34:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: extend dma mask to 36 bits
To: <ath12k@lists.infradead.org>
References: <20250321162331.19507-1-johan+linaro@kernel.org>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <20250321162331.19507-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ng3h81iFGsgkdEKK8MZm2Ard9QG5Usfg
X-Proofpoint-GUID: ng3h81iFGsgkdEKK8MZm2Ard9QG5Usfg
X-Authority-Analysis: v=2.4 cv=feOty1QF c=1 sm=1 tr=0 ts=67e255a2 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=K3_Uot4QyE093sgO9NIA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_03,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 mlxlogscore=690 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503250047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_000507_727861_C875A341 
X-CRM114-Status: GOOD (  12.47  )
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

On 3/21/2025 9:53 PM, Johan Hovold wrote:
> Extend the DMA mask to 36 bits to avoid using bounce buffers on machines
> without an iommu (under OS control) similar to what was done for ath11k
> in commit dbd73acb22d8 ("wifi: ath11k: enable 36 bit mask for stream
> DMA").
> 
> This specifically avoids using bounce buffers on Qualcomm Snapdragon X
> Elite machines like the Lenovo ThinkPad T14s when running at EL1.
> 
> Note that the mask could possibly be extended further but unresolved DMA
> issues with 64 GiB X Elite machines currently prevents that from being
> tested.
> 
> Also note that the driver is limited to 32 bits for coherent
> allocations and that there is no need to check for errors when setting
> masks larger than 32 bits.
> 
> Tested-on: WCN7850 hw2.0 WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Tested-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

Validated iperf traffic on QCN9274 with FW version -
WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

