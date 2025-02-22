Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454E1C021B3
	for <ath12k@archiver.kernel.org>; Sat, 22 Feb 2025 02:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A7+0aHG3njtyOdvfTEJGKDp1ymScZwp1PcvoplR7Hls=; b=SjLhZ0wn8pFKrDcg2f8LKtXxaQ
	LjIJihqZw4RUXDt3kDnTovxVaVEXJd+iAIT80331DU53g7u42AGSJoYhIXe8IzyG1DdvkQzMsFRDd
	sgfQD9tRUC3CANyshi+q+U2O0/hWSZCCqT3ERO1eMqauLUdWRIVE+lIGPFtvrGTGp1uXUpJD8RXyo
	+29f+KoAtBP5TEF40utlulN8WjKMJHmiI8au1cDLYGYhlGdMma9iH5+cE0C4zMu7jUhY4dp5i892S
	9ggyIduD6t12N8RaRjQip7T1lH8+1sih4nPLLED9T/FnYawU58KNxWsjJ/m05cSGIC0YkK5VcCFud
	bcgUfAmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlf0P-00000007LMy-3jkM
	for ath12k@archiver.kernel.org;
	Sat, 22 Feb 2025 02:12:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlf0N-00000007LMc-0SYb
	for ath12k@lists.infradead.org;
	Sat, 22 Feb 2025 02:12:36 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LILW0j026039;
	Sat, 22 Feb 2025 02:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A7+0aHG3njtyOdvfTEJGKDp1ymScZwp1PcvoplR7Hls=; b=BXiWqBjQank8F/Ji
	89/r8lcd+kfRJo7NHpfr7erdD0gzJexz1b1APjvBU6//IT2cZJnQi4/qL9dYgS5n
	WC4TqWCND3xEFzeOVc1iK1/X/xZxnD5telHFVeBDvAfpNjhzZn5BssJRGuLNdwIc
	bLT0xgamDuWv98VIWd1sG+9+JZ4zHatmxIC6Pgr35+U5k7ft61D9mDWjoGzVTM8V
	mAFqU1HPUsKsI4RJDN3tMBmokGhMXI8Me8HAWCnAToOvF851G/whpq5rZ3VHG3Tb
	MyHzTLfvJP8LbGDyVndt273IJTIpsWDgjLJO52EaabAq0HTUVHg+uEowcAxwVFo/
	yR38zw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44x2r3wvxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 22 Feb 2025 02:12:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51M2CJsM032591
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 22 Feb 2025 02:12:19 GMT
Received: from [10.216.33.17] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 21 Feb
 2025 18:12:17 -0800
Message-ID: <0349e41e-9e88-b45d-e711-d3a096adcdd5@quicinc.com>
Date: Sat, 22 Feb 2025 07:42:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 7/8] wifi: ath12k: fix NULL access in assign channel
 context handler
To: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250221164110.3277222-1-quic_periyasa@quicinc.com>
 <20250221164110.3277222-8-quic_periyasa@quicinc.com>
 <a2874f49-6725-be71-7428-a2e910c2001d@oss.qualcomm.com>
Content-Language: en-US
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <a2874f49-6725-be71-7428-a2e910c2001d@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: m9MYcWeszOe7ZZzZYMoBtU3kDGG9o1Mm
X-Proofpoint-GUID: m9MYcWeszOe7ZZzZYMoBtU3kDGG9o1Mm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_09,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 bulkscore=0 phishscore=0 mlxlogscore=831 suspectscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502220016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_181235_176713_652550A1 
X-CRM114-Status: UNSURE (   7.77  )
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



On 2/21/2025 10:52 PM, Vasanthakumar Thiagarajan wrote:
> 
> 
> On 2/21/2025 10:11 PM, Karthikeyan Periyasamy wrote:
>> Currently, when ath12k_mac_assign_vif_to_vdev() fails, the radio handle
>> (ar) gets accessed fom the link VIF handle (arvif) for debug logging, 
>> This
>> is incorrect. In the fail scenario, radio handle is NULL. Fix the NULL
>> access, avoid radio handle access by moving to the hardware debug logging
>> helper function (ath12k_hw_warn).
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI 
>> WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> 
> fixes tag?

Sure, will fix in the next version of the patch

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

