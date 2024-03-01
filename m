Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90ED4C5475B
	for <ath12k@archiver.kernel.org>; Fri,  1 Mar 2024 11:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mO8JlELbHMR2IKAMovqQhpXO8r5xG68vVlzuXpznzGM=; b=jFHFYw97dnzTTKEaZgFeFzQmsK
	w5Th3P9TrGy83eofVcxvBK5Od7KLHFvzHRfSeapzsTX3Fd+EcJr0bz0hvkh821o2uG+caoKgy4h48
	SIlKZdUdsBDBE0AFUwt158r5FD6ndu+S1bgsQk8CYBuslEgdT5rMZV5z4Q5PC6vFGWNRNiyAlyyC3
	BPG2D28tVnXzznlaYPNxuhfs0bdQQBEbfRl8LFKzYnY6mSNNaLqvRBObvVs8jhm6a2K9HojXQ5fNr
	BdZ4cW1LYGLjk1bCGmaYVarHfetZVTy5LxSGedj2p1zGeJrxBrckhZ3gGQHjV3vHQv9JBBXLRR1Eq
	gtSh3JOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg1HS-00000000332-0vCo
	for ath12k@archiver.kernel.org;
	Fri, 01 Mar 2024 11:42:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg1HO-0000000031Q-3EHm
	for ath12k@lists.infradead.org;
	Fri, 01 Mar 2024 11:42:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4218NNpZ008065;
	Fri, 1 Mar 2024 11:42:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=mO8JlELbHMR2IKAMovqQhpXO8r5xG68vVlzuXpznzGM=; b=Wh
	KPO/miFtnQxeWoNCP0Dj+Np7VkKoy3c7zYCo9z6GU8a+tZ3JjkO+CAwlCGOZKOVL
	GdV53Yk6ajNpHhSte8nZQ7/tGpsVzrGBBkNqA5xoym35ZR8exa0AMZzzhnMK87pm
	iVAiqcvkJSYTP0WAjxJQWBBw0Pcsul7oblZkRvEIrOAbDooTHMNeskbi3Z37vi1p
	hQk8UgdVMy4rH8Ujgl+/qKcltIKSRZKaGIJB91SmBsU+qKRYwz4/JYxhQI6F8isk
	pAB/IVxT9drmrFgLcfnuwpRkJKUBcbeN6vS/zJhvM1A45P12hZUyZkPFv3LvHSNd
	HlTrz/zOzkkZf1z0uCjw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wk9mf0sdk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Mar 2024 11:42:14 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 421BgD2v023820
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Mar 2024 11:42:13 GMT
Received: from [10.253.10.248] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 1 Mar
 2024 03:42:10 -0800
Message-ID: <25c22014-bb26-414e-a29f-8ed97c1ef465@quicinc.com>
Date: Fri, 1 Mar 2024 19:42:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 6GHz AP association failure on WCN7850
Content-Language: en-US
To: Jun Nie <jun.nie@linaro.org>, Jeff Johnson <quic_jjohnson@quicinc.com>,
        <kvalo@kernel.org>, <quic_periyasa@quicinc.com>
CC: <ath12k@lists.infradead.org>, Neil Armstrong <neil.armstrong@linaro.org>
References: <CABymUCNgjWMmfBAWJtzsd96iw5o0nxO8K8pdK_YJjkyjv-1roQ@mail.gmail.com>
 <ded15bd4-7b89-467e-829d-62b1067e1f03@quicinc.com>
 <CABymUCOuxnJH6o15VFihx0xVNjcdaUtpaEuQO-NGHhjaEiLWbQ@mail.gmail.com>
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <CABymUCOuxnJH6o15VFihx0xVNjcdaUtpaEuQO-NGHhjaEiLWbQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WXIolqDaMnMpZ3eaUPVSIpxhmUtJU40F
X-Proofpoint-GUID: WXIolqDaMnMpZ3eaUPVSIpxhmUtJU40F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-01_10,2024-03-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 spamscore=0 clxscore=1011 priorityscore=1501 adultscore=0 impostorscore=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2403010099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_034219_036926_3FC1C373 
X-CRM114-Status: GOOD (  12.73  )
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



On 3/1/2024 5:14 PM, Jun Nie wrote:
> Hi,
> 
> I see there is association failure many times when I try to connect my
> 6GHz AP with latest mainline Linux. Does anyone also observe it too?
> Any newer firmware than WLAN.HMT.2.0-01734 is available? Or we
> recommend any specific version firmware?
> 
> The issue only happens with this version firmware:
>    [    9.441624] ath12k_pci 0000:01:00.0: Hardware name: wcn7850 hw2.0
>     [   10.058822] ath12k_pci 0000:01:00.0: chip_id 0x2 chip_family 0x4
> board_id 0x3d soc_id 0x40170200
>     [   10.082876] ath12k_pci 0000:01:00.0: fw_version 0x200a06c6
> fw_build_timestamp 2023-09-20 03:43 fw_build_id
> QC_IMAGE_VERSION_STRING=WLAN.HMT.2.0-01734-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> 

Wrong firmware.

We use WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 and 
WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4,

https://github.com/kvalo/ath11k-firmware/tree/master/ath12k-testing/WCN7850/hw2.0

> I do not see the issue with firmware:
> [    7.896737] ath12k_pci 0000:01:00.0: fw_version 0x1005bc12
> fw_build_timestamp 2022-10-11 12:13 fw_build_id
> QC_IMAGE_VERSION_STRING=WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 

That's it, i recommend you to use 
WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3. It's new one.



> Detail log can be found at:
> https://www.dropbox.com/scl/fi/jgn1zbnw44i1vypbjxl0v/ath12k-6GHz-association-fail-log.tgz?rlkey=pg2ifnzcttzimz7vaxb7tuc6w&dl=0
> 
> Jun

