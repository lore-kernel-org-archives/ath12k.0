Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E2AC47077
	for <ath12k@archiver.kernel.org>; Fri, 12 Jan 2024 01:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdDsp1CEIE+93DfW0N9GSzZxQw584o7yLlC6esqf78Y=; b=zPHXVOJ9WiDxzDmHDKZxEBUO7x
	ufHErCIPfvXA6lrh7l09uTMRqa7SIkMOxKtzTDklBlwcqnLp2qtn4mL+Hfd88wLblORxsl8DA2oeS
	uNlxCVfJEbO+aWyDzNrxmoHyUjTEF2hxnOaVKnUiNykkjO/GnxEZuqDJv/1FmfzkMjZPbU4jbsS0I
	rs4X7Iol/nnQJ/7ko95XXWxAt9xBpLreeVEJ8esPAWewH+FRhyYE9vIG4cuY5tHjl3TKDmWTO3huH
	Xk+oP2frYbfeY6SBFcB9M2CyjmK5F0eBR9NX4N+gjBInYPpu5zyGEs3BKrHyVpC7u0ZU1Z8r5/5QI
	R7lr+7Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rO6V3-001doo-0f
	for ath12k@archiver.kernel.org;
	Fri, 12 Jan 2024 01:38:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rO6V0-001doR-0n
	for ath12k@lists.infradead.org;
	Fri, 12 Jan 2024 01:38:20 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40C0UCR6023709;
	Fri, 12 Jan 2024 01:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=vdDsp1CEIE+93DfW0N9GSzZxQw584o7yLlC6esqf78Y=; b=l2
	iXvrtqKdRqZmSiC05qQPv+oxn1M2DWjXzgxHUkeiv8S0uvqEyd/9qvmGyJIR2U7Q
	5XozapJb7A6J/BFq0uvpfLV0cppm9RAKL/V7k/JBbXQ72W8/lOVxtpkk3udfUIW4
	h1xHYXQWlrmXGAJNp0GFlTgjs5Wx78IPUc4/e/UnnpMmQNgVcav1iVZtdxDdyPXD
	Dypqt1Ro33+QKATXInVPeCpZyGN5QK7eWHp1Fnzgf7IYAaXEUa7XjCxfoG8uu0U6
	YvwjpcA1FBQWzc0Eo3LzeLInrcSKVT6+b9K8PhmV+IydcpImA7vfkKOuPAScrIx0
	BIjgXcxCwzaYURId1GeA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vjcvjt56d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 01:38:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40C1cEuP024941
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 01:38:14 GMT
Received: from [10.50.59.85] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 11 Jan
 2024 17:38:12 -0800
Message-ID: <c53f6a51-74d2-28e7-4d0d-c3c6374a2ab9@quicinc.com>
Date: Fri, 12 Jan 2024 07:08:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/2] wifi: ath12k: Introduce hw abstraction
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240109051252.3325106-1-quic_periyasa@quicinc.com>
 <ea393ad8-5623-45b9-824a-02d7e4c39b90@quicinc.com>
Content-Language: en-US
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <ea393ad8-5623-45b9-824a-02d7e4c39b90@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kabwuA546fsZbj-kWPZ_eXEiYhAOfnbp
X-Proofpoint-ORIG-GUID: kabwuA546fsZbj-kWPZ_eXEiYhAOfnbp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=545 spamscore=0
 adultscore=0 mlxscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401120010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_173818_427488_5BAF17A1 
X-CRM114-Status: GOOD (  11.68  )
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


On 1/12/2024 1:42 AM, Jeff Johnson wrote:
> On 1/8/2024 9:12 PM, Karthikeyan Periyasamy wrote:
>> To support multi link operation (MLO), need to move from the multi wiphy
>> model to a single wiphy model. However, the single wiphy model allows
>> multiple link/radio to be exposed by the same mac80211 hw. So introduce
>> a new container (ath12k_hw) structure. This approach improves scalability
>> for future multi link operation support.
>>
>> Note:
>>
>> This patchset sits on top of below patches
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
>>    wifi: ath12k: Refactor the DP pdev pre alloc call sequence
>>    wifi: ath12k: Refactor the MAC allocation and destroy
>>    wifi: ath12k: Refactor MAC setup channel helper function
>>    wifi: ath12k: Refactor MAC un/register helper function
>>
>> Karthikeyan Periyasamy (2):
>>    wifi: ath12k: Refactor the mac80211 hw access from link/radio
>>    wifi: ath12k: Introduce the container for mac80211 hw
>>
>>   drivers/net/wireless/ath/ath12k/core.c   | 108 +++--
>>   drivers/net/wireless/ath/ath12k/core.h   |  47 ++-
>>   drivers/net/wireless/ath/ath12k/dp_mon.c |   4 +-
>>   drivers/net/wireless/ath/ath12k/dp_rx.c  |   6 +-
>>   drivers/net/wireless/ath/ath12k/dp_tx.c  |   6 +-
>>   drivers/net/wireless/ath/ath12k/mac.c    | 480 +++++++++++++++++------
>>   drivers/net/wireless/ath/ath12k/mac.h    |  14 +-
>>   drivers/net/wireless/ath/ath12k/reg.c    |   9 +-
>>   drivers/net/wireless/ath/ath12k/wmi.c    |  17 +-
>>   9 files changed, 510 insertions(+), 181 deletions(-)
>>
>>
>> base-commit: 2cd4e3f91f264926a6b11df948417b74d52ca9b9
>> prerequisite-patch-id: c2cebfe634adf505f1dd4fff4235dac6162c7da7
>> prerequisite-patch-id: cc11dc22588dbbd884ce44bcc4680ff0cc64b696
>> prerequisite-patch-id: 2eb8549471f3a66e200d82f6d3e902de2832a210
>> prerequisite-patch-id: 330f495e6871998fddc71c735e7fbfe5efc9c798
>> prerequisite-patch-id: 903acc7b989d5974623fdf4b9be901e2664dbef3
>> prerequisite-patch-id: 53378c45727417943331a0b98c5718b24a8e3577
>> prerequisite-patch-id: 9f1e02951355b889eddf23c24d063e9933008b2a
>> prerequisite-patch-id: 9b662f69fa076e61e089a15b5559c4ee913f94a8
>> prerequisite-patch-id: 4e079d284495ae939dc2173cae9e3fa082e607cb
>> prerequisite-patch-id: f81c109928533db71c84e64e102f5921db406f2d
>> prerequisite-patch-id: 70e3b0429286e17f26ea53369027a6f43a3653c3
>> prerequisite-patch-id: c2bebc5a0ea8cea79d6aec293096a168860bb48d
>> prerequisite-patch-id: e89f6abeea9771cb0832b8db13507a2b08f774ce
>> prerequisite-patch-id: c26a2ceec9261bec16474d1c8e3ff093d404b778
> In my workspace your patches are not applying. Can you rebase against
> the 'pending' branch since that has the pending versions of the
> prerequisite patches?
>
> /jeff


I will send the next version of the patches against the pending branch.


Thanks,

Karthikeyan


