Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CD8C47077
	for <ath12k@archiver.kernel.org>; Tue, 16 Jan 2024 04:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QAdivOL0iqI4Cqi62ycdiX0+iy75X/hQpBLFBtppcWU=; b=kAcDRx6mESA6zW+GPjmd5uOYCZ
	jj8DYDlgsG1UbhzrlJBflmoprY1F7fbBxXEENCo1PciIwra+Gk2QhG41T572T8K14YYaexorCpKVm
	Wc5TU6w1x/7PHpUba7PIzCTIluHUElXPDfCICHL+g6aMuHeUY05PNv7475bHMnUain9rN+cQuKvgp
	dd89Z8xb+1ygVLxyMd47CLKjfqDjj0ehPj32Muj47f+qnikkDkapYJ+AhE4BZjGYmE0eNlM4C8F8H
	1MqAJqxaW+TbxMmQXHNO+oyCbwFG00DJJI4X823QXk6X0QYBEUydE8SvPVA2kPpLNfgc8QdFZlvk1
	yASaXEOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPbPX-00Ax27-1A
	for ath12k@archiver.kernel.org;
	Tue, 16 Jan 2024 04:50:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPbPU-00Ax1V-0s
	for ath12k@lists.infradead.org;
	Tue, 16 Jan 2024 04:50:49 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40G3retJ000644;
	Tue, 16 Jan 2024 04:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=QAdivOL0iqI4Cqi62ycdiX0+iy75X/hQpBLFBtppcWU=; b=RT
	ukTfpZFqSvgUO0mi552LvVSgha0EobyJxJqMNrPBlEcIrEw6e0T5kY5DzSDDmtMn
	ULRRLDlzvF4aawxlkeRYDjkotf3iWrGAIgrSAhC+IoYcIgjA187GImO1e440iNWZ
	n9OVYDLjsq8OQm0WCCY3HPtfiX8lrC5A4ckOzU/61tnhKib9g5Rgv2pLl4LuWaoR
	LKiAeeaXWzAq1fj21QQuRgkhVmn3Ofi3aPhjmL17CSQCZuQdH0l+Co2QZ1OwWmNq
	qxQzNaVo90YaE2+PipN2njXCE1W0ZWY6j8HatjvQVgMv74YouMwfHxFKTbdLrWkC
	daGxX+qkJCJkY6Ll55qA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vngm58aey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jan 2024 04:50:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40G4oj6M031325
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jan 2024 04:50:45 GMT
Received: from [10.50.41.2] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 15 Jan
 2024 20:50:43 -0800
Message-ID: <915171c5-7176-f7be-fd7f-f748917dfbf0@quicinc.com>
Date: Tue, 16 Jan 2024 10:20:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 00/10] wifi: ath12k: Refactor mac80211 callback operation
 functions
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240103063731.3356060-1-quic_periyasa@quicinc.com>
 <87r0ii7goe.fsf@kernel.org>
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <87r0ii7goe.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jAyjCtjaFfYUW8rYVtTgT32Z7uXrrLkI
X-Proofpoint-ORIG-GUID: jAyjCtjaFfYUW8rYVtTgT32Z7uXrrLkI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=479 spamscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 mlxscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401160034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_205048_339617_CEB5FF7C 
X-CRM114-Status: UNSURE (   8.99  )
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


On 1/15/2024 9:05 PM, Kalle Valo wrote:
> Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:
>
>> Currently, the existing mac80211 callback functions are defined assuming
>> each link/radio is represented by a single mac80211 hw. In order to
>> support multi link operation (MLO), need to move from the multi wiphy
>> model to a single wiphy model. However, the single wiphy model allows
>> multiple link/radio to be exposed by the same mac80211 hw. Therefore, we
>> need to separate the link/radio specific handling within the mac80211
>> callback operations. This way, the callback can be extended to support
>> multiple link/radio in the future.
>>
>> 			Current Multi wiphy Model
>>
>> +---------------+            +---------------+            +-------------+
>> |  Mac80211 hw  |            | Mac80211 hw   |            |Mac80211 hw  |
>> |  private data |            | private data  |            |private data |
>> |               |            |               |            |             |
>> |               |            |               |            |             |
>> |               |            |               |            |             |
>> |   ar (2GHz)   |            |   ar (5GHz)   |            |  ar (6GHz)  |
>> |               |            |               |            |             |
>> |               |            |               |            |             |
>> |               |            |               |            |             |
>> +---------------+            +---------------+            +-------------+
>>
>>
>>
>>
>> 			  Single wiphy Model
>>
>>                             +--------------+
>>                             | Mac80211 hw  |
>>                             | private data |
>>                             |              |
>>                             |ath12k hw (ah)|
>>                             | +----------+ |
>>                             | |ar (2GHz) | |
>>                             | +----------+ |
>>                             | |          | |
>>                             | |ar (5GHz) | |
>>                             | +----------+ |
>>                             | |          | |
>>                             | |ar (6GHz) | |
>>                             | |          | |
>>                             | +----------+ |
>>                             +--------------+
>>
>>
>> Karthikeyan Periyasamy (10):
>>    wifi: ath12k: Refactor mac callback of config
>>    wifi: ath12k: Refactor mac callback of bss info changed
>>    wifi: ath12k: Refactor mac callback of conf tx
>>    wifi: ath12k: Refactor mac callback of start
>>    wifi: ath12k: Refactor mac callback of stop
>>    wifi: ath12k: Refactor mac callback of update vif offload
>>    wifi: ath12k: Refactor mac callback of configure filter
>>    wifi: ath12k: Refactor mac callback of ampdu action
>>    wifi: ath12k: Refactor mac callback of flush
>>    wifi: ath12k: Refactor start vdev delay function
> In the pending branch I renamed the patch titles like this, an example:
>
> wifi: ath12k: refactor ath12k_mac_op_conf_tx()
>
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=bdb399b467daacabdc0e2127e03874d399f17a38

Looks fine to me.


Thanks,

Karthikeyan


