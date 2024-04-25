Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B00C4345F
	for <ath12k@archiver.kernel.org>; Thu, 25 Apr 2024 17:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1J9xCEHnJqEEI/CVe9T1ZVmK0X5pRO4R286AMXokBk=; b=z0Ny8a1I65lM17q/HprIU7MrNn
	eJFmBzlT/BV84H54qsWkxM4oLMgrlRaDq32889Pt5ONGXtyd2/+U27k7okM6dHG2hDJ0NtD6y/uxu
	Amq1ooZoGltxx/MGlZHaXmIMTE6X82IsXX1CQbNGKe+duVfwQ+Fyn9fAO/xSBmxPcS4uyxIDek79Y
	cUAr45K35zQ8U60PCRYH+3L6X+QTyfYzSu+5upIK1aHScKvTQI8akpBPXOvgTzfWI+2AICXWqzCCZ
	48BnZvP4exvR9JZdFLOpkE+q7Kupf21KcG/oBioYv/F8c1nwA1CjPLs2Y24qcLMZXILjL8acJmL2p
	FscMB//A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s02x7-00000009bHC-01OO
	for ath12k@archiver.kernel.org;
	Thu, 25 Apr 2024 17:32:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s02x3-00000009bGD-3zuq
	for ath12k@lists.infradead.org;
	Thu, 25 Apr 2024 17:32:07 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43PAxPpL020059;
	Thu, 25 Apr 2024 17:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=A1J9xCEHnJqEEI/CVe9T1ZVmK0X5pRO4R286AMXokBk=; b=jw
	wx2+uYAa8W60IuFgeV9TXNAH2vuxxAdynrGgsKWb80xwS4PtNcYYSEZgp2HgDxwK
	fRMO5LgNJJ3fd5J4ZJp8TYDU2ogxL70wSJltR4Mrz7e6YXWXs9HCYQSraN3Zp1do
	V4uDv1hPRyqe+ey0RrYMTLWkm0jjVcmCndvfRSPvCzI7deNz1bPG5NRE204ykfn/
	aZee0dbVDOUxGyLBcUobPZf7CCBsvF0p/6eMfaWr0SikIa5SOlp6lgqiUY2VaPsU
	YmQAXM9XWMbzg20pDJtWn5pcU1p99ZhRPc8aLdTyOe01KPjVDz/JpXoqOnmpU3lr
	RuVo99LRyLSIaR27vs0w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqenh38dm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 17:32:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43PHW31r014958
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 17:32:03 GMT
Received: from [10.110.61.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 25 Apr
 2024 10:32:03 -0700
Message-ID: <aa21d6de-85f9-4733-9fb2-45fb8eee0a47@quicinc.com>
Date: Thu, 25 Apr 2024 10:32:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/6] wifi: ath12k: add channel 2 into 6 GHz channel
 list
Content-Language: en-US
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240424191141.32549-1-quic_pradeepc@quicinc.com>
 <20240424191141.32549-2-quic_pradeepc@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240424191141.32549-2-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tUqVo_fH0PG_vpdQHQnSArAgxFgxrj8r
X-Proofpoint-GUID: tUqVo_fH0PG_vpdQHQnSArAgxFgxrj8r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_17,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=882 bulkscore=0 clxscore=1015 suspectscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_103206_037245_99031D98 
X-CRM114-Status: UNSURE (   7.32  )
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

On 4/24/2024 12:11 PM, Pradeep Kumar Chitrapu wrote:
> Add support for the 6 GHz channel 2 with center frequency
> 5935 MHz and operating class 136 per IEEE Std 802.11ax-2021,
> Table E-4.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>

I gave the following in v2 which you should have propagated to v3 since there
were no changes

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


