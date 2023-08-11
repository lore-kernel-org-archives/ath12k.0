Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D9BC0015E
	for <ath12k@archiver.kernel.org>; Fri, 11 Aug 2023 09:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XDVixZrfrBDKSOITt/IaOze0eYNWPCy6eo45qiZnbHM=; b=b1ZlxcqaINTsuA
	QW9gsZOZGcsmMZWDYI1RX2KNJoM+ix83cy/WkPphtOWSuT+hksiEGr/LElG68v2ZkI3wiPrOab0G5
	yyqtoxLuWqW9DfTuI1ofWJfA2JmZ7QSUO/NiDsI9wUmJx3VBwTa3qn5WWyTcHBprlmyKrSqXaBtIh
	grv97vblrdVCIyyuQlQbvMTIcAspp5mbdDt78gIFSdR4Eje6BjhBOl76kfXz7mFdwSISnOMaaB5zs
	jczIZ6L6hVhKY+VIvAQqJwwr7l/KrYdLqJYxMO6TiwE4BYf1TfOIyKJ2NJPpdNCnum90i+n3gLzbi
	ng4Yw9uzEtrMUx5vlYoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUOGG-009wUt-0e
	for ath12k@archiver.kernel.org;
	Fri, 11 Aug 2023 09:16:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUOGC-009wUL-31
	for ath12k@lists.infradead.org;
	Fri, 11 Aug 2023 09:16:46 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37B4o2BR015432;
	Fri, 11 Aug 2023 09:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Im0HlFF/jFHxyQzHrj8bE9B3ABpF3Osaw1rwortTpBU=;
 b=Nn8ch3v1sjIOLGbicRX7yA3oZiu5pCkZg220rEbAldLTxvJ/a9o+DLZnFQCGrYAMpErS
 jHKVEi4OCNZhdnqha3RpCJnzTnt21tkTJnsQPLvXtNIcuqsaxssLHfiBhPXMyYyDMFer
 CeHsFss4r79q6hH77NtLK3FznBx4jy2BbOaQDImoxgB74drU7aXdDl1cd5FL54iDIXkF
 gPpSUwpuqiAVzpcF0qDypeAZIdrUPGUKv/Nh4VQD2fllIZf+0P6jOVdppEjSCLCZo6Y9
 6D9OwADfR7fi4DyFod9Aseck0BXAyUDNmkVHciEw4ywnVHXiXaqzZ3vTFuT/6wBW8X7k xw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sd8yuh74c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Aug 2023 09:16:42 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37B9GfUc013605
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Aug 2023 09:16:41 GMT
Received: from [10.201.206.104] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 11 Aug
 2023 02:16:39 -0700
Message-ID: <fbdfaef1-d680-c58b-f048-306ec8623ced@quicinc.com>
Date: Fri, 11 Aug 2023 14:46:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH 2/2] wifi: ath12k: fix undefined behavior with __fls in dp
To: Johannes Berg <johannes@sipsolutions.net>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230809042738.13394-1-quic_hprem@quicinc.com>
 <20230809042738.13394-3-quic_hprem@quicinc.com>
 <5cabcc57acd781e90c35fcc9b3c6a8aa8fbaa581.camel@sipsolutions.net>
Content-Language: en-US
From: Harshitha Prem <quic_hprem@quicinc.com>
In-Reply-To: <5cabcc57acd781e90c35fcc9b3c6a8aa8fbaa581.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hZcBKDM7q0mMY5ZHYbiFtx1eQ6McCa6P
X-Proofpoint-ORIG-GUID: hZcBKDM7q0mMY5ZHYbiFtx1eQ6McCa6P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_20,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=908 adultscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308110084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_021645_106140_0CBB1D33 
X-CRM114-Status: GOOD (  13.54  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org



On 8/9/2023 5:47 PM, Johannes Berg wrote:
> On Wed, 2023-08-09 at 09:57 +0530, Harshitha Prem wrote:
>>
>> During the crash, the fragment id of that packet was 0 and
>> __fls returned a junk value. Hence, it was identified that "__fls"
>> would have an undefined behavior if the argument is passed as "0".
>> Therefore, add changes to handle the same.
> 
> Umm. That makes it sound like you are surprised by this behaviour of
> __fls() and expected something else?! Please go read the documentation,
> and then rewrite the commit message. You really shouldn't be surprised
> by this.
> 
> johannes

Thanks Johannes for reviewing the changes. Sure, I will update the 
commit message in next patch version.

Thanks,
Harshitha

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
