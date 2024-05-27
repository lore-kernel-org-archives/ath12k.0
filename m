Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4942DC25B74
	for <ath12k@archiver.kernel.org>; Mon, 27 May 2024 04:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BxXoftpsQbbJzWdxegDrPAtMKsSXw07brHUmKfr9UeI=; b=MHom9mP4tZAu3Kmxp3yRCL7o76
	sXX7e0TRDBqHL9058wwSPvPlGzE9DTrhnhG7yk7y0IQ+vFGiGZGSppdtPMa+KqiMZPVXfJSveB1SZ
	rILxEMpWs4+74RQPPhv8ZzJyHr86VSlAmgxKXkCJyC8LogAkvOf4c03SHKzKx7B510E+CxErQRE/l
	OnpB79MoJkan3gmOiwilYf+tEx1ID0h2Rss0UETSGb+9HsDyTUm4RYsx3b4r37e0OBGInCRLF0OJj
	2csAEqxh+h8+kPjOj27plcTCBSbfMDIgPin71YOV9laS1KsnGLUaKlzN+xpHUd90v+8rMOzydGbf4
	SsmYEvuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBSDS-0000000Dm6w-2r60
	for ath12k@archiver.kernel.org;
	Mon, 27 May 2024 04:44:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBSDQ-0000000Dm6U-3zgx
	for ath12k@lists.infradead.org;
	Mon, 27 May 2024 04:44:10 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44R0Qs6l014491;
	Mon, 27 May 2024 04:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BxXoftpsQbbJzWdxegDrPAtMKsSXw07brHUmKfr9UeI=; b=piJ5dvK9hT8OaSVr
	s110/7wIAjgNmwmeyGTgbyYUqr2WKQK+WpS8G1dXAJAPYK+znqw29Rg4UW8BLTxU
	hq6vtRmgV0TrG0SOl6qkTSOtFXegb0vTfyQqAzrEvHcuSw2Al92YWDI8PhPBxJxM
	iNSWm1x73eRFlX24kL0YWZ8K/fq4B4lMowlCrMTu9jiHc+G8YUQrpGhKw4BfWb0o
	BkYH0GT1oB7dKgU3NycdtDJOnbhNyxjCTnEhqPDP64C3moFUfZBF5vRH9rT8PEkZ
	8IyqAgtLRc0cDCHkhiRVozpsVHwOgl6QLvpva8fUsckAi9LXzJe16jSSGFzVly6d
	YKKMBQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0pjken-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 May 2024 04:44:06 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44R4i2K3022280
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 May 2024 04:44:02 GMT
Received: from [10.152.206.169] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 26 May
 2024 21:44:00 -0700
Message-ID: <78b640af-22ae-8dcc-e086-25f3a9bd79c6@quicinc.com>
Date: Mon, 27 May 2024 10:13:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH v5 8/8] wifi: ath12k: move ath12k_hw from per soc to group
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
References: <20240522095439.2596989-1-quic_hprem@quicinc.com>
 <20240522095439.2596989-9-quic_hprem@quicinc.com>
 <d981696e-0ce2-43c2-8877-68ead0743dd3@quicinc.com>
Content-Language: en-US
From: Harshitha Prem <quic_hprem@quicinc.com>
In-Reply-To: <d981696e-0ce2-43c2-8877-68ead0743dd3@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: yUE7unRGYo3CLMSP5p2FXLKzrIgrhPt1
X-Proofpoint-GUID: yUE7unRGYo3CLMSP5p2FXLKzrIgrhPt1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-26_09,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405270036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240526_214409_039112_54A44F5E 
X-CRM114-Status: GOOD (  12.02  )
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



