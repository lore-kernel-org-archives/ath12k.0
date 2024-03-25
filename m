Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B965FC54E64
	for <ath12k@archiver.kernel.org>; Mon, 25 Mar 2024 06:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EAT5SOgOHEHcbwCIMlnf6M9GXtINrjPFJq4zt5RzCZs=; b=1iOI/08hg7ccAg3tOZ2LHmrFbG
	oBN5j09XFDFwri8Hsp/5AwRdPCNWaZYNCZ1c40uvqJND+u5ttjmbEQg/v1xmCVshq+9LuM6EcDHFu
	BsJUlAdHW/gaUWOzXMKQ47EfBgXQAwcJCT2nkGJWQJc5ApZ1HOpYww3BPixP83NDFx7CRGSbGYQup
	KL0DHGCtRtXTgOHYcz/AQWpOn4u66cIbFJCvDMW/DswHGIY+n4E+l9Q68HnpGTXBPHEPvCX9Nfu77
	CFJ8ANXwTjIzr355F4qwzpzGkKru3My/J9hxc+mdMDyGtuiW9kgNaEQ/23mrQZRLUj1GhRBGzXE6c
	VLIR+kug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roeBa-0000000FlNO-16JG
	for ath12k@archiver.kernel.org;
	Mon, 25 Mar 2024 06:51:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roeBX-0000000FlLP-0Kz4
	for ath12k@lists.infradead.org;
	Mon, 25 Mar 2024 06:51:56 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42P6Xfbe014505;
	Mon, 25 Mar 2024 06:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=EAT5SOgOHEHcbwCIMlnf6M9GXtINrjPFJq4zt5RzCZs=; b=T1
	x4hAUjE6A0mOJjTguoQhsls1iTQXPuZ+QAbPslkDaD5F4LMDm8yhwq4G5+Y68HyB
	hgin+tv200aOnWH+R1MjcvTccYtIkqge/fPQ5j6CTjE+eThqbh8coEvZqPMuRBtl
	BUKKerCJBRLajRkIg1hBFn0c8fkwKCgDMyQVmIYDk9qio07lFM+PbHtl21zFV+po
	nIyccXvrdAHlJgQjcFQvYx6Yk/epRMWmJFKfHetQM0lQ8szfJDvT94ZYRGIAkmKM
	jThXTal0rNgztr0MuXJbCCQu5NIsYA5nOp3OM3iIzk8+wAPG1d65lXt8xfa0o77p
	b3u7AAc1BHbLe3Kb5nAg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x1qa7xa4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 06:51:53 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42P6pq1c003627
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 06:51:52 GMT
Received: from [10.201.211.55] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sun, 24 Mar
 2024 23:51:50 -0700
Message-ID: <f690a1f8-09f8-a27c-e1be-fc6c76ea3456@quicinc.com>
Date: Mon, 25 Mar 2024 12:21:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2]wifi: ath12k: Add firmware coredump collection support
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>
References: <20240322054231.467152-1-quic_ssreeela@quicinc.com>
 <bec0c3f9220c5084f163a39355499bcc7a32da36.camel@sipsolutions.net>
From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
In-Reply-To: <bec0c3f9220c5084f163a39355499bcc7a32da36.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: e_WLJ4uLs8hu_pQupBOd_dxl035FJXW_
X-Proofpoint-ORIG-GUID: e_WLJ4uLs8hu_pQupBOd_dxl035FJXW_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-25_04,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1011 mlxscore=0 mlxlogscore=999 impostorscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403250036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_235155_347451_2D258168 
X-CRM114-Status: GOOD (  12.07  )
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

On 3/22/2024 9:32 PM, Johannes Berg wrote:
> On Fri, 2024-03-22 at 11:12 +0530, Sowmiya Sree Elavalagan wrote:
>>
>> +config ATH12K_COREDUMP
>> +	bool "ath12k coredump"
>> +	depends on ATH12K
>> +	select WANT_DEV_COREDUMP
>> +	help
>> +	  Enable ath12k coredump collection
>> +
>> +	  If unsure, say Y to make it easier to debug problems. But if
>> +	  you want optimal performance choose N.
> 
> Why would having the hooks to dump affect performance? Surely you don't
> expect to be doing it much?
> 
> Also I'm impressed - 55MB seems like a lot :)
> 
> johannes
> 

Hi Johannes,

As per the current design it shouldn't affect performance, here we collect the dump and queue the work of uploading using a work queue and trigger core restart. But according to earlier design we postpone the core restart until the dump has been uploaded.  I will remove the statement on performance impact in my next version.
 
Firmware team requires all the memory regions to be dumped for easier debugging. This holds 55 MB only in case of high memory profile ( >= 1 GB). We haven't enabled any other low memory profile in upstream.

Thanks,
Sowmiya Sree

