Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B445CE7CF8
	for <ath12k@archiver.kernel.org>; Tue,  1 Oct 2024 09:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/19Tyxgrt1SEVblNeRF8Z3P7nByNhKfHz19N+7mP6UE=; b=RNKgQHYcPey4cFE8gDaWXrxmca
	RGuNXj5uMOKddKbdGbeOPxYzbMVDbClSdmKkPxzGHWnrzRlOWiSyDqwLlCAgnNZoAlVYZQje93pAY
	+1WXN6ACb3FY0gCTBSu1NWIcauS4EZdEfytstkOffz8RwgzN69nRcAR49BAnG1tQNtSpXA/edJiUQ
	qcAIzSCFEyp6DTMB7JsuQpDWeySya5GkTJNwoaq8qkJsmLkoherv3ezGKeJ6berQseyBdBzQ9KXGH
	5SbRcQqp1cBVj4xfmOo3QgR51JW4oI1usGer9PhhbIssSLLBBmvfV3KPmqiU8u+WAPbq7QIx4APU/
	9jhYFzog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svYza-00000002CfX-3CiA
	for ath12k@archiver.kernel.org;
	Tue, 01 Oct 2024 09:16:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svYzX-00000002Cf6-44AF
	for ath12k@lists.infradead.org;
	Tue, 01 Oct 2024 09:16:25 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48UNxRUr015533;
	Tue, 1 Oct 2024 09:16:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/19Tyxgrt1SEVblNeRF8Z3P7nByNhKfHz19N+7mP6UE=; b=YKkNlIwJTszdi9VM
	MoxUrODTO+FuV+Tylz4dJjy2OuTKkRmwAyvuMUguyWOkYHT5m4eOn1YCPgKw9Zr1
	kqn7IwP9uw+HJzFk6+WQKKVeNKsjyDqCknDDeH2bXJQUs+TaYBEweCOQGKuN+zgd
	ujqDI5A6/0ASXr0tVpLTnbvI2nrFj3SVLwW1HNRviB+kEpElb42EePtDawXE4IbV
	91t8pxOBfBBbhPWkimeoZb0q7g/qU3T1eLR9dy7yn9lmhpiZbk8O6B8havEAPWs+
	TIEoS18h92SFuto9OeoucocErPugkaQohc8BSM0KJVOclk/SBqlCQqORYSl0PT4H
	pm4EEg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41xaymfp4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 09:16:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4919GKSg013871
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Oct 2024 09:16:20 GMT
Received: from [10.152.202.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 1 Oct 2024
 02:16:18 -0700
Message-ID: <99b6c9aa-ec20-4385-bf6d-49f4c59276ad@quicinc.com>
Date: Tue, 1 Oct 2024 14:46:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: mac80211: fix assigning channel in activate links
To: Johannes Berg <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>
References: <20241001041518.2236297-1-quic_adisi@quicinc.com>
 <0353d31db76afbd5d9bb2e7d42246ae3c8e14044.camel@sipsolutions.net>
 <fd731cac-7182-4de3-afd4-0fc5892a9440@quicinc.com>
 <c103db90ed53a75cae10baba0ae52dae85bf1c3f.camel@sipsolutions.net>
 <5fe9fdf2-ae5c-4d15-a095-0203a814e4ba@quicinc.com>
 <16ad03533ab6aca65c3fe9db94ae53ad11fdb9d1.camel@sipsolutions.net>
 <39b73ddd-5478-4599-a92b-00b274d2ce02@quicinc.com>
 <d66a63e31e55249bc88faa5731abb2859fa2a940.camel@sipsolutions.net>
Content-Language: en-US
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <d66a63e31e55249bc88faa5731abb2859fa2a940.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rNIGCmJBsCEHjGS0gPVK6BPYBcf7xvOV
X-Proofpoint-GUID: rNIGCmJBsCEHjGS0gPVK6BPYBcf7xvOV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxscore=0 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 mlxlogscore=848
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410010060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_021624_047355_F3BEC7B5 
X-CRM114-Status: GOOD (  11.97  )
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

On 10/1/24 13:58, Johannes Berg wrote:
> On Tue, 2024-10-01 at 13:56 +0530, Aditya Kumar Singh wrote:
>> Yes please that would be of great help. Let me send a next version
>> having the changes as discussed above and then you could pick that for
>> testing and let us know whether it is working as expected by Intel driver?
> 
> Sure. I suspect it'll work better if you do the ordering as you had
> described in the comment.

Sure, done and I have sent the next version. Do let us know if you face 
any issues.

> 
>> It would be better if other MLO based drivers could also test this? I
>> mean if possible they could also test and let us know if this breaks any
>> of their expectations! Or if not test, at least ack this change?
> 
> I guess they'll just have to speak up here too :)

:)


-- 
Aditya


