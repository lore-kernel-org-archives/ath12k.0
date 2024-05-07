Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B50C10F1A
	for <ath12k@archiver.kernel.org>; Tue,  7 May 2024 11:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=StWBNV/pEUVac1VskfbognEZZQrm/yz5f41jUW5WZJM=; b=oA2pJ//EBq4I/emBOLLDD3KOrn
	TOymRvvhThzOlf1d/lqUG4VXunTa5JHARlXuEEeQCeLATlgtPMD6LFic8X7vXdtxePRoAPFTT11zm
	A4JiBDW7VB6KqL6LOpxAYCWkCUN4gtVgxbRqvTSfDjHrHBICdGZfJrHP3FzEf9m+aNzu8ynVsQGSm
	xbYD6IO5SswSdIIf4bKQTnDUZRmZ16A8j2GFCFVHpEsTToM9FnNOI7vmVHBvDnxVHBVoGOQ47PztK
	BdCe91gb1zLEKlBdkdtUHzLGs2uNTdkXjHAD5Q79gXId2NC7POOkt6HF2rJkk18IvzWx5gTEKwhkm
	Jws75Q1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4IsE-0000000Ahc7-0oNR
	for ath12k@archiver.kernel.org;
	Tue, 07 May 2024 11:20:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4IsC-0000000Aham-17Df
	for ath12k@lists.infradead.org;
	Tue, 07 May 2024 11:20:41 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 447AuYAR022792;
	Tue, 7 May 2024 11:20:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=StWBNV/pEUVac1VskfbognEZZQrm/yz5f41jUW5WZJM=; b=j7
	jGJq7qPC0HEppxXKzl9zrL7dL1lfBtV0koXgqD8MYun3x7oWb9IFtOsEbTbiNA1/
	wZoLnha1JYtNJQNHvBCEv7EZwwKc2JIkE98hWlqCc/moxJJXL6nHEWF00zAVSuCb
	WoZGv+MaVMsQYTZGku/86TPFPm/WfgU0aTjmVcNzN6PPq+K3oas8bcoD6+pE+ARs
	UVeQcje+Fbsw19JAudd0MVoN6h+9Qb+M10sKZM480RYH5xkoArBVzZQ+pkjVgjWz
	p+gwllYGYtZ14hZ0xTYu3m5VM1veiF3Ksp9OxVx6EL0PvUigVYp3Je6zSu5nls5q
	c+GzltgRObRCfBJbB3Rw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xyj5h85bn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 11:20:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 447BKWhE010498
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 May 2024 11:20:32 GMT
Received: from [10.253.76.74] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 7 May 2024
 04:20:31 -0700
Message-ID: <430d0e14-bc60-4872-ace7-2328532bcfc0@quicinc.com>
Date: Tue, 7 May 2024 19:20:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] wifi: ath12k: remove redundant peer delete
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240429081525.983-5-quic_kangyang@quicinc.com>
 <171507720282.3827098.15356808712274335251.kvalo@kernel.org>
Content-Language: en-US
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <171507720282.3827098.15356808712274335251.kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UDh7yU130P7CtqozbWGj4OOp-NGvpfFf
X-Proofpoint-GUID: UDh7yU130P7CtqozbWGj4OOp-NGvpfFf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_05,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=909 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405070078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_042040_473428_9A23567E 
X-CRM114-Status: UNSURE (   7.04  )
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



On 5/7/2024 6:20 PM, Kalle Valo wrote:
> kangyang <quic_kangyang@quicinc.com> wrote:
> 
>> Firmware will create internal peer for monitor mode. For host no need to
>> do peer create and peer delete.
>>
>> So remove related code.
>>
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
>> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> 
> What about QCN9274? The commit message doesn't mention that at all. Is it safe
> to assume that QCN9274 firmware acts the same?
> 


The first judgement 'ab->hw_params->vdev_start_delay' only works for 
WCN7850. It won't affect QCN9274.

Sorry, i should mention.


