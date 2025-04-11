Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D0FC36010
	for <ath12k@archiver.kernel.org>; Fri, 11 Apr 2025 07:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ni+mHILITGZ5XHL/N5eQLGAbSrglv1cg+f6LFqWOhYw=; b=45wl4r2gylekK3w+5uPh+6RRWP
	RHZzhK/NpKMOkgLCDOrx/bwsgeAz3NpE+3Fko+qWfIXtVDxqbkh4eY55WWSZRcRpFrQCaT1os3vjA
	bp4OREJRvbyqSh7FqJgR+u9yS3Dt5S0bUvIRvbbxT2BsKhGFIoj5dPpAsqdxeqMtRCt2G0bi/RkjI
	gj5IKEQTO+J5Vab4qqV6EJ/SKpqm2EfoVay8wsiT0ui5NQ86M6NWLZZjAp4fb4KmCe8b2G3tOeoA2
	Qoe6ZaXAyTYcWtXK0VR9QkJe/6s9FOeTurLbe6Nf500yE/hPDAR3OzmxMqCgmgy82901xhdYiRIip
	VJwiNd2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38qH-0000000Crzy-1OkU
	for ath12k@archiver.kernel.org;
	Fri, 11 Apr 2025 07:30:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38NZ-0000000Co4i-44G9
	for ath12k@lists.infradead.org;
	Fri, 11 Apr 2025 07:00:47 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B4cWJ5008480;
	Fri, 11 Apr 2025 07:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ni+mHILITGZ5XHL/N5eQLGAbSrglv1cg+f6LFqWOhYw=; b=ZVFLmfAXQlnXNcbH
	XB5AL33ZIY+lKT1buo9JcxU7QvglZ60mpU5tWRE3MffNuBKLhN+m6i1HCAZzxLk0
	OvMXc5aKlXjM9uOcwGyRxkslWoC6PKtxb+4fbvZVXgCHc/t6NIR1s8kJ8b7M1tWL
	p7Bxbl2LdssFXOS4s71nW+gxzR5RtMS+vd+/Wk2Dl3jDt4UZCdYLKyOB9es1geZS
	W1GNOxoI2UUqcDCmmCK/3Y9+tkS3ZtbcjOWIjqa8yx91tP8FKQWLrsbD5f75Zeax
	TjG4XaCM4IGbN6n+MPiDfQ8TCF9h1s0eplTlt+3V/dCpxwMyCHYTyqcv2quTH4cq
	0aEVWw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd09mw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 07:00:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53B70ZjB029084
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 07:00:36 GMT
Received: from [10.216.57.178] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 11 Apr
 2025 00:00:33 -0700
Message-ID: <d6feee78-d693-14b4-b90a-6c0219fede04@quicinc.com>
Date: Fri, 11 Apr 2025 12:30:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v2 2/2] wifi: ath12k: correctly handle mcast
 packets for clients
Content-Language: en-US
To: Sarika Sharma <quic_sarishar@quicinc.com>,
        Vasanthakumar Thiagarajan
	<vasanthakumar.thiagarajan@oss.qualcomm.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250411061523.859387-1-quic_sarishar@quicinc.com>
 <20250411061523.859387-3-quic_sarishar@quicinc.com>
 <24179c31-f351-2ed9-2699-d98615742d4b@oss.qualcomm.com>
 <a47a67e4-5756-459d-b49c-6e517b37e492@quicinc.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <a47a67e4-5756-459d-b49c-6e517b37e492@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6j80c4qu7aYQkAAnFSJwQiq_KLUooEpj
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f8be1c cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ppMG8rbRpNWmaPcQXTYA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 6j80c4qu7aYQkAAnFSJwQiq_KLUooEpj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=589 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_000046_138769_53027B3B 
X-CRM114-Status: UNSURE (   9.00  )
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



On 4/11/2025 12:27 PM, Sarika Sharma wrote:
> On 4/11/2025 11:55 AM, Vasanthakumar Thiagarajan wrote:
>>
>>
>> On 4/11/2025 11:45 AM, Sarika Sharma wrote:
>>> Currently, RX is_mcbc bit is set for packest send from client as
>>> destination address (DA) is multicast/broadcast address, but packets
>>> are actually unicast as receiver address (RA) is not multicast address.
>>> Hence, packets are not handled properly due to this is_mcbc bit.
>>>
>>> Therefore, reset the is_mcbc bit if interface type is AP.
>>>
>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
>>>
>>> Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>
>>
>> Should there be a fixes tag?
> 
> This patch independently does not fix any known issue, this is required because of patch 1 
> in the series. Due to 1st patch some existing issue is exposed, to address that 2nd patch 
> is required.
> 

Ok

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

