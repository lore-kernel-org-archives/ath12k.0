Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B254C4345F
	for <ath12k@archiver.kernel.org>; Mon, 29 Apr 2024 05:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wMms5es7D3a11n/v3t0aF+r1YXzwnTwPTS4bW4QLJS0=; b=W2nNnB98rpu5OJYL9WxlGBElKJ
	nowOoOUrlyK/ef9HFGD5n7YFj8M+PbfV6/yU5Fqi+MuBRx0PYpCnsiB/seCYayibZzAoTDMQERtX8
	II0pmpWlhO1DELEB8Hxmb4dRT5DggHZLlBWRZHic5HA2CpOt/mbtpVSEKqTkv1ED9aQHwD7XCuDjz
	I+xjV/zCJmROvkkK8SYhsfHYT8OAWcN5vtm4dnSILFHEvG3ww2zoRko75p6e3vgxht0ql/45Tj/3t
	0aEONb7EufMtiCXqz0Hw+u/P7MTeU/IRcXdqSJROGbYxs/IWjYsnArO6yuzMi3/qVn3Uk8TMOhXPs
	azB4z+qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1JWg-00000001WIl-17S8
	for ath12k@archiver.kernel.org;
	Mon, 29 Apr 2024 05:26:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1JWc-00000001WH8-08Jk
	for ath12k@lists.infradead.org;
	Mon, 29 Apr 2024 05:26:05 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43T4pkDi025476;
	Mon, 29 Apr 2024 05:25:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=wMms5es7D3a11n/v3t0aF+r1YXzwnTwPTS4bW4QLJS0=; b=J1
	CbCrOC3RgdPPzLhA/36Xs3hr5YlwkdXSfVycxYpF7X5sehaxQTlCEed3y5j9CIKe
	RVcS3OTIkHChF7ETTejur1ZeNEcwrdsWFJ3ncTEkY65eG8ZDEq3fsLngaY/OpXQa
	x/+FJJi7wq8GTNhMrM6jTxQFuyPu352ckiOl2FCyLE/bAKsDilXHpMlqLCjn5cNI
	j++C73vCLISlReltHPLLl7Sxd6R/pXXhqtOI3mhCfcWRhh8S+3femm6dgkmU9HQR
	QAAbIhQCIh2U32UWzr7Hr3tvq/wk+nJD/LhniMurhv01GlVsgJyB12xS2zxI+75P
	l3TmjdCmZX9Peimv5eIg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xrseyts0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 05:25:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43T5PuSC026497
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 05:25:56 GMT
Received: from [10.216.63.219] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 28 Apr
 2024 22:25:55 -0700
Message-ID: <64e35352-b301-8464-6fc9-f8b0a2e3474b@quicinc.com>
Date: Mon, 29 Apr 2024 10:55:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCHv2 0/3] wifi: ath12k: Remove unsupported and unused ring
 configurations
Content-Language: en-US
To: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240427162644.2470886-1-quic_tamizhr@quicinc.com>
 <4cea96f8-399c-0974-4d9c-21bf5eda143f@quicinc.com>
 <4f567b1a-aebc-709c-5303-ecbeb5cebc30@quicinc.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <4f567b1a-aebc-709c-5303-ecbeb5cebc30@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pByhnNyt7rhuGjrzvoIEYNRwkJT6dVtx
X-Proofpoint-ORIG-GUID: pByhnNyt7rhuGjrzvoIEYNRwkJT6dVtx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_02,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404290035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_222602_300493_AFA5B653 
X-CRM114-Status: GOOD (  11.76  )
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



On 4/29/2024 9:54 AM, Tamizh Chelvam Raja wrote:
> On 4/28/2024 8:59 AM, Vasanthakumar Thiagarajan wrote:
>>
>>
>> On 4/27/2024 9:56 PM, Tamizh Chelvam Raja wrote:
>>> Currently in driver doing memory allocation for tx_monitor,
>>> tcl_cmd_ring and tcl_status ring. Here driver support for
>>> tx_monitor mode is not there and memory for tcl_cmd and tcl_status
>>> rings are allocated by firmware and it uses that memory instead of
>>> host allocated. So avoid these unused ring setup configuration.
>>>
>>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>>
>>> Tamizh Chelvam Raja (3):
>>>     wifi: ath12k: fix calling correct function for rx monitor mode
>>>     wifi: ath12k: Remove unsupported tx monitor handling
>>>     wifi: ath12k: Remove unused tcl_*_ring configuration
>>>
>>> v2:
>>>     * Rebased on top of ToT
>>>
>>>    drivers/net/wireless/ath/ath12k/dp.c     | 16 -------
>>>    drivers/net/wireless/ath/ath12k/dp.h     |  2 -
>>>    drivers/net/wireless/ath/ath12k/dp_mon.c | 40 +----------------
>>>    drivers/net/wireless/ath/ath12k/dp_rx.c  | 56 ------------------------
>>>    drivers/net/wireless/ath/ath12k/dp_tx.c  | 44 +------------------
>>>    drivers/net/wireless/ath/ath12k/dp_tx.h  |  1 -
>>>    6 files changed, 2 insertions(+), 157 deletions(-)
>>>
>>>
>>
>> It nice to see code removal in general :)
>> But I've also seen some concerns internally around code removal
>> especially when the code will have to be re-added in future while
>> properly supporting the feature. I guess the cover letter
>> may need to clarify those concerns at least for internal review.
>>
> This is mainly to avoid unnecessary memory allocation for the unused rings.
> And this can be added in the future while enabling the feature.

I agree. I think I somehow overlooked the memory optimization part. Thanks
for the clarification.

Vasanth