On 5/23/2024 1:28 AM, Jeff Johnson wrote:
> On 5/22/2024 2:54 AM, Harshitha Prem wrote:
>> From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
>>
>> Currently, hardware abstractions (ah) of different radio bands
>> are tightly coupled to a single device (ab). But, with hardware
>> device group abstraction (ag), multiple radios across different
>> devices in a group can possibly form different combinations of
>> hardware abstractions (ah) within the group. Hence, the mapping
>> between ah to ab can be removed and instead it can be mapped with ag.
>>
>> Please find below illustration of how mapping between ath12k_hw (ah),
>> ath12k_base (ab) and ath12k_hw_group (ag) is changed.
>>
>>          current mapping of hardware abstraction (ah) with device (ab)
>>              +------------------------------------------------+
>>              |  +-------------------------------------+       |
>>              |  | +---------------+ +---------------+ |       |
>>              |  | |ath12k_hw (ah) | |ath12k_hw (ah) | |       |
>>              |  | +---------------+ +---------------+ |       |
>>              |  |                                     |       |
>>              |  |  +-----------+ |   +-----------+    |       |
>>              |  |  | ar (2GHz) | |   | ar (5GHz) |    |       |
>>              |  |  +-----------+ |   +-----------+    |       |
>>              |  |          Dual band device-1 (ab)    |       |
>>              |  +-------------------------------------+       |
>>              |    ath12k_hw_group (ag) based on group id      |
>>              +------------------------------------------------+
>>
>>                  After, with hardware device group abstraction
>>                  (moving ah array out of ab to ag)
>>              +----------------------------------------------+
>>              |   +---------------+  +---------------+       |
>>              |   |ath12k_hw (ah) |  |ath12k_hw (ah) |       |
>>              |   +---------------+  +---------------+       |
>>              |  +-------------------------------------+     |
>>              |  | +-----------+     +-----------+     |     |
>>              |  | | ar (2GHz) |     | ar (5GHz) |     |     |
>>              |  | +-----------+     +-----------+     |     |
>>              |  |     Dual band device-1 (ab)         |     |
>>              |  +-------------------------------------+     |
>>              |   ath12k_hw_group (ag) based on group id     |
>>              +----------------------------------------------+
>>
>> This decoupling of ath12k_hw (ah) from ath12k_base (ab) and mapping it
>> to ath12k_hw_group (ag) will help in forming different combinations of
>> multi-link devices.
>>
>> Say for example, device 1 has two radios (2 GHz and 5 GHz band) and
>> device 2 has one radio (6 GHz).
>>
>> In existing code -
>>          device 1 will have two hardware abstractions hw1 (2 GHz) and
>>          hw2 (5 GHz) will be registered separately to mac80211 as phy0
>>          and phy1 respectively. Similarly, device 2 will register its
>>          hw (6 GHz) as phy2 to mac80211.
>>
>> In future, with multi-link abstraction
>>
>>          combination 1 - Different group id for device1 and device 2
>>                  Device 1 will create a single hardware abstraction hw1
>>                  (2 GHz and 5 GHz) and will be registered to mac80211 as
>>                  phy0. similarly, device 2 will register its hardware
>>                  (6 GHz) to mac80211 as phy1.
>>
>>          combination 2 - Same group id for device1 and device 2
>>                  Both device details are combined together as a group, say
>>                  group1, with single hardware abstraction of radios 2 GHz,
>>                  5 GHz and 6 GHz band details and will be registered to
>>                  mac80211 as phy0.
>>
>> Hence, Add changes to decouple ath12k_hw (ah) from ath12k_base (ab) and
>> map it to ath12k_hw_group (ag).
>>
>> Refactor the following APIs to help simplify the registration based on
>> ath12k_hw_group (ag) rather than ath12k_base (ab)
>>          * ath12k_mac_allocate()
>>          * ath12k_mac_destroy()
>>          * ath12k_mac_register()
>>          * ath12k_mac_unregister()
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
>> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> 

Thanks Jeff.

With this patch seeing below smatch error:

drivers/net/wireless/ath/ath12k/mac.c:8918 ath12k_mac_hw_allocate() 
error: uninitialized symbol 'ab'.
   CC [M]  drivers/net/wireless/ath/ath12k/reg.o
   CHECK   drivers/net/wireless/ath/ath12k/reg.c

Will fix it in next patchset.

Regards,
Harshitha

