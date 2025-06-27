Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912B0C7EE2A
	for <ath12k@archiver.kernel.org>; Fri, 27 Jun 2025 03:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W6haESMb17b0awpmARzv+pxnGvZhyPxdFdK53R9oEB0=; b=OkJt4vm3yl2pTo+GTZH6cE9qFG
	mOz3aCAaG5zCF//XPRdFEUMU3W2VlmBlVyUfiJsbxbo3v23rMLHi+RkOleTNDV+nMokZvPedXp8df
	UgZVz++asv/SkVuVKdweyId1s3NNp2B3QT26HCKwq3wj4JbvtXmkhl2H+ZpxGT5IXK+YapoB0HcBK
	OvDHR/6o5hxwVBuAgS9Lt3SZsyXg1Gbv7A3QadwM1ReqbCe9cZTiP9siyZ2NfHirXJkMMyrvvLLIK
	d5eua7zLQlT2DpH3HgqKd53jBAkcT7KXjHmrgSdFyMbf3yHYJRr3Ie56rpMoaUNl0HKqmQoTwZETE
	WU5GtPyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV00c-0000000DRcm-1JZw;
	Fri, 27 Jun 2025 03:44:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV00Z-0000000DRcS-0gpr
	for ath12k@lists.infradead.org;
	Fri, 27 Jun 2025 03:44:12 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QKHSmJ013542;
	Fri, 27 Jun 2025 03:44:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W6haESMb17b0awpmARzv+pxnGvZhyPxdFdK53R9oEB0=; b=Itc0cpOcxvjvHyeE
	zV+Vy552ez1lq8NQYhehs+byWqtd/Tkb5u3Ss8jD61a9cKTtEmv8oNS4SzMYFi3s
	uuemkgRmSuGBpcmfgk+rLx8pBd8TvrS9uFFU1+qAHm9R+hmf1caRMKro0YRvMJUS
	u+E531boDHecPakw+Ob0tDZ/Ooqln5wDfjpHIqiOZCirAPp1dI23D/pyvRB45Hg6
	Iu/NOm3j1fjll3GFe7V14pJy92SpeZ6/HYMdQa4kp9tFjXD2wY2FJVmrhsBtYyrg
	fuch4J2nGmhid27fHDFU0H61qXM/w3DE9UkPrxBtge/0WRklMIXgi2HLJ0ddNVBr
	iVlA0Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgnan2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 03:44:09 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55R3i85x029397
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 03:44:08 GMT
Received: from [10.216.56.23] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 26 Jun
 2025 20:44:06 -0700
Message-ID: <e657ddc8-84c8-a9dc-7b86-482437079c7a@quicinc.com>
Date: Fri, 27 Jun 2025 09:14:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Add support for transmit
 histogram stats
Content-Language: en-US
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan
	<vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Saleemuddin Shaik
	<quic_saleemud@quicinc.com>
References: <20250617112139.865788-1-quic_rdevanat@quicinc.com>
 <6b32c871-0d18-4cdd-e097-97fc2e7bdf28@oss.qualcomm.com>
 <cab5daaf-bafb-4df3-9e44-1d0e6dda0341@oss.qualcomm.com>
 <fca2def0-227b-4208-8104-abc40368f7fb@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <fca2def0-227b-4208-8104-abc40368f7fb@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7vYCiBxcLiNaqejugmexJisyz8jTKpC9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDAyNyBTYWx0ZWRfX8MZ4gyeXn9Ho
 g89DeBjsu2tuyGjbLFcaUZ4n0O60SzVd/5wde23V38Yyqs0NzlC2DTlUO8vs0/pSyVx862e4Mkq
 7fqr1fsjvrRmBpVQ06TAgGUpT+FtAJCCa+uXppKwwX6TigKML1CojhEhxojZ6VPu9tcNgW5QlWm
 JAQWF67cEUAS/pfqMIIMBYkTr39j5VoaY6Vg5AMMIEOszu4DVvSyL6+ceYfBv2oWIMgJqcj9dct
 1mISDwFvmHT1TwqIxx1n71T0hRlVjudBFjs3ZEyULFxi8G0Jn0YwVF/SmnAdRrjjQXqTO6dRIFU
 u2HYMCZ5CQQudF8lGgpzuxfonO5Bz3ddpSYVreDKdFWEZIXJt7zGZIgEJ3MQd4rL1XFGqng3dI9
 Tibs08QOKbIcAIaYSueqd9A+nBxJf+uJZ6bibJvFAkwSpxNCJn0kM1LcLWUZiUx2ubrV0PnZ
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685e1389 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=TE82o3EEuiIpzjil3jEA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 7vYCiBxcLiNaqejugmexJisyz8jTKpC9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_01,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=977 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_204411_334243_D3890969 
X-CRM114-Status: GOOD (  10.50  )
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



On 6/26/2025 11:55 PM, Jeff Johnson wrote:
> On 6/26/2025 11:18 AM, Jeff Johnson wrote:
>> On 6/26/2025 10:20 AM, Vasanthakumar Thiagarajan wrote:
>>> On 6/17/2025 4:51 PM, Roopni Devanathan wrote:
>>>> From: Saleemuddin Shaik <quic_saleemud@quicinc.com>
>>>> +struct ath12k_htt_tx_histogram_stats_tlv {
>>>> +	__le32 rate_retry_mcs_drop_cnt;
>>>> +	__le32 mcs_drop_rate[ATH12K_HTT_TX_PDEV_STATS_NUM_MCS_DROP_COUNTERS];
>>>> +	__le32 per_histogram_cnt[ATH12K_HTT_TX_PDEV_STATS_NUM_PER_COUNTERS];
>>>> +	__le32 low_latency_rate_cnt;
>>>> +	__le32 su_burst_rate_drop_cnt;
>>>> +	__le32 su_burst_rate_drop_fail_cnt;
>>>> +};
>>>
>>> Since this strcuture represents the message format used between host and firmware, pls add
>>> __packed annotation even though it may not have any effect in this case.
>>
>> looks like I missed this in a few other structs as well, at least:
>> ath12k_htt_tx_pdev_rate_stats_tlv
>> ath12k_htt_rx_pdev_rate_ext_stats_tlv
>>
>> perhaps i'll take this as-is and then have another patch that adds __packed to
>> all _tlv structs that are missing it?
> 
> actually let me fix this instance in pending, and we can fix other existing
> ones separately

Sounds good, thanks.


Vasanth

