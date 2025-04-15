Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09635C369C1
	for <ath12k@archiver.kernel.org>; Tue, 15 Apr 2025 18:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KNyvxgaFjdluaSNtWy3XPc5pO7h2GV8xLehLv0Dnad8=; b=blUAq97HDOm4x0LjEYVFtQjFE3
	BwB+IuCma1kohWd4V3mg3fcDoTUQ5QEXF3wytKq5I6csaGDMkbAvPiitWy0eabMMZd+BQWwbVgeOb
	3agt1+fS1OC/uVkExRJypYimZdFJo+UXri1g1cyaTjgx5/3xToFjxC46RD2n/xWcDqKXdnNudTr/K
	e0ko/ZaLjxI9oh2wcO6g2dTW/751oeNVToe6mTiAeBZP1hJKc9/88Z9bsaZcrK+Ar7KfZPI0KS4UQ
	OxAvTVEN7A/9COL7GsM7ZcXbOPPtiSddADC9E1UK7z8UFMw/h90yvoZE4aDGKHN0MrNyWrrAdMMzq
	vg6NQaZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4khe-00000006fs3-3Io1;
	Tue, 15 Apr 2025 18:08:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4kYk-00000006eVL-2pGb
	for ath12k@lists.infradead.org;
	Tue, 15 Apr 2025 17:59:00 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tEeW019568;
	Tue, 15 Apr 2025 17:58:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KNyvxgaFjdluaSNtWy3XPc5pO7h2GV8xLehLv0Dnad8=; b=Fw3muwjDi1sGI8u0
	wMC1Mw7i9IPV4YFIAX8qICmmyZDehXoPCkYzVe/NaFLGfQg2J9l5BTyLdrD4pqbY
	m3zlXrqijFpprvgWMDo1DLCIr88M+2Yu6toHeWvgG9VtwEBkVtFbXfmX4KNNIlWe
	c3DMzzLoSWJL/CkdByu+Wwa1fjYnbBFL62lpTbmgOyJJlsVJVkGkGJLTpNg4eBVl
	Jzqu/R9PJCk0mu4vCtEmUcLb3qXY46x7roUHXj9bvNCY4kJl+oqHtr7ZWBKK0x0s
	PcVUTHyj0eLkkRKiRbaMJ7NSaPEUFRpBhVAHVe0w97HHRHsCkenGZgzLqUFOB9BJ
	0MQwkQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhfd0xwn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 17:58:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53FHwvV6001553
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 17:58:57 GMT
Received: from [10.227.108.41] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 15 Apr
 2025 10:58:56 -0700
Message-ID: <fbd9558b-b07c-421c-a745-d6afbcffdc50@quicinc.com>
Date: Tue, 15 Apr 2025 10:58:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V12 0/9] wifi: ath12k: add MU-MIMO and 160 MHz bandwidth
 support
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250408010132.3699967-1-quic_pradeepc@quicinc.com>
 <c8236051-4341-4d49-a6d8-283320aff2f6@oss.qualcomm.com>
Content-Language: en-US
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
In-Reply-To: <c8236051-4341-4d49-a6d8-283320aff2f6@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CfUI5Krl c=1 sm=1 tr=0 ts=67fe9e61 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=k9HlIU_l3moIi_vngRMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: _eN7SQA148OvsY_uLaTXD5STv5Nw_3F_
X-Proofpoint-ORIG-GUID: _eN7SQA148OvsY_uLaTXD5STv5Nw_3F_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_07,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=910 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_105858_738204_8F7CDC89 
X-CRM114-Status: UNSURE (   8.37  )
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


>> base-commit: ac17b1211841c98a9b4c2900ba2a7f457c80cf90
> 
> Sorry, this needs to be rebased again:
> 
> Applying: wifi: ath12k: push HE MU-MIMO params to hardware
> Applying: wifi: ath12k: push EHT MU-MIMO params to hardware
> Applying: wifi: ath12k: move HE MCS mapper to a separate function
> Applying: wifi: ath12k: generate rx and tx mcs maps for supported HE mcs
> Applying: wifi: ath12k: fix TX and RX MCS rate configurations in HE mode
> Applying: wifi: ath12k: add support for setting fixed HE rate/GI/LTF
> Applying: wifi: ath12k: clean up 80P80 support
> Applying: wifi: ath12k: add support for 160 MHz bandwidth
> Using index info to reconstruct a base tree...
> M       drivers/net/wireless/ath/ath12k/core.h
> M       drivers/net/wireless/ath/ath12k/mac.c
> M       drivers/net/wireless/ath/ath12k/wmi.c
> Falling back to patching base and 3-way merge...
> Auto-merging drivers/net/wireless/ath/ath12k/wmi.c
> Auto-merging drivers/net/wireless/ath/ath12k/mac.c
> CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/mac.c
> Auto-merging drivers/net/wireless/ath/ath12k/core.h
> Recorded preimage for 'drivers/net/wireless/ath/ath12k/mac.c'
> error: Failed to merge in the changes.
> Patch failed at 0008 wifi: ath12k: add support for 160 MHz bandwidth
> 
Sure Jeff..Let me rebase and post v13
Thanks
Pradeep

