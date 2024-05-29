Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03D1C25B75
	for <ath12k@archiver.kernel.org>; Wed, 29 May 2024 16:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=urZPuhE4Ze5SpqIR+pZW/zf0Jx1npbUKRLTd268UZEo=; b=WGvoOpyWnUevVGe/BEKeElTrX0
	T3cLu1tJoNty+dKeXv4WTuYIM8kiN+bwPS5Ymd3U3DWNttAjeyj1DBW5ETH3+TcM9xgtWtMaPi/E8
	i/Rwj3Kkr7dj/p91WdMuIDeeL2MdBQ2TB7lxQpi177S27gveCQtqx1R8DQiFNbBq1Mjb52t6RNw6n
	m55BV6B9k38pRG35Mel9kuRunoQnjKXfGx9sml+bsoOFBTwH7halBgXi0ySiN2OX+OHNmscHK5o2v
	VPIwDwpHSWn9VK4iiMNyjxqXFP2jyYUVkfGE6rTOFYkqvuMaejLkFu0Qq03OANKoDr3tXDc2IwPS+
	L6TCgoAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCMWn-00000004zzB-2bQk
	for ath12k@archiver.kernel.org;
	Wed, 29 May 2024 16:51:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCMWk-00000004zxI-3LKG
	for ath12k@lists.infradead.org;
	Wed, 29 May 2024 16:51:52 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T9nOtS030893;
	Wed, 29 May 2024 16:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	urZPuhE4Ze5SpqIR+pZW/zf0Jx1npbUKRLTd268UZEo=; b=fIh9l1GFp5hxam79
	EQ61S8/UZZgtiEWbVLQ9VUSHkV0TM64tFKQkxAKwU5ff8M/aEUv0BOBIZvDCgcAc
	wCOYUpVMVoAFngAwQO26ra8rGlfbTar3z7c4b00PGLYM3RqzjvajEF0FHSWBmDl3
	BixX8Ptlv0V2bSaB3IRa52Vx1kMpUTDJ5Ut4PZRAj9jc/l2+tb//8vtmDrsFdhFD
	Z3HTL1dYT472RNoW8vmBAWyPga4LTqB6p2606qyQtCOT2xZlbgLuRl5Lc/bn5ijw
	6ZG1WRs5po4i2sJ8iKZIthnclq5PM0Mx/nHiaRYMzL0uScnQmqzXI2q3Wrmy7lTI
	eDXn/g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0qhhsw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 16:51:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TGpk0u014547
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 16:51:46 GMT
Received: from [10.110.122.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 May
 2024 09:51:45 -0700
Message-ID: <392f51d7-0831-4d77-9adb-1c2e84e0356d@quicinc.com>
Date: Wed, 29 May 2024 09:51:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Remove unused ath12k_base from ath12k_hw
Content-Language: en-US
To: Harshitha Prem <quic_hprem@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240529060939.4156281-1-quic_hprem@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240529060939.4156281-1-quic_hprem@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RxnN8m-T-UQOvXE4Mb5Z3kT-W0FIlJeS
X-Proofpoint-ORIG-GUID: RxnN8m-T-UQOvXE4Mb5Z3kT-W0FIlJeS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_13,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=838 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_095150_998201_B7143E85 
X-CRM114-Status: UNSURE (   8.30  )
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

On 5/28/2024 11:09 PM, Harshitha Prem wrote:
> Currently, device (ab) reference in hardware abstraction (ah)
> is not used anywhere. Also, with multiple device group abstraction,
> hardware abstraction would be coupled with device group abstraction
> rather than single device.
> 
> Hence, remove the ab reference from hardware abstraction.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
> ---
> Depends-On: [PATCH] wifi: ath12k: Fix WARN_ON during firmware crash in split-phy
> Link: https://lore.kernel.org/ath12k/20240529034405.2863150-1-quic_aarasahu@quicinc.com/
> ---
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


