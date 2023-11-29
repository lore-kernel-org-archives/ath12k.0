Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C85C10DC1
	for <ath12k@archiver.kernel.org>; Wed, 29 Nov 2023 22:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rkaqzL2WPKZV4VxwCGw5IZVE+X2WtBIGcfX8NZuhwJo=; b=zXc0o1rPd/inj0i4qSv9uIjjwi
	9pWzSpJ3fF2daFnBPt8fGFPZ6tnyZySWjiey0z+iWYjBAM/UHvFmImzYs5vBOARki8yOYQSyBlPxf
	VUMftntW305N7HpfhrszkRNg4lJPyKR47uYPD+qH2y4xIGWh93Sw5t8oDxTNKttqYzkHkT4TfJDRD
	ZZtlaUAtj8iAnlgrDeMu7/sI3nBbkIAuxqrjsmX6meaDIgwDkAOwfr67mMOTHnu7HV/PSL5DuSYwb
	sXNV8PqpmB0yP/4X4BUgx/guD2FGNnnG2R5k3cDH6CDPUPIhiTuzPnDBQZAQ2R8C6jnAOIKDfGMIZ
	BcdevaIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8TNA-009T2a-33
	for ath12k@archiver.kernel.org;
	Wed, 29 Nov 2023 22:49:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8TN7-009T1D-10
	for ath12k@lists.infradead.org;
	Wed, 29 Nov 2023 22:49:35 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ATMcb28000591;
	Wed, 29 Nov 2023 22:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=rkaqzL2WPKZV4VxwCGw5IZVE+X2WtBIGcfX8NZuhwJo=;
 b=FxYAPRsr+CJceaPsjdnZyd7mlxgmOUHBtZ/PZmjcoVypBjc/15egAySu3BXo8NBThXff
 XziOtAAtF7/ajELY+rfY5sSVr49L8MeNX8mdzw1c4+gUnLvTFZmubVLuZ1apwaVduCcE
 2qOcKFO54V1f7fLvRF2mv6oPuckoR+PAUdR3mwmCkU+VWF0g4alial/MSpzbSykjSLgU
 hBnLIJWEd0TdH8maYg7zVzxK7dX9nnNI9v6A39LTE7uemlCIo3xC2KxiHHbeMbc9c8FZ
 Pgw7xGwjn+7/bucZeX7K6KJd3MQi0cO7X0aB2o8pl1Lf+/0lWCQZUmQxMoUGFClLiLKz yA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3up4cf9pbs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 22:49:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ATMnOj8010799
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 22:49:24 GMT
Received: from [10.110.26.250] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 29 Nov
 2023 14:49:24 -0800
Message-ID: <bcc2a41e-0d5c-46b2-acbc-fa0f22c55232@quicinc.com>
Date: Wed, 29 Nov 2023 14:49:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Firmware for qcn9274?
Content-Language: en-US
To: Ben Greear <greearb@candelatech.com>, <ath12k@lists.infradead.org>
References: <864419c3-71e1-49e8-40e1-88bfafba26f4@candelatech.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <864419c3-71e1-49e8-40e1-88bfafba26f4@candelatech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _4dIyY5ptZI04alaUQpqvEziH2CBqC9p
X-Proofpoint-ORIG-GUID: _4dIyY5ptZI04alaUQpqvEziH2CBqC9p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_21,2023-11-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 suspectscore=0 mlxlogscore=420
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311290175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_144933_405070_3EBBEDE2 
X-CRM114-Status: GOOD (  10.48  )
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

On 11/29/2023 9:39 AM, Ben Greear wrote:
> Hello,
> 
> Where are the ath12k firmware binaries located?  I don't see any ath12k tree
> in linux-firmware, for instance.
> 
> ]# dmesg|grep ath12
> [   55.381104] ath12k_pci 0000:0e:00.0: BAR 0: assigned [mem 0xdf000000-0xdf1fffff 64bit]
> [   55.415662] ath12k_pci 0000:0e:00.0: Hardware name: qcn9274 hw2.0
> [   55.592167] mhi mhi0: Direct firmware load for ath12k/QCN9274/hw2.0/amss.bin failed with error -2
> 
> Thanks,
> Ben
> 
See if this helps
https://wireless.wiki.kernel.org/en/users/drivers/ath12k/installation

