Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF34C02193
	for <ath12k@archiver.kernel.org>; Wed,  5 Feb 2025 01:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=riqRvzbNwbYlkuc7UwhRFdLtvXAkud21a578+p1IZ04=; b=v0dYqtveGOQPir3wUNZQikoBxU
	mkdJNwppSsJKWPQ4v9ShgFzwaTJdAd8QLj6yqAr6+uCmlIhyoP7egpL1wOY7+bMN0YJBEv+a94+O4
	sP5DKeF5pG6lpPMEWEr1xQ7CwI4moocdWc2QO+plz/QN6zJmFH6wwF0RaNcuvC0eV4rZ40EuItgJn
	DMja9FPjZUGKefxo3hlP9wDi8lnemimC/ZyYlfzrFPLZ3HuAZ4knTWJTlGM+buOv0BZJwKtrYxi7f
	VxAGH7v2B1AJuWSqdGfWp0SIGpyJNw5pazGSIpgeiIdKid4bSVYICfKkv2PX7T6hnqhxLFjUhprhH
	7ZnKb4TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfTvg-00000002068-3UPg
	for ath12k@archiver.kernel.org;
	Wed, 05 Feb 2025 01:10:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfTp9-00000001z4k-1FCw
	for ath12k@lists.infradead.org;
	Wed, 05 Feb 2025 01:03:28 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514E1aab032316;
	Wed, 5 Feb 2025 01:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	riqRvzbNwbYlkuc7UwhRFdLtvXAkud21a578+p1IZ04=; b=D/SL7Fzyp8+tw9Ay
	cqFTMF34lgBqzAtWT9gO8MHYJCQimjV0TNPPY7IJRMLOEpJwB/lRW+fIs5cqo5ej
	e+x8lspu2tT18VSeNdmkAOrorIiS+aup7ASZU+W/MnAVOOwWuslkY5LyluFru5cg
	KmLSzbLUQf/WIsXwf2/R6LNoSor6AEPrsH6P9ONLvbnzTy6eJX7ii6Ddp8HzADob
	FKRWMy728qrtShExeqLCb7hznUZRCuTW3EiMklDf2MR0gYogEdYPnVNX2QVeqgd4
	Bbi/ntHJ5zy6vqfn91TymSt/yuRiRu4tqqJO81gFGxmgzzMbSPX28CHbrLsgZ/PS
	YBAPwA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44km9whdxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 01:03:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51513Pv1005165
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Feb 2025 01:03:25 GMT
Received: from [10.216.47.115] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Feb 2025
 17:03:10 -0800
Message-ID: <0f7885ad-a360-2ff1-eb0b-51454de2eeb0@quicinc.com>
Date: Wed, 5 Feb 2025 06:32:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v8 1/9] wifi: ath12k: Add HAL_PHYRX_GENERIC_U_SIG TLV
 parsing support
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
References: <20250204035718.3227726-1-quic_periyasa@quicinc.com>
 <20250204035718.3227726-2-quic_periyasa@quicinc.com>
 <414ca414-d6a4-4228-acb3-dde4bb71624d@oss.qualcomm.com>
Content-Language: en-US
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <414ca414-d6a4-4228-acb3-dde4bb71624d@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: K63B46zqiidkaSgslUYMUM_-P2NOP8za
X-Proofpoint-GUID: K63B46zqiidkaSgslUYMUM_-P2NOP8za
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_10,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 adultscore=0 mlxscore=0 bulkscore=0 mlxlogscore=851
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502050006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_170327_356602_8B65D1BA 
X-CRM114-Status: UNSURE (   7.70  )
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



On 2/5/2025 3:59 AM, Jeff Johnson wrote:
> On 2/3/2025 7:57 PM, Karthikeyan Periyasamy wrote:
>> Currently, monitor is not enabled. However, in the future, the monitor
>> will be enabled. Therefore, add the necessary HAL_PHYRX_GENERIC_U_SIG TLV
>> parsing support in monitor Rx path, which help to populate the EHT
>> radiotap data.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
>> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
>> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
>> Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
> 
> Normally your S-O-B should be the last tag. Any tags you collect should come
> before it.

Oh my bad, if you want to re-spin ?
will fix it in the next version of the path.

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

