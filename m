Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853ADC4345F
	for <ath12k@archiver.kernel.org>; Fri, 19 Apr 2024 06:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:CC:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wx68YUPrjLnD35NqlXwGizNFx0HzIB+u8ShWxGK62Y4=; b=MjxESMkoYZ9Cq+78uZkhgaut6t
	swxAUT6OQkZWV3qldw9FiCBn6PhXgCCnx0Nj6tn32OK04DyEMu7CYEvELCYOABqYL9URdTMp4MDbZ
	xZsLAmoPYFYG+vaDfkZOvgw/iCbY14bmarm2lJMkQPPNF5Sb9Zgg9gJiGgU/xj2sj2C/rOqi3HfGU
	Q/r0o7bfrxud/a6bBEVgamiVAoU87NoHLr8t5icGZ8q/60WT5xrK8f12RCQ1itAtlXFmh+fHvfngu
	KImUstXiF0/KFcyvyTIZNRJXG1lNvV6+m7fnOIcFiVlldegtIPo6DXs1AfnVsVRm0JtTD0VNmclyJ
	QuforzQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxhmz-00000004d6I-0qL6
	for ath12k@archiver.kernel.org;
	Fri, 19 Apr 2024 06:32:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxhmy-00000004d5z-0Wl8
	for ath12k@bombadil.infradead.org;
	Fri, 19 Apr 2024 06:32:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:From:CC:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=wx68YUPrjLnD35NqlXwGizNFx0HzIB+u8ShWxGK62Y4=; b=RII4kUUiZgkK7sDmJ79rOVjwhh
	wLa16CfKkOyD1rtY3tVLJYgvbt7CnR2Z+dQBD9qNZepn5rtuWDMBHSHl81QjtqEjfiLlYYW1bste+
	FVkHMAR3SU7WX9c45OATdUMe6ak15PbLB98DuM6zvT29zHtzSwl6OjvIXT96QiqvAVSLqukATzbil
	fmyvifVigV34P+s/QBWdEeIHm+ojxzl12w6SUiVamEqj9/MT/CAd+JBzWE/tNE5yZZHPP0WWvjEky
	4x25nKqdbOpzyO4DYlTsopc3K6paxIsCe0RkugPsq98p6V2NO55xG9s2K6Lz23nUe3wdY7oY8FI4M
	Xree/NAw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxhmp-0000000CKyZ-3ekH
	for ath12k@lists.infradead.org;
	Fri, 19 Apr 2024 06:31:58 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43J3di1m017732;
	Fri, 19 Apr 2024 06:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:to:cc:from:subject:content-type
	:content-transfer-encoding; s=qcppdkim1; bh=wx68YUPrjLnD35NqlXwG
	izNFx0HzIB+u8ShWxGK62Y4=; b=OLxXdkypDpVE7I13rYLgPBigtNrvBwDWf50O
	Uqzg8aNE/1oH9MMUjdAGzBDUDsbTrCGYPw1juU+vWfO/PBuEAB8IG7rLTpaKWLYY
	uORtjMJjBnQNfK65vE1HVyD/aAYiu+0/hhwSGzKuF/WkhtK1eKxOD99elpBwewCJ
	guU9aDXyV663awftezkrdKxAzChkOBV9Bt/IWCjFiZQM65RjGf8ANp1ZeLitQnnb
	gOOyFkMRgeJfu2fosHPzNIVkxgdWlZEbT21Rg8NobHl9y7phjb3++9ugcyHv+022
	LlbX6xJAcpR09Ss25EC5m9XKplrA87VEW9ilqxW9WLw5A1C29w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xk4vm9wyq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Apr 2024 06:30:36 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43J6UZAB008050
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Apr 2024 06:30:35 GMT
Received: from [10.110.91.89] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 18 Apr
 2024 23:30:34 -0700
Message-ID: <91cbda07-0b93-4e0b-adaa-cd9b078a91b8@quicinc.com>
Date: Fri, 19 Apr 2024 14:30:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
From: Lingbo Kong <quic_lingbok@quicinc.com>
Subject: Fwd: [PATCH v8 0/4] wifi: ath12k: ACPI support
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: a_IkWnqc4o5ZA_zJI5xY-yZ6CIysY5QY
X-Proofpoint-GUID: a_IkWnqc4o5ZA_zJI5xY-yZ6CIysY5QY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_03,2024-04-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 mlxlogscore=884 mlxscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404190047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_073154_427685_C1E44BFE 
X-CRM114-Status: GOOD (  17.20  )
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

 > -------- Forwarded Message --------
 > Subject: Re: [PATCH v8 0/4] wifi: ath12k: ACPI support
 > Date: Fri, 19 Apr 2024 07:16:07 +0300
 > From: Kalle Valo <kvalo@kernel.org>
 > To: Jeff Johnson <quic_jjohnson@quicinc.com>
 > CC: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
 >
 > Jeff Johnson <quic_jjohnson@quicinc.com> writes:
 >
 > > On 4/18/2024 9:20 AM, Kalle Valo wrote:
 > >
 > >> From: Kalle Valo <quic_kvalo@quicinc.com>
 > >>
 > >> Through reading ACPI tables, implement Time-Average-SAR(TAS), BIOS
 > >> SAR, configuration of CCA threshold and band edge channel power
 > functionalities.
 > >> This is enabled only on WCN7850.
 > >>
 > >> TODO:
 > >>
 > >> * test with ACPI support in hardware (I don't have such hardware),
 > especially
 > >>   suspend and hibernation
 >
 > [...]
 >
 > > I can verify this doesn't crash my system, but apparently my ACPI
 > > doesn't have the underlying settings, so cannot verify actual
 > > functionality
 >
 > Thanks for testing. I hope Lingbo has a device with proper ACPI settings.
 >

yes, I'll apply these patch then test it.

 > > Apr 18 15:13:59 qca-HP-ZBook-14-G2 kernel: ath12k_pci 0000:03:00.0:
 > > acpi_evaluate_dsm() failed Apr 18 15:13:59 qca-HP-ZBook-14-G2 kernel:
 > > ath12k_pci 0000:03:00.0: failed to get ACPI DSM data: -2 Apr 18
 > > 15:13:59 qca-HP-ZBook-14-G2 kernel: ath12k_pci 0000:03:00.0: acpi
 > > failed: -2
 >
 > I just want to verify that these are debug messages, right? Normal users
 > shouldn't see any ACPI errors if there are no ACPI settings in the 
system.
 >

Let me check it.

Best regards
Lingbo Kong

 > --
 > https://patchwork.kernel.org/project/linux-wireless/list/
 >
 > 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpat
 > ches

