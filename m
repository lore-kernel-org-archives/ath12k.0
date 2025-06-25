Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA50C7EE32
	for <ath12k@archiver.kernel.org>; Wed, 25 Jun 2025 12:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63/bL2IIGIhEgVAkuZEz0w9mUZlosciFa/3XDDkBNPc=; b=T3KrktX2+lu4XiQexdtyO2PxAJ
	Mi16hEaq8HJa8dyQ0q6//PQALRvMkF3I/AyCRRYJ8q0F6L/knBfLQ3uWfCPFU58S+IqqpBTNkqKCp
	P1UNaUPSHAet6HOTkxeqMwCFILjPXe1o/rHNOgAoBpA3JFvPNNqEPERCJIRvNLb1jWvSpUSY9dtT0
	ESCAlNmZzbn9K3Vu4bARVlHKremy+uQ5lp7IahMVQH7GJ6ZBBTKjDD/XJo+0U3LlvRMbxmB5A77UU
	Z+OJofQCUHd7QLiNSV/w/myMDIH1+sOXXNag4mTWOpybxKBNFNyvCoNYqF8XrDuL6bihW/gKrPNAK
	+++D67vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOvr-00000008a4y-1qRh;
	Wed, 25 Jun 2025 12:08:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNAO-00000008Hjc-0mAu
	for ath12k@lists.infradead.org;
	Wed, 25 Jun 2025 10:15:45 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P5Uage014612;
	Wed, 25 Jun 2025 10:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	63/bL2IIGIhEgVAkuZEz0w9mUZlosciFa/3XDDkBNPc=; b=gcPbRqMeHb0eFjY9
	dXeTSIscHXthu4m2AZQJ1yPz8rwjjqcAm3eXyYxKCYGrxuiSPnhDA6ieevU2qrnW
	ftclR3te/Ugcuwqn39Ejd6sIz5uVVGIV/3Cg2k/eawJziZAb7TwX301p0evHPS5v
	zNd8V41ey3f9zDSgw1oYrw+oE/ga6NKpTRVVok2VKu1eSlFRjOWW6cMao/roFRxz
	su3cdEXexfugcuvLt9apkXag3NuyfuA0LLiOhrepRIK4yOajUWO82wU5ViL57ygo
	qJUv4/wRUYknfBZtyhoaL8kWJ0NtTPk2FhdeIs6MHY//bbo/WKe/3WANCqLtZYXa
	WzOM5g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rpyqm6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:15:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55PAFcNw020623
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:15:38 GMT
Received: from [10.133.33.71] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Jun
 2025 03:15:36 -0700
Message-ID: <2d688040-e547-4e18-905e-ea31ea9d627b@quicinc.com>
Date: Wed, 25 Jun 2025 18:15:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: install pairwise key first
To: Johan Hovold <johan@kernel.org>
CC: Jeff Johnson <jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>,
        <ath12k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Gregoire
	<gregoire.s93@live.fr>, Sebastian Reichel <sre@kernel.org>
References: <20250523-ath12k-unicast-key-first-v1-0-f53c3880e6d8@quicinc.com>
 <aFvGnJwMTqDbYsHF@hovoldconsulting.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <aFvGnJwMTqDbYsHF@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685bcc4b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=UqCG9HQmAAAA:8 a=COk6AnOGAAAA:8 a=DXNEfgFaXloPVKmhlksA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA3NyBTYWx0ZWRfX/S9JpvsSuZkw
 /6lT3pInHPGkUYiPRogRT0qYb5M4y2vtnyGSor3NxU6Eoe3IrM9TdsCFK7aUgqJhwSKOvgFpKNw
 A5YzNSE/tWbHwdYg3RGEG26Gv2QyWae5kaA1fJIjwXvDhq8o2LRmtwlGGFlqUfVzKRtK4bg6NDE
 nMlFXm6R1eZNMCkxVPf9XPHxfL1/vcxekRRhk3k6ycOeVVcpead9f7zOpAl1PQXFHHU+73iU7/E
 A5MCUaLVENKMm4CAQLTCcJxEaV5sFhHipHvavhwfIEVFFioGC0y1at9r0tgANIHm9RWXmmi7h3H
 2i8W0Ns4q9fYS/RJ20XrV9sbBBZQ1ktJB5Ii8lWAm6HOjqh+0Kz1VUjHuznCMy5oGCzVzQHan7E
 Ie338x+ajIyDcGM8e71ciZglhJ2+ftBaQxyZtqFZYUrvgv+REyv5yDV+6ZbQef9MKr6ydPW+
X-Proofpoint-ORIG-GUID: U5h60NmTV_qS2FdWiRKR7rNBv3AlkNaW
X-Proofpoint-GUID: U5h60NmTV_qS2FdWiRKR7rNBv3AlkNaW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1011 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_031544_340929_8BE6A49F 
X-CRM114-Status: GOOD (  14.01  )
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



On 6/25/2025 5:51 PM, Johan Hovold wrote:
> [ +CC: Gregoire ]
> 
> On Fri, May 23, 2025 at 11:49:00AM +0800, Baochen Qiang wrote:
>> We got report that WCN7850 is not working with IWD [1][2]. Debug
>> shows the reason is that IWD installs group key before pairwise
>> key, which goes against WCN7850's firmware.
>>
>> Reorder key install to workaround this.
>>
>> [1] https://bugzilla.kernel.org/show_bug.cgi?id=218733
>> [2] https://lore.kernel.org/all/AS8P190MB12051DDBD84CD88E71C40AD7873F2@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
>>
>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>> ---
>> ---
>> Baochen Qiang (2):
>>       wifi: ath12k: avoid bit operation on key flags
>>       wifi: ath12k: install pairwise key first
> 
> Thanks for fixing this, Baochen.
> 
> I noticed the patches weren't clearly marked as fixes. Do you think we
> should ask the stable team to backport these once they are in mainline
> (e.g. after 6.17-rc1 is out)? Or do you think they are too intrusive and
> risky to backport or similar?

Yeah, I think they should be backported.

> 
> [ Also please try to remember to CC any (public) reporters. I only found
>   out today that this had been addressed in linux-next. ]

Thanks, will keep in mind.

> 
> Johan


